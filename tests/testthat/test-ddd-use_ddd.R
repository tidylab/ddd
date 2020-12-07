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
    file_paths <- file.path(getwd(), "R", c("ddd-abc.R"))
    for(file_path in file_paths) expect_file_exists(file_path)
})
