#' Check the lines in text file
#'
#' @param file path to file
#' @param regex
#'
#' @return logical value from `grep()`
#'
#' @export
#'
#' @examples
#' # check_lines("DESCRIPTION", "Package:")
check_lines <- function(file, regex) {
  x <- readLines(file)
  pattern <- regex
  grep(pattern = pattern, x = x, value = TRUE)
}

#' Check fields in DESCRIPTION file
#'
#' @param path path to DESCRIPTION file
#'
#' @return logical
#'
#' @export
#'
#' @examples
#' # check_pkg_description(getwd())
check_pkg_description <- function(path, verbose = FALSE) {
  if (verbose) {
    if (!file.exists(file.path(path, "DESCRIPTION"))) {
      cli::cli_alert_warning("'DESCRIPTION' file missing")
      return(FALSE)
    }

    fields_regex <- paste0("^", c(
      "Package:", "Version:", "License:",
      "Description:", "Title:", "Author:",
      "Maintainer:"
    ), collapse = "|")

    desc_fields <- check_lines(
      file = list.files(path,
        pattern = "DESCRIPTION$",
        full.names = TRUE
      ),
      regex = fields_regex
    )

    if (length(desc_fields) == 0) {
      return(FALSE)
    } else if (length(desc_fields) > 1 & length(desc_fields) < 7) {
      if (!any(grepl(pattern = "^Package:", desc_fields))) {
        cli::cli_alert_warning("'DESCRIPTION' missing 'Package' field")
        return(FALSE)
      } else if (!any(grepl(pattern = "^Version:", desc_fields))) {
        cli::cli_alert_warning("'DESCRIPTION' missing 'Version' field")
        return(FALSE)
      } else if (!any(grepl(pattern = "^License:", desc_fields))) {
        cli::cli_alert_warning("'DESCRIPTION' missing 'License' field")
        return(FALSE)
      } else if (!any(grepl(pattern = "^Description:", desc_fields))) {
        cli::cli_alert_warning("'DESCRIPTION' missing 'Description' field")
        return(FALSE)
      } else if (!any(grepl(pattern = "^Title:", desc_fields))) {
        cli::cli_alert_warning("'DESCRIPTION' missing 'Title' field")
        return(FALSE)
      } else if (!any(grepl(pattern = "^Author:", desc_fields))) {
        cli::cli_alert_warning("'DESCRIPTION' missing 'Author' field")
        return(FALSE)
      } else {
        cli::cli_alert_warning("'DESCRIPTION' missing 'Author' field")
        return(TRUE)
      }
    } else {
      return(TRUE)
    }
  } else {
    if (!file.exists(file.path(path, "DESCRIPTION"))) {
      return(FALSE)
    }
    fields_regex <- paste0("^", c(
      "Package:", "Version:", "License:",
      "Description:", "Title:", "Author:",
      "Maintainer:"
    ), collapse = "|")
    desc_fields <- check_lines(
      file = list.files(path,
        pattern = "DESCRIPTION$",
        full.names = TRUE
      ),
      regex = fields_regex
    )
    if (length(desc_fields) == 0) {
      return(FALSE)
    } else if (length(desc_fields) > 1 & length(desc_fields) < 7) {
      if (!any(grepl(pattern = "^Package:", desc_fields))) {
        return(FALSE)
      } else if (!any(grepl(pattern = "^Version:", desc_fields))) {
        return(FALSE)
      } else if (!any(grepl(pattern = "^License:", desc_fields))) {
        return(FALSE)
      } else if (!any(grepl(pattern = "^Description:", desc_fields))) {
        return(FALSE)
      } else if (!any(grepl(pattern = "^Title:", desc_fields))) {
        return(FALSE)
      } else if (!any(grepl(pattern = "^Author:", desc_fields))) {
        return(FALSE)
      } else {
        return(TRUE)
      }
    } else {
      return(TRUE)
    }
  }
}

#' Check package fields in .Rproj file
#'
#' @param path path to .Rproj file
#'
#' @return logical
#'
#' @export
#'
#' @examples
#' # check_pkg_rproj(getwd())
check_pkg_rproj <- function(path, verbose = FALSE) {
  rproj_file <- grep(
    pattern = ".Rproj$",
    x = list.files(file.path(path),
      full.names = TRUE
    ),
    value = TRUE
  )
  if (verbose) {
    if (!file.exists(rproj_file)) {
      cli::cli_alert_warning("'.Rproj' file missing")
      return(FALSE)
    }

    fields_regex <- paste0("^", c(
      "BuildType: Package",
      "PackageUseDevtools:",
      "PackageInstallArgs:"
    ),
    collapse = "|"
    )

    rproj_fields <- check_lines(
      file = list.files(path,
        pattern = ".Rproj$",
        full.names = TRUE
      ),
      regex = fields_regex
    )

    if (length(rproj_fields) < 3) {
      if (!any(grepl(pattern = "^BuildType: Package", rproj_fields))) {
        cli::cli_alert_warning("'.Rproj' missing 'BuildType: Package'")
        return(FALSE)
      } else if (!any(grepl(pattern = "^PackageUseDevtools:", rproj_fields))) {
        cli::cli_alert_warning("'.Rproj' missing 'PackageUseDevtools' field")
        return(FALSE)
      } else {
        cli::cli_alert_warning("'.Rproj' missing 'PackageInstallArgs' field")
        return(FALSE)
      }
    } else {
      return(TRUE)
    }
  } else {
    if (!file.exists(rproj_file)) {
      return(FALSE)
    }
    fields_regex <- paste0("^", c(
      "BuildType: Package",
      "PackageUseDevtools:",
      "PackageInstallArgs:"
    ),
    collapse = "|"
    )
    rproj_fields <- check_lines(
      file = list.files(path,
        pattern = ".Rproj$",
        full.names = TRUE
      ),
      regex = fields_regex
    )
    if (length(rproj_fields) < 3) {
      if (!any(grepl(pattern = "^BuildType: Package", rproj_fields))) {
        return(FALSE)
      } else if (!any(grepl(pattern = "^PackageUseDevtools:", rproj_fields))) {
        return(FALSE)
      } else {
        return(FALSE)
      }
    } else {
      return(TRUE)
    }
  }
}

# is_r_pkg <- function(path = ".") {
#   path <- tryCatch({
#     rprojroot_find_package_root_file(path = path)
#   },
#   error = function(e) {
#     msg <- c(
#       "Could not find a root 'DESCRIPTION' file that starts with '^Package' in {.path {normalizePath(path)}}.",
#       "i" = "Are you in your project directory and does your project have a 'DESCRIPTION' file?"
#     )
#     cli::cli_abort(msg)
#   })
# }

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
is_r_pkg <- function(path, verbose = FALSE) {

  desc_status <- check_pkg_description(path = path)

  rproj_status <- check_pkg_rproj(path = path)

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
