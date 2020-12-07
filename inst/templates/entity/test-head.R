context('unit test for entity {name}')

# Setup -------------------------------------------------------------------
testthat::setup({{
    assign('test_env', testthat::test_env(), envir = parent.frame())
    test_env$entity_uid <- "738a742a"
}})

# General -----------------------------------------------------------------
test_that('calling {name}$new instantiates an object with a unique id', {{
    attach(test_env)
    expect_is(entity <- {name}$new(uid = entity_uid), "{name}")
    test_env$entity <- entity
}})

# Public Methods ----------------------------------------------------------
