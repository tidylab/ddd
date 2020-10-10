add_entity(
    "Order", domain = "pizza_ordering",
    commands = c("add_pizza", "confirm_order")
)

add_entity(
    "Pizza", domain = "pizza_ordering",
    commands = c("select_size", "add_topping", "remove_topping"),
    queries = c("review_pizza")
)
