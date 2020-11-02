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


    # Acquire Templates -------------------------------------------------------
    template <- new.env()
    template$step <- read_lines(find.template("templates", "workflow", "step.R"))
    template$skeleton <- read_lines(find.template("templates", "workflow", "skeleton.R"))


    # Render Templates --------------------------------------------------------
    script <- new.env()

    script$step <-
        paste0("step_", 1:n_step) %>%
        purrr::map(~ str_glue(template$step, name = .x)) %>%
        str_flatten()

    script$skeleton <-
        template$skeleton %>%
        str_glue(
            name = filename$workflow(name, domain),
            steps = script$step,
            workflow = ""
        )


    # Export Script -----------------------------------------------------------
    file_path <- file.path(getwd(), "inst", "workflows", filename$workflow(name, domain))
    file.create(file_path)
    writeLines(script$skeleton, con = file_path)

    invisible()
}
