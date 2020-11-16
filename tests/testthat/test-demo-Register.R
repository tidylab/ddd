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
test_that('calling Register$start_order retruns an Order', {
    attach(test_env)
    expect_is(customer_order <- register$start_order(), "Order")
    test_env$customer_order <- customer_order

})

test_that('calling Register$commit_order an Order', {
    attach(test_env)
    expect_warning(register$commit_order("invalid input"))
    expect_is(register$commit_order(customer_order), "Register")
})

test_that('calling Register$retrieve_order returns an Order', {
    attach(test_env)
    expect_null(register$retrieve_order("invalid uid"))
    expect_identical(register$retrieve_order(customer_order$uid), customer_order)
})


