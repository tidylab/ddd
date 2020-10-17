# Order -------------------------------------------------------------------
Order <- R6::R6Class("Order", inherit = Entity)

Order$set("public", "items", R6DS::RSet$new(equal = function(x, y) return(x$id == y$id)))

Order$set("public", "add_pizza", function(Pizza){
    stopifnot("Pizza" %in% class(Pizza))
    self$items$add(Pizza)
    return(self)
})

# Pizza -------------------------------------------------------------------
Pizza <- R6::R6Class("Pizza", inherit = Entity)

