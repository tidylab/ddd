context("unit test for domain dummies")

# Setup -------------------------------------------------------------------
testthat::setup({
    assign("test_env", testthat::test_env(), envir = parent.frame())
})

# Dummy Value Object ------------------------------------------------------
test_that("instantiate a dummy Value Object", {
    attach(test_env)
    expect_class(DummyValueObject(), "data.frame")
})


# Dummy Entity ------------------------------------------------------------
test_that("instantiate a dummy Entity", {
    attach(test_env)
    expect_class(DummyEntity$new(uid = "placeholder"), "Entity")
})
