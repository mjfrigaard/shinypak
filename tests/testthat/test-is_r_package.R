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
    expect_false(is_r_package(path = "."))
    expect_false(is_r_package(path = ".", verbose = TRUE))
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
