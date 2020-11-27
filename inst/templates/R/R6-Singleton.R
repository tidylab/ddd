#' @title Singleton
#' @description Restricts the instantiation of a class to one "single" instance.
#' @examples
#' \donttest{
#' # Example: A Counter Implementation
#' Counter <- R6::R6Class(inherit = Singleton, public = list(
#'     count = 0,
#'     add_1 = function(){self$count = self$count + 1; invisible(self)}
#' ))
#'
#' counter <- Counter$new()
#' counter$count # = 0
#' counter$add_1()$count # = 1
#' counter$add_1()$count # = 2
#'
#' retrieved_conter <- Counter$new()
#' retrieved_conter$count # 2
#' }
#' @noRd
#' @export
Singleton <- R6::R6Class("Singleton", public = list(
    #' @description Singleton takes the control of object creation out of the
    #'   hands of the programmer. Create or retrieve a new. If the object
    #'   doesn't exists, then Singleton instantiate an object. Else, Singleton
    #'   retrieves the existing object instance.
    initialize = function(){
        private$name <- gsub("\\$new\\(.*\\)", "", deparse(sys.calls()[[sys.nframe()-1]]))
        if(!private$exists()) private$set()
    },
    finalize = function() while(private$exists()) private$del()
), private = list(
    name = NULL,
    exists = function() private$name %in% search(),
    del = function() eval(parse(
        text = paste0("detach('", private$name, "', unload = TRUE, force = TRUE, character.only = TRUE)")
    )),
    set = function() eval(parse(
        text = paste0("attach(new.env(), name = '", private$name, "', warn.conflicts = FALSE)")
    ))
))
