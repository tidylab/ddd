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

# Macros ------------------------------------------------------------------
# tic::use_ghactions_deploy()
if (ci_on_ghactions() & is_master_branch()) do_pkgdown(deploy = TRUE, orphan = TRUE)

# Stage: Before Script ----------------------------------------------------
get_stage("before_script") %>%
    add_code_step(try(devtools::uninstall(), silent = TRUE)) %>%
    add_code_step(unlink(list.files(".", "demo-.*.R", full.names = TRUE, recursive = TRUE)))

# Stage: Script -----------------------------------------------------------
get_stage("script") %>%
    check_package() %>%
    run_unit_tests() %>%
    run_code_coverage()

# Stage: After Success ----------------------------------------------------
get_stage("after_success")

# Stage: After Failure ----------------------------------------------------
get_stage("after_failure")

# Stage: Before Deploy ----------------------------------------------------
get_stage("before_deploy")

# Stage: Deploy -----------------------------------------------------------
if(is_master_branch() | is_develop_branch())
    get_stage("deploy") %>%
    add_step(step_publish_package_coverage())

# Stage: After Deploy -----------------------------------------------------
get_stage("after_deploy")

# Stage: After Script -----------------------------------------------------
get_stage("after_script")
