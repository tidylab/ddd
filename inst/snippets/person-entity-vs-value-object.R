# Customer Entity ---------------------------------------------------------
Customer <- R6::R6Class("Customer", inherit = Entity)

Customer$set(
    "public", "initialize", overwrite = TRUE,
    function(uid = uuid::UUIDgenerate(), given, family){
        super$initialize(uid)
        invisible(self)
    }
)


# Customer Value Object ---------------------------------------------------
Customer <- function(given = "John", family = "Doe")
    utils::Customer(given = given, family = family)

