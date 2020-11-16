#' @title Register Domain Service
#' @family Pizza Ordering, domain-service
#' @noRd
Register <- R6::R6Class("Register", inherit = NULL, lock_objects = FALSE, cloneable = FALSE)

# Public Methods ----------------------------------------------------------
Register$set("public", "start_order", function(){
    Order$new(uid = uuid::UUIDgenerate())
})
