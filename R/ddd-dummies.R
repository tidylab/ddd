# -------------------------------------------------------------------------
#' @title Dummy Value Object
#' @description A Value Object that does literally nothing. It can be used as a
#' placeholder to facilitate software development.
#' @family Dummy Domain Objects
#' @return (`data.frame`) mtcars dataset.
#' @export
DummyValueObject <- function() return(mtcars)

# -------------------------------------------------------------------------
#' @title Dummy Entity
#' @description An Entity that does literally nothing. It can be used as a
#' placeholder to facilitate software development.
#' @family Dummy Domain Objects
#' @return (`Entity`) A domain entity.
#' @export
DummyEntity <- R6::R6Class("DummyEntity", inherit = AbstractEntity, lock_objects = FALSE, cloneable = FALSE)

# -------------------------------------------------------------------------
#' @title Dummy Domain Service
#' @description An Domain Service that does literally nothing. It can be used as
#'   a placeholder to facilitate software development.
#' @family Dummy Domain Objects
#' @return (`ContextManager`) Access to a bunch of services.
#' @export
DummyDomainService <- R6::R6Class("DummyDomainService", inherit = AbstractContextManager, lock_objects = FALSE, cloneable = FALSE, public = list(
    #' @description Initialize a Domain Service
    #' @param entity \link{DummyEntity}
    #' @param value_object \link{DummyValueObject}
    initialize = function(entity = DummyEntity$new(NULL), value_object = DummyValueObject()){
        stopifnot(any(class(entity) %in% "Entity"))
        stopifnot(any(class(value_object) %in% "data.frame"))
    }
))


