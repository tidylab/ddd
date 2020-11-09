# Passenger Entity ---------------------------------------------------------
Passenger <- R6::R6Class("Passenger", inherit = Entity)

Passenger$set(
    "public", "initialize", overwrite = TRUE,
    function(uid = uuid::UUIDgenerate(), given, family){
        super$initialize(uid)
        invisible(self)
    }
)


# Passenger Value Object ---------------------------------------------------
Passenger <- function(given = "John", family = "Doe")
    utils::person(given = given, family = family)



# Value Object vs Data Frame  ---------------------------------------------
Passenger <- function(given = NA_character_, family = NA_character_){
    stopifnot(is.character(given))
    stopifnot(is.character(family))
    base::data.frame(given = given, family = family)
}

passenger <- Passenger(given = "Bilbo", family = "Baggins")

passenger <- base::data.frame(given = "Bilbo", family = "Baggins")


Passenger <- function(given = NA_character_, family = NA_character_, age = NA_integer_){
    stopifnot(is.character(given))
    stopifnot(is.character(family))
    stopifnot(is.numeric(age), age <= 120, age >= 0)
    base::data.frame(given = given, family = family)
}

Pizza <- R6::R6Class("Pizza", Event, public = list(review = function() {
    PizzaSlip(size = "medium", slices = 8, cheese = TRUE, toppings = list(olives = "left side"))
    return()
}))

testthat::test_that("Pizza$review returns the Pizza Slip", {
    testthat::expect_setequal(1:3, 3:1)
    testthat::expect_setequal(colnames(Pizza$review()), colname(PizzaSlip()))

}
