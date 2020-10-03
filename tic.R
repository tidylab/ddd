#' Job Lifecycle
#'
#' 1. before_script
#' 2. script
#' 3. after_success or after_failure
#' 4. OPTIONAL before_deploy
#' 5. OPTIONAL deploy
#' 6. OPTIONAL after_deploy
#'
library(tic, warn.conflicts = FALSE)
source("./.app/tic/helpers.R")

# Stage: Before Script ----------------------------------------------------
get_stage("before_script") %>%
    add_code_step(try(devtools::uninstall(), silent = TRUE)) %>%
    add_code_step()

# Stage: Script -----------------------------------------------------------
get_stage("script") %>%
    check_package() %>%
    run_unit_tests()

# Stage: After Success ----------------------------------------------------
get_stage("after_success")

# Stage: After Failure ----------------------------------------------------
get_stage("after_failure")

# Stage: Before Deploy ----------------------------------------------------
get_stage("before_deploy")

# Stage: Deploy -----------------------------------------------------------
if(ci_on_travis()) get_stage("deploy") %>% publish_package_coverage()
if (ci_on_ghactions())get_stage("deploy") %>% add_code_step(pkgdown::deploy_to_branch())

# Stage: After Deploy -----------------------------------------------------
get_stage("after_deploy")

# Stage: After Script -----------------------------------------------------
get_stage("after_script")
