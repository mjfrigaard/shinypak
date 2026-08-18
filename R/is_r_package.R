#' Check Directory for R Package Structure
#'
#' Checks whether a directory has the files an R package needs (a valid
#' `DESCRIPTION`, and optionally an `.Rproj` configured for package
#' development). Set `verbose = TRUE` to see which checks passed and which
#' failed.
#'
#' @param path A character string specifying the path to the directory to be
#'     checked.
#' @param verbose A logical parameter; if set to TRUE, detailed messages will
#'     be displayed during the check.
#' @return A logical value; `TRUE` if the directory contains a valid
#'     `DESCRIPTION` file (and an optional `.Rproj` configured for package
#'     development), `FALSE` otherwise.
#'
#' @export
#'
#' @details
#' This is a wrapper around `is_pkg_description()` and `is_pkg_rproj()`, which
#' check the `DESCRIPTION` and `.Rproj` files respectively. When `verbose` is
#' `TRUE`, `cli` messages report each check and its result.
#'
#' @examples
#' is_r_package(
#'      system.file("pkg", package = "shinypak"),
#'      verbose = TRUE)
#' is_r_package(
#'      system.file("app", package = "shinypak"),
#'      verbose = TRUE)
is_r_package <- function(path, verbose = FALSE) {
  desc <- list.files(path = path, pattern = "DESCRIPTION$", full.names = TRUE)
  rproj <- list.files(path = path, pattern = "\\.Rproj$", full.names = TRUE)

  # Handle cases where DESCRIPTION or .Rproj files are missing
  if (length(desc) == 0) {
    cli::cli_alert_danger("'{path}' is not an R package (no DESCRIPTION file found)")
    return(FALSE)
  }

  is_pkg_desc <- is_pkg_description(file = desc, verbose = verbose)

  if (length(rproj) == 0) {
    if (!is_pkg_desc) {
      cli::cli_alert_danger("'{path}' is not an R package (invalid DESCRIPTION, no .Rproj)")
      return(FALSE)
    } else {
      cli::cli_alert_success("'{path}' is an R package (DESCRIPTION found, no .Rproj)")
      return(TRUE)
    }
  }

  is_pkg_rproj <- is_pkg_rproj(file = rproj, verbose = verbose)

  if (verbose) {
    if (is_pkg_desc && is_pkg_rproj) {
      cli::cli_alert_success("'{path}' is an R package (RS build tools configured)")
    } else if (is_pkg_desc && !is_pkg_rproj) {
      cli::cli_alert_success("'{path}' is an R package (no RS build tools configured)")
    } else if (!is_pkg_desc && is_pkg_rproj) {
      cli::cli_alert_danger("'{path}' is not an R package (RS build tools configured)")
    } else {
      cli::cli_alert_danger("'{path}' is not an R package (no RS build tools configured)")
    }
  }

  return(is_pkg_desc)  # Returns TRUE if it's an R package, otherwise FALSE
}
