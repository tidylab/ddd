suppressPackageStartupMessages(
    withr::with_dir(
        usethis::proj_get(),
        pkgload::load_all(export_all = FALSE, helpers = FALSE, quiet = TRUE, warn_conflicts = FALSE)
    )
)

# global options ----------------------------------------------------------
options(tidyverse.quiet = TRUE)

# knitr -------------------------------------------------------------------
knitr::opts_chunk$set(
    collapse = TRUE,
    out.width = '100%',
    echo = FALSE,
    results = "markup",
    message = FALSE,
    warning = FALSE,
    cache = TRUE,
    comment = "#>",
    fig.retina = 0.8, # figures are either vectors or 300 dpi diagrams
    dpi = 300,
    out.width = "70%",
    fig.align = 'center',
    fig.width = 6,
    fig.asp = 0.618,  # 1 / phi
    fig.show = "hold",
    eval.after = 'fig.cap' # so captions can use link to demos
)


# cache -------------------------------------------------------------------
cache <- new.env()
cache$initilize <- function() {
    path <- file.path(usethis::proj_set(), "vignettes", "_cache")
    dir.create(path, F, T)
    options(R.cache.rootPath = path)
    invisible()
}
cache$save <- function(key, value){
    if(missing(value)){ value <- key; key <- deparse(substitute(key)) }
    R.cache::saveCache(object = value, key = list(key))
}
cache$load <- function(key) R.cache::loadCache(key = list(key))
cache$initilize()

# helpers -----------------------------------------------------------------
to_snake_case <- snakecase::to_snake_case
read_snippet <- function(name) readLines(system.file("inst", "snippets", paste0(name,".R"), package = devtools::loaded_packages()[1,1]))

# rmarkdown ---------------------------------------------------------------
kable <- knitr::kable

