# Setup -------------------------------------------------------------------
foo <<- function(name = NA_character_, age = 0L) assert_default_classes()
bar <<- function(name = NA_character_, age = 0L) bind_input_arguments()
# withr::defer(rm(foo, bar), envir = .GlobalEnv)

# assert_default_classes --------------------------------------------------
test_that("assert_default_classes works", {
    expect_null(foo())
    expect_null(foo(name = "Bilbo", age = 18L))
    expect_error(foo(name = Sys.Date(), age = 18L))
})

# bind_input_arguments ----------------------------------------------------
test_that("bind_input_arguments works", {
    expect_equal(bar(), data.frame(name = NA_character_, age = 0L))
    expect_equal(bar(age = 18L), data.frame(name = NA_character_, age = 18L))
    expect_equal(bar(name = "Bilbo", age = 18L), data.frame(name = "Bilbo", age = 18L))
})
