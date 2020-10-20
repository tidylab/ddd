## code to prepare `event_storming` dataset goes here

event_storming <-
    tibble::tribble(
        ~Entity, ~Event,                 ~Command,             ~CQRS, ~Example,
        "Order", "New order created",    "New",                "C",   "",
        "Pizza", "New pizza created",    "New",                "C",   "",
        "Order", "Pizza added to order", "Add pizza",          "C",   "",
        "Pizza", "Pizza size selected",  "Select size",        "C",   "medium",
        "Pizza", "Topping added",        "Add topping",        "C",   "olives",
        "Pizza", "Topping added",        "Add topping",        "C",   "anchovy, but only on the right half",
        "Pizza", "Topping removed",      "Remove topping",     "C",   "no olives",
        "Pizza", "Pizza reviewed",       "Review",             "Q",   "",
        "Order", "Order reviewed",       "Review",             "Q",   "",
        "Order", "Order confirmed",      "Confirm",            "C",   ""
    )


usethis::use_data(event_storming, overwrite = TRUE)
