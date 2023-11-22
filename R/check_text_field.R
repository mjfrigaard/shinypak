#' Check for fields in text file
#'
#' @param file path to plain text file
#' @param field field in file
#'
#' @return logical
#'
#' @export
#'
#'
check_text_field <- function(file, field, verbose = FALSE) {
  file_lines <- readLines(file)
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

#' @noRd
check_txt_field <- function(file, field, verbose = TRUE) {
  file_lines <- readLines(file)
  result <- sum(grepl(pattern = paste0("^", field), x = file_lines))
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
# check_txt_field(system.file("pkg", "DESCRIPTION",
#                  package = "shinyap"), "Package")
