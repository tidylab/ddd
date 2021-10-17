# Setup -------------------------------------------------------------------
create_package(test_wd)
withr::local_dir(test_wd)
name <- title$entity("Pizza")
domain <- title$domain("Pizza Ordering")
commands <- title$command(c("Select Size", "Add Topping"))
queries <- title$command(c("Review"))

# Tests -------------------------------------------------------------------
test_that("create an R script", {
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
  file_path <- file.path(getwd(), "tests", "testthat", paste0("test-", filename$entity(name, domain)))
  expect_file_exists(file_path)

  file_content <- readLines(file_path)
  expect_match(file_content, paste0("unit test for entity ", name))
  expect_match(file_content, paste0(name, "\\$new\\("))
  expect_match(file_content, paste0("calling ", commands[1], " changes the state of the object"))
  expect_match(file_content, paste0("calling ", queries[1], " returns the desired results"))
})
