# Helper functions for dynamic value object generation ---------------------

#' Infer R type default from data frame column
#' @param x A vector from a data.frame column
#' @return Character string representing the default value for the type
#' @noRd
infer_type_default <- function(x) {
    if (is.logical(x)) {
        return("NA")
    } else if (is.integer(x)) {
        return("0L")
    } else if (is.numeric(x)) {
        return("0.0")
    } else if (is.character(x)) {
        return("NA_character_")
    } else if (is.factor(x)) {
        return("factor()")
    } else {
        return("NULL")
    }
}

#' Infer type string for documentation
#' @param x A vector from a data.frame column
#' @return Character string representing the type name
#' @noRd
infer_type_string <- function(x) {
    if (is.logical(x)) {
        return("logical")
    } else if (is.integer(x)) {
        return("integer")
    } else if (is.numeric(x)) {
        return("numeric")
    } else if (is.character(x)) {
        return("character")
    } else if (is.factor(x)) {
        return("factor")
    } else {
        return("unknown")
    }
}

#' Infer appropriate conversion function
#' @param x A vector from a data.frame column
#' @return Character string representing the conversion function
#' @noRd
infer_conversion_function <- function(x) {
    if (is.logical(x)) {
        return("as.logical")
    } else if (is.integer(x)) {
        return("as.integer")
    } else if (is.numeric(x)) {
        return("as.numeric")
    } else if (is.character(x)) {
        return("as.character")
    } else if (is.factor(x)) {
        return("as.factor")
    } else {
        return("identity")
    }
}

#' Generate dynamic template for value object
#' @param name Value object name
#' @param domain Domain name
#' @param fields Data frame with columns to use as fields
#' @return Character string with the complete value object code
#' @noRd
generate_dynamic_template <- function(name, domain, fields) {
    col_names <- names(fields)
    
    # Generate @param documentation for each field
    param_docs <- sapply(col_names, function(col) {
        type_str <- infer_type_string(fields[[col]])
        paste0("#' @param ", col, " ('", type_str, "') ?")
    })
    
    # Generate function parameters
    func_params <- sapply(col_names, function(col) {
        default_val <- infer_type_default(fields[[col]])
        paste0("    ", col, " = ", default_val)
    })
    
    # Generate tibble add_column calls
    add_column_calls <- sapply(col_names, function(col) {
        conv_func <- infer_conversion_function(fields[[col]])
        paste0("   |> tibble::add_column(", col, " = ", conv_func, "(", col, "))")
    })
    
    # Construct the complete template using paste instead of str_glue
    template_parts <- c(
        paste0("#' @title ", name, " Value Object"),
        param_docs,
        paste0("#' @return (`", name, "`) ", name, " Value Object"),
        "#' @export",
        paste0("#' @family ", domain),
        paste0(name, " <- function("),
        paste(func_params, collapse = ",\n"),
        "){",
        "    tibble::tibble()",
        add_column_calls,
        "   |> dplyr::distinct()",
        "   |> tidyr::drop_na()",
        "}"
    )
    
    template <- paste(template_parts, collapse = "\n")
    return(template)
}

#' @title Add a Value Object to a Domain
#' @description Value Object
#' @param name (`character`) \code{Value Object} name.
#' @param domain (`character`) \code{Value Object} domain name.
#' @param path (`character`) Path where the R files should be created. Defaults to "R".
#' @param fields (`data.frame`, optional) A data.frame whose columns will be used as fields 
#'   for the value object. When provided, the value object will be generated with 
#'   parameters matching the column names and types of the data.frame.
#' @includeRmd vignettes/articles/add_value_object.Rmd
#' @family domain object generators
#' @export
add_value_object <- function(name, domain, path = "R", fields = NULL){
    # Defensive Programming ---------------------------------------------------
    assert$is_character(name)
    assert$is_character(domain)
    assert$is_character(path)
    if (!is.null(fields)) {
        stopifnot(is.data.frame(fields))
    }

    # Setup -------------------------------------------------------------------
    name <- title$value(name)
    domain <- title$domain(domain)

    # Add Value Object --------------------------------------------------------
    file_path <- file.path(path, filename$value(name, domain))
    file.create(file_path)

    if (is.null(fields)) {
        # Use existing template for backward compatibility
        template <- read_lines(find.template("templates", "value-object", "template.R"))
        excerpts <- str_glue(template, name = name, domain = domain)
        
        content <- excerpts %>%
            unlist(use.names = FALSE) %>%
            paste0(collapse = "\n\n")
    } else {
        # Generate dynamic template based on fields
        content <- generate_dynamic_template(name, domain, fields)
    }

    write(content, file = file_path, append = FALSE, sep = "\n")

    if(interactive()) fs::file_show(file_path) # nocov

    # Return ------------------------------------------------------------------
    invisible()
}
