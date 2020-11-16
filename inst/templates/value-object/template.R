#' @title {name} Value Object
#' @return (`data.frame`)
#' @export
#' @family {domain}, domain-value-objects
#' @keywords internal
#' @noRd
{name} <- function(
    size = NA_character_,
    slices = NA_integer_,
    toppings = list(),
    takeaway = NA
){{
    stopifnot(is.character(size))
    stopifnot(is.integer(slices), slices > 0, slices <= 8)
    stopifnot(is.list(toppings))
    stopifnot(is.logical(takeaway))

    tibble::tibble(
        size = size,
        slices = slices,
        toppings = toppings,
        takeaway = takeaway
    )
}}
