content <- "Version: 1.0

RestoreWorkspace: Default
SaveWorkspace: Default
AlwaysSaveHistory: Default

EnableCodeIndexing: Yes
UseSpacesForTab: Yes
NumSpacesForTab: 2
Encoding: UTF-8

RnwWeave: Sweave
LaTeX: XeLaTeX"

file.create("tests/testthat/fixtures/project_rproj.txt")

writeLines(text = content, con = "tests/testthat/fixtures/project_rproj.txt")

# file.edit("tests/testthat/fixtures/project_rproj.txt")
