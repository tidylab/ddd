.onAttach <- function(lib, pkg,...){
    try(
        packageStartupMessage(
            paste(
                "\n",
                "Welcome to ddd version ", utils::packageDescription("ddd")$Version, "\n",
                "\n",
                "More information is available on the ddd project website:\n",
                "https://tidylab.github.io/ddd/\n",
                "\n",
                sep="")
        )
    )
}
