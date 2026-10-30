describe("is_pkg_rproj()", {

  test_that("returns TRUE when build tool fields are present", {
    expect_true(is_pkg_rproj(test_path("fixtures", "package_rproj.txt")))
  })

  test_that("returns TRUE with verbose output", {
    expect_true(is_pkg_rproj(test_path("fixtures", "package_rproj.txt"),
      verbose = TRUE))
  })

  test_that("returns FALSE when build tool fields are missing", {
    expect_false(is_pkg_rproj(test_path("fixtures", "project_rproj.txt")))
  })

  test_that("aborts when file does not exist", {
    expect_error(is_pkg_rproj("nonexistent.Rproj"), "does not exist")
  })

})
