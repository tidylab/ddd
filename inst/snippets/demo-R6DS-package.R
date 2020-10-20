# What is the best option for storing Pizza objects? ----------------------
Entity <- R6::R6Class("Entity", public = list(uid = NA_character_, initialize = function(uid) self$uid <- uid))
Pizza <- R6::R6Class("Pizza", inherit = Entity)
Drink <- R6::R6Class("Drink", inherit = Entity)

pizza_a <- Pizza$new("a")
pizza_b <- Pizza$new("b")

# Set ---------------------------------------------------------------------
pizzas <- R6DS::RSet$new(equal = function(x, y) return(x$uid == y$uid))
pizzas$add(pizza_a)
pizzas$add(pizza_b)

pizzas$contains()


# Dictionary of Dictionaries ----------------------------------------------
items <- R6DS::RDict$new()
items$add("pizzas", R6DS::RDict$new())
items$get("pizzas")$add(pizza_a$uid, pizza_a)
items$get("pizzas")$add(pizza_b$uid, pizza_b)
pizzas <- items$get("pizzas")
pizzas$keys

# Dictionary of Sets ------------------------------------------------------
items <- R6DS::RDict$new()
items$add("pizzas", R6DS::RSet$new(equal = function(x, y) return(x$uid == y$uid)))


