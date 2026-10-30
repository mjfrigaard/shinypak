## code to prepare `topic_lookup` dataset goes here
topic_lookup <- data.frame(
  branch = c(
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
    "12.1_debug-mods",
    "12.2_mod-comms",
    "13_logging",
    "14_tests_suite",
    "15_specs",
    "16.1_test-help",
    "16.2_test-data",
    "16.3_test-logger",
    "16.4_test-snapshots",
    "17_test-modules",
    "18_test-system",
    "19_shinyappsio",
    "20_docker",
    "21.1_gha-style",
    "21.2_gha-shiny-deploy",
    "21.3_gha-shiny-docker",
    "22_webr",
    "23_shinyelectron",
    "24_pkgdown",
    "25_golem",
    "26_leprechaun",
    "27_rhino",
    "28_llm-shiny-assist",
    "29_llm-ellmer",
    "30_llm-chores",
    "31_llm-gander",
    "32_llm-btw"
  ),
  part = c(
    "Intro",           # 02.1_shiny-app
    "Intro",           # 02.2_movies-app
    "Intro",           # 02.3_proj-app
    "Intro",           # 03.1_description
    "Intro",           # 03.2_rproj
    "Intro",           # 03.3_create-package
    "Intro",           # 04_devtools
    "App-packages",    # 05_roxygen2
    "App-packages",    # 06.1_exports
    "App-packages",    # 06.2_imports
    "App-packages",    # 07_data
    "App-packages",    # 08_launch
    "App-packages",    # 09_inst
    "Debugging",       # 10_debugger
    "Debugging",       # 11_debug-print
    "Debugging",       # 12.1_debug-mods
    "Debugging",       # 12.2_mod-comms
    "Debugging",       # 13_logging
    "Tests",           # 14_tests_suite
    "Tests",           # 15_specs
    "Tests",           # 16.1_test-help
    "Tests",           # 16.2_test-data
    "Tests",           # 16.3_test-logger
    "Tests",           # 16.4_test-snapshots
    "Tests",           # 17_test-modules
    "Tests",           # 18_test-system
    "Deploy",          # 19_shinyappsio
    "Deploy",          # 20_docker
    "Deploy",          # 21.1_gha-style
    "Deploy",          # 21.2_gha-shiny-deploy
    "Deploy",          # 21.3_gha-shiny-docker
    "Deploy",          # 22_webr
    "Deploy",          # 23_shinyelectron
    "Deploy",          # 24_pkgdown
    "Frameworks",      # 25_golem
    "Frameworks",      # 26_leprechaun
    "Frameworks",      # 27_rhino
    "Shiny & LLMs",    # 28_llm-shiny-assist
    "Shiny & LLMs",    # 29_llm-ellmer
    "Shiny & LLMs",    # 30_llm-chores
    "Shiny & LLMs",    # 31_llm-gander
    "Shiny & LLMs"     # 32_llm-btw
  ),
  chapter = c(
    "Shiny",                                                  # 02.1_shiny-app
    "Shiny",                                                  # 02.2_movies-app
    "Shiny",                                                  # 02.3_proj-app
    "Packages",                                               # 03.1_description
    "Packages",                                               # 03.2_rproj
    "Packages",                                               # 03.3_create-package
    "Development",                                            # 04_devtools
    "Documentation",                                          # 05_roxygen2
    "Dependencies",                                           # 06.1_exports
    "Dependencies",                                           # 06.2_imports
    "Data",                                                   # 07_data
    "Launch",                                                 # 08_launch
    "External files",                                         # 09_inst
    "Debugging in Positron/RStudio",                          # 10_debugger
    "Print debugging methods",                                # 11_debug-print
    "Debugging modules",                                      # 12.1_debug-mods
    "Debugging module communication",                         # 12.2_mod-comms
    "Logging app behaviors",                                  # 13_logging
    "Building testthat test suite",                           # 14_tests_suite
    "Test specifications",                                    # 15_specs
    "Using ensure to help write tests",                       # 16.1_test-help
    "Storing and using test data",                            # 16.2_test-data
    "Writing a test logging helper function",                 # 16.3_test-logger
    "Test snapshots",                                         # 16.4_test-snapshots
    "Testing modules",                                        # 17_test-modules
    "System tests",                                           # 18_test-system
    "Deploy to shinyapps.io",                                 # 19_shinyappsio
    "Deploying with Docker",                                  # 20_docker
    "Deploying with GitHub Actions (styling code)",           # 21.1_gha-style
    "Deploying shiny app with GitHub Actions",                # 21.2_gha-shiny-deploy
    "Deploying shiny app with Docker and GitHub Actions",     # 21.3_gha-shiny-docker
    "Deploying with webR and shinylive",                      # 22_webr
    "Deploying desktop apps with shinyelectron",              # 23_shinyelectron
    "Deploying a package website",                            # 24_pkgdown
    "golem framework",                                        # 25_golem
    "leprechaun framework",                                   # 26_leprechaun
    "rhino framework",                                        # 27_rhino
    "LLMs with Shiny Assistant",                              # 28_llm-shiny-assist
    "LLMs with ellmer package",                               # 29_llm-ellmer
    "LLMs with chores package",                               # 30_llm-chores
    "LLMs with gander package",                               # 31_llm-gander
    "LLMs with btw package"                                   # 32_llm-btw
  )
)

vroom::vroom_write(x = topic_lookup, file = "inst/extdata/topic_lookup.csv")

usethis::use_data(topic_lookup, overwrite = TRUE)
