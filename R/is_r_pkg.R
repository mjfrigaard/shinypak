#' Is directory an R package?
#'
#' @param path path to folder
#' @param verbose verbose messages? Defaults to `TRUE`
#'
#' @return logical
#'
#' @export
#'
#' @examples
#' # is_r_pkg()
is_r_pkg <- function(path = getwd(), verbose = TRUE) {

  desc <- list.files(path, pattern = "^DESCRIPTION$")
  rproj <- list.files(path, pattern = ".Rproj$")

  if (!file.exists(desc)) {
    cli::cli_abort("'DESCRIPTION' file missing")
  } else if (!file.exists(rproj)) {
    cli::cli_abort("'.Rproj' file missing")
  }

  desc_status <- check_description(desc_file_path = desc)

  rproj_status <- check_rproj(rproj_file_path = rproj)

  if (verbose) {

      if (isTRUE(desc_status) & isTRUE(rproj_status)) {
        cli::cli_alert_success("Package 'DESCRIPTION' & 'Rproj'")
        return(TRUE)
      } else if (isFALSE(desc_status) & isTRUE(rproj_status)) {
        cli::cli_alert_danger("Missing fields in 'DESCRIPTION'")
        cli::cli_alert_success("Package 'Rproj'")
        return(FALSE)
      } else if (isTRUE(desc_status) & isFALSE(rproj_status)) {
        cli::cli_alert_danger("Missing fields in 'Rproj'")
        cli::cli_alert_success("Package 'DESCRIPTION'")
        return(FALSE)
      } else {
        cli::cli_alert_danger("Missing fields in 'DESCRIPTION' & 'Rproj'")
        return(FALSE)
      }

  } else {

      if (isTRUE(desc_status) & isTRUE(rproj_status)) {
        return(TRUE)
      } else if (isFALSE(desc_status) & isTRUE(rproj_status)) {
        return(FALSE)
      } else if (isTRUE(desc_status) & isFALSE(rproj_status)) {
        return(FALSE)
      } else {
        return(FALSE)
      }

  }

}

check_lines <- function(file, regex) {
  x <- readLines(file)
  pattern <- paste0("^", regex, collapse = "|")
  grep(pattern = pattern, x = x, value = TRUE)
}

check_description <- function(desc_file_path) {
  desc_fields <- check_lines(file = desc_file_path,
                              regex = c("Package:", "Version:", "License:",
                                        "Description:", "Title:", "Author:",
                                        "Maintainer:"))
  if (length(desc_fields) == 0) {
    cli::cli_abort("'DESCRIPTION' file missing all required fields")
    #
  } else if (length(desc_fields) < 7) {
      if (!grepl(pattern = "^Package:", desc_fields)) {
        cli::cli_abort("'DESCRIPTION' missing 'Package' field")
      } else if (!grepl(pattern = "^Version:", desc_fields)) {
        cli::cli_abort("'DESCRIPTION' missing 'Version' field")
      } else if (!grepl(pattern = "^License:", desc_fields)) {
        cli::cli_abort("'DESCRIPTION' missing 'License' field")
      } else if (!grepl(pattern = "^Description:", desc_fields)) {
        cli::cli_abort("'DESCRIPTION' missing 'Description' field")
      } else if (!grepl(pattern = "^Title:", desc_fields)) {
        cli::cli_abort("'DESCRIPTION' missing 'Title' field")
      } else if (!grepl(pattern = "^Author:", desc_fields)) {
        cli::cli_abort("'DESCRIPTION' missing 'Author' field")
      } else {
        cli::cli_abort("'DESCRIPTION' missing 'Author' field")
      }
  } else {
    return(TRUE)
  }
}

check_rproj <- function(rproj_file_path) {
  rproj_fields <- check_lines(file = rproj_file_path,
                              regex = c("BuildType: Package",
                                        "PackageUseDevtools:",
                                        "PackageInstallArgs:"))
  if (length(rproj_fields) == 0) {
    cli::cli_abort("'.Rproj' file missing package development fields")
  } else if (length(rproj_fields) < 3) {
      if (!grepl(pattern = "^BuildType: Package", rproj_fields)) {
        cli::cli_abort("'.Rproj' missing 'BuildType: Package'")
      } else if (!grepl(pattern = "^PackageUseDevtools:", rproj_fields)) {
        cli::cli_abort("'.Rproj' missing 'PackageUseDevtools' field")
      } else {
        cli::cli_abort("'.Rproj' missing 'PackageInstallArgs' field")
      }
  } else {
    return(TRUE)
  }
}
