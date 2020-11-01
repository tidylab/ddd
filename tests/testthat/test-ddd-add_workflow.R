context("unit test for add_workflow")

# Setup -------------------------------------------------------------------
testthat::setup({
    assign("test_env", testthat::test_env(), envir = parent.frame())
})

# Create R script ---------------------------------------------------------
test_that("create R script without unit test", {
    attach(test_env)
    name <- "order one pizza"
    domain <- "pizza ordering"
    path <- file.path(getwd(), "inst", "workflows", filename$workflow(name, domain))
    expect_silent(add_workflow(name, domain, n_steps = 3))
    # expect_file_exists(path)
    # path <- proj_path("R", domain %+% "-" %+% name, ext = "R")
    # expect_true(file.exists(path))
    # unlink(path)
    #
    # path <- proj_path("tests", "testthat", "test" %+% "-" %+% domain %+% "-" %+% name, ext = "R")
    # expect_false(file.exists(path))
})
