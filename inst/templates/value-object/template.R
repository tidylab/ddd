#' @title {name} Value Object
#' @return (`data.frame`)
#' @export
#' @family {domain}
#' @keywords internal
#' @noRd
{name} <- function(
    size = NA_character_,
    slices = NA_integer_,
    cheese = NA,
    toppings = list()
){{
    stopifnot(is.character(size))
    stopifnot(is.integer(slices), slices > 0, slices <= 8)
    stopifnot(is.character(cheese))
    stopifnot(is.list(toppings))

    tibble::tibble(
        size = size,
        slices = slices,
        cheese = cheese,
        toppings = toppings
    )
}}
