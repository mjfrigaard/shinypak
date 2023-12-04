#' Check `DESCRIPTION` File for Package Fields
#'
#' @description
#' This function ensures that a `DESCRIPTION` file contains all of the necessary
#' fields for an R package in Writing R Extensions (https://cran.r-project.org/doc/manuals/R-exts.html#The-DESCRIPTION-file).
#'
#' @param file A character string specifying the path to the `DESCRIPTION` file.
#' @param verbose A logical parameter; if set to TRUE, detailed messages will
#'     be displayed during the check.
#'
#' @return A logical value; `TRUE` if all required fields are present, `FALSE`
#'     otherwise.
#'
#' @export
#'
#' @examples
#' is_pkg_description(
#'      system.file("pkg", "DESCRIPTION",
#'                  package = "shinyap"))
#' is_pkg_description(
#'      system.file("pkg", "DESCRIPTION",
#'                  package = "shinyap"), verbose = TRUE)
is_pkg_description <- function(file, verbose = FALSE) {
  fields <- c(
    "Package", "Version", "License",
    "Description", "Title", "Author",
    "Maintainer"
  )
  result <- mapply(check_text_field, file,
    MoreArgs = list(field = paste0(fields, ":")),
    SIMPLIFY = TRUE,
    USE.NAMES = FALSE
  )
  if (verbose) {
    cli::cli_alert_info("Checking DESCRIPTION for package fields")
    if (isTRUE(result)) {
      cli::cli_alert_success("{fields} found!")
      return(TRUE)
    } else {
      cli::cli_alert_danger("{fields} not in DESCRIPTION!")
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
