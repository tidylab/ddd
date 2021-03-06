# Setup -------------------------------------------------------------------
create_package(test_wd)
withr::local_dir(test_wd)


# Value Object ------------------------------------------------------------
test_that("implementing Value Object returns data.frame", {
    expect_s3_class(null_car <- DummyValueObject(), "data.frame")
    expect_has_columns(null_car, colnames(mtcars))

    expect_s3_class(null_car <- DummyValueObject(hp = 8), "data.frame")
    expect_equal(null_car$hp, 8)
})


# Entity ------------------------------------------------------------------
test_that("implementing AbstractEntity returns Entity", {
    expect_s3_class(entity <<- DummyEntity$new(uid = rownames(mtcars[1,])), "Entity")
})

test_that("calling DummyEntity$command returns Entity", {
    expect_s3_class(entity$command(specification = mtcars[1,]), "Entity")
})

test_that("calling DummyEntity$query returns DummyValueObject", {
    expect_has_columns(entity$query(), colnames(DummyValueObject()))
})


# Domain Service ----------------------------------------------------------
test_that("instantiate a DummyDomainService Domain Service", {
    expect_s3_class(domain_service <<- DummyDomainService$new(), "DomainService")
})

test_that("calling DummyDomainService$command performs an action", {
    expect_s3_class(domain_service$command(specification = mtcars[1,]), "DomainService")
})

test_that("calling DummyDomainService$query returns the desired results", {
    expect_null(domain_service$query(uid = character(0)))
})


# Teardown ----------------------------------------------------------------
withr::defer(rm(entity, domain_service, envir = .GlobalEnv))


