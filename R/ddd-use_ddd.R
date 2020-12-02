#' @title Make a Project Independent of the \code{ddd} Package
#' @param path (`character`) Path to the root folder of the project.
#' @includeRmd vignettes/articles/use_ddd.Rmd
#' @export
use_ddd <- function(path = "."){
    fs::dir_exists(path)
    fs::dir_copy(find.template("templates", "R"), file.path(path))
    invisible()
}
