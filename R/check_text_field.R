#' Check for fields in text file
#'
#' @param file path to plain text file
#' @param field field in file
#' @param verbose logical; if `TRUE`, reports the check and its result via
#'   `cli` messages. Defaults to `FALSE`.
#'
#' @return logical
#'
#' @keywords internal
#'
#' @examples
#' check_text_field("Package: shinypak \n Title: Shiny App Examples", "Package")
#' check_text_field("Package: shinypak \n Title: Shiny App Examples",
#' "Package", verbose = TRUE)
check_text_field <- function(file, field, verbose = FALSE) {
  file_lines <- readr::read_lines(file)
  result <- sum(grepl(paste0("^", field, collapse = "|"), file_lines))
  if (isTRUE(verbose)) {
    cli::cli_progress_message("checking '{field}' field")
      if (result == 0) {
        cli::cli_progress_step("'{field}' field not found")
        FALSE
      } else {
        cli::cli_progress_step("'{field}' field found")
        TRUE
      }
  } else {
    if (result == 0) {
      FALSE
    } else {
      TRUE
    }
  }
}


