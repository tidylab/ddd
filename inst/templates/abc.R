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

# Public Methods ----------------------------------------------------------
Entity$set(which = "public", overwrite = TRUE, name = "command", value = function(...){
    # TODO: Write command code here
    return(self)
})

Entity$set(which = "public", overwrite = TRUE, name = "query", value = function(){
    # TODO: Write query code here
    query_result <- mtcars
    return(query_result)
})


