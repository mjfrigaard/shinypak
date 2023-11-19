#' Separate columns (base)
#'
#' @param data data.frame or tibble
#' @param col column to split
#' @param into columns to split into
#' @param sep regex to split on
#'
#' @return data with new columns
#'
#' @export sep_cols
#'
#' @examples
#' sep_cols(branches,
#'   col = "name",
#'   into = c("source", "branch_name"),
#'   sep = "/")
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
