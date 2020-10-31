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


# File Names --------------------------------------------------------------
filename <- new.env()

filename$template <- function(entity = NULL, attribute = NULL, value = NULL){
    # NULL protection
    `%|>|%` <- function(a, b = identity){ if(is.null(a)) return(NULL) else return(b(a)) }

    paste0(paste(
        entity %|>|% snakecase::to_snake_case,
        attribute %|>|% snakecase::to_snake_case,
        value,
        sep = "-"
    ), ".R")
}

filename$event <- function(domain = "domain", name = "unnamed"){
    filename$template(domain, "event", title$event(name))
}

filename$value <- function(domain = "domain", name = "unnamed"){
    filename$template(domain, "value", title$value(name))
}

filename$entity <- function(domain = "domain", name = "unnamed"){
    filename$template(domain, "entity", title$entity(name))
}

filename$service <- function(domain = "domain", name = "unnamed"){
    filename$template(domain, "service", title$service(name))
}

filename$command <- function(domain = "domain", name = "unnamed"){
    filename$template(domain, "command", title$command(name))
}
