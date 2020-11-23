context("integration test for standalone domain objects")

# Setup -------------------------------------------------------------------
setup({
    assign("test_env", testthat::test_env(), envir = parent.frame())
    test_wd <- tempfile("test-")
    create_package(test_wd)
    withr::local_dir(test_wd, .local_envir = test_env)
})


# Tests -------------------------------------------------------------------
describe("domain objects", {

    it("creates domain objects", {
        expect_null(ddd::add_value_object("Diner", "dummy"))
        expect_null(ddd::add_entity("Pizza", "dummy",  commands = "command", queries = "query"))
    })

    it("works when ddd is loaded", {
        devtools::document(quiet = TRUE)

        expect_is(Diner(), "data.frame")
        expect_is(Pizza$new(uid = NULL), "Pizza")

    })

    it("works when ddd is unloaded", {
        expect_null(use_ddd())
        devtools::document(quiet = TRUE)
        detach("package:ddd", unload = TRUE)

        expect_is(Diner(), "data.frame")
        expect_is(Pizza$new(uid = NULL), "Pizza")
    })

})

# test_that("run server with ddd uninstalled", {
#     detach("package:ddd", unload = TRUE)
#     expect_is(DummyDomainService$new(), "DummyDomainService")
#     attach(test_env)
# })


# Teardown ----------------------------------------------------------------
# teardown(unlink(test_env$test_wd, recursive = TRUE, force = TRUE))

