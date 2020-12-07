# Setup -------------------------------------------------------------------
testthat::setup({
    assign("test_env", testthat::test_env(), envir = parent.frame())
    test_env$foo <- function(name = NA_character_, age = 0L) assert_default_classes()
    test_env$bar <- function(name = NA_character_, age = 0L) bind_input_arguments()
})


# assert_default_classes --------------------------------------------------
test_that("assert_default_classes works", {
    attach(test_env)
    expect_null(foo())
    expect_null(foo(name = "Bilbo", age = 18L))
    expect_error(foo(name = Sys.Date(), age = 18L))
})


# bind_input_arguments ----------------------------------------------------
test_that("bind_input_arguments works", {
    attach(test_env)

    expect_equal(bar(), data.frame(name = NA_character_, age = 0L))
    expect_equal(bar(age = 18L), data.frame(name = NA_character_, age = 18L))
    expect_equal(bar(name = "Bilbo", age = 18L), data.frame(name = "Bilbo", age = 18L))
})
