# Setup -------------------------------------------------------------------
testthat::setup({
    assign("test_env", testthat::test_env(), envir = parent.frame())
    create_package(test_wd)
    withr::local_dir(test_wd, .local_envir = test_env)
    test_env$name     <- title$entity("Pizza")
    test_env$domain   <- title$domain("Pizza Ordering")
    test_env$commands <- title$command(c("Select Size", "Add Topping"))
    test_env$queries  <- title$command(c("Review"))
})

# Tests -------------------------------------------------------------------
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


test_that("create a unit-test", {
    attach(test_env)
    file_path <- file.path(getwd(), "tests", "testthat", paste0("test-", filename$entity(name, domain)))
    expect_file_exists(file_path)

    file_content <- readLines(file_path)
    expect_match(file_content, paste0("unit test for entity ", name))
    expect_match(file_content, paste0(name, "\\$new\\("))
    expect_match(file_content, paste0("calling ", commands[1], " changes the state of the object"))
    expect_match(file_content, paste0("calling ", queries[1], " returns the desired results"))
})


# Cleanup -----------------------------------------------------------------
testthat::teardown(unlink(test_wd, recursive = TRUE, force = TRUE))
