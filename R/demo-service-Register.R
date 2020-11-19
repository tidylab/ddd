#' @title Register Domain Service
#' @family Pizza Ordering, domain-service
#' @noRd
Register <- R6::R6Class("Register", inherit = NULL, lock_objects = FALSE, cloneable = FALSE, public = list(
    uow = AbstractUnitOfWork$new(),
    initialize = function(uow = AbstractUnitOfWork$new()){
        assert$is_class(uow, "UnitOfWork")
        self$uow <- uow$enter()
    },
    finalize = function(){
        self$uow$exit()
    }
))

# Public Methods ----------------------------------------------------------
Register$set("public", "commit_order", function(Order){
    tryCatch({
        assert$is_class(Order, "Order")
        do.call(self$uow$orders$delete, args = list(key = Order$uid))
        do.call(self$uow$orders$add, args = list(key = Order$uid, val = Order))
        self$uow$commit()
    },
    error = function(e){
        events$invalid_input(msg = e$message)
        self$uow$rollback()
    })
    invisible(self)
})

Register$set("public", "retrieve_order", function(uid){
    self$uow$enter()

    order <- tryCatch({
        assert$is_character(uid)
        order <- do.call(self$uow$orders$get, args = list(key = uid))
        if(is.null(order)) stop("order uid doen't exist") else order
    },
    error = function(e){
        events$invalid_uid(msg = e$message)
        return(NULL)
    })

    self$uow$exit()
    return(order)
})
