#' @title Dummy Domain Service
#' @description A dummy for tests, and demonstration purposes.
#' @param specification (`data.frame`) a data.frame of type DummyValueObject.
#' @param uid (`character`) A DummyEntity \code{uid}.
#' @family dummy domain objects
#' @keywords internal
#' @noRd
DummyDomainService <- R6::R6Class("DummyDomainService", inherit = AbstractDomainService, lock_objects = FALSE, cloneable = FALSE, public = list(
    #' @description command function
    command = function(specification = DummyValueObject()){
        stopifnot(any(class(specification) %in% "data.frame"))
        stopifnot(all(colnames(specification) %in% colnames(DummyValueObject())))

        tryCatch({
            # TODO: Write code that uses uow interface
        },
        error = function(e){
            # TODO: Raise event handler
        })

        invisible(self)
    },
    #' @description query function
    query =  function(uid = character(0)){
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


# Entity ------------------------------------------------------------------
#' @title Dummy Entity
#' @description A dummy for tests, place-holders and demonstration purposes.
#' @param uid (`character`) A DummyEntity \code{uid}.
#' @param specification (`data.frame`) a data.frame of type DummyValueObject.
#' @family dummy domain objects
#' @keywords internal
#' @noRd
DummyEntity <- R6::R6Class("Entity", inherit = AbstractEntity, lock_objects = FALSE, cloneable = FALSE, public = list(
    #' @description  Instantiate a dummy Entity object
    initialize = function(uid = NULL){
        super$initialize(uid)
        self$specification <- list()
        return(self)
    },
    #' @description command function
    command = function(specification = DummyValueObject()){
        # TODO: Write command code here
        stopifnot(all(colnames(specification) %in% colnames(DummyValueObject())))
        self$specification <- purrr::list_modify(self$specification, !!!specification)
        return(self)
    },
    #' @description query function
    query = function(){
        # TODO: Write query code here
        return(cbind(uid = self$uid, as.data.frame(self$specification)))
    }
))


# Value Object ------------------------------------------------------------
#' @title Dummy Value Object
#' @description A dummy for tests, place-holders and demonstration purposes.
#' @family dummy domain objects
#' @keywords internal
#' @noRd
DummyValueObject <- function(
    mpg = NA_real_, cyl = NA_real_, disp = NA_real_, hp = NA_real_,
    drat = NA_real_, wt = NA_real_, qsec = NA_real_, vs = NA_real_,
    am = NA_real_, gear = NA_real_, carb = NA_real_)
{
    assert_default_classes()
    bind_input_arguments()
}
