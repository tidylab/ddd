context('unit test for entity {name}')

# Setup -------------------------------------------------------------------
testthat::setup({{
    assign('test_env', testthat::test_env(), envir = parent.frame())
    test_env$md5 <- digest::digest(Sys.time())
}})

# General -----------------------------------------------------------------
test_that('calling {name}$new instantiates an object with a unique id', {{
    attach(test_env)
    expect_is(entity <- {name}$new(uid = md5), "{name}")
    test_env$entity <- entity
}})

# Public Methods ----------------------------------------------------------
