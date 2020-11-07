context("unit test for add_entity")

# Setup -------------------------------------------------------------------
testthat::setup({
    assign("test_env", testthat::test_env(), envir = parent.frame())
    withr::local_dir(test_wd, .local_envir = test_env)
    test_env$name     <- title$entity("Pizza")
    test_env$domain   <- title$domain("Pizza Ordering")
    test_env$commands <- title$command(c("Select Size", "Add Topping"))
    test_env$queries  <- title$command(c("Review"))
})

# Create R script ---------------------------------------------------------
test_that("create an R script", {
    attach(test_env)

    expect_null(add_entity(name, domain, commands, queries))
    file_path <- file.path(getwd(), "R", filename$entity(name, domain))
    expect_file_exists(file_path)

    file_content <- readLines(file_path)
    expect_match(file_content, name)
    expect_match(file_content, domain)
    expect_match(file_content, commands[1])
    expect_match(file_content, commands[2])
    expect_match(file_content, queries[1])
})

test_that("create abstract base class (ABC) script", {
    attach(test_env)
    file_path <- file.path(getwd(), "R", "ddd-abc.R")
    expect_file_exists(file_path)

    file_content <- readLines(file_path)
    expect_match(file_content, "Entity")
})

test_that("create a unit-test", {
    attach(test_env)
    file_path <- file.path(getwd(), "tests", "testthat", paste0("test-", filename$entity(name, domain)))
    expect_file_exists(file_path)

    # file_content <- readLines(file_path)
    # expect_match(file_content, "Entity")
})
