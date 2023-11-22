test_that("multiplication works", {
  expected <- data.frame(
    id = 1:3,
    x = c("m-123", "f-455", "f-123"),
    chr = c("m", "f", "f"),
    num = c("123", "455", "123")
  )
  expect_equal(object = sep_cols(
    data.frame(id = 1:3, x = c("m-123", "f-455", "f-123")),
    col = "x",
    into = c("chr", "num"),
    sep = "-"
  ), expected)
})
