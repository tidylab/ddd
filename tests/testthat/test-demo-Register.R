context("unit test for service Register")

# Setup -------------------------------------------------------------------
testthat::setup({
    assign("test_env", testthat::test_env(), envir = parent.frame())
    test_env$customer_order <- Order$new("2674769e-b0c8-45ee-9b52-d8193c15101f")
    lgr::threshold("off")
})

# General -----------------------------------------------------------------
test_that("calling Register$new instantiates an object", {
    attach(test_env)
    expect_is(register <- Register$new(), "Register")
    test_env$register <- register
})

# Public Methods ----------------------------------------------------------
test_that('calling Register$commit_order an Order', {
    attach(test_env)
    expect_is(register$commit_order("invalid input"), "Register")
    expect_is(register$commit_order(customer_order), "Register")
})

test_that('calling Register$retrieve_order returns an Order', {
    attach(test_env)
    expect_null(register$retrieve_order("invalid uid"))
    expect_identical(register$retrieve_order(customer_order$uid), customer_order)
})
