context("unit test for entity Pizza")

# Setup -------------------------------------------------------------------
testthat::setup({
    assign("test_env", testthat::test_env(), envir = parent.frame())
    test_env$pizza_uid <- "cc1d4f32-628f-4da0-97ae-b8995ab7c9ce"
})

# General -----------------------------------------------------------------
test_that("calling Pizza$new instantiates an object with unique id", {
    attach(test_env)
    expect_is(pizza <- Pizza$new(uid = pizza_uid), "Pizza")
    expect_identical(pizza$uid, pizza_uid)
    test_env$pizza <- pizza
})

# Public Methods ----------------------------------------------------------
test_that('calling Pizza$select_size changes the state of pizza', {
    attach(test_env)
    expect_is(pizza$select_size("M"), "Pizza")
    expect_identical(pizza$size, "medium")
})

test_that('calling Pizza$add_topping changes the state of pizza', {
    attach(test_env)
    expect_false(pizza$toppings$has("olives"))
    expect_is(pizza$add_topping(name = "olives", side = "both"), "Pizza")
    expect_true(pizza$toppings$has("olives"))
})

test_that('calling Pizza$add_topping changes the state of pizza', {
    attach(test_env)
    expect_true(pizza$toppings$has("olives"))
    expect_is(pizza$remove_topping(name = "olives"), "Pizza")
    expect_false(pizza$toppings$has("olives"))
})

test_that('calling pizza$summary returns the desired results', {
    attach(test_env)
    expect_is(pizza_slip <- pizza$summary(), "data.frame")
    expect_has_columns(pizza_slip, c("entity", "attribute", "value"))
})

# Factory -----------------------------------------------------------------
test_that('calling Pizza$add_topping changes the state of pizza', {
    attach(test_env)
    expect_is(pizza.a <- Pizza$new(uid = "a"), "Pizza")
    expect_is(pizza.b <- Pizza$new(uid = "b"), "Pizza")
    expect_null(pizza.a$toppings$keys)

    pizza.a$add_topping("olives", "both")
    expect_equal(pizza.a$toppings$keys, "olives")
    expect_null(pizza.b$toppings$keys)
})

