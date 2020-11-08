context('unit test for entity Entity')

# Setup -------------------------------------------------------------------
testthat::setup({
    assign('test_env', testthat::test_env(), envir = parent.frame())
    test_env$md5 <- digest::digest(Sys.time())
})

# General -----------------------------------------------------------------
test_that('calling Entity$new instantiates an object with an unique id', {
    attach(test_env)
    expect_is(entity <- Entity$new(uid = md5), "Entity")
    expect_identical(entity$uid, md5)
    test_env$entity <- entity
})

# Public Methods ----------------------------------------------------------
test_that('calling command changes the state of the object', {
    attach(test_env)
    expect_is(entity$command(), "Entity")
})

test_that('calling query returns the desired results', {
    attach(test_env)
    expect_equivalent(entity$query(), mtcars)
})
