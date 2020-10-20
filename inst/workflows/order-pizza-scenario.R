# Order Pizza Scenario ----------------------------------------------------
pkgload::load_all()
seesion <- new.env()


# Helpers -----------------------------------------------------------------
generate_uid <- uuid::UUIDgenerate


# Issue New Order ---------------------------------------------------------
order <- Order$new(uid = generate_uid())
pizza <- Pizza$new(uid = generate_uid())
order$add_pizza(Pizza = pizza)


# Order Pizza -------------------------------------------------------------
pizza$select_size("medium")
pizza$add_topping(name = "olives", side = "both")
pizza$add_topping(name = "anchovy", side = "right")
pizza$add_topping(name = "jalapenos", side = "left")
pizza$remove_topping(name = "olives")
pizza$summary()


# Submit Order ------------------------------------------------------------
order$summary()


