# nocov start
# -------------------------------------------------------------------------
#' @title Abstract Entity Class
#' @description
#' This class provides the infrastructure for defining abstract base classes of
#' core domain objects.
#' @family abstract base classes
#' @return (`R6`) Object.
#' @export
AbstractEntity <- R6::R6Class("Entity", cloneable = FALSE, public = list(
  #' @field uid Entity unique identifier.
  uid = character(0),
  #' @description Instantiate an Entity object.
  #' @param uid (`character`) Entity unique identifier.
  initialize = function(uid) {
    self$uid <- uid
  }
))

# -------------------------------------------------------------------------
#' @title Abstract Domain Service
#' @description Use \code{Unit of Work} as a context manager.
#' @family abstract base classes
#' @return (`R6`) Object.
#' @export
AbstractDomainService <- R6::R6Class("DomainService", cloneable = FALSE, public = list(
  #' @description Instantiate a domain service
  initialize = function() {},
  #' @description Tear down a domain service
  finalize = function() {}
))

# -------------------------------------------------------------------------
# nocov end
