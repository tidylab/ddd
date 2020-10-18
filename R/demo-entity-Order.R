#' @title Order
#' @family Pizza Ordering
#' @noRd
Order <- R6::R6Class("Order", inherit = Entity, lock_objects = FALSE, cloneable = FALSE)

# Public Methods ----------------------------------------------------------
Order$set("public", "initialize", overwrite = TRUE, function(uid){
    super$initialize(uid)
    self$items <- R6DS::RSet$new(equal = function(x, y) return(x$uid == y$uid))
    return(self)
})

Order$set("public", "add_pizza", function(Pizza){
    stopifnot("Pizza" %in% class(Pizza))

    # do.call(self$items$delete, args = list(val = Pizza))
    # do.call(self$items$add, args = list(val = Pizza))

    return(self)
})

# Order$set("public", "review_order", function(){
# return(self$items$to)
#     })
