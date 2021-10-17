## code to prepare `event_storming` dataset goes here
event_storming <-
  usethis::proj_path("data-raw", "event_storming", ext = "csv") %>%
  readr::read_csv()

event_storming <-
  event_storming %>%
  tidyr::replace_na(structure(rep("", ncol(event_storming)), .Names = colnames(event_storming)) %>% as.list())

usethis::use_data(event_storming, overwrite = TRUE)
