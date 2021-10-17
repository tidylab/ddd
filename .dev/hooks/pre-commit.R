# https://github.com/lorenzwalthert/precommit
remotes::install_cran(c("precommit", "reticulate"), quiet = TRUE)
reticulate::install_miniconda()
# precommit::install_precommit(force = FALSE)
precommit::install_precommit()
precommit::use_precommit()
