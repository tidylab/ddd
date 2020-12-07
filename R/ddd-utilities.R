#' @title Utility Functions
#' @description These functions complement and facilitate common tasks of **Value Objects**.
#' @details
#'
#' * `assert_default_classes` compares the classes of the \strong{actual input arguments}
#'   are equal to the classes of the \strong{default input arguments}. This replaces:
#'
#' 1. Multiple assertion calls such as `stopifnot(class(arg) %in%
#' <expected_class>)`; and
#' 2. Hardcoding of assertions. Instead the function automatically detects what
#' is the expected class of the input argument by looking on the class of the
#' default value.
#'
#' * `bind_input_arguments` binds the input argument of the calling functions into a `data.frame`.
#'
#' @name ddd_utils
#' @examples
#'
#' # The following Value Object does two things:
#' # * Defensive programming, specifically, data type check; and
#' # * Organizing the input arguments into a data.frame.
#'
#' foo <<- function(name = NA_character_, age = 0L){
#'   assert_default_classes()
#'   bind_input_arguments()
#' }
#'
#' ## No input arguments
#' foo() # Works (returns the NULL value object)
#'
#' ## Some input arguments
#' foo(age = 18L) # Works
#'
#' ## All input arguments
#' foo(name = "Bilbo", age = 18L) # Works
#'
#' ## Some invalid input arguments
#' try(foo(name = Sys.Date(), age = 18L)) # Fails
#'
#' @references {
#'
#' \href{https://en.wikipedia.org/wiki/Defensive_programming}{Defensive programming}
#'
#' }
NULL

#' @title Data type check
#' @rdname ddd_utils
#' @export
assert_default_classes <- function(){
    caller_name <- sys.call(sys.parent())[[1]]
    expected_args <- as.data.frame(as.list(formals(eval(parse(text = caller_name)), envir = parent.frame(2))))
    actual_args <- lapply(names(expected_args), base::dynGet) %>% stats::setNames(names(expected_args)) %>% as.data.frame()

    for(arg in names(expected_args)){
        expected_class <- class(expected_args[[arg]])
        actual_class <- class(actual_args[[arg]])
        stopifnot(any(actual_class %in% expected_class))
    }

    invisible()
}

#' @title Bind input arguments
#' @rdname ddd_utils
#' @export
bind_input_arguments <- function(){
    caller_name <- sys.call(sys.parent())[[1]]
    expected_args <- as.data.frame(as.list(formals(eval(parse(text = caller_name)), envir = parent.frame(2))))
    actual_args <- lapply(names(expected_args), base::dynGet) %>% stats::setNames(names(expected_args)) %>% as.data.frame()
    as.data.frame(purrr::list_modify(as.list(expected_args), !!!as.list(actual_args)))
}
