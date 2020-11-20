#' @title Entity Name
#'
#' @description TODO: Describe how this entity models unique things
#'
#' @examples
#' \dontrun{
#' entity <- Entity$new(id = uuid::UUIDgenerate())
#' entity$uid
#' entity$command()
#' entity$query()
#' }
#'
#' @export
#' @family Domain Name
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
