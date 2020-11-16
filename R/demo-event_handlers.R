#' @keywords internal
#' @noRd
events <- new.env()

# Handlers ----------------------------------------------------------------
events$invalid_input <- function(msg) lgr::lgr$error(msg)
events$invalid_uid <- function(msg) lgr::lgr$info(msg)
