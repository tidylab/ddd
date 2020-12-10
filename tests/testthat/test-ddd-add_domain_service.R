# Setup -------------------------------------------------------------------
create_package(test_wd)
withr::local_dir(test_wd)
name <- title$service("Registry")
domain <- title$domain("Pizza Ordering")

# Tests -------------------------------------------------------------------
test_that("create an R script", {
    expect_null(add_domain_service(name, domain))
    file_path <- file.path(getwd(), "R", filename$service(name, domain))
    expect_file_exists(file_path)

    file_content <- readLines(file_path)
    expect_match(file_content, name)
    expect_match(file_content, domain)
    expect_match(file_content, "command")
    expect_match(file_content, "query")
})

test_that("create a unit-test", {
    file_path <- file.path(getwd(), "tests", "testthat", paste0("test-", filename$service(name, domain)))
    expect_file_exists(file_path)

    file_content <- readLines(file_path)
    expect_match(file_content, paste0(name, "\\$new\\("))
})
