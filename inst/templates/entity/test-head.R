context('unit test for entity {name}')

# Setup -------------------------------------------------------------------
entity_uid <- "738a742a"


# General -----------------------------------------------------------------
test_that('calling {name}$new instantiates an object with a unique id', {{
    expect_s3_class(entity <<- {name}$new(uid = entity_uid), "{name}")
}})

# Public Methods ----------------------------------------------------------
