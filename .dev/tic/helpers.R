invisible(sapply(list.files("./.dev/tic", "^step_", full.names = TRUE), source))

# branches wrappers -------------------------------------------------------
ci_is_ghactions <- function() nchar(Sys.getenv("GITHUB_ACTION")) > 0
ci_is_gitlab <- function() identical(Sys.getenv("CI_SERVER_NAME"), "GitLab")
ci_get_branch <- function() if(ci_is_gitlab()) Sys.getenv("CI_COMMIT_REF_NAME") else tic::ci_get_branch()
is_master_branch <- function() "master" %in% ci_get_branch()
is_develop_branch <- function() "develop" %in% ci_get_branch()
is_feature_branch <- function() grepl("feature", ci_get_branch())
is_hotfix_branch <- function() grepl("hotfix", ci_get_branch())
is_release_branch <- function() grepl("release", ci_get_branch())
