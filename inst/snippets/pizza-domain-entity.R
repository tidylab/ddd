add_entity(
    "Order", domain = "pizza_ordering",
    commands = c("add_pizza", "confirm"),
    queries = c("review")
)

add_entity(
    "Pizza", domain = "pizza_ordering",
    commands = c("select_size", "add_topping", "remove_topping"),
    queries = c("review")
)
