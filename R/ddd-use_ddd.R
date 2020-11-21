#' @title Copy \code{ddd} Classes and Types to your Project
#' @description
#' The function makes a project independent of the \code{ddd} package.
#' \code{ddd} is needed for software development and has no added value in
#' production.
#' @details This function copies the necessary R classes and functions
#' into the "R" folder of your project.
#' @export
use_ddd <- function(){
    fs::dir_copy(find.template("templates", "R"), file.path(getwd(), "R"))
    invisible()
}
