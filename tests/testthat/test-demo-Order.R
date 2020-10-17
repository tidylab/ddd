context("unit test for Order")

# Setup -------------------------------------------------------------------
testthat::setup({
    assign("test_env", testthat::test_env(), envir = parent.frame())
    test_env$order_uid <- "910e87ed-7565-4dc3-bfba-8aa072852f8d"
})


# Constructors ------------------------------------------------------------
test_that("calling Order$new instantiates an object with unique id", {
    attach(test_env)
    expect_is(order <- Order$new(uid = order_uid), "Order")
    expect_identical(order$uid, order_uid)
    test_env$order <- order
})
