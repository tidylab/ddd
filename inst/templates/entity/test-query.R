test_that('calling {query} returns the desired results', {{
    attach(test_env)
    expect_equivalent(entity${query}(), mtcars)
}})
