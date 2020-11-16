#' @keywords internal
#' @noRd
events <- new.env()


# Handlers ----------------------------------------------------------------
events$invalid_input <- function(msg) warning(msg)

