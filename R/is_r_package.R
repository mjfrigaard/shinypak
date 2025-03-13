#' Check Directory for R Package Structure
#'
#' This function checks a directory to ascertain if it has the required files
#' (`.Rproj` and `DESCRIPTION`) configured correctly for an R package. It
#' provides verbose output detailing which checks have passed or failed.
#'
#' @param path A character string specifying the path to the directory to be
#'     checked.
#' @param verbose A logical parameter; if set to TRUE, detailed messages will
#'     be displayed during the check.
#' @return A logical value; `TRUE` if both `.Rproj` and `DESCRIPTION` files
#'     are configured correctly, `FALSE` otherwise.
#'
#' @export
#'
#' @section Details:
#' This function wraps around `is_pkg_description` and `is_pkg_rproj`
#' functions to check both the `DESCRIPTION` and `.Rproj` files. If `verbose`
#' is `TRUE`, it will use `cli` package functions to alert the user about the
#' checks being performed and their results.
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
      cli::cli_alert_danger("'{path}' is not an R package (no .Rproj file found!)")
      return(FALSE)
    } else {
      cli::cli_alert_success("'{path}' is an R package (no .Rproj file found!)")
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
