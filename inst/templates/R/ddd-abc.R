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
#' @title AbstractDomainService
#' @description Use \code{Unit of Work} as a context manager.
#' @family abstract base classes
#' @keywords internal
#' @export
AbstractDomainService <- R6::R6Class("DomainService", public = list(
    #' @description Instantiate a domain service
    initialize = function(){},
    #' @description Tear down a domain service
    finalize = function(){}
))

# -------------------------------------------------------------------------
#nocov end
