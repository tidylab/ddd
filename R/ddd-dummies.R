# -------------------------------------------------------------------------
#' @title Dummy Value Object
#' @description A Value Object that does literally nothing. It can be used as a
#' placeholder to facilitate software development.
#' @family Dummy Domain Objects
#' @return (`data.frame`) mtcars dataset.
#' @export
DummyValueObject <- function(){
    return(mtcars)
}


# -------------------------------------------------------------------------
#' @title Dummy Entity
#' @description An Entity that does literally nothing. It can be used as a
#' placeholder to facilitate software development.
#' @family Dummy Domain Objects
#' @return (`Entity`) A domain entity.
#' @export
DummyEntity <- R6::R6Class("DummyEntity", inherit = AbstractEntity, lock_objects = FALSE, cloneable = FALSE)


