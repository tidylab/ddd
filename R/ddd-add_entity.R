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

    # Setup -------------------------------------------------------------------
    name <- title$entity(name)
    domain <- title$domain(domain)
    commands <- title$command(commands)
    queries <- title$command(queries)

    # Add Entity to Abstract Base Class (ABC) ---------------------------------
    .add_entity$add_Entity_abc()

    # Add Entity Object -------------------------------------------------------
    .add_entity$add_Entity_object(name, domain, commands, queries)
    if(interactive()) fs::file_show(file_path) # nocov

    # Add Unit Test -----------------------------------------------------------
    if(testthat_exemption != TRUE){
        file_path <- file.path(getwd(), "tests", "testthat", paste0("test-", filename$entity(name, domain)))
        file.create(file_path)

        template <- list()
        template$test <- read_lines(find.template("templates", "entity", "test-head.R"))
        template$command <- read_lines(find.template("templates", "entity", "test-command.R"))

        excerpts <- list()
        excerpts$test <- str_glue(template$test, name = name, domain = domain)
        excerpts$command <- purrr::map_chr(commands, ~str_glue(template$command, name = name, command = command(.x)))

        excerpts %>%
            unlist(use.names = FALSE) %>%
            paste0(collapse = "\n\n") %>%
            write(file = file_path, append = FALSE, sep = "\n")

        if(interactive()) fs::file_show(file_path) # nocov
    }

    # Return ------------------------------------------------------------------
    invisible()
}
.add_entity <- new.env()


# High-level functions ----------------------------------------------------
.add_entity$add_Entity_object <- function(name, domain, commands, queries){
    file_path <- file.path(getwd(), "R", filename$entity(name, domain))
    file.create(file_path)

    excerpts <- list()
    excerpts$head <- .add_entity$add_entity_head(name, domain, commands, queries)
    excerpts$commands <- .add_entity$add_entity_commands(name, domain, commands, queries)
    excerpts$queries <- .add_entity$add_entity_queries(name, domain, commands, queries)

    excerpts %>%
        unlist(use.names = FALSE) %>%
        paste0(collapse = "\n\n") %>%
        write(file = file_path, append = FALSE, sep = "\n")

    invisible()
}

.add_entity$add_Entity_abc <- function(){
    file.not.exists <- Negate(file.exists)
    file.not.contain <- function(path, regex) all(stringr::str_detect(readLines(path), regex, negate = TRUE))
    file_path <- file.path(getwd(), "R", "ddd-abc.R")

    if(file.not.exists(file_path)){
        file.create(file_path)
        excerpts <- list()
        excerpts$head <- read_lines(find.template("templates", "abc", "head.R"))
        excerpts %>%
            unlist(use.names = FALSE) %>%
            paste0(collapse = "\n\n") %>%
            write(file = file_path, append = FALSE, sep = "\n")
    }

    if(file.exists(file_path) & file.not.contain(file_path, "^Entity")){
        excerpts <- list()
        excerpts$entity <- read_lines(find.template("templates", "abc", "entity.R"))
        excerpts %>%
            unlist(use.names = FALSE) %>%
            paste0(collapse = "\n\n") %>%
            write(file = file_path, append = TRUE, sep = "\n")
    }
}


# Low-level functions -----------------------------------------------------
.add_entity$add_entity_head <- function(name, domain, commands, queries){
    template <- read_lines(find.template("templates", "entity", "head.R"))
    str_glue(template, name = name, domain = domain)
}

.add_entity$add_entity_commands <- function(name, domain, commands, queries){
    if(is.null(commands)) return()
    template <- read_lines(find.template("templates", "entity", "commands.R"))
    purrr::map_chr(commands, ~str_glue(template, name = name, command = .x))
}

.add_entity$add_entity_queries <- function(name, domain, commands, queries){
    if(is.null(queries)) return()
    template <- read_lines(find.template("templates", "entity", "queries.R"))
    purrr::map_chr(queries, ~str_glue(template, name = name, query = .x))
}
