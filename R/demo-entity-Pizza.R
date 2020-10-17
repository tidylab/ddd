# Pizza -------------------------------------------------------------------
Pizza <- R6::R6Class("Pizza", inherit = Entity, lock_objects = TRUE)


# Public Fields -----------------------------------------------------------
Pizza$set("public", "size", character(0))


# Public Methods ----------------------------------------------------------
Pizza$set("public", "select_size", function(size){
    size <- match.arg(tolower(size), c("small", "medium", "large"))
    self$size <- size
    return(self)
})
