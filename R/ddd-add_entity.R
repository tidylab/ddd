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


    invisible()
}
