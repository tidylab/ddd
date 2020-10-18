# Order -------------------------------------------------------------------
Order <- R6::R6Class("Order", inherit = Entity, lock_objects = FALSE)

Order$set("public", "items", R6DS::RSet$new(equal = function(x, y) return(x$uid == y$uid)))

# Order$set("public", "add_pizza", function(Pizza){
#     stopifnot("Pizza" %in% class(Pizza))
#     self$items$add(Pizza)
#     return(self)
# })

# Order$set("public", "review_order", function(){
# return(self$items$to)
#     })
