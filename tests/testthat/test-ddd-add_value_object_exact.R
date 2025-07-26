# Test to verify exact requirements from the issue

# Setup -------------------------------------------------------------------
create_package(test_wd)
withr::local_dir(test_wd)

test_that("add_value_object matches the exact requirements from the issue", {
    # Create test data using mtcars subset (just a few columns for testing)
    mtcars_subset <- data.frame(
        mpg = c(21.0, 21.0, 22.8, 21.4),
        cyl = c(6L, 6L, 4L, 6L),
        hp = c(110L, 110L, 93L, 110L),
        stringsAsFactors = FALSE
    )
    
    # The exact call from the issue:
    # add_value_object(path = "./R", domain = "showroom", name = "car", fields = "mtcars")
    # But since we're using a data.frame instead of the name, we adjust:
    expect_null(add_value_object(path = "R", domain = "showroom", name = "car", fields = mtcars_subset))
    
    # Check that file was created in ./R/showroom-value-objects (or similar)
    file_path <- file.path("R", filename$value("car", "showroom"))
    expect_file_exists(file_path)
    
    # Read the generated content
    file_content <- readLines(file_path)
    content_str <- paste(file_content, collapse = "\n")
    
    # Verify it follows the template pattern from the issue:
    # Should have @title, @param for each column, @return, @export, @family
    expect_match(content_str, "#' @title Car Value Object")
    expect_match(content_str, "#' @param mpg \\('numeric'\\)")
    expect_match(content_str, "#' @param cyl \\('integer'\\)") 
    expect_match(content_str, "#' @param hp \\('integer'\\)")
    expect_match(content_str, "#' @return \\(`Car`\\) Car Value Object")
    expect_match(content_str, "#' @export")
    expect_match(content_str, "#' @family Showroom")
    
    # Should have the function with proper arguments
    expect_match(content_str, "Car <- function\\(")
    expect_match(content_str, "mpg = 0\\.0")
    expect_match(content_str, "cyl = 0L")
    expect_match(content_str, "hp = 0L")
    
    # Should use tibble::add_column pattern as specified
    expect_match(content_str, "tibble::add_column\\(mpg = as\\.numeric\\(mpg\\)\\)")
    expect_match(content_str, "tibble::add_column\\(cyl = as\\.integer\\(cyl\\)\\)")
    expect_match(content_str, "tibble::add_column\\(hp = as\\.integer\\(hp\\)\\)")
    
    # Should include distinct() and drop_na()
    expect_match(content_str, "dplyr::distinct\\(\\)")
    expect_match(content_str, "tidyr::drop_na\\(\\)")
})