#' @title Make a Project Independent of the \code{ddd} Package
#' @param path (`character`) Path to the root folder of the project.
#' @includeRmd vignettes/articles/use_ddd.Rmd
#' @section Workflow:
#' 1. Call \code{\link{use_ddd}} maximum once per project; this will make the
#' project independent of `ddd`
#' 2. Call \code{devtools::document} (or Ctrl+Shift+D on windows) to include the
#' copied classes in the project NAMESPACE file
#' @export
use_ddd <- function(path = "."){
    fs::dir_exists(path)
    fs::dir_copy(find.template("templates", "R"), file.path(path))
    invisible()
}
