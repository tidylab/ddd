#' @title Dummy Entity
#' @keywords internal
#' @noRd
DummyEntity <- R6::R6Class("Entity", inherit = AbstractEntity, lock_objects = FALSE, cloneable = FALSE, public = list(
    # specification = Specification(),
    initialize = function(uid = NULL, specification = NULL){
        super$initialize(uid)
        self$specification <- specification
    },
    query = function(){self$specification %>% tibble::add_column(uid = self$uid, .before = 0)},
    command = function(){knitr::kable(self$query()); invisible(self)}
))

