describe("project .Rproj file", code = {
  proj_rproj <- test_path("fixtures", "project_rproj.txt")

  test_that("check_text_field() project TRUE verbose", {
    expect_true(check_text_field(
      file = proj_rproj,
      field = "Version: 1.0",
      verbose = TRUE
    ))
  })
  test_that("check_text_field() project TRUE", {
    expect_true(check_text_field(file = proj_rproj,
      field = "Version: 1.0"))
  })

  test_that("check_text_field() project FALSE", {
    expect_false(check_text_field(file = proj_rproj,
      field = "Package:"))
  })
})

describe("package Rproj", code = {
pkg_rpoj <- test_path("fixtures", "package_rproj.txt")

test_that("check_text_field() package TRUE", {
  expect_true(
    check_text_field(file = pkg_rpoj,
      field = "BuildType")
    )
})

test_that("check_text_field() package TRUE verbose", {
  expect_true(
    check_text_field(file = pkg_rpoj,
      field = "BuildType", verbose = TRUE)
    )
})

test_that("check_text_field() package FALSE", {
  expect_false(
    check_text_field(file = pkg_rpoj,
      field = "PackageCheckArgs")
    )
})

test_that("check_text_field() package FALSE verbose", {
  expect_false(
    check_text_field(file = pkg_rpoj,
      field = "PackageCheckArgs", verbose = TRUE)
    )
})

})
