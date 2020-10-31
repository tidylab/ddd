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

title$event <- snakecase::to_upper_camel_case
title$value <- snakecase::to_upper_camel_case
title$entity <- snakecase::to_upper_camel_case
title$service <- snakecase::to_upper_camel_case
title$handler <- snakecase::to_snake_case
title$command <- snakecase::to_snake_case
title$domain <-  snakecase::to_title_case
title$exammple <- snakecase::to_sentence_case
