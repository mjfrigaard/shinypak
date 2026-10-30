#' Check `DESCRIPTION` File for Package Fields
#'
#' @description
#' Checks a `DESCRIPTION` file for the fields an R package requires: `Package`,
#' `Version`, `License`, `Description`, `Title`, and either `Authors@R` or both
#' `Author` and `Maintainer`.
#' These are described in the
#' [Writing R Extensions](https://cran.r-project.org/doc/manuals/R-exts.html#The-DESCRIPTION-file)
#' manual.
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
    "Description", "Title"
  )

  result <- vapply(fields, function(field) {
    field_found <- check_text_field(file, field = paste0(field, ":"))

    if (verbose) {
      if (field_found) {
        cli::cli_alert_success("{field} found!")
      } else {
        cli::cli_alert_danger("{field} not in DESCRIPTION!")
      }
    }

    field_found
  }, logical(1))

  # Authors@R can replace Author and Maintainer
  has_authors_r <- check_text_field(file, field = "Authors@R:")
  has_author <- check_text_field(file, field = "Author:") &&
    check_text_field(file, field = "Maintainer:")
  authors_found <- has_authors_r || has_author

  if (verbose) {
    if (authors_found) {
      cli::cli_alert_success("Authors@R or Author/Maintainer found!")
    } else {
      cli::cli_alert_danger("Authors@R or Author/Maintainer not in DESCRIPTION!")
    }
  }

  result <- c(result, authors_found)

  all(result) # Returns TRUE if all fields are found, FALSE otherwise
}


