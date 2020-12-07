#' @title Dummy Value Object
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

#' @title Dummy Entity
#' @keywords internal
#' @noRd
DummyEntity <- R6::R6Class("Entity", inherit = AbstractEntity, lock_objects = FALSE, cloneable = FALSE, public = list(
    # specification = Specification(),
    initialize = function(uid = NULL, specification = NULL){
        super$initialize(uid)
        self$specification <- specification
    },
    query = function(){cbind(uid = self$uid, self$specification)},
    command = function(){knitr::kable(self$query()); invisible(self)}
))





