{-# LANGUAGE OverloadedStrings #-}
import Hakyll
import Text.Pandoc

import Control.Monad ((>=>), when)
import Data.Monoid (mconcat)
import Data.List (nub)
import Data.Maybe (isJust, fromJust)
import Data.Text (Text, unpack)
import System.Directory (copyFile, doesFileExist)
import System.FilePath ((</>), takeFileName, replaceExtension, takeDirectory, splitDirectories)
import System.Process (system)

import qualified Text.Pandoc.UTF8 as UTF8

--------------------------------------------------------------------------------
meta :: [(String -> Rules (), [String])]
meta = [ (texToPdf,   [ "CS1010"
                      , "CP3108"
                      , "CS3230"
                      , "GEH1036"
                      , "GEQ1000"
                      , "MA1100"
                      , "MA1101R"
                      , "MA2101S"
                      , "MA2104"
                      ])
       , (mdToBeamer, [ "CS2030lab" ])
       , (mdToHtml,   [ "CS2100"
                      , "MA2108S"
                      , "MA2104/summary"
                      , "MA2202S/t"
                      , "MA3205"
                      , "MA5220"
                      , "CS4232"
                      ])
       , (mdToPdf,    [ "MA2101S"
                      , "MA2104/a"
                      , "MA2202S/hw"
                      ])
       ]

numberSectionDisabled = ["MA2101S", "MA2104/a", "MA2108S", "MA3205"]

cname :: Maybe String
cname = Just "m5th.b0ss.net"

mathJax :: String
mathJax = "<script src=\"https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/MathJax.js?config=TeX-AMS_CHTML-full\" type=\"text/javascript\"></script>"

--------------------------------------------------------------------------------
main :: IO ()
main = hakyll $ do
    sequence $ concatMap (uncurry map) meta
    traverse autoIndex $ tldsFrom meta
    homepage
    match "css/*" $ do
        route   idRoute
        compile compressCssCompiler
    match "templates/*" $
        compile templateBodyCompiler
    match ("**.pdf" .||. "**.png" .||. "**.jpg") $ do
        route   idRoute
        compile copyFileCompiler
    when (isJust cname) $ create [fromFilePath "CNAME"] $ do
        route   idRoute
        compile . makeItem . fromJust $ cname

autoIndex :: String -> Rules ()
autoIndex dir = create [fromFilePath $ dir </> "index.html"] $ do
    route idRoute
    compile $ do
        entries <- loadAllSnapshots noIndexPattern "_autoindex"
        let indexCtx = mconcat
                [ constField "title" dir
                , listField "entries" defaultContext (pure entries)
                , defaultContext
                ]
        makeItem ""
            >>= loadAndApplyTemplate "templates/list.html" indexCtx
            >>= loadAndApplyTemplate "templates/default.html" indexCtx
            >>= relativizeUrls
    where noIndexPattern = (dir */* "*.md" .||. dir */* "*.tex") .&&.
                complement (dir */* "index.html")

homepage :: Rules ()
homepage = match "index.md" $ do
    route $ setExtension "html"
    compile $ do
        let mods = map (\x -> Item { itemIdentifier = fromFilePath (x++"/index.html"), itemBody = x } ) (tldsFrom meta)
            homepageCtx = listField "entries" defaultContext (pure mods) <> defaultContext
            readerOptions = defaultReaderOptions { readerExtensions = disableExtension Ext_tex_math_dollars extensions }
        pandocCompilerWith readerOptions defaultWriterOptions
            >>= applyAsTemplate homepageCtx
            >>= loadAndApplyTemplate "templates/default.html" homepageCtx
            >>= relativizeUrls

--------------------------------------------------------------------------------
mdToHtml :: String -> Rules ()
mdToHtml prefix = match (patternFrom prefix) $ do
    let mathCtx = constField "math" mathJax <> defaultContext
    route $ setExtension "html"
    compile $ pandocCompilerWith defaultReaderOptions (updateNumberSections prefix defaultWriterOptions)
        >>= loadAndApplyTemplate "templates/entry.html" mathCtx
        >>= loadAndApplyTemplate "templates/default.html" mathCtx
        >>= relativizeUrls
        >>= saveSnapshot "_autoindex"

mdToPdf :: String -> Rules ()
mdToPdf prefix = match (patternFrom prefix) $ do
    route $ setExtension "pdf"
    compile $ getResourceString >>= saveSnapshot "_autoindex"
        >>= readPandocWith defaultReaderOptions
        >>= withItemBody (writeXetex writeLaTeX defaultWriterOptions "eisvogel" prefix >=> xelatex)

mdToBeamer :: String -> Rules ()
mdToBeamer prefix = match (patternFrom prefix) $ do
    route $ setExtension "pdf"
    compile $ getResourceString >>= saveSnapshot "_autoindex"
        >>= readPandocWith defaultReaderOptions
        >>= withItemBody (writeXetex writeBeamer defaultHakyllWriterOptions "default" prefix >=> xelatex)

texToPdf :: String -> Rules ()
texToPdf mod = match (mod */* "*.tex") $ do
    route $ setExtension "pdf"
    compile $ getResourceString >>= saveSnapshot "_autoindex"
        >> getResourceFilePath >>= latexmk >>= makeItem

--------------------------------------------------------------------------------
extensions :: Extensions
extensions = foldr enableExtension pandocExtensions $
    [ Ext_tex_math_single_backslash ]

defaultReaderOptions :: ReaderOptions
defaultReaderOptions = defaultHakyllReaderOptions
    { readerExtensions = extensions
    , readerStandalone = True
    }

defaultWriterOptions :: WriterOptions
defaultWriterOptions = defaultHakyllWriterOptions
    { writerExtensions       = extensions
    , writerEmailObfuscation = ReferenceObfuscation
    , writerHTMLMathMethod   = MathJax ""
    , writerNumberSections   = True
    , writerListings         = True
    , writerVariables        = [ ("lang",          "en-UK")
                               , ("papersize",     "a4")
                               , ("colorlinks",    "true")
                               , ("CJKmainfont",   "IPAexMincho")
                               , ("titlepage",     "true")
                               ]
    }

--------------------------------------------------------------------------------
writeXetex :: (WriterOptions -> Pandoc -> PandocIO Text) -> WriterOptions -> String -> FilePath
            -> Pandoc -> Compiler String
writeXetex w writerOptions templateName prefix p = unsafeCompiler . fmap (either (fail . show) unpack) . runIO $ do
    wo <- updateNumberSections prefix <$> updateTemplate templateName writerOptions
    w wo p

updateTemplate :: PandocMonad m => String -> WriterOptions -> m WriterOptions
updateTemplate templateName writerOptions = do
    lookupEnv "HOME" >>= setUserDataDir . fmap (++ "/.pandoc")
    t <- UTF8.toString <$> readDataFile ("templates/" ++ templateName ++ ".latex")
    pure $ writerOptions { writerTemplate = Just t }

disableNumberSections :: WriterOptions -> WriterOptions
disableNumberSections wo = wo { writerNumberSections = False }

updateNumberSections :: String -> WriterOptions -> WriterOptions
updateNumberSections prefix
  | prefix `elem` numberSectionDisabled = disableNumberSections
  | otherwise = id

--------------------------------------------------------------------------------
-- | From https://github.com/jaspervdj/jaspervdj/blob/f12cdf27340106613e560dfcecbd7a87a6ce408a/src/Main.hs#L261
-- | Hacky.
xelatex :: String -> Compiler (TmpFile)
xelatex texString = do
    TmpFile tmpTexPath <- newTmpFile "xelatex.tex"
    let tmpDir  = takeDirectory tmpTexPath
        pdfPath = replaceExtension tmpTexPath "pdf"

    unsafeCompiler $ do
        writeFile tmpTexPath texString
        -- gotta do it twice
        _ <- system $ unwords ["xelatex", "-halt-on-error", "-output-directory", tmpDir, tmpTexPath, ">/dev/null 2>&1"]
        _ <- system $ unwords ["xelatex", "-halt-on-error", "-output-directory", tmpDir, tmpTexPath, ">/dev/null 2>&1"]
        pure ()

    pure (TmpFile pdfPath)

-- | Even more hacky.
latexmk :: FilePath -> Compiler (TmpFile)
latexmk origTexPath = do
    TmpFile tmpTexPath <- newTmpFile "xelatex.tex"
    let tmpDir  = takeDirectory tmpTexPath
        pdfPath = replaceExtension tmpTexPath "pdf"
        tmpBibPath = replaceExtension tmpTexPath "bib"
        origBibPath = replaceExtension origTexPath "bib"

    unsafeCompiler $ do
        copyFile origTexPath tmpTexPath
        bibExist <- doesFileExist origBibPath
        when bibExist $ copyFile origBibPath tmpBibPath
        _ <- system $ unwords ["latexmk", "-xelatex", "-halt-on-error", "-outdir=" ++ tmpDir, "-cd", tmpTexPath, ">/dev/null 2>&1"]
        pure ()

    pure (TmpFile pdfPath)

takeTopLevelDirectory :: FilePath -> FilePath
takeTopLevelDirectory path = case splitDirectories path of
                        []    -> "."
                        (d:_) -> d

tldsFrom :: [(String -> Rules (), [String])] -> [String]
tldsFrom = nub . map takeTopLevelDirectory . concatMap snd

(*/*) :: FilePath -> FilePath -> Pattern
a */* b = fromGlob $ a </> b

patternFrom :: String -> Pattern
patternFrom prefix = if prefix == takeTopLevelDirectory prefix
                        then prefix */* "*.md"
                        else fromGlob $ prefix ++ "*.md"
