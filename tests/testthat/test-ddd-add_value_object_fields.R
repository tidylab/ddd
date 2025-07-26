# Test for new add_value_object functionality with fields parameter

# Setup -------------------------------------------------------------------
create_package(test_wd)
withr::local_dir(test_wd)

test_that("add_value_object creates dynamic template with fields parameter", {
    # Create test data similar to mtcars subset
    test_fields <- data.frame(
        mpg = c(21.0, 21.0),
        cyl = c(6L, 6L),
        hp = c(110L, 110L),
        stringsAsFactors = FALSE
    )
    
    # Test the new functionality
    name <- title$value("Car")
    domain <- title$domain("Showroom")
    
    expect_null(add_value_object(name = name, domain = domain, fields = test_fields))
    
    # Check that file was created (using same pattern as original test)
    file_path <- file.path(getwd(), "R", filename$value(name, domain))
    expect_file_exists(file_path)
    
    # Read and check file content
    file_content <- readLines(file_path)
    content_str <- paste(file_content, collapse = "\n")
    
    # Verify the content contains expected elements
    expect_match(content_str, "@param mpg \\('numeric'\\)")
    expect_match(content_str, "@param cyl \\('integer'\\)")
    expect_match(content_str, "@param hp \\('integer'\\)")
    expect_match(content_str, "mpg = 0\\.0")
    expect_match(content_str, "cyl = 0L")
    expect_match(content_str, "hp = 0L")
    expect_match(content_str, "tibble::add_column\\(mpg = as\\.numeric\\(mpg\\)\\)")
    expect_match(content_str, "tibble::add_column\\(cyl = as\\.integer\\(cyl\\)\\)")
    expect_match(content_str, "tibble::add_column\\(hp = as\\.integer\\(hp\\)\\)")
    expect_match(content_str, "dplyr::distinct\\(\\)")
    expect_match(content_str, "tidyr::drop_na\\(\\)")
})

test_that("add_value_object maintains backward compatibility without fields", {
    name <- title$value("Pizza Slice")
    domain <- title$domain("Pizza Ordering")
    
    # Test legacy functionality (without fields parameter)
    expect_null(add_value_object(name, domain))
    file_path <- file.path(getwd(), "R", filename$value(name, domain))
    expect_file_exists(file_path)

    file_content <- readLines(file_path)
    expect_match(file_content, name)
    expect_match(file_content, domain)
})