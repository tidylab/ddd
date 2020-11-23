# -------------------------------------------------------------------------
#' @title Abstract Entity Class
#' @family Abstract Base Class
#' @export
#' @noRd
AbstractEntity <- R6::R6Class("Entity", inherit = NULL, public = list(
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
#' @description Unit of Work hides database details.
#' @family Abstract Base Class
#' @export
#' @noRd
AbstractUnitOfWork <- R6::R6Class("UnitOfWork", inherit = Singleton, public = list(
    enter = function() return(self),
    exit = function() self$rollback(),
    commit = function() NULL,
    rollback = function() NULL
))

# -------------------------------------------------------------------------
#' @title AbstractDomainService
#' @description Use \code{Unit of Work} as a context manager.
#' @family Abstract Base Class
#' @export
#' @noRd
AbstractDomainService <- R6::R6Class("DomainService", public = list(
    uow = AbstractUnitOfWork$new(),
    initialize = function(uow = AbstractUnitOfWork$new()){
        stopifnot(any(class(uow) %in% "UnitOfWork"))
        self$uow <- uow$enter()
    },
    finalize = function(){
        self$uow$exit()
    }
))
