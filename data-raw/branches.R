## code to prepare `branches` dataset goes here
branches <- data.frame(branch = c("01_whole-app-game",
                                      "02.1_shiny-app",
                                     "02.2_movies-app",
                                       "02.3_proj-app",
                                    "03.1_description",
                                          "03.2_rproj",
                                 "03.3_create-package",
                                         "04_devtools",
                                         "05_roxygen2",
                                        "06.1_exports",
                                        "06.2_imports",
                                             "07_data",
                                           "08_launch",
                                             "09_inst",
                                         "10_debugger",
                                      "11_debug-print",
                                       "12_debug-apps",
                                       "14_test-suite",
                                      "15_tests-specs",
                                 "16.1_tests-fixtures",
                                  "16.2_tests-helpers",
                                "16.3_tests-snapshots",
                                    "17_tests-modules",
                                     "18_tests-system",
                                           "20_docker",
                                      "21.1_gha-style",
                                      "21.2_gha-shiny",
                                     "21.3_gha-docker",
                                          "22_pkgdown",
                                            "23_golem",
                                       "24_leprechaun",
                                        "25_charpente",
                                            "26_rhino"))

usethis::use_data(branches, overwrite = TRUE)

intro_regex <- paste(c("01_whole-app-game",
                      "02.1_shiny-app",
                      "02.2_movies-app",
                      "02.3_proj-app",
                      "03.1_description",
                      "03.2_rproj",
                      "03.3_create-package",
                      "04_devtools"),
                        collapse = "|")
app_pkg_regex <- paste(c("05_roxygen2",
                      "06.1_exports",
                      "06.2_imports",
                           "07_data",
                         "08_launch",
                           "09_inst"),
                        collapse = "|")
debug_regex <- paste(c("10_debugger",
                      "11_debug-print",
                      "12_debug-apps",
                      "13_logging"),
                        collapse = "|")
tests_regex <- paste(c("14_test-suite",
                      "15_tests-specs",
                 "16.1_tests-fixtures",
                  "16.2_tests-helpers",
                "16.3_tests-snapshots",
                    "17_tests-modules",
                     "18_tests-system"),
                          collapse = "|")
deploy_regex <- paste(c("20_docker",
                      "21.1_gha-style",
                      "21.2_gha-shiny",
                     "21.3_gha-docker",
                          "22_pkgdown"),
                          collapse = "|")
fm_regex <- paste(c("23_golem",
                   "24_leprechaun",
                    "25_charpente",
                    "26_rhino"), collapse = "|")
spec_topics_regex <- paste(c("27_code-style",
                              "28_non-r-code",
                              "29_app-data",
                              "30_stack-traces",
                              "31_depends-hell"),
                              collapse = "|")

part_lookup <- dplyr::mutate(
  branches,
  part = dplyr::case_when(
    stringr::str_detect(string = branch, pattern = intro_regex) ~ "Intro",
    stringr::str_detect(string = branch, pattern = app_pkg_regex) ~ "App-packages",
    stringr::str_detect(string = branch, pattern = debug_regex) ~ "Debug",
    stringr::str_detect(string = branch, pattern = tests_regex) ~ "Tests",
    stringr::str_detect(string = branch, pattern = deploy_regex) ~ "Deploy",
    stringr::str_detect(string = branch, pattern = fm_regex) ~ "Frameworks",
    stringr::str_detect(string = branch, pattern = spec_topics_regex) ~ "Special Topics"
  )
)

topic_lookup <- dplyr::mutate(
  part_lookup,
  chapter = dplyr::case_when(
    stringr::str_detect(string = branch, pattern = "01_whole-app-game") ~ "Whole app game",
    stringr::str_detect(string = branch, pattern = "02.1_shiny-app|02.2_movies-app|02.3_proj-app") ~ "Shiny",
    stringr::str_detect(string = branch, pattern = "03.1_description|03.2_rproj|03.3_create-package") ~ "Packages",
    stringr::str_detect(string = branch, pattern = "04_devtools") ~ "Development",
    stringr::str_detect(string = branch, pattern = "05_roxygen2") ~ "Documentation",
    stringr::str_detect(string = branch, pattern = "06.1_exports|06.2_imports") ~ "Dependencies",
    stringr::str_detect(string = branch, pattern = "07_data") ~ "Data",
    stringr::str_detect(string = branch, pattern = "08_launch") ~ "Launch",
    stringr::str_detect(string = branch, pattern = "09_inst") ~ "Resources",
    stringr::str_detect(string = branch, pattern = "10_debugger") ~ "Debuggers",
    stringr::str_detect(string = branch, pattern = "11_debug-print") ~ "Print debugging",
    stringr::str_detect(string = branch, pattern = "12_debug-apps") ~ "Debugging apps",
    stringr::str_detect(string = branch, pattern = "13_logging") ~ "Logging",
    stringr::str_detect(string = branch, pattern = "14_test-suite") ~ "Test suite",
    stringr::str_detect(string = branch, pattern = "15_tests-specs") ~ "Specifications",
    stringr::str_detect(string = branch, pattern = "16.1_tests-fixtures") ~ "Test tools",
    stringr::str_detect(string = branch, pattern = "16.2_tests-helpers") ~ "Test tools",
    stringr::str_detect(string = branch, pattern = "16.3_tests-snapshots") ~ "Test tools",
    stringr::str_detect(string = branch, pattern = "17_tests-modules") ~ "Testing modules",
    stringr::str_detect(string = branch, pattern = "18_tests-system") ~ "System tests",
    stringr::str_detect(string = branch, pattern = "20_docker") ~ "Docker",
    stringr::str_detect(string = branch, pattern = "21.1_gha-style") ~ "GitHub Actions",
    stringr::str_detect(string = branch, pattern = "21.2_gha-shiny") ~ "GitHub Actions",
    stringr::str_detect(string = branch, pattern = "21.3_gha-docker") ~ "GitHub Actions",
    stringr::str_detect(string = branch, pattern = "22_pkgdown") ~ "pkgdown",
    stringr::str_detect(string = branch, pattern = "23_golem") ~ "golem",
    stringr::str_detect(string = branch, pattern = "24_leprechaun") ~ "leprechaun",
    stringr::str_detect(string = branch, pattern = "25_charpente") ~ "charpente",
    stringr::str_detect(string = branch, pattern = "26_rhino") ~ "rhino"
  )
)

usethis::use_data(topic_lookup, overwrite = TRUE)
