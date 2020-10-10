add_step("start_order", domain = "pizza_ordering")
add_step("add_pizza_to_order", domain = "pizza_ordering")
add_step("select_pizza_size", domain = "pizza_ordering")
add_step("add_topping", domain = "pizza_ordering")
add_step("remove_topping", domain = "pizza_ordering")
add_step("review_pizza", domain = "pizza_ordering")
add_step("confirm_order", domain = "pizza_ordering")

# Workflow ----------------------------------------------------------------
session <- new.env()

session %>%
    start_order() %>%
    add_pizza_to_order() %>%
    select_pizza_size() %>%
    add_topping() %>%
    remove_topping() %>%
    review_pizza() %>%
    confirm_order()
