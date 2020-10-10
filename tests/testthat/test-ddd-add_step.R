context("unit test for add_step")

# Setup -------------------------------------------------------------------
testthat::setup({
    assign("test_env", testthat::test_env(), envir = parent.frame())
    withr::local_dir(tempdir(), .local_envir = test_env)
    invisible(file.create(".here"))
    test_env$proj_path <- fs::path_wd
    test_env$name <- "add_pizza_to_order"
    test_env$domain <- "pizza_ordering"
})

# Create R script ---------------------------------------------------------
test_that("create R script without unit test", {
    attach(test_env)
    expect_silent(add_step(name, domain, testthat_exemption = TRUE))

    path <- proj_path("R", domain %+% "-" %+% name, ext = "R")
    expect_true(file.exists(path))
    unlink(path)

    path <- proj_path("tests", "testthat", "test" %+% "-" %+% domain %+% "-" %+% name, ext = "R")
    expect_false(file.exists(path))
})

# Create R script and unit-test --------------------------------------------
test_that("create R script with unit test", {
    attach(test_env)
    expect_silent(add_step(name, domain))

    path <- proj_path("R", domain %+% "-" %+% name, ext = "R")
    expect_true(file.exists(path))
    unlink(path)

    path <- proj_path("tests", "testthat", "test" %+% "-" %+% domain %+% "-" %+% name, ext = "R")
    expect_true(file.exists(path))
    unlink(path)
})
