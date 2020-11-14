#' @import assertthat
#' @keywords internal
#' @noRd
assert <- new.env()

# General -----------------------------------------------------------------
assert$all_are_non_missing <- function(x) assert_that(noNA(x))
assert$has_colnames <- function(df, which) assert_that(has_name(df, which))
assert$are_character_or_null <- function(x) assert_that(is.character(x) | is.null(x))
assert$are_character <- function(x) assert_that(is.character(x))
assert$is_character <- function(x) assert_that(is.character(x), is.scalar(x))
assert$is_numeric <- function(x) assert_that(is.numeric(x), is.scalar(x))
assert$is_count <- function(x) assert_that(is.count(x))
assert$is_logical <- function(x) assert_that(is.logical(x), is.scalar(x))
assert$is_class <- function(x, class) assert_that(any(class(x) %in% class), msg = paste("object inherits from", paste(class(x), collapse  = ", "), "not",  paste(class, collapse  = ", ")))
assert$is_entity <- function(x) assert_that(any(class(x) %in% "Entity"), msg = paste("object inherits from", paste(class(x), collapse  = ", "), "not Entity"))

