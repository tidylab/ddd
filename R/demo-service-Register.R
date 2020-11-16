#' @title Register Domain Service
#' @family Pizza Ordering, domain-service
#' @noRd
Register <- R6::R6Class("Register", inherit = NULL, lock_objects = FALSE, cloneable = FALSE)

# Public Methods ----------------------------------------------------------
Register$set("public", "start_order", function(){
    Order$new(uid = uuid::UUIDgenerate())
})

Register$set("public", "commit_order", function(Order){
    tryCatch(
        stopifnot(assert$is_class(Order, "Order")),
        error = function(e) events$invalid_input(msg = e$message)
    )
    invisible(self)
})
