#' @title {name} Domain Entity
#' @family {domain}, domain-entity
#' @noRd
{name} <- R6::R6Class("{name}", inherit = AbstractEntity, lock_objects = FALSE, cloneable = FALSE)

# Public Methods ----------------------------------------------------------
{name}$set("public", "initialize", overwrite = TRUE, function(uid){{
    super$initialize(uid)
    return(self)
}})
