.onAttach <- function(lib, pkg,...){
    if(interactive()) packageStartupMessage(paste(
        "\n",
        "Welcome to ddd\n",
        "\n",
        "More information is available on the ddd project website:\n",
        "https://tidylab.github.io/ddd/\n",
        "\n",
        sep=""
    ))
}
