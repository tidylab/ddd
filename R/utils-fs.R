#' @inheritParams fs::file_show
#' @noRd
#' @keywords internal
file_show <- function(path = ".", browser = getOption("browser"))
    if(interactive() & !identical(Sys.getenv("TESTTHAT"), "true"))
        fs::file_show(path, browser)
