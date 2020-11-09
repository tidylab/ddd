context("unit test for add_value_object")

# Setup -------------------------------------------------------------------
testthat::setup({
    assign("test_env", testthat::test_env(), envir = parent.frame())
    withr::local_dir(test_wd, .local_envir = test_env)
    test_env$name   <- title$value("Pizza Slip")
    test_env$domain <- title$domain("Pizza Ordering")
})

# Create R script ---------------------------------------------------------
test_that("create an R script", {
    attach(test_env)

    expect_null(add_value_object(name, domain))
    file_path <- file.path(getwd(), "R", filename$value(name, domain))
    expect_file_exists(file_path)

    # file_content <- readLines(file_path)
    # expect_match(file_content, name)
    # expect_match(file_content, domain)
    # expect_match(file_content, commands[1])
    # expect_match(file_content, commands[2])
    # expect_match(file_content, queries[1])
})
