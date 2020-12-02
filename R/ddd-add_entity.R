#' @title Add an Entity to a Domain
#' @description
#' \code{add_entity} makes it easy to create a class that encapsulates the data
#' and behaviours of an \code{Entity} in a domain.
#' @param name (`character`) \code{Entity} name.
#' @param domain (`character`) \code{Entity} domain name.
#' @param commands (`character`) Optional: names of public method that perform an action.
#' @param queries (`character`) Optional: names of public method that return data to the caller.
#' @includeRmd vignettes/articles/add_entity.Rmd
#' @section Workflow:
#' 1. Optional: Call \code{\link{use_ddd}} maximum once per project; this will make the project independent of `ddd`
#' 2. Call \code{\link{add_entity}} with its respective arguments
#' 3. Call \code{devtools::document} (or Ctrl+Shift+D on windows) to include the Entity in the project NAMESPACE file.
#' 4. Call \code{devtools::test} (or Ctrl+Shift+T on windows) to validate that the Entity's unit-test pass
#' @family domain driven design patterns
#' @export
add_entity <- function(name, domain, commands = NULL, queries = NULL){
    # Defensive Programming ---------------------------------------------------
    assert$is_character(name)
    assert$is_character(domain)
    assert$are_character_or_null(commands)
    assert$are_character_or_null(queries)

    # Setup -------------------------------------------------------------------
    name     <- name %|>|% title$entity
    domain   <- domain %|>|% title$domain
    commands <- commands %|>|% title$command
    queries  <- queries %|>|% title$command

    # Add Entity Object -------------------------------------------------------
    file_path <- file.path(getwd(), "R", filename$entity(name, domain))
    .add_entity$add_Entity_object(file_path, name, domain, commands, queries)
    if(interactive()) fs::file_show(file_path) # nocov

    # Add Unit Test -----------------------------------------------------------
    file_path <- file.path(getwd(), "tests", "testthat", paste0("test-", filename$entity(name, domain)))
    .add_entity$add_Entity_test(file_path, name, domain, commands, queries)
    if(interactive()) fs::file_show(file_path) # nocov

    # Return ------------------------------------------------------------------
    invisible()
}
.add_entity <- new.env()


# High-level functions ----------------------------------------------------
.add_entity$add_Entity_test <- function(file_path, name, domain, commands, queries){
    map_chr <- function(.x, .f, ...){ if(is.null(.x)) return(NULL) else purrr::map_chr(.x, .f, ...)}
    file.create(file_path)

    template <- list()
    template$test <- read_lines(find.template("templates", "entity", "test-head.R"))
    template$command <- read_lines(find.template("templates", "entity", "test-command.R"))
    template$query <- read_lines(find.template("templates", "entity", "test-query.R"))

    excerpts <- list()
    excerpts$test <- str_glue(template$test, name = name, domain = domain)
    excerpts$commands <- map_chr(commands, ~str_glue(template$command, name = name, command = .x))
    excerpts$queries <- map_chr(queries, ~str_glue(template$query, name = name, query = .x))

    excerpts %>%
        unlist(use.names = FALSE) %>%
        paste0(collapse = "\n\n") %>%
        write(file = file_path, append = FALSE, sep = "\n")
}

.add_entity$add_Entity_object <- function(file_path, name, domain, commands, queries){
    map_chr <- function(.x, .f, ...){ if(is.null(.x)) return(NULL) else purrr::map_chr(.x, .f, ...)}
    file.create(file_path)

    template <- list()
    template$head <- read_lines(find.template("templates", "entity", "head.R"))
    template$command <- read_lines(find.template("templates", "entity", "command.R"))
    template$query <- read_lines(find.template("templates", "entity", "query.R"))

    excerpts <- list()
    excerpts$head <- str_glue(template$head, name = name, domain = domain)
    excerpts$commands <- map_chr(commands, ~str_glue(template$command, name = name, command = .x))
    excerpts$queries <- map_chr(queries, ~str_glue(template$query, name = name, query = .x))

    excerpts %>%
        unlist(use.names = FALSE) %>%
        paste0(collapse = "\n\n") %>%
        write(file = file_path, append = FALSE, sep = "\n")

    invisible()
}
