# Tests -------------------------------------------------------------------
test_that("instantiate a {name} Domain Service", {{
    expect_s3_class(domain_service <<- {name}$new(), "DomainService")
}})

test_that("calling {name}$command performs an action", {{
    expect_s3_class(domain_service$command(), "DomainService")
}})

test_that("calling {name}$query returns the desired results", {{
    expect_null(domain_service$query(uid = character(0)))
}})
