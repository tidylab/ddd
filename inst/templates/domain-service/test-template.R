context('unit test for domain-service {name}')

# Setup -------------------------------------------------------------------
testthat::setup({{
    assign("test_env", testthat::test_env(), envir = parent.frame())
}})

# Tests -------------------------------------------------------------------
test_that("instantiate a {name} Domain Service", {{
    attach(test_env)
    expect_s3_class(domain_service <- {name}$new(), "DomainService")
    test_env$domain_service <- domain_service
}})

test_that("calling {name}$command performs an action", {{
    attach(test_env)
    expect_s3_class(domain_service$command(), "DomainService")
}})

test_that("calling {name}$query returns the desired results", {{
    attach(test_env)
    expect_null(domain_service$query(uid = character(0)))
}})

# Cleanup -----------------------------------------------------------------
testthat::teardown(rm(domain_service, envir = test_env))
