pkg_desc_content <- c(
  "Package: bla",
  "Title: bla",
  "Version: 0.1.0",
  "Author: bla",
  "Maintainer: bla",
  "Description: blablablablablablablablablablablablablablablablablablabla",
  "   blablablablablablablablablablablablablablabla",
  "License: bla"
)

describe("package DESCRIPTION", {

  test_that("returns TRUE for valid DESCRIPTION file", {
    tmp <- withr::local_tempfile(fileext = "DESCRIPTION")
    writeLines(pkg_desc_content, tmp)
    expect_true(is_pkg_description(tmp))
  })

  test_that("returns TRUE with verbose output", {
    tmp <- withr::local_tempfile(fileext = "DESCRIPTION")
    writeLines(pkg_desc_content, tmp)
    expect_true(is_pkg_description(tmp, verbose = TRUE))
  })

  test_that("returns FALSE for incomplete DESCRIPTION file", {
    tmp <- withr::local_tempfile(fileext = "DESCRIPTION")
    writeLines(c("Package: bla", "Title: bla"), tmp)
    expect_false(is_pkg_description(tmp))
  })

  test_that("aborts when file does not exist", {
    expect_error(
      is_pkg_description("nonexistent_DESCRIPTION"),
      regexp = "does not exist"
    )
  })

  test_that("inst/pkg DESCRIPTION passes", {
    pkg_desc <- system.file("pkg", "DESCRIPTION", package = "shinypak")
    expect_true(is_pkg_description(pkg_desc))
  })

})
