#' @title Add a Service to a Domain
#' @description Domain Service
#' @param name (`character`) \code{Domain Service} name.
#' @param domain (`character`) \code{Domain Service} domain name.
#' @includeRmd vignettes/articles/add_domain_service.Rmd
#' @family domain object generators
#' @export
add_domain_service <- function(name, domain){
    # Defensive Programming ---------------------------------------------------
    assert$is_character(name)
    assert$is_character(domain)

    # Setup -------------------------------------------------------------------
    name <- title$service(name)
    domain <- title$domain(domain)

    # Add Domain Server -------------------------------------------------------
    file_path <- file.path(getwd(), "R", filename$service(name, domain))
    file.create(file_path)

    template <- read_lines(find.template("templates", "domain-service", "template.R"))
    excerpts <- str_glue(template, name = name, domain = domain)

    excerpts %>%
        unlist(use.names = FALSE) %>%
        paste0(collapse = "\n\n") %>%
        write(file = file_path, append = FALSE, sep = "\n")

    if(interactive()) fs::file_show(file_path) # nocov

    # Add Unit Test -----------------------------------------------------------
    file_path <- file.path(getwd(), "tests", "testthat", paste0("test-", filename$service(name, domain)))
    file.create(file_path)

    template <- read_lines(find.template("templates", "domain-service", "test-template.R"))
    excerpts <- str_glue(template, name = name, domain = domain)

    excerpts %>%
        unlist(use.names = FALSE) %>%
        paste0(collapse = "\n\n") %>%
        write(file = file_path, append = FALSE, sep = "\n")

    if(interactive()) fs::file_show(file_path) # nocov

    # Return ------------------------------------------------------------------
    invisible()
}
