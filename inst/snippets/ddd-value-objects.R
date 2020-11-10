# the types we create will implement this kind of field-based equality testing by default
try(mtcars == iris) # Error

# structural equality (strong sense) --------------------------------------
# check for structure + values
n <- nrow(mtcars)
all.equal(mtcars, mtcars) # TRUE
all.equal(mtcars[1:n, ], mtcars[n:1, ]) # FALSE
all.equal(mtcars, iris) # FALSE

# structural equality (weak sense) ----------------------------------------
# check only for structure
n <- nrow(mtcars)
all.equal(mtcars, mtcars, tolerance = Inf, check.attributes = FALSE) # TRUE
all.equal(mtcars[1:n, ], mtcars[n:1, ], tolerance = Inf, check.attributes = FALSE) # TRUE
all.equal(mtcars, iris, tolerance = Inf, check.attributes = FALSE) # FALSE


# -------------------------------------------------------------------------
# Value types that measure, quantify, or describe things are easier to create,
# test, use, optimize, and maintain.
Car <- function(
    model_name = NULL,
    mpg = NA_real_, cyl = NA_real_, disp = NA_real_, hp = NA_real_,
    drat = NA_real_, wt = NA_real_, qsec = NA_real_, vs = NA_real_,
    am = NA_real_, gear = NA_real_, carb = NA_real_)
{
    base::data.frame(
        mpg = mpg, cyl = cyl, disp = disp, hp = hp,
        drat = drat, wt = wt, qsec = qsec, vs = vs,
        am = am, gear = gear, carb = carb,
        row.names = model_name
    ) %>% tidyr::drop_na()
}

# Easy to test ------------------------------------------------------------
assertthat::assert_that(all(colnames(mtcars) %in% colnames(Car())))

test_that('calling Order$get_customer_info() returns the desired results', {
    expect_setequal(
        colnames(Order$get_customer_info()),
        c("given", "family", "phone", "address")
    )
})


# Easy to use -------------------------------------------------------------
rbind(NULL, mtcars)
rbind(Car(), mtcars)
str(Car())

