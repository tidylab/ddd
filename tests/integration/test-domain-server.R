context("integration test for domain server")

# Setup -------------------------------------------------------------------
setup({
    assign("test_env", testthat::test_env(), envir = parent.frame())
    create_package(test_wd)
    withr::local_dir(test_wd, .local_envir = test_env)
})

# Create R script ---------------------------------------------------------
test_that("create an R script", {
    attach(test_env)
})
