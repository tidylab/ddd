# Adding Events -----------------------------------------------------------
# add_domain_event("order_issued",         domain = "pizza_ordering")
# add_domain_event("pizza_added_to_order", domain = "pizza_ordering")
# add_domain_event("pizza_size_decided",   domain = "pizza_ordering")
# add_domain_event("topping_added",        domain = "pizza_ordering")
# add_domain_event("topping_removed",      domain = "pizza_ordering")
# add_domain_event("pizza_reviewed",       domain = "pizza_ordering")
# add_domain_event("order_confirmed",      domain = "pizza_ordering")


# Event ABC ---------------------------------------------------------------
#' @title Domain Event Class
#' @description Event parent class that can store common attributes.
#' @details The class accepts a \code{data.frame} or a \code{list} and maps
#' every column / element into a public method.
#' @export
Event <- R6::R6Class(
    "Event", lock_objects = FALSE,
    public = list(
        #' @description Initialize new event
        #' @param event (`character`) Event name
        #' @param dataclass (`data.frame` | `list`)
        initialize = function(event, dataclass) {
            stopifnot(isFALSE(missing(event)))

            self$event <- event
            self$timestamp <- Sys.time()
            for(k in seq_len(ncol(dataclass)))
                self[[names(dataclass)[k]]] <- dataclass[[k]]

            invisible(self)
        }
    )
)


ToppingAdded <- function()
    Event$new("ToppingAdded", data.frame(ingredient = "olives", side = "both"))
