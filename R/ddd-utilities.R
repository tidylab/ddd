#' @title Data Type Check
#' @description Assert that the classes of the \strong{actual input arguments}
#'   are equal to the classes of the \strong{default input arguments}.
#' @keywords internal
#' @examples
#' foo <- function(name = NA_character_, age = 0L){
#'   assert_default_classes()
#'
#'   caller_name <- match.call()[[1]]
#'   row_default <- parse(text = caller_name) %>% eval() %>% formals() %>% as.list()
#'   row_updated <- tryCatch(
#'       purrr::list_modify(row_default, match.call()[[-1]]),
#'       error = function(e) return(row_default)
#'   )
#'   as.data.frame(row_updated)
#' }
#'
#' foo() # Works (returns the NULL value object)
#' foo(name = "Bilbo", age = 18L) # Works
#'
#' \donttest{foo(name = Sys.Date(), age = 18L)} # Fails
#'
#' @return Error if there is any actual class different than the default class,
#'   otherwise returns \code{NULL}.
#' @family domain driven design utilities
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

#' @title Bind Input Arguments into a data.frame
#' @family domain driven design utilities
#' @export
bind_input_arguments <- function(){
    caller_name <- sys.call(sys.parent())[[1]]
    expected_args <- as.data.frame(as.list(formals(eval(parse(text = caller_name)), envir = parent.frame(2))))
    actual_args <- lapply(names(expected_args), base::dynGet) %>% stats::setNames(names(expected_args)) %>% as.data.frame()
    as.data.frame(purrr::list_modify(as.list(expected_args), !!!as.list(actual_args)))
}
