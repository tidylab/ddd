#' @title Pizza Slip
#' @export
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

    return(
        tibble::tribble(
            ~attribute, ~value,
            "size",     size,
            "crust",    crust,
            "sauce",    sauce,
            "cheese",   cheese,
            "toppings", serialize(toppings)
        ) %>% tibble::add_column(entity = uid, .before = 0)
    )
}
