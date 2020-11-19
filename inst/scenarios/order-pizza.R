################################################################################
## Order Pizza Scenario
################################################################################
# Setup -------------------------------------------------------------------
pkgload::load_all()
uow <- FakeUnitOfWork$new()


# Issue New Order ---------------------------------------------------------
register <- Register$new(uow)
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


# Teardown ----------------------------------------------------------------
rm(register)
uow$orders$keys
