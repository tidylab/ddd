context("unit test for entity Order")

# Setup -------------------------------------------------------------------
testthat::setup({
    assign("test_env", testthat::test_env(), envir = parent.frame())
    test_env$order_uid <- "910e87ed-7565-4dc3-bfba-8aa072852f8d"
    test_env$pizza <- Pizza$new(uid = "cc1d4f32")$add_topping("olives", "both")
})

# General -----------------------------------------------------------------
test_that("calling Order$new instantiates an object with unique id", {
    attach(test_env)
    expect_is(pizza_order <- Order$new(uid = order_uid), "Order")
    expect_identical(pizza_order$uid, order_uid)
    test_env$pizza_order <- pizza_order
})

# Public Methods ----------------------------------------------------------
test_that('calling Order$add_pizza changes the state of Order', {
    attach(test_env)
    expect_null(pizza_order$get_pizza(pizza$uid))
    expect_is(pizza_order$add_pizza(pizza), "Order")
    expect_identical(pizza_order$get_pizza(pizza$uid), pizza)
})

test_that('calling Order$review returns the desired results', {
    attach(test_env)
    expect_is(order_slip <- pizza_order$review(), "data.frame")
    expect_has_columns(order_slip, c("item", "entity", "attribute", "value"))
})
