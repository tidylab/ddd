################################################################################
## Abstract Base Class
################################################################################
#' @title Entity
#' @noRd
Entity <- R6::R6Class("Entity", inherit = NULL, public = list(
    #' @field  Entity unique identifier.
    uid = character(0),
    #' @description
    #' Instantiate Entity object.
    #' @param uid (`character`) Entity unique identifier.
    initialize = function(uid){
        self$uid <- uid
    }
))

