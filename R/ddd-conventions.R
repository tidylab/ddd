# Naming Style ------------------------------------------------------------
#' @title Generate Object Names which are DDD compliant
#' @noRd
#' @keywords internal
title <- new.env(parent = emptyenv())
title$event <- snakecase::to_upper_camel_case
title$value <- snakecase::to_upper_camel_case
title$entity <- snakecase::to_upper_camel_case
title$service <- snakecase::to_upper_camel_case
title$handler <- snakecase::to_snake_case
title$command <- snakecase::to_snake_case
title$domain <- snakecase::to_title_case
title$exammple <- snakecase::to_sentence_case

# File Names --------------------------------------------------------------
#' @title Generate File Names which are DDD compliant
#' @noRd
#' @keywords internal
filename <- new.env(parent = emptyenv())

filename$template <- function(entity = NULL, attribute = NULL, value = NULL) {
  paste0(paste(
    entity %|>|% snakecase::to_snake_case,
    attribute %|>|% snakecase::to_snake_case,
    value,
    sep = "-"
  ), ".R") %>%
    stringr::str_replace_all("--", "-") %>%
    stringr::str_remove_all("^-")
}

filename$event <- function(name = "unnamed", domain = "domain") {
  filename$template(domain, "event", title$event(name))
}

filename$value <- function(name = "unnamed", domain = "domain") {
  filename$template(domain, "value", title$value(name))
}

filename$entity <- function(name = "unnamed", domain = "domain") {
  filename$template(domain, "entity", title$entity(name))
}

filename$service <- function(name = "unnamed", domain = "domain") {
  filename$template(domain, "service", title$service(name))
}

filename$command <- function(name = "unnamed", domain = "domain") {
  filename$template(domain, "command", title$command(name))
}
