#' @title Register Domain Service
#' @family Pizza Ordering, domain-service
#' @noRd
Register <- R6::R6Class("Register", inherit = NULL, lock_objects = FALSE, cloneable = FALSE)

# Public Methods ----------------------------------------------------------
Register$set("public", "start_order", function(){
    Order$new(uid = uuid::UUIDgenerate())
})

Register$set("public", "commit_order", function(Order){
    tryCatch({
        assert$is_class(Order, "Order")
        do.call(private$orders$delete, args = list(key = Order$uid))
        do.call(private$orders$add, args = list(key = Order$uid, val = Order))
    },
    error = function(e) events$invalid_input(msg = e$message)
    )
    invisible(self)
})

Register$set("public", "retrieve_order", function(uid){
    order <- tryCatch({
        assert$is_character(uid)
        do.call(private$orders$get, args = list(key = uid))
    },
    error = function(e){events$invalid_input(msg = e$message); return(NULL)}
    )
    return(order)
})

# Private Methods and Fields ----------------------------------------------
Register$set("private", "orders", R6DS::RDict$new())


