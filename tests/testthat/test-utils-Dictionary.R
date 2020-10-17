context("unit test for Dictionary")

# Setup -------------------------------------------------------------------
testthat::setup({
    assign("test_env", testthat::test_env(), envir = parent.frame())
})

# General -----------------------------------------------------------------
test_that("calling Dictionary instantiates a dictionary", {
    attach(test_env)
    expect_is(test_env$dict <- Dictionary$new(), "environment")
})

# Add items to the dictionary ---------------------------------------------
test_that('adding fixed key-value pair to the dictionary', {
    attach(test_env)
    expect_false(dict$has("Spinach"))
    try(dict$add("Spinach", "right"))
    expect_true(dict$has("Spinach"))
    expect_identical(dict$get("Spinach"), "right")
})

test_that('adding dynamic key-value pair to the dictionary', {
    attach(test_env)
    name <- "Broccoli"; side <- "left"
    expect_false(dict$has(name))
    try(dict$add(name, side))
    expect_true(dict$has(name))
    expect_true(dict$has("Broccoli"))
    expect_identical(dict$get(name), side)
})

test_that('adding key without a value to the dictionary', {
    attach(test_env)
    expect_false(dict$has("Tomatoes"))
    try(dict$add("Tomatoes"))
    expect_true(dict$has("Tomatoes"))
    expect_identical(dict$get("Tomatoes"), "Tomatoes")
})

test_that('add multiple key-value pairs to the dictionary', {
    attach(test_env)

    dict$add_multiple(collapse = c(Carrot = "left", Mushrooms = "both"))
    expect_true(all(c("Carrot", "Mushrooms") %in% dict$keys))

    dict$add_multiple("Cardamon", "Garlic")
    expect_true(all(c("Cardamon", "Garlic") %in% dict$keys))
})

# Delete items ------------------------------------------------------------
test_that('deleting fixed key-value pair to the dictionary', {
    attach(test_env)

    try(dict$add("Spinach", "right"))
    expect_true(dict$has("Spinach"))

    try(dict$delete("Spinach"))
    expect_false(dict$has("Spinach"))
})
