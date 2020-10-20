#' @title Pizza
#' @family Pizza Ordering
#' @noRd
Pizza <- R6::R6Class("Pizza", inherit = Entity, lock_objects = FALSE, cloneable = FALSE)


# Public Methods ----------------------------------------------------------
Pizza$set("public", "initialize", overwrite = TRUE, function(uid){
    super$initialize(uid)
    self$size <- "small"
    self$toppings <- R6DS::RDict$new()
    invisible(self)
})

Pizza$set("public", "review", function(size){
    pizza_slip <-
        tibble::tribble(
            ~attribute, ~value,
            "toppings", serialize(self$toppings$toList),
            "size",     serialize(self$size)
        ) %>%
        tibble::add_column(entity = self$uid, .before = 0)

    return(pizza_slip)
})

Pizza$set("public", "select_size", function(size){
    size <- match.arg(tolower(size), ValueObject$get("sizes"))
    self$size <- size
    invisible(self)
})

Pizza$set("public", "add_topping", function(name, side){
    name <- match.arg(tolower(name), ValueObject$get("toppings"))
    side <- match.arg(tolower(side), ValueObject$get("sides"))

    do.call(self$toppings$delete, args = list(key = name))
    do.call(self$toppings$add, args = list(key = name, val = side))

    invisible(self)
})

Pizza$set("public", "remove_topping", function(name){
    name <- match.arg(tolower(name), ValueObject$get("toppings"))
    do.call(self$toppings$delete, args = list(key = name))
    invisible(self)
})

