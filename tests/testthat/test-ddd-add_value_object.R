# Setup -------------------------------------------------------------------
create_package(test_wd)
withr::local_dir(test_wd)
name <- title$value("Pizza Slip")
domain <- title$domain("Pizza Ordering")

# Create R script ---------------------------------------------------------
test_that("create an R script", {
    expect_null(add_value_object(name, domain))
    file_path <- file.path(getwd(), "R", filename$value(name, domain))
    expect_file_exists(file_path)

    file_content <- readLines(file_path)
    expect_match(file_content, name)
    expect_match(file_content, domain)
})
