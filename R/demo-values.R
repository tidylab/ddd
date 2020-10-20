#' @title Value Object
#' @noRd
#' @keywords internal
ValueObject <- R6DS::RDict$new()

# Toppings ----------------------------------------------------------------
ValueObject$add_multiple(toppings = c("olives", "anchovy", "jalapenos", "feta"))
ValueObject$add_multiple(sides = c("left", "right", "both"))

# Pizza Size --------------------------------------------------------------
ValueObject$add_multiple(sizes = c("small", "medium", "large"))

