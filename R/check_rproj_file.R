#' Check .Rproj File for Required Fields
#'
#' @param file character string specifying the path to the `.Rproj` file.
#' @param verbose logical; if  `TRUE`, detailed messages will be displayed
#'
#' @return A logical value; `TRUE` if all fields are found, `FALSE` otherwise.
#'
#' @export
#'
#' @examples
#' check_rproj_file(
#'      system.file("project", "project.Rproj",
#'                  package = "shinyap"))
#' check_rproj_file(
#'      system.file("pkg", "pkg.Rproj",
#'                  package = "shinyap"), verbose = TRUE)
check_rproj_file <- function(file, verbose = FALSE) {
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
