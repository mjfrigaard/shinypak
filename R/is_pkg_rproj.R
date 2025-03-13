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
  if (!file.exists(file)) {
    cli::cli_abort("The .Rproj file '{file}' does not exist. Please provide a valid file path.")
  }

  fields <- c("BuildType", "PackageUseDevtools", "PackageInstallArgs")

  result <- sapply(fields, function(field) {
    field_found <- check_text_field(file, field = paste0(field, ":"))

    if (verbose) {
      if (field_found) {
        cli::cli_alert_success("{field} found!")
      } else {
        cli::cli_alert_danger("{field} not in .Rproj!")
      }
    }

    field_found
  })

  all(result) # Returns TRUE if all fields are found, FALSE otherwise
}
