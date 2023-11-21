#' Check for fields in text file
#'
#' @param file path to plain text file
#' @param field field in file
#'
#' @return logical
#'
#'
check_txt_field <- function(file, field) {
  if (!file.exists(file.path(file))) {
    cli::cli_alert_danger("{file} doesn't exist!")
    return(FALSE)
  }
  file_lines <- readLines(file)
  regex <- paste0("^", field, collapse = "|")
  any(grepl(pattern = regex, x = file_lines))
}
