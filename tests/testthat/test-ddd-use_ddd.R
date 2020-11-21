context("unit test for use_ddd")

# Setup -------------------------------------------------------------------
testthat::setup({
    assign("test_env", testthat::test_env(), envir = parent.frame())
    create_package(test_wd)
    withr::local_dir(test_wd, .local_envir = test_env)
})

# Create R scripts --------------------------------------------------------
test_that("use_ddd workds", {
    attach(test_env)
    expect_null(use_ddd())
    file_path <- file.path(getwd(), "R", "ddd-abc.R")
    expect_file_exists(file_path)
})
