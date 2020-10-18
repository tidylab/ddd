# Order Pizza Scenario ----------------------------------------------------
pkgload::load_all()
seesion <- new.env()


# Helpers -----------------------------------------------------------------
generate_id <- uuid::UUIDgenerate


# Issue New Order ---------------------------------------------------------
order <- Order$new(id = generate_id())
pizza <- Pizza$new(id = generate_id())
order$add_pizza(Pizza = pizza)


# Order Pizza -------------------------------------------------------------
pizza$select_size("medium")
pizza$add_topping(name = "olives", side = "both")
pizza$add_topping(name = "anchovy", side = "right")
pizza$remove_topping(name = "olives", side = "both")
pizza$review()


# Submit Order ------------------------------------------------------------
order$confirm_order()


