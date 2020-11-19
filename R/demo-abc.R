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
    initialize = function()return(self),
    finalize = function() self$rollback() ,
    commit = function() stop("NotImplementedError"),
    rollback = function() stop("NotImplementedError")
))

