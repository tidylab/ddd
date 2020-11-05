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
    assert$is_character(name)
    assert$is_character(domain)
    assert$are_character(commands)
    assert$are_character(queries)
    assert$is_logical(testthat_exemption)
    assert$is_logical(covr_exemption)

    add_entity_head <- function(name, domain){
        ""
    }

    add_entity_commands <- function(commands){
        ""
    }

    add_entity_queries <- function(queries){
        ""
    }

    excerpts <- list()
    excerpts$head <- add_entity_head(name, domain)
    excerpts$commands <- add_entity_commands(commands)
    excerpts$queries <- add_entity_queries(queries)

    # Export Script -----------------------------------------------------------
    file_path <- file.path(getwd(), "R", filename$entity(name, domain))
    file.create(file_path)
    writeLines(purrr::map_chr(excerpts, stringr::str_c), con = file_path)

    if(interactive()) fs::file_show(file_path) # nocov
    invisible()
}
