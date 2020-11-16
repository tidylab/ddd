################################################################################
## Order Pizza Scenario
################################################################################
pkgload::load_all()

# Issue New Order ---------------------------------------------------------
register <- Register$new()
customer_order <- Order$new(uid = uuid::UUIDgenerate())
pizza <- Pizza$new(uid = uuid::UUIDgenerate())

customer_order$remove_item(pizza)
customer_order$get_item(pizza$uid, "Pizza")

customer_order$add_item(pizza)
customer_order$get_item(pizza$uid, "Pizza")


# Order Pizza -------------------------------------------------------------
pizza$select_size("medium")
pizza$add_topping(name = "olives", side = "both")
pizza$add_topping(name = "anchovy", side = "right")
pizza$remove_topping(name = "olives")
pizza$review()


# Commit Order ------------------------------------------------------------
customer_order$review()
register$commit_order(customer_order)

