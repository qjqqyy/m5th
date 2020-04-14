![Deploy Pages](https://github.com/qjqqyy/m5th/workflows/Deploy%20Pages/badge.svg)

This repo contains all of my school-related LaTeX/markdown manuscripts, since uni started in fall 2017.

With effort, everything is generated with with [Hakyll](https://jaspervdj.be/hakyll/index.html).

Also, every single markdown file in here except for this one liberally uses pandoc extensions,
and probably will not preview nicely.

## Quick (docker) dev setup

1. `docker run --rm -p 8000:8000 -it -v $(pwd):/site docker.pkg.github.com/qjqqyy/hakyll-latex/hakyll-latex`
    * noobtip: `--tmpfs` might or might not come in useful here
    * you might or might not wanna alias the above
2. open <http://localhost:8000> (if Docker is running on `localhost` that is)

See: [hakyll-latex](https://github.com/qjqqyy/hakyll-latex)

## What is even going on

I do the majority of my homework stuff with either LaTeX or Markdown
(depending on whether I need stuff like `amsthm` and more control over document structure).
As an upgrade from my [old stash of symlinks, Makefiles and general crap](https://m4th.b0ss.net),
I [repurposed Hakyll](site.hs) to compile almost all source files into viewables.
This also has the nice side-effect of separating the source of truth (in here) from the [produced files](https://github.com/qjqqyy/m5th/tree/gh-pages).

## Routes

* Pandoc markdown to HTML
* Pandoc markdown to PDF
* LaTeX to PDF
    * refer to bib files using `\jobname.bib` so `latexmk` picks up the link
    * oh and they also get renamed in the compilation process anyway (so better do it)
* Pandoc markdown to Beamer
