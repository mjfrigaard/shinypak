#' Check for fields in text file
#'
#' @param file path to plain text file
#' @param field field in file
#'
#' @return logical
#'
#'
check_text_field <- function(file, field) {
  if (!file.exists(file.path(file))) {
    cli::cli_alert_danger("{file} doesn't exist!")
    return(FALSE)
  }
  file_lines <- readLines(file)
  regex <- paste0("^", field, collapse = "|")
  any(grepl(pattern = regex, x = file_lines))
}

#' @noRd
check_txt_field <- function(file, field, verbose = TRUE) {
  if (!file.exists(file.path(file))) {
    cli::cli_alert_danger("{file} doesn't exist!")
    return(FALSE)
  }
  file_lines <- readLines(file)
  regex <- paste0("^", field)
  result <- sum(grepl(pattern = regex, x = file_lines))
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
