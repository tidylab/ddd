#' @title Order
#' @family Pizza Ordering
#' @noRd
Order <- R6::R6Class("Order", inherit = Entity, lock_objects = FALSE, cloneable = FALSE)

# Public Methods ----------------------------------------------------------
Order$set("public", "initialize", overwrite = TRUE, function(uid){
    super$initialize(uid)
    self$items <- R6DS::RDict$new()
    self$items$add("pizza", R6DS::RDict$new())
    return(self)
})

# Order Methods -----------------------------------------------------------
Order$set("public", "review_order", function(uid){
    order_slip <- data.frame()
    return(order_slip)
})

# Pizza CRUD Methods ------------------------------------------------------
Order$set("public", "add_pizza", function(Pizza){
    stopifnot("Pizza" %in% class(Pizza))
    self$remove_pizza(Pizza$uid)
    do.call(self$items$get("pizza")$add, args = list(key = Pizza$uid, val = Pizza))
    return(self)
})

Order$set("public", "get_pizza", function(uid){
    Pizza <- do.call(self$items$get("pizza")$get, args = list(key = uid))
    return(Pizza)
})

Order$set("public", "remove_pizza", function(uid){
    do.call(self$items$get("pizza")$delete, args = list(key = uid))
    return(self)
})
