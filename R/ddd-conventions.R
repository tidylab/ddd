#' @title Naming Conventions
#' @noRd
#' @keywords internal
title <- new.env()

title$event <- function(string) snakecase::to_snake_case(string)
title$command <- function(string) snakecase::to_snake_case(string)
