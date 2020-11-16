context("unit test for service Register")

# Setup -------------------------------------------------------------------
testthat::setup({
    assign("test_env", testthat::test_env(), envir = parent.frame())
})

# General -----------------------------------------------------------------
test_that("calling Register$new instantiates an object", {
    attach(test_env)
    expect_is(register <- Register$new(), "Register")
    test_env$register <- register
})

# Public Methods ----------------------------------------------------------
# test_that('calling Pizza$select_size changes the state of pizza', {
#     attach(test_env)
#     expect_is(order <- register$start_order(), "Order")
# })
