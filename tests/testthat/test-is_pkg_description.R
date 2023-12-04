describe("package DESCRIPTION", code = {
pkg_desc <- "
Package: bla
Title: bla
Version: 0.1.0
Author: bla
Maintainer: bla
Description: blablablablablablablablablablablablablablablablablablabla
   blablablablablablablablablablablablablablabla
License: bla
"
  test_that("multiplication works", {
    expect_true(is_pkg_description(pkg_desc))
  })
})

