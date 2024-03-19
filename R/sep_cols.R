#' Separate columns (base)
#'
#' @description
#' This is a utility function used to create the list of applications in the Git
#' branches.
#'
#'
#' @param data data.frame or tibble
#' @param col column to split
#' @param into columns to split into
#' @param sep regex to split on
#'
#' @return data with new columns
#'
#' @keywords internal
#'
#' @export
#'
# #examples
# d <- data.frame(id = 1:3, x = c("m-123", "f-455", "f-123"))
# sep_cols(d,
#   col = "x",
#   into = c("chr", "num"),
#   sep = "-")
sep_cols <- function(data, col, into, sep) {
  # Split the column by the separator
  split_names <- strsplit(data[[col]], sep)

  # Create new columns with the split data
  data[into] <- do.call(rbind, lapply(split_names, function(x) {
    if (length(x) == 1) {
      return(c(NA, x))
    } else {
      return(x)
    }
  }))

  return(data)
}

