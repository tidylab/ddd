# Test that exactly matches the issue requirements
# GIVEN a domain ("showroom"), a value object name ("car") and a data.frame (mtcars)
# WHEN add_value_object(path = "./R", domain = "showroom", name = "car", fields = mtcars) is called
# THEN a new file is created ./R/showroom-value-objects
# AND a value object template for car is created with mtcars columns as input arguments and expected types

# Setup -------------------------------------------------------------------
create_package(test_wd)
withr::local_dir(test_wd)

test_that("add_value_object exactly matches issue requirements with mtcars data", {
    # Use actual mtcars data (subset for testing to keep it manageable)
    mtcars_test <- mtcars[1:3, c("mpg", "cyl", "disp", "hp", "drat")]
    
    # The exact call from the issue (adjusted for data.frame instead of string)
    result <- add_value_object(path = "R", domain = "showroom", name = "car", fields = mtcars_test)
    expect_null(result)
    
    # Check that file was created with correct name pattern
    file_path <- file.path("R", filename$value("car", "showroom"))
    expect_file_exists(file_path)
    
    # Read the generated content
    file_content <- readLines(file_path)
    content_str <- paste(file_content, collapse = "\n")
    
    # Verify it matches the value object template specified in the issue
    
    # 1. Should have proper title
    expect_match(content_str, "#' @title Car Value Object")
    
    # 2. Should have @param for each mtcars column with inferred types
    expect_match(content_str, "#' @param mpg \\('numeric'\\)")
    expect_match(content_str, "#' @param cyl \\('numeric'\\)")  # mtcars$cyl is numeric, not integer
    expect_match(content_str, "#' @param disp \\('numeric'\\)")
    expect_match(content_str, "#' @param hp \\('numeric'\\)")   # mtcars$hp is numeric, not integer  
    expect_match(content_str, "#' @param drat \\('numeric'\\)")
    
    # 3. Should have proper return documentation
    expect_match(content_str, "#' @return \\(`Car`\\) Car Value Object")
    
    # 4. Should have export and family tags
    expect_match(content_str, "#' @export")
    expect_match(content_str, "#' @family Showroom")
    
    # 5. Should have function definition with proper default values
    expect_match(content_str, "Car <- function\\(")
    expect_match(content_str, "mpg = 0\\.0")
    expect_match(content_str, "cyl = 0\\.0")    # numeric default
    expect_match(content_str, "disp = 0\\.0")
    expect_match(content_str, "hp = 0\\.0")     # numeric default
    expect_match(content_str, "drat = 0\\.0")
    
    # 6. Should use tibble with add_column as specified in the issue
    expect_match(content_str, "tibble::tibble\\(\\)")
    expect_match(content_str, "tibble::add_column\\(mpg = as\\.numeric\\(mpg\\)\\)")
    expect_match(content_str, "tibble::add_column\\(cyl = as\\.numeric\\(cyl\\)\\)")
    expect_match(content_str, "tibble::add_column\\(disp = as\\.numeric\\(disp\\)\\)")
    expect_match(content_str, "tibble::add_column\\(hp = as\\.numeric\\(hp\\)\\)")
    expect_match(content_str, "tibble::add_column\\(drat = as\\.numeric\\(drat\\)\\)")
    
    # 7. Should include distinct() and drop_na() as specified
    expect_match(content_str, "dplyr::distinct\\(\\)")
    expect_match(content_str, "tidyr::drop_na\\(\\)")
    
    # 8. Check the overall structure matches the template from the issue
    # The issue shows a specific pattern, let's verify key parts are there
    expect_match(content_str, "\\|>")  # Should use pipe operator
})

test_that("add_value_object handles integer columns correctly", {
    # Create test data with explicit integer columns
    test_data_int <- data.frame(
        count = c(1L, 2L, 3L),
        flag = c(TRUE, FALSE, TRUE),
        name = c("a", "b", "c"),
        stringsAsFactors = FALSE
    )
    
    result <- add_value_object(name = "test_int", domain = "testing", fields = test_data_int)
    expect_null(result)
    
    file_path <- file.path("R", filename$value("test_int", "testing"))
    expect_file_exists(file_path)
    
    file_content <- readLines(file_path)
    content_str <- paste(file_content, collapse = "\n")
    
    # Check integer types are handled correctly
    expect_match(content_str, "#' @param count \\('integer'\\)")
    expect_match(content_str, "#' @param flag \\('logical'\\)")
    expect_match(content_str, "#' @param name \\('character'\\)")
    
    expect_match(content_str, "count = 0L")
    expect_match(content_str, "flag = NA")
    expect_match(content_str, "name = NA_character_")
    
    expect_match(content_str, "as\\.integer\\(count\\)")
    expect_match(content_str, "as\\.logical\\(flag\\)")
    expect_match(content_str, "as\\.character\\(name\\)")
})