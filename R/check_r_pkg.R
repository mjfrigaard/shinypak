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
#' This function wraps around `check_desc_file` and `check_rproj_file`
#' functions to check both the `DESCRIPTION` and `.Rproj` files. If `verbose`
#' is `TRUE`, it will use `cli` package functions to alert the user about the
#' checks being performed and their results.
check_r_pkg <- function(path, verbose = FALSE) {

  desc <- list.files(
    path = path, "DESCRIPTION$",
    full.names = TRUE
  )

  rproj <- list.files(
    path = path, ".Rproj$",
    full.names = TRUE
  )

  is_pkg_desc <- check_desc_file(desc, verbose = verbose)

  is_pkg_rproj <- check_rproj_file(rproj, verbose = verbose)

  if (verbose) {
    if (isTRUE(is_pkg_desc) & isTRUE(is_pkg_rproj)) {
      cli::cli_alert_success("'{path}' is an R package")
      return(TRUE)
    } else if (isFALSE(is_pkg_desc) & isTRUE(is_pkg_rproj)) {
      desc_msg <- paste0(path, "DESCRIPTION", collapse = "/")
      cli::cli_alert_danger("{desc_msg} is not configured as an R package")
      return(FALSE)
    } else if (isTRUE(is_pkg_desc) & isFALSE(is_pkg_rproj)) {
      cli::cli_alert_danger("'{rproj}' is not configured as an R package")
      return(FALSE)
    } else {
      desc_msg <- paste0(path, "DESCRIPTION", collapse = "/")
      cli::cli_alert_danger("'{desc}' & '{rproj}' are not configured as an R package")
      return(FALSE)
    }
  } else {
    if (isTRUE(is_pkg_desc) & isTRUE(is_pkg_rproj)) {
      return(TRUE)
    } else if (isFALSE(is_pkg_desc) & isTRUE(is_pkg_rproj)) {
      return(FALSE)
    } else if (isTRUE(is_pkg_desc) & isFALSE(is_pkg_rproj)) {
      return(FALSE)
    } else {
      return(FALSE)
    }
  }
}



