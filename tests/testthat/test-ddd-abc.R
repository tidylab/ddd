# Setup -------------------------------------------------------------------
testthat::setup({
    assign("test_env", testthat::test_env(), envir = parent.frame())
    create_package(test_wd)
    withr::local_dir(test_wd, .local_envir = test_env)
})

# Entity ------------------------------------------------------------------
test_that("implementing AbstractEntity returns Entity", {
    attach(test_env)
    expect_is(entity <- DummyEntity$new(uid = rownames(mtcars[1,]), specification = mtcars[1,]), "Entity")
    expect_is(entity$command(), "Entity")
})


# Cleanup -----------------------------------------------------------------
testthat::teardown(unlink(test_wd, recursive = TRUE, force = TRUE))
