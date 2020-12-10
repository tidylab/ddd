test_that('calling {command} changes the state of the object', {{
    attach(test_env)
    expect_s3_class(entity${command}(), "{name}")
}})
