#' @title Add a Workflow
#' @description Create a workflow of sequential steps.
#' @param name (`character`) \code{Workflow} name.
#' @param domain (`character`) sub-domain name.
#' @param n_step (`character`) Number of steps that constitute the \code{Workflow}.
#' @includeRmd vignettes/patterns/workflow.Rmd
#' @family domain driven design patterns
#' @export
add_workflow <- function(name, domain = "domain", n_steps = 3){
    assert$is_character(name)
    assert$is_character(domain)
    assert$is_count(n_steps)

    invisible()
}
