#' @title {name} Domain Service
#' @family {domain}
#' @noRd
{name} <- R6::R6Class("{name}", inherit = AbstractDomainService, lock_objects = FALSE, cloneable = FALSE)

# Public Methods ----------------------------------------------------------
{name}$set("public", "command", function(
    entity = DummyEntity$new(uid = NULL),
    value_object = DummyValueObject()
){{
    tryCatch({{
        stopifnot(any(class(entity) %in% "Entity"))
        stopifnot(any(class(value_object) %in% "data.frame"))
        # TODO: Write code that uses uow interface
        self$uow$commit()
    }},
    error = function(e){{
        # TODO: Raise event handler
        self$uow$rollback()
    }})

    invisible(self)
}})

{name}$set("public", "query", function(uid){{
    entity <- tryCatch({{
        stopifnot(is.character(uid))
        # TODO: Write code that uses uow interface
        entity <- NULL
        if(is.null(entity)) stop("entity uid doen't exist") else entity
    }},
    error = function(e){{
        # TODO: Raise event handler
        return(NULL)
    }})

    return(entity)
}})
