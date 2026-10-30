#' Clone a Specific Branch of the sap Repository and Optionally Open it
#'
#' @description
#' Clones a branch of the [`sap`](https://github.com/mjfrigaard/sap) GitHub
#' repository into the current working directory, then cleans it up: `.git`
#' files, `.DS_Store` files, and `.Rbuildignore` files are removed, and the
#' `.Rproj` file is renamed to match the branch. Set `open = TRUE` to open the
#' result in a new IDE session.
#'
#' @param app The name of the branch to be cloned as a character string. If
#' not specified, defaults to "main".
#' @param open A logical parameter, when set to `TRUE`, the function will
#' attempt to open the project directory in a new session using
#' `rstudioapi::openProject`. Defaults to `FALSE`.
#'
#' @return The path to the cloned app, invisibly. The function is called for
#'   its side effects.
#'
#' @details
#' The branch is cloned into a temporary folder first. If the clone succeeds and
#' the directory for the branch already exists, the old copy is replaced so you
#' always get the latest commit. If the clone fails, the existing copy is left
#' untouched. After cloning, `get_app()` removes:
#' - The `.git` directory and files
#' - Any `.DS_Store` files
#' - Any `.Rbuildignore` files
#'
#' It then renames the `.Rproj` file to match the cloned branch and, if
#' `open = TRUE`, opens the project.
#'
#' @section Note:
#' - The `rstudioapi::openProject` function works in RStudio and Positron.
#'   The project directory is passed directly, so no `.Rproj` file is required.
#'
#' @export
#'
#' @examplesIf interactive()
#' get_app("02.2_movies-app")
get_app <- function(app = "main", open = FALSE) {
  app_dir <- file.path(getwd(), app)

  cli::cli_progress_message("getting '{app}'")

  # clone into a temporary sibling folder so a failed clone never
  # touches an existing local copy ----
  clone_dir <- tempfile(pattern = ".shinypak-", tmpdir = getwd())
  on.exit(unlink(clone_dir, recursive = TRUE, force = TRUE), add = TRUE)

  cli::cli_progress_step("downloading '{app}'")
  tryCatch(
    gert::git_clone(
      path = clone_dir,
      url = "https://github.com/mjfrigaard/sap",
      branch = app,
      verbose = FALSE
    ),
    error = function(e) {
      cli::cli_abort("Could not clone '{app}' from 'sap'.", parent = e)
    }
  )

  # replace the local copy only after a successful clone ----
  if (dir.exists(app_dir)) {
    cli::cli_progress_step("updating '{app}'")
    unlink(app_dir, recursive = TRUE, force = TRUE)
  }
  if (!file.rename(from = clone_dir, to = app_dir)) {
    cli::cli_abort("Could not move the cloned '{app}' into '{app_dir}'.")
  }

  # remove .git files ----
  git_files <- list.files(app_dir,
    pattern = "^\\.git",
    all.files = TRUE, full.names = TRUE
  )
  unlink(git_files, recursive = TRUE, force = TRUE)

  # remove .DS_Store files ----
  ds_store <- list.files(app_dir,
    pattern = "^\\.DS_Store$",
    all.files = TRUE, full.names = TRUE
  )
  unlink(ds_store, recursive = TRUE, force = TRUE)

  # remove .Rbuildignore files ----
  rbuild_ignore <- list.files(app_dir,
    pattern = "^\\.Rbuildignore$",
    all.files = TRUE, full.names = TRUE
  )
  unlink(rbuild_ignore, recursive = TRUE, force = TRUE)

  # find rproj and rename it ----
  rproj <- list.files(app_dir,
    pattern = "^sap\\.Rproj$",
    all.files = TRUE, full.names = TRUE
  )
  if (length(rproj) > 0) {
    new_rproj <- paste0(app_dir, "/", app, ".Rproj")
    file.rename(from = rproj, to = new_rproj)
  }

  # open project directory ----
  if (open) {
    cli::cli_progress_step("opening '{app}' in new session")
    rstudioapi::openProject(app_dir, newSession = TRUE)
  }

  cli::cli_progress_step("got '{app}'")
  invisible(app_dir)
}
