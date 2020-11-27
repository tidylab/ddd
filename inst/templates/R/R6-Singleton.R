#' @title Singleton
#' @description Restricts the instantiation of a class to one "single" instance.
#' @keywords internal
#' @export
#' @noRd
Singleton <- R6::R6Class("Singleton", public = list(
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
