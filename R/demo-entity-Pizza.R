#' @title Pizza
#' @family Pizza Ordering
#' @noRd
Pizza <- R6::R6Class("Pizza", inherit = Entity, lock_objects = TRUE)


# Public Fields -----------------------------------------------------------
Pizza$set("public", "size", "small")
Pizza$set("public", "toppings", R6DS::RDict$new())


# Public Methods ----------------------------------------------------------
Pizza$set("public", "select_size", function(size){
    size <- match.arg(tolower(size), c("small", "medium", "large"))
    self$size <- size
    return(self)
})

Pizza$set("public", "add_topping", function(name, side){
    name <- match.arg(tolower(name), c("olives"))
    side <- match.arg(tolower(side), c("left", "right", "both"))

    do.call(self$toppings$delete, args = list(key = name))
    do.call(self$toppings$add, args = list(key = name, val = side))

    return(self)
})

