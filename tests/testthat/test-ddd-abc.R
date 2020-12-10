# Setup -------------------------------------------------------------------
assign("test_env", testthat::test_env())
create_package(test_wd)
withr::local_dir(test_wd, .local_envir = test_env)


# Value Object ------------------------------------------------------------
test_that("implementing Value Object returns data.frame", {
    attach(test_env)
    expect_s3_class(null_car <- DummyValueObject(), "data.frame")
    expect_has_columns(null_car, colnames(mtcars))

    expect_s3_class(null_car <- DummyValueObject(hp = 8), "data.frame")
    expect_equal(null_car$hp, 8)
})


# Entity ------------------------------------------------------------------
test_that("implementing AbstractEntity returns Entity", {
    attach(test_env)
    expect_s3_class(entity <- DummyEntity$new(uid = rownames(mtcars[1,]), specification = mtcars[1,]), "Entity")
    expect_s3_class(entity$command(), "Entity")
    expect_s3_class(entity$query(), "data.frame")
})
