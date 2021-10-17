remotes::install_cran("styler", quiet = TRUE)

# styler::style_file(
#     path = usethis::proj_path("R", "Data_Extraction", ext = "R"),
#     style = styler::tidyverse_style
# )

styler::style_pkg(usethis::proj_get(), style = styler::tidyverse_style(indent_by = 4))

# styler::style_dir(usethis::proj_path("inst", "scripts"), style = styler::tidyverse_style)
