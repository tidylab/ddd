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
#' @title Singleton
#' @description Restricts the instantiation of a class to one "single" instance.
#' @noRd
Singleton <- R6::R6Class("Singleton", public = list(
    initialize = function(){
        private$name <- gsub("\\$new\\(.*\\)", "", deparse(sys.calls()[[sys.nframe()-1]]))
        if(!private$exists()) private$set()
    },
    finalize = function() while(private$exists()) private$del()
), private = list(
    name = NULL,
    exists = function() private$name %in% search(),
    get = function() as.environment(private$name),
    del = function() detach(private$name, unload = TRUE, force = TRUE, character.only = TRUE),
    set = function() attach(new.env(), name = private$name, warn.conflicts = FALSE)
))

# -------------------------------------------------------------------------
#' @title Unit of Work (UoW)
#' @description Unit of Work is a context manager.
#' @noRd
AbstractUnitOfWork <- R6::R6Class("UnitOfWork", inherit = Singleton, public = list(
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
