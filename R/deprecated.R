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
