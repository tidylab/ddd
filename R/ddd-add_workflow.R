#' @title Add a Workflow
#' @description Create a **workflow** of sequential steps.
#' @param name (`character`) ***Workflow** name.
#' @param domain (`character`) sub-domain name.
#' @param n_step (`character`) Number of steps that constitute the **Workflow**.
#' @includeRmd vignettes/patterns/workflow.Rmd
#' @family domain driven design patterns
#' @export
add_workflow <- function(name, domain, n_step = 3){
    assert$is_character(name)
    assert$is_character(domain)
    assert$is_count(n_step)

    file_path <- file.path(getwd(), "inst", "workflows", filename$workflow(name, domain))
    file.create(file_path)

    template <-
        readLines(find.template("templates", "workflow", "template.R")) %>%
        stringr::str_flatten("\n") %>%
        stringr::str_glue(
            name = "",
            steps = "step_1",
            workflow = ""
        )

    writeLines(template, con = file_path)
    invisible(NULL)
}
