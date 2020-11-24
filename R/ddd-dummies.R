# -------------------------------------------------------------------------
#' @title Dummy Value Object
#' @description A Value Object that does literally nothing. It can be used as a
#' placeholder to facilitate software development.
#' @param ... Any object
#' @family Dummy Domain Objects
#' @return (`data.frame`) mtcars dataset.
#' @export
DummyValueObject <- function(...) return(data.frame(UpperAlphabet = LETTERS, LowerAlphabet = letters)[0,])

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
#' @return (`DomainService`) Access to a bunch of services.
#' @export
DummyDomainService <- R6::R6Class("DummyDomainService", inherit = AbstractDomainService, lock_objects = FALSE, cloneable = FALSE, public = list(
    #' @description Domain service command
    #' @param entity \link{DummyEntity}
    #' @param value_object \link{DummyValueObject}
    command = function(entity = DummyEntity$new(NULL), value_object = DummyValueObject()){
        stopifnot(any(class(entity) %in% "Entity"))
        stopifnot(any(class(value_object) %in% "data.frame"))

        tryCatch({
            self$uow$commit()
        },
        error = function(e){ #nocov start
            self$uow$rollback()
        }) #nocov end

        return(self)
    },
    #' @description Domain service query
    #' @param uid (`character`) Entity uid
    query = function(uid = character(0)){
        stopifnot(is.character(uid))

        entity <- tryCatch({
            # TODO: Write code that uses uow interface
            entity <- NULL
            if(is.null(entity)) stop("entity uid doen't exist") else entity
        },
        error = function(e){
            # TODO: Raise event handler
            return(NULL)
        })

        return(entity)
    }
))


