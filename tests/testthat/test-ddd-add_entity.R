context("unit test for add_entity")

# Setup -------------------------------------------------------------------
testthat::setup({
    assign("test_env", testthat::test_env(), envir = parent.frame())
    withr::local_dir(test_wd, .local_envir = test_env)
    test_env$name <- "Pizza"
    test_env$domain <- "pizza_ordering"
    test_env$commands <- c("select_size", "add_topping")
    test_env$queries <- c("review")
})

# Create R script ---------------------------------------------------------
test_that("create an R script", {
    attach(test_env)

    expect_null(add_entity(name, domain, commands, queries))
    file_name <- stringr::str_glue("{domain}-entity-{name}.R", name = name, domain = domain)
    file_path <- file.path(getwd(), "R", file_name)
    expect_file_exists(file_path)
    #
    # file_content <- readLines(file_path)
    # expect_match(file_content, "step_1")
})
