{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

import Hakyll
import Text.Pandoc

import Control.Monad ((>=>), when)
import Data.Aeson ( defaultOptions
                  , genericParseJSON
                  , sumEncoding
                  , SumEncoding(UntaggedValue)
                  , FromJSON(..)
                  )
import Data.Monoid (appEndo, Endo(..), mconcat)
import Data.List (nub, sort)
import Data.Map.Strict (Map)
import Data.Maybe (isJust, fromJust)
import Data.Text (Text, unpack)
import Data.Yaml (decodeFileThrow)
import GHC.Generics
import System.Directory (copyFile, doesFileExist)
import System.FilePath ( (</>)
                       , takeFileName
                       , replaceExtension
                       , takeDirectory
                       , splitDirectories
                       )
import System.Process (system)

import qualified Text.Pandoc.UTF8 as UTF8
import qualified Data.Map.Strict as Map

main :: IO ()
main = do
    (cn, meta) <- convert <$> decodeFileThrow "routes.yaml"
    hakyll $ do
        sequence $ concatMap (uncurry map) meta
        traverse autoIndex $ tldsFrom meta
        homepage $ tldsFrom meta
        match "css/*" $ do
            route   idRoute
            compile compressCssCompiler
        match "templates/*" $
            compile templateBodyCompiler
        match ("**.pdf" .||. "**.png" .||. "**.jpg") $ do
            route   idRoute
            compile copyFileCompiler
        when (isJust cn) $ create [fromFilePath "CNAME"] $ do
            route   idRoute
            compile . makeItem . fromJust $ cn

--------------------------------------------------------------------------------

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

homepage :: [String] -> Rules ()
homepage tlds = match "index.md" $ do
    route $ setExtension "html"
    compile $ do
        -- hack
        let mods = map (\x -> Item { itemIdentifier = fromFilePath (x++"/index.html"), itemBody = x }) . sort $ tlds
            homepageCtx = listField "entries" defaultContext (pure mods) <> defaultContext
            readerOptions = defaultReaderOptions { readerExtensions = disableExtension Ext_tex_math_dollars extensions }
        pandocCompilerWith readerOptions defaultWriterOptions
            >>= applyAsTemplate homepageCtx
            >>= loadAndApplyTemplate "templates/default.html" homepageCtx
            >>= relativizeUrls

--------------------------------------------------------------------------------
mdToHtml :: String -> PrefixInfo -> Rules ()
mdToHtml mJax (prefix, woverrides) = match (patternFrom prefix) $ do
    let mathCtx = constField "math" mJax <> defaultContext
    route $ setExtension "html"
    compile $ pandocCompilerWith defaultReaderOptions (appEndo woverrides defaultWriterOptions)
        >>= loadAndApplyTemplate "templates/entry.html" mathCtx
        >>= loadAndApplyTemplate "templates/default.html" mathCtx
        >>= relativizeUrls
        >>= saveSnapshot "_autoindex"

mdToPdf :: PrefixInfo -> Rules ()
mdToPdf (prefix, woverrides) = match (patternFrom prefix) $ do
    route $ setExtension "pdf"
    compile $ getResourceString >>= saveSnapshot "_autoindex"
        >>= readPandocWith defaultReaderOptions
        >>= withItemBody (texWithPandocWriter "eisvogel.latex" writeLaTeX (appEndo woverrides defaultWriterOptions) >=> lualatex)

mdToBeamer :: PrefixInfo -> Rules ()
mdToBeamer (prefix, woverrides) = match (patternFrom prefix) $ do
    route $ setExtension "pdf"
    compile $ getResourceString >>= saveSnapshot "_autoindex"
        >>= readPandocWith defaultReaderOptions
        >>= withItemBody (texWithPandocWriter "default.latex" writeBeamer (appEndo woverrides defaultHakyllWriterOptions) >=> lualatex)

texToPdf :: PrefixInfo -> Rules ()
texToPdf (mod, _) = match (mod */* "*.tex") $ do
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
    --, writerVariables        = [ ("lang",          "en-UK")
    --                           , ("papersize",     "a4")
    --                           , ("colorlinks",    "true")
    --                           , ("CJKmainfont",   "IPAexMincho")
    --                           ]
    }

--------------------------------------------------------------------------------
texWithPandocWriter :: String -> (WriterOptions -> Pandoc -> PandocIO Text) -> WriterOptions -> Pandoc -> Compiler String
texWithPandocWriter templateName w writerOptions p = unsafeCompiler . fmap (either (fail . show) unpack) . runIO $ do
    wo <- updateTemplate templateName writerOptions
    w wo p

updateTemplate :: PandocMonad m => String -> WriterOptions -> m WriterOptions
updateTemplate templateName writerOptions = do
    lookupEnv "HOME" >>= setUserDataDir . fmap ((++ "/.pandoc") . unpack)
    t <- fmap (either (error) id) $ getTemplate templateName >>= runWithDefaultPartials . compileTemplate ""
    pure $ writerOptions { writerTemplate = Just t }

--------------------------------------------------------------------------------
-- | From https://github.com/jaspervdj/jaspervdj/blob/f12cdf27340106613e560dfcecbd7a87a6ce408a/src/Main.hs#L261
-- | Hacky.
lualatex :: String -> Compiler (TmpFile)
lualatex texString = do
    TmpFile tmpTexPath <- newTmpFile "lualatex.tex"
    let tmpDir  = takeDirectory tmpTexPath
        pdfPath = replaceExtension tmpTexPath "pdf"

    unsafeCompiler $ do
        writeFile tmpTexPath texString
        -- gotta do it twice
        _ <- system $ unwords ["lualatex", "-halt-on-error", "-output-directory", tmpDir, tmpTexPath, "</dev/null >/dev/null 2>&1"]
        _ <- system $ unwords ["lualatex", "-halt-on-error", "-output-directory", tmpDir, tmpTexPath, "</dev/null >/dev/null 2>&1"]
        pure ()

    pure (TmpFile pdfPath)

-- | Even more hacky.
latexmk :: FilePath -> Compiler (TmpFile)
latexmk origTexPath = do
    TmpFile tmpTexPath <- newTmpFile "lualatex.tex"
    let tmpDir  = takeDirectory tmpTexPath
        pdfPath = replaceExtension tmpTexPath "pdf"
        tmpBibPath = replaceExtension tmpTexPath "bib"
        origBibPath = replaceExtension origTexPath "bib"

    unsafeCompiler $ do
        copyFile origTexPath tmpTexPath
        bibExist <- doesFileExist origBibPath
        when bibExist $ copyFile origBibPath tmpBibPath
        _ <- system $ unwords ["latexmk", "-lualatex", "-halt-on-error", "-outdir=" ++ tmpDir, "-cd", tmpTexPath, "</dev/null >/dev/null 2>&1"]
        pure ()

    pure (TmpFile pdfPath)

takeTopLevelDirectory :: FilePath -> FilePath
takeTopLevelDirectory path = case splitDirectories path of
                        []    -> "."
                        (d:_) -> d

tldsFrom :: [(PrefixInfo -> Rules (), [PrefixInfo])] -> [String]
tldsFrom = nub . map (takeTopLevelDirectory . fst) . concatMap snd

(*/*) :: FilePath -> FilePath -> Pattern
a */* b = fromGlob $ a </> b

patternFrom :: String -> Pattern
patternFrom prefix = if prefix == takeTopLevelDirectory prefix
                        then prefix */* "*.md"
                        else fromGlob $ prefix ++ "*.md"

--------------------------------------------------------------------------------
-- low effort parsing hell
type Prefix = String
type PrefixInfo = (Prefix, Endo WriterOptions)
type Override = String

-- very partial function, fite me
toWriterOptionsEndo :: Override -> Endo WriterOptions
toWriterOptionsEndo "disableNumberSections" = Endo (\w -> w { writerNumberSections = False })

data Entry = Short Prefix
           | Long (Map Prefix [Override])
           deriving (Generic, Show)
instance FromJSON Entry where
    parseJSON = genericParseJSON defaultOptions { sumEncoding = UntaggedValue }
toPrefixInfo :: Entry -> PrefixInfo
toPrefixInfo (Short p) = (p, Endo id)
toPrefixInfo (Long m)
  | Map.size m == 1 = let (p, os) = head (Map.toList m)
                       in (p, mconcat (map toWriterOptionsEndo os))

data Config = Config
    { texpdf :: [Entry]
    , mdbeamer :: [Entry]
    , mdhtml :: [Entry]
    , mdpdf :: [Entry]
    , cname :: Maybe String
    , mathJax :: String
    } deriving (Generic, Show)
instance FromJSON Config where
    parseJSON = genericParseJSON defaultOptions { sumEncoding = UntaggedValue }
convert :: Config -> (Maybe String, [(PrefixInfo -> Rules(), [PrefixInfo])])
convert Config{ cname = c
              , mathJax = mj
              , texpdf = tp
              , mdbeamer = mb
              , mdhtml = mh
              , mdpdf = mp
              } = ( c
                  , [ (texToPdf,    map toPrefixInfo tp)
                    , (mdToBeamer,  map toPrefixInfo mb)
                    , (mdToHtml mj, map toPrefixInfo mh)
                    , (mdToPdf,     map toPrefixInfo mp)
                    ]
                  )
