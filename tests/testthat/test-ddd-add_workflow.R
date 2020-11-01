context("unit test for add_workflow")

# Setup -------------------------------------------------------------------
testthat::setup({
    assign("test_env", testthat::test_env(), envir = parent.frame())
    # withr::local_dir(path, .local_envir = test_env)
})

# Create R script ---------------------------------------------------------
test_that("create R script without unit test", {
    attach(test_env)
    # usethis::proj_set(path, force = TRUE)
    # print(getwd())
    name <- "order one pizza"
    domain <- "pizza ordering"
    file_path <- file.path(getwd(), "inst", "workflows", "pizza-ordering.R")
    # expect_silent(add_workflow(name, domain, n_steps = 3))
    # expect_file_exists(file_path)
})
