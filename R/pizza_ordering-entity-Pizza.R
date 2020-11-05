#' @title Pizza
#' @family Pizza Ordering
#' @noRd
Pizza <- R6::R6Class("Pizza", inherit = Entity, lock_objects = FALSE, cloneable = FALSE)

# Public Methods ----------------------------------------------------------
Pizza$set("public", "initialize", overwrite = TRUE, function(uid){
    super$initialize(uid)
    return(self)
})

Pizza$set(which = "public", overwrite = TRUE, name = "select_size", value = function(...){
    # TODO: Write command code here
    return(self)
})

Pizza$set(which = "public", overwrite = TRUE, name = "add_topping", value = function(...){
    # TODO: Write command code here
    return(self)
})

Pizza$set(which = "public", overwrite = TRUE, name = "review", value = function(){
    # TODO: Write query code here
    query_result <- mtcars
    return(query_result)
})
