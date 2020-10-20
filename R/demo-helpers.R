#' @noRd
serialize <- function(x) x %>% jsonlite::toJSON(auto_unbox = TRUE) %>% as.character()
