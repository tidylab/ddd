#' @title Add a Command as a Process Step
#' @description Represent a command as a step in a sequential process.
#' @aliases add_command
#' @param name (`character`) Command name.
#' @param domain (`character`) Command domain name.
#' @param testthat_exemption (`logical`) Should the function be excluded from unit-testing?
#' @param covr_exemption (`logical`) Should the function be excluded from code-coverage?
#' @includeRmd vignettes/event-storming/02-commands.Rmd
#' @family domain driven design elements
#' @export
add_step <- function(name, domain = NULL, testthat_exemption = FALSE, covr_exemption = testthat_exemption){
    stopifnot(
        is.character(name),
        is.null(domain) | is.character(domain),
        is.logical(testthat_exemption),
        is.logical(covr_exemption)
    )

    .add_step$script(name, domain, covr_exemption)
    if(!testthat_exemption) .add_step$test(name, domain)

    invisible()
}

# Low-lever Functions -----------------------------------------------------
.add_step <- new.env()
.add_step$script <- function(name, domain, covr_exemption){
    proj_path <- fs::path_wd
    `%||%` <- function(a,b) if(is.null(a)) b else a
    slug <- .add_step$slug(name, domain)
    dir.create(proj_path("R"), recursive = TRUE, showWarnings = FALSE)

    start_comments <- ifelse(covr_exemption, "# nocov start", "")
    end_comments <- ifelse(covr_exemption, "# nocov end", "")

    content <- stringr::str_glue(stringr::str_replace_all(
        "
        ~ @title TODO: Write What the Function Does
        ~ @description  TODO: Write description for`{fct_name}`.
        ~ @param session (`environment`) A shared environment.
        ~ @return session
        ~ @family {domain} domain
        ~ @export
        {fct_name} <- function(session) {{ {start_comments}
            stopifnot(is.environment(session))
            attach(.{fct_name}, warn.conflicts = FALSE)
            on.exit(detach(.{fct_name}))

            # Code ...

            # Return
            invisible(session)
        }} {end_comments}

        # Steps -------------------------------------------------------------------
        .{fct_name} <- new.env()
        .{fct_name}$dummy_step <- function(...) NULL
        ", "~", "#'"),
        fct_name = name,
        domain = domain %||% "",
        start_comments = start_comments,
        end_comments = end_comments
    )

    writeLines(content, proj_path("R", slug, ext = "R"))

    invisible()
}

.add_step$test <- function(name, domain){
    proj_path <- fs::path_wd
    dir.create(proj_path("tests", "testthat"), recursive = TRUE, showWarnings = FALSE)
    slug <- .add_step$slug(name, domain)
    writeLines(
        stringr::str_glue("
        context('unit test for {fct_name}')

        # Setup -------------------------------------------------------------------
        testthat::setup({{
            assign('test_env', testthat::test_env(), envir = parent.frame())
            test_env$session <- new.env()
        }})

        # General -----------------------------------------------------------------
        test_that('{fct_name} works', {{
            attach(test_env)
            expect_silent({fct_name}(session))
        }})
        ", fct_name = name),
        proj_path("tests", "testthat", paste0("test-", slug), ext = "R")
    )
    invisible()
}

.add_step$slug <- function(name, domain){
    is.not.null <- Negate(is.null)
    `%+%` <- base::paste0

    slug <- name
    slug <- if(is.not.null(domain)) domain %+% "-" %+% slug
    return(slug)
}
