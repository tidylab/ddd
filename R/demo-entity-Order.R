#' @title Order
#' @family Pizza Ordering
#' @noRd
Order <- R6::R6Class("Order", inherit = Entity, lock_objects = FALSE, cloneable = FALSE)

# Public Methods ----------------------------------------------------------
Order$set("public", "initialize", overwrite = TRUE, function(uid){
    super$initialize(uid)
    self$items <- R6DS::RDict$new()
    self$items$add("Pizza", R6DS::RDict$new())
    invisible(self)
})

# Order Methods -----------------------------------------------------------
Order$set("public", "review", function(uid){
    pizza_slips <- list()

    for(k in seq_len(self$items$get("Pizza")$size)){
        pizza <- self$items$get("Pizza")$values[[k]]
        pizza_slip <- pizza$review()
        pizza_slips <- append(pizza_slips, list(pizza_slip))
    }

    order_slip <- OrderSlip(
        uid = self$uid,
        pizza_slips = pizza_slips
    )

    return(order_slip)
})

# Pizza CRUD Methods ------------------------------------------------------
Order$set("public", "add_pizza", function(Pizza){
    stopifnot("Pizza" %in% class(Pizza))
    self$add_item(Pizza)
    invisible(self)
})

Order$set("public", "get_pizza", function(uid){
    Pizza <- do.call(self$items$get("Pizza")$get, args = list(key = uid))
    return(Pizza)
})

Order$set("public", "remove_pizza", function(uid){
    do.call(self$items$get("Pizza")$delete, args = list(key = uid))
    invisible(self)
})

Order$set("public", "add_item", function(item){
    assert$is_entity(item)
    item_type <- class(item)[1]

    if(item_type %not_in% self$items$keys)
        do.call(self$items$add, args = list(key = item_type, val = R6DS::RDict$new()))

    item_dic <- do.call(self$items$get, args = list(key = item_type))
    do.call(item_dic$delete, args = list(key = item$uid))
    do.call(item_dic$add, args = list(key = item$uid, val = item))

    invisible(self)
})
