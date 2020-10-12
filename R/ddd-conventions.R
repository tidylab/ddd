#' @title Naming Conventions
#' @noRd
#' @keywords internal
title <- new.env()

title$event <- function(string) snakecase::to_snake_case(string)
title$command <- function(string) snakecase::to_snake_case(string)
title$entity <- function(string) snakecase::to_upper_camel_case(string)
title$domain <- function(string) snakecase::to_title_case(string)
