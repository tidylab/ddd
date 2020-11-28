#nocov start
# -------------------------------------------------------------------------
#' @title Abstract Entity Class
#' @description
#' This class provides the infrastructure for defining abstract base classes of
#' core domain objects.
#' @family abstract base classes
#' @keywords internal
#' @export
AbstractEntity <- R6::R6Class("Entity", inherit = NULL, public = list(
    #' @field uid Entity unique identifier.
    uid = character(0),
    #' @description Instantiate Entity object.
    #' @param uid (`character`) Entity unique identifier.
    initialize = function(uid){
        self$uid <- uid
    }
))

# -------------------------------------------------------------------------
#' @title Unit of Work (UoW)
#' @description Unit of Work hides database details.
#' @family abstract base classes
#' @references
#' * \href{https://docs.python.org/3/library/stdtypes.html#typecontextmanager}{context manager}
#' * \href{https://docs.python.org/3/reference/datamodel.html#object.__enter__}{enter}
#' * \href{https://docs.python.org/3/reference/datamodel.html#object.__exit__}{exit}
#' @keywords internal
#' @export
AbstractUnitOfWork <- R6::R6Class("UnitOfWork", inherit = Singleton, public = list(
    #' @description
    #' Enter the runtime context related to this object. The with statement will
    #' bind this method’s return value to the target(s) specified in the as
    #' clause of the statement, if any.
    enter = function() return(self),
    #' @description
    #' Exit the runtime context related to this object. The parameters describe
    #' the exception that caused the context to be exited. If the context was
    #' exited without an exception, all three arguments will be None.
    exit = function() self$rollback(),
    #' @description Store changes since \code{enter} was called.
    commit = function() NULL,
    #' @description Revert changes since \code{enter} or \code{commit} was called.
    rollback = function() NULL
))

# -------------------------------------------------------------------------
#' @title AbstractDomainService
#' @description Use \code{Unit of Work} as a context manager.
#' @family abstract base classes
#' @keywords internal
#' @export
AbstractDomainService <- R6::R6Class("DomainService", public = list(
    #' @description Instantiate a domain service
    #' @param uow (`UnitOfWork`) instance. See \link{AbstractUnitOfWork}.
    initialize = function(uow = AbstractUnitOfWork$new()){
        stopifnot(any(class(uow) %in% "UnitOfWork"))
        private$uow <- uow$enter()
    },
    #' @description Tear down a domain service
    finalize = function(){
        private$uow$exit()
    }
), private = list(
    uow = AbstractUnitOfWork$new()
))

# -------------------------------------------------------------------------
#nocov end
