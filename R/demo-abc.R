################################################################################
## Abstract Base Class
################################################################################
#' @title Entity
#' @noRd
Entity <- R6::R6Class("Entity", inherit = NULL, public = list(
    #' @field  Entity unique identifier.
    uid = character(0),
    #' @description
    #' Instantiate Entity object.
    #' @param uid (`character`) Entity unique identifier.
    initialize = function(uid){
        self$uid <- uid
    }
))
# -------------------------------------------------------------------------
#' @title Unit of Work (UoW)
#' @description Unit of Work is a context manager.
#' @noRd
AbstractUnitOfWork <- R6::R6Class("UnitOfWork", public = list(
    enter = function() return(self),
    exit = function() self$rollback(),
    commit = function() stop("NotImplementedError"),
    rollback = function() stop("NotImplementedError")
))


# -------------------------------------------------------------------------
#' @title Unit of Work for Development and Tests
#' @description This implementation uses a dictionary structure
#' @noRd
FakeUnitOfWork <- R6::R6Class("FakeUnitOfWork", inherit = AbstractUnitOfWork, lock_objects = FALSE)

FakeUnitOfWork$set("public", "orders", R6DS::RDict$new())

FakeUnitOfWork$set("public", overwrite = TRUE, "enter", function(){
    self$.orders <-  self$orders$clone()
    super$enter()
})

FakeUnitOfWork$set("public", overwrite = TRUE, "exit", function(){
    super$exit()
})

FakeUnitOfWork$set("public", overwrite = TRUE, "commit", function(){
    self$.orders <-  self$orders
})

FakeUnitOfWork$set("public", overwrite = TRUE, "rollback", function(){
    self$orders <- self$.orders
})
