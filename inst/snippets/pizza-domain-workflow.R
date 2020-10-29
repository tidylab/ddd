commands <- c("create_order",
              "create_pizza",
              "add_pizza_to_order",
              "select_size",
              "add_topping",
              "remove_topping",
              "review_pizza",
              "review_order")
add_workflow(steps = commands, domain = "Pizza Ordering")
