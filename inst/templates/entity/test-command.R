test_that('calling {command} changes the state of the object', {{
    attach(test_env)
    expect_is(entity${command}(), "{name}")
}})
