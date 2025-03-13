#' Check `DESCRIPTION` File for Package Fields
#'
#' @description
#' This function ensures that a `DESCRIPTION` file contains all of the necessary
#' fields for an R package in [Writing R Extensions](https://cran.r-project.org/doc/manuals/R-exts.html#The-DESCRIPTION-file).
#'
#' @param file A character string specifying the path to the `DESCRIPTION` file.
#' @param verbose A logical parameter; if set to TRUE, detailed messages will
#'     be displayed during the check.
#'
#' @return A logical value; `TRUE` if all required fields are present, `FALSE`
#'     otherwise.
#'
#' @keywords internal
#'
#' @export
#'
#' @examples
#' is_pkg_description(
#'      system.file("pkg", "DESCRIPTION",
#'                  package = "shinypak"))
#' is_pkg_description(
#'      system.file("pkg", "DESCRIPTION",
#'                  package = "shinypak"), verbose = TRUE)
is_pkg_description <- function(file, verbose = FALSE) {
  if (!file.exists(file)) {
    cli::cli_abort("The DESCRIPTION file '{file}' does not exist. Please provide a valid file path.")
  }

  fields <- c(
    "Package", "Version", "License",
    "Description", "Title", "Author",
    "Maintainer"
  )

  result <- sapply(fields, function(field) {
    field_found <- check_text_field(file, field = paste0(field, ":"))

    if (verbose) {
      if (field_found) {
        cli::cli_alert_success("{field} found!")
      } else {
        cli::cli_alert_danger("{field} not in DESCRIPTION!")
      }
    }

    field_found
  })

  all(result) # Returns TRUE if all fields are found, FALSE otherwise
}


