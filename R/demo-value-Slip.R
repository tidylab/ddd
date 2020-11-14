# Order Slip --------------------------------------------------------------
#' @title Order Slip
#' @export
#' @family Pizza Ordering
#' @keywords internal
#' @noRd
OrderSlip <- function(
    uid = NA_character_,
    slips = list(PizzaSlip())
){
    stopifnot(is.character(uid), is.list(slips))
    order_slip <-
        dplyr::bind_rows(
            pizza = dplyr::bind_rows(slips),
            .id = "item"
        ) %>%
        tidyr::drop_na()
}

# Pizza Slip --------------------------------------------------------------
#' @title Pizza Slip
#' @return (`data.frame`) Entity–attribute–value model.
#' @export
#' @family Pizza Ordering
#' @keywords internal
#' @noRd
PizzaSlip <- function(
    uid = NA_character_,
    size = NA_character_,
    crust = NA_character_,
    sauce = NA_character_,
    cheese = NA_character_,
    toppings = list()
){
    stopifnot(
        is.character(uid), is.character(size), is.character(crust),
        is.character(sauce), is.character(cheese), is.list(toppings)
    )

    pizza_slip <-
        tibble::tribble(
            ~attribute, ~value,
            "size",     size,
            "crust",    crust,
            "sauce",    sauce,
            "cheese",   cheese,
            "toppings", serialize(toppings)
        ) %>%
        tibble::add_column(entity = uid, .before = 0) %>%
        tidyr::drop_na("entity")
}
