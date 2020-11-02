################################################################################
## <name> Workflow
################################################################################
# Steps -------------------------------------------------------------------
step_1 <- function(session){
    return(session)
}

step_2 <- function(session){
    return(session)
}

step_3 <- function(session){
    return(session)
}


# Workflow ----------------------------------------------------------------
session <- new.env()

session %>%
    step_1() %>%
    step_2() %>%
    step_3()
