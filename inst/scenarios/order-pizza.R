################################################################################
## Order Pizza Scenario
################################################################################
pkgload::load_all()
generate_uid <- uuid::UUIDgenerate


# Issue New Order ---------------------------------------------------------
customer_order <- Order$new(uid = generate_uid())
pizza <- Pizza$new(uid = generate_uid())
customer_order$add_pizza(Pizza = pizza)


# Order Pizza -------------------------------------------------------------
pizza$select_size("medium")
pizza$add_topping(name = "olives", side = "both")
pizza$add_topping(name = "anchovy", side = "right")
pizza$remove_topping(name = "olives")
pizza$review()


# Commit Order ------------------------------------------------------------
customer_order$commit()
