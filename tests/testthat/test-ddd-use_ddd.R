# Setup -------------------------------------------------------------------
create_package(test_wd)
withr::local_dir(test_wd)

# Create R scripts --------------------------------------------------------
test_that("use_ddd workds", {
    expect_null(use_ddd())
    file_paths <- file.path(getwd(), "R", c("ddd-abc.R"))
    for(file_path in file_paths) expect_file_exists(file_path)
})
