# Create Dummy Project Folder Structure
options(usethis.quiet = TRUE)
# suppressMessages({
    # sink(tempfile("sink-"))
    path <- tempfile("test-")
    unlink(path, recursive = TRUE, force = TRUE)
    # usethis::create_package(path, rstudio = FALSE, check_name = FALSE, open = FALSE)
    # sink()
# })
