context("integration test for domain objects")

# Setup -------------------------------------------------------------------
setup({
    assign("test_env", testthat::test_env(), envir = parent.frame())
    test_wd <- tempfile("test-")
    create_package(test_wd)
    withr::local_dir(test_wd, .local_envir = test_env)
})


# Tests -------------------------------------------------------------------
test_that("ValueObject works out-of-the-box", {
    attach(test_env)
    expect_null(ddd::add_value_object("Diner", "dummy"))

    devtools::document(quiet = TRUE)
    pkgload::load_all()

    detach("package:ddd", unload = TRUE)
    expect_is(Diner(), "data.frame")
})

# test_that("run server with ddd uninstalled", {
#     detach("package:ddd", unload = TRUE)
#     expect_is(DummyDomainService$new(), "DummyDomainService")
#     attach(test_env)
# })


# Teardown ----------------------------------------------------------------
# teardown(unlink(test_env$test_wd, recursive = TRUE, force = TRUE))

