#' @title Add an Entity to a Domain
#' @description Domain Entity
#' @param name (`character`) \code{Entity} name.
#' @param domain (`character`) \code{Entity} domain name.
#' @param commands (`character`)
#' @param queries (`character`)
#' @param testthat_exemption (`logical`) Should the \code{Entity} be excluded from unit-testing?
#' @param covr_exemption (`logical`) Should the \code{Entity} be excluded from code-coverage?
#' @includeRmd vignettes/patterns/entity.Rmd
#' @family domain driven design patterns
#' @export
add_entity <- function(name, domain = NULL, commands = NULL, queries = NULL, testthat_exemption = FALSE, covr_exemption = testthat_exemption){
    # Defensive Programming ---------------------------------------------------
    assert$is_character(name)
    assert$is_character(domain)
    assert$are_character(commands)
    assert$are_character(queries)
    assert$is_logical(testthat_exemption)
    assert$is_logical(covr_exemption)

    # Export Script -----------------------------------------------------------
    excerpts <- .add_entity$generate_R_script(name, domain, commands, queries)
    file_path <- file.path(getwd(), "R", filename$entity(name, domain))
    file.create(file_path)

    excerpts %>%
        unlist(use.names = FALSE) %>%
        paste0(collapse = "\n\n") %>%
        writeLines(con = file_path)

    if(interactive()) fs::file_show(file_path) # nocov
    invisible()
}
.add_entity <- new.env()


# High-level functions ----------------------------------------------------
.add_entity$generate_R_script <- function(name, domain, commands, queries){
    excerpts <- list()
    excerpts$head <- .add_entity$add_entity_head(name, domain, commands, queries)
    excerpts$commands <- .add_entity$add_entity_commands(name, domain, commands, queries)
    excerpts$queries <- .add_entity$add_entity_queries(name, domain, commands, queries)
    return(excerpts)
}


# Low-level functions -----------------------------------------------------
.add_entity$add_entity_head <- function(name, domain, commands, queries){
    template <- read_lines(find.template("templates", "entity", "head.R"))
    str_glue(template, name = title$entity(name), domain = title$domain(domain))
}

.add_entity$add_entity_commands <- function(name, domain, commands, queries){
    if(is.null(commands)) return()
    template <- read_lines(find.template("templates", "entity", "commands.R"))
    purrr::map_chr(commands, ~str_glue(template, name = title$entity(name), command = title$command(.x)))
}

.add_entity$add_entity_queries <- function(name, domain, commands, queries){
    if(is.null(queries)) return()
    template <- read_lines(find.template("templates", "entity", "queries.R"))
    purrr::map_chr(queries, ~str_glue(template, name = title$entity(name), query = title$command(.x)))
}
