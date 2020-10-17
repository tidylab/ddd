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
