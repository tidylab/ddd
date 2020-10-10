## code to prepare `event_storming` dataset goes here

event_storming <-
    tibble::tribble(
        ~Entity, ~Event,                 ~Command,             ~CQRS, ~Example,
        "Order", "Order issued",         "Start order",        "C",   "",
        "Order", "Pizza added to order", "Add pizza to order", "C",   "",
        "Pizza", "Pizza size selected",  "Select pizza size",  "C",   "medium",
        "Pizza", "Topping added",        "Add topping",        "C",   "olives",
        "Pizza", "Topping added",        "Add topping",        "C",   "anchovy, but only on the right half",
        "Pizza", "Topping removed",      "Remove topping",     "C",   "no olives",
        "Pizza", "Pizza reviewed",       "Review pizza",       "Q",   "",
        "Order", "Order confirmed",      "Confirm order",      "C",   ""
    )


usethis::use_data(event_storming, overwrite = TRUE)
