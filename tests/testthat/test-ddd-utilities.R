# Setup -------------------------------------------------------------------
testthat::setup({
    assign("test_env", testthat::test_env(), envir = parent.frame())
    test_env$foo <- function(name = NA_character_, age = 0L) assert_default_classes()
})

# assert_default_classes --------------------------------------------------
test_that("assert_default_classes works", {
    attach(test_env)
    expect_null(foo(), data.frame(name = NA_character_, age = 0L))
    expect_null(foo(name = "Bilbo", age = 18L), data.frame(name = "Bilbo", age = 18L))
    expect_error(foo(name = Sys.Date(), age = 18L))

    #     caller_name <- match.call()[[1]]
    #     row_default <- parse(text = caller_name) %>% eval() %>% formals() %>% as.list()
    #     row_updated <- tryCatch(
    #         purrr::list_modify(row_default, match.call()[[-1]]),
    #         error = function(e) return(row_default)
    #     )
    #     as.data.frame(row_updated)
    # }
})
