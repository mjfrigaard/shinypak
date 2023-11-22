test_that("check_text_field() project TRUE", {
expect_true(
    check_text_field(file = test_path("fixtures", "project_rproj.txt"),
      field = "Version: 1.0")
    )
})

test_that("check_text_field() project FALSE", {
expect_false(
    check_text_field(file = test_path("fixtures", "project_rproj.txt"),
      field = "BuildType")
    )
})

test_that("check_text_field() package TRUE", {
  expect_true(
    check_text_field(file = test_path("fixtures", "package_rproj.txt"),
      field = "BuildType")
    )
})

test_that("check_text_field() package TRUE", {
  expect_true(
    check_text_field(file = test_path("fixtures", "package_rproj.txt"),
      field = "PackageRoxygenize")
    )
})
