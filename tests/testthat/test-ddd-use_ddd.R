context("unit test for use_ddd")

# Setup -------------------------------------------------------------------
testthat::setup({
    assign("test_env", testthat::test_env(), envir = parent.frame())
    withr::local_dir(test_wd, .local_envir = test_env)
})

# Create R scripts --------------------------------------------------------
test_that("use_ddd workds", {
    attach(test_env)

    expect_null(use_ddd())
    # file_path <- file.path(getwd(), "R", "ddd-abc.R")
    # expect_file_exists(file_path)

    # file_content <- readLines(file_path)
    # expect_match(file_content, name)
    # expect_match(file_content, domain)
    # expect_match(file_content, commands[1])
    # expect_match(file_content, commands[2])
    # expect_match(file_content, queries[1])
})

