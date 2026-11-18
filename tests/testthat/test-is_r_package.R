pkg_desc_lines <- c(
  "Package: testpkg",
  "Title: Test Package",
  "Version: 0.1.0",
  "Author: Test [aut]",
  "Maintainer: Test <test@test.com>",
  "Description: A test package.",
  "License: MIT"
)

describe("is_r_package() with .Rproj", {

  test_that("returns TRUE for valid package with .Rproj", {
    pkg <- system.file("pkg", package = "shinypak")
    expect_true(is_r_package(path = pkg))
    expect_true(is_r_package(path = pkg, verbose = TRUE))
  })

  test_that("returns FALSE for directory without DESCRIPTION", {
    empty_dir <- withr::local_tempdir()
    expect_false(is_r_package(path = empty_dir))
    expect_false(is_r_package(path = empty_dir, verbose = TRUE))
  })

})

describe("is_r_package() without .Rproj (Positron)", {

  test_that("returns TRUE for valid DESCRIPTION without .Rproj", {
    tmp <- withr::local_tempdir()
    writeLines(pkg_desc_lines, file.path(tmp, "DESCRIPTION"))
    expect_true(is_r_package(path = tmp))
  })

  test_that("returns FALSE for incomplete DESCRIPTION without .Rproj", {
    tmp <- withr::local_tempdir()
    writeLines(c("Package: testpkg", "Title: Test"), file.path(tmp, "DESCRIPTION"))
    expect_false(is_r_package(path = tmp))
  })

  test_that("success message references DESCRIPTION when no .Rproj", {
    tmp <- withr::local_tempdir()
    writeLines(pkg_desc_lines, file.path(tmp, "DESCRIPTION"))
    expect_message(
      is_r_package(path = tmp),
      regexp = "DESCRIPTION found"
    )
  })

  test_that("danger message references missing .Rproj when DESCRIPTION invalid", {
    tmp <- withr::local_tempdir()
    writeLines(c("Package: testpkg", "Title: Test"), file.path(tmp, "DESCRIPTION"))
    expect_message(
      is_r_package(path = tmp),
      regexp = "no .Rproj"
    )
  })

})

describe("is_r_package() verbose messages with .Rproj", {

  pkg_rproj <- test_path("fixtures", "package_rproj.txt")
  proj_rproj <- test_path("fixtures", "project_rproj.txt")

  make_pkg <- function(desc, rproj) {
    tmp <- withr::local_tempdir(.local_envir = parent.frame())
    writeLines(desc, file.path(tmp, "DESCRIPTION"))
    file.copy(rproj, file.path(tmp, "x.Rproj"))
    tmp
  }

  test_that("valid DESCRIPTION, build tools configured", {
    tmp <- make_pkg(pkg_desc_lines, pkg_rproj)
    expect_message(expect_true(is_r_package(tmp, verbose = TRUE)),
      "is an R package \\(RS build tools configured")
  })

  test_that("valid DESCRIPTION, no build tools", {
    tmp <- make_pkg(pkg_desc_lines, proj_rproj)
    expect_message(expect_true(is_r_package(tmp, verbose = TRUE)),
      "is an R package \\(no RS build tools")
  })

  test_that("invalid DESCRIPTION, build tools configured", {
    tmp <- make_pkg("Package: x", pkg_rproj)
    expect_message(expect_false(is_r_package(tmp, verbose = TRUE)),
      "is not an R package \\(RS build tools configured")
  })

  test_that("invalid DESCRIPTION, no build tools", {
    tmp <- make_pkg("Package: x", proj_rproj)
    expect_message(expect_false(is_r_package(tmp, verbose = TRUE)),
      "is not an R package \\(no RS build tools")
  })

})
