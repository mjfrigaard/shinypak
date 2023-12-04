test_that("is_r_package() works", {
  # package path
  pkg <- "../.."
  expect_true(is_r_package(path = pkg))
  expect_true(is_r_package(path = pkg, verbose = TRUE))
  expect_false(is_r_package(path = "."))
  expect_false(is_r_package(path = ".", verbose = TRUE))
})
