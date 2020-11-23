context("unit test for domain dummies")

# Setup -------------------------------------------------------------------
testthat::setup({
    assign("test_env", testthat::test_env(), envir = parent.frame())
})

# Dummy Value Object ------------------------------------------------------
test_that("instantiate a dummy Value Object", {
    expect_is(value_object <- DummyValueObject(), "data.frame")
    test_env$value_object <- value_object
})

# Dummy Entity ------------------------------------------------------------
test_that("instantiate a dummy Entity", {
    expect_is(entity <- DummyEntity$new(uid = "placeholder"), "Entity")
    test_env$entity <- entity
})

# # Dummy Domain Service ----------------------------------------------------
test_that("instantiate a dummy Domain Service", {
    attach(test_env)
    expect_is(domain_service <- DummyDomainService$new(), "DomainService")
    expect_is(domain_service$command(entity = entity, value_object = value_object), "DomainService")
    expect_null(domain_service$query(uid = character(0)))
})
