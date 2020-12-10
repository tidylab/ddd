#' @title Dummy Domain Service
#' @keywords internal
#' @family internal
#' @noRd
DummyDomainService <- R6::R6Class("DummyDomainService", inherit = AbstractDomainService, lock_objects = FALSE, cloneable = FALSE)

# Public Methods ----------------------------------------------------------
DummyDomainService$set("public", "command", function(
    entity = DummyEntity$new(uid = NULL),
    value_object = DummyValueObject()
){
    stopifnot(any(class(entity) %in% "Entity"))
    stopifnot(any(class(value_object) %in% "data.frame"))

    tryCatch({
        # TODO: Write code that uses uow interface
    },
    error = function(e){
        # TODO: Raise event handler
    })

    invisible(self)
})

DummyDomainService$set("public", "query", function(uid = character(0)){
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
})


# Value Object ------------------------------------------------------------
#' @title Dummy Value Object
#' @keywords internal
#' @family internal
#' @noRd
DummyValueObject <- function(
    mpg = NA_real_, cyl = NA_real_, disp = NA_real_, hp = NA_real_,
    drat = NA_real_, wt = NA_real_, qsec = NA_real_, vs = NA_real_,
    am = NA_real_, gear = NA_real_, carb = NA_real_)
{
    assert_default_classes()
    bind_input_arguments()
}


# Entity ------------------------------------------------------------------
#' @title Dummy Entity
#' @keywords internal
#' @family internal
#' @noRd
DummyEntity <- R6::R6Class("Entity", inherit = AbstractEntity, lock_objects = FALSE, cloneable = FALSE, public = list(
    specification = NULL,
    initialize = function(uid = NULL, specification = DummyValueObject()){
        stopifnot(all(colnames(specification) %in% colnames(DummyValueObject())))
        super$initialize(uid)
        self$specification <- specification
    },
    query = function(){cbind(uid = self$uid, self$specification)},
    command = function(){knitr::kable(self$query()); invisible(self)}
))





