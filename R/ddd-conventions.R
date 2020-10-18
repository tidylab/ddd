#' @title Naming Conventions
#' @details
#' * \code{event} ToppingAdded
#' * \code{handler} add_topping
#' * \code{command} add_topping
#' * \code{entity} PizzaOrder
#' * \code{domain} Ordering Pizza
#' @noRd
#' @keywords internal
title <- new.env()

title$event <- function(string) snakecase::to_upper_camel_case(string)
title$handler <- function(string) snakecase::to_snake_case(string)
title$command <- function(string) snakecase::to_snake_case(string)
title$entity <- function(string) snakecase::to_upper_camel_case(string)
title$domain <- function(string) snakecase::to_title_case(string)
