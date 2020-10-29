#' @title Value Object
#' @noRd
#' @keywords internal
Constants <- R6DS::RDict$new()

# Toppings ----------------------------------------------------------------
Constants$add_multiple(toppings = c("olives", "anchovy", "jalapenos", "feta"))
Constants$add_multiple(sides = c("left", "right", "both"))

# Pizza Size --------------------------------------------------------------
Constants$add_multiple(sizes = c("small", "medium", "large"))

