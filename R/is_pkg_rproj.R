#' Check `.Rproj` File for Package Fields
#'
#' @param file character string specifying the path to the `.Rproj` file.
#' @param verbose logical; if  `TRUE`, detailed messages will be displayed
#'
#' @return A logical value; `TRUE` if all fields are found, `FALSE` otherwise.
#'
#' @keywords internal
#'
#' @export
#'
#' @examples
#' is_pkg_rproj(system.file("pkg", "pkg.Rproj", package = "shinypak"),
#'              verbose = TRUE)
#' is_pkg_rproj(system.file("pkg", "pkg.Rproj", package = "shinypak"))
#'
is_pkg_rproj <- function(file, verbose = FALSE) {
  fields <- c("BuildType", "PackageUseDevtools", "PackageInstallArgs")
  result <- mapply(check_text_field, file,
    MoreArgs = list(field = paste0(fields, ":")),
    SIMPLIFY = TRUE,
    USE.NAMES = FALSE
  )
  if (verbose) {
    cli::cli_alert_info("Checking .Rroj for project build fields")
    if (isTRUE(result)) {
      cli::cli_alert_success("{fields} in .Rproj!")
      return(TRUE)
    } else {
      cli::cli_alert_danger("{fields} not in .Rproj!")
      return(FALSE)
    }
  } else {
    if (isTRUE(result)) {
      return(TRUE)
    } else {
      return(FALSE)
    }
  }
}
