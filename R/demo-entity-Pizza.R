#' @title Pizza
#' @family Pizza Ordering
#' @noRd
Pizza <- R6::R6Class("Pizza", inherit = Entity, lock_objects = FALSE, cloneable = FALSE)


# Public Methods ----------------------------------------------------------
Pizza$set("public", "initialize", overwrite = TRUE, function(uid){
    super$initialize(uid)
    self$size <- "small"
    self$toppings <- R6DS::RDict$new()
    return(self)
})

Pizza$set("public", "summary", function(size){
    pizza_slip <- data.frame(uid = self$uid)
    return(pizza_slip)
})

Pizza$set("public", "select_size", function(size){
    size <- match.arg(tolower(size), ValueObject$get("sizes"))
    self$size <- size
    return(self)
})

Pizza$set("public", "add_topping", function(name, side){
    name <- match.arg(tolower(name), ValueObject$get("toppings"))
    side <- match.arg(tolower(side), ValueObject$get("sides"))

    do.call(self$toppings$delete, args = list(key = name))
    do.call(self$toppings$add, args = list(key = name, val = side))

    return(self)
})

Pizza$set("public", "remove_topping", function(name){
    name <- match.arg(tolower(name), ValueObject$get("toppings"))
    do.call(self$toppings$delete, args = list(key = name))
    return(self)
})

