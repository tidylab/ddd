#' @title Add a Value Object to a Domain
#' @description Value Object
#' @param name (`character`) \code{Value Object} name.
#' @param domain (`character`) \code{Value Object} domain name.
#' @includeRmd vignettes/add_value_object.Rmd
#' @family domain driven design patterns
#' @export
add_value_object <- function(name, domain = NULL){
    # Defensive Programming ---------------------------------------------------
    assert$is_character(name)
    assert$is_character(domain)

    # Setup -------------------------------------------------------------------
    name <- title$value(name)
    domain <- title$domain(domain)

    # Add Value Object --------------------------------------------------------
    file_path <- file.path(getwd(), "R", filename$value(name, domain))
    file.create(file_path)

    template <- read_lines(find.template("templates", "value-object", "template.R"))
    excerpts <- str_glue(template, name = name, domain = domain)

    excerpts %>%
        unlist(use.names = FALSE) %>%
        paste0(collapse = "\n\n") %>%
        write(file = file_path, append = FALSE, sep = "\n")

    if(interactive()) fs::file_show(file_path) # nocov

    # Return ------------------------------------------------------------------
    invisible()
}
