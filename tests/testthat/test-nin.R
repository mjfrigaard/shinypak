test_that("%nin% returns TRUE for elements not in table", {
  expect_equal(1 %nin% 2:10, TRUE)
  expect_equal("a" %nin% c("b", "c"), TRUE)
})

test_that("%nin% returns FALSE for elements in table", {
  expect_equal(1 %nin% 1:10, FALSE)
  expect_equal("a" %nin% c("a", "b"), FALSE)
})

test_that("%nin% is vectorized over x", {
  expect_equal(c(1, 5, 11) %nin% 1:10, c(FALSE, FALSE, TRUE))
})
