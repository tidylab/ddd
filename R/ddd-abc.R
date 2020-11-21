# -------------------------------------------------------------------------
#' @title Abstract Entity Class
#' @family Abstract Base Class
#' @export
#' @noRd
AbstractEntity <- R6::R6Class("Entity", inherit = NULL, public = list(
    #' @field  Entity unique identifier.
    uid = character(0),
    #' @description
    #' Instantiate Entity object.
    #' @param uid (`character`) Entity unique identifier.
    initialize = function(uid){
        self$uid <- uid
    }
))

# -------------------------------------------------------------------------
#' @title Abstract Context Manager
#' @family Abstract Base Class
#' @references
#' * \href{https://book.pythontips.com/en/latest/context_managers.html}{Context Managers in Python}
#' @export
#' @noRd
AbstractContextManager <- R6::R6Class("ContextManager", inherit = NULL)
