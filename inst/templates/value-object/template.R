# -------------------------------------------------------------------------
#' @title {name} Value Object
#' @return (`data.frame`)
#' @export
#' @family {domain}
#' @keywords internal
#' @noRd
{name} <- function(
    size = NA_character_,
    slices = 4L,
    toppings = list(),
    takeaway = NA
){{
    tibble::tibble(
        size = size,
        slices = slices,
        toppings = toppings,
        takeaway = takeaway
    )
}}

{name} <- decorators::validate_arguments({name})

