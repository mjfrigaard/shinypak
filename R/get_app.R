#' Clone a Specific Branch of the shinyAppPkgs Repository and Optionally Open it
#'
#' @description
#' Clones a specified branch of the `shinyAppPkgs` GitHub repository into the
#' current working directory. It cleans the cloned directory by removing `.git`
#' files, `.DS_Store`, and `.Rbuildignore` files, renames the R project file,
#' and optionally opens it in a new RStudio session.
#'
#' @param app The name of the branch to be cloned as a character string. If
#' not specified, defaults to "main".
#' @param open A logical parameter, when set to `TRUE`, the function will attempt
#' to open the new R project in a new RStudio session using
#' `rstudioapi::openProject`. Defaults to `FALSE`.
#'
#' @return Invisible `NULL`. The function is called for its side effects.
#'
#'
#'
#' @section Details:
#' If the directory for the branch already exists, it is deleted and re-cloned
#' to ensure the latest version is present.
#' After cloning, the function performs cleanup operations:
#' - Deletes `.git` directory and files.
#' - Removes `.DS_Store` files.
#' - Deletes any `.Rbuildignore` files present.
#' It then renames the R project file to match the name of the cloned branch
#' and, if specified, opens the project in RStudio.
#'
#' @section Note:
#' - The `rstudioapi::openProject` function requires RStudio to be installed
#'   and will only work if R is running inside RStudio.
#' - The working directory is temporarily changed during the function's
#'   execution but is reset at the end.
#'
#' @export
#'
#' @examples
#' # get_app("02_movies-app")
get_app <- function(app = "main", open = FALSE) {

  # keep track
  original_dir <- getwd()

  # clone repo
  app_dir <- file.path(original_dir, app)

  cli::cli_progress_message("getting '{app}'")

  if (!dir.exists(app_dir)) {
    cli::cli_progress_step("'{app}' not in local working directory")
    cli::cli_progress_step("downloading '{app}'")
    gert::git_clone(path = app_dir,
      url = "https://github.com/mjfrigaard/shinyAppPkgs",
        branch = app,
        verbose = FALSE)

  } else {
    cli::cli_progress_step("'{app}' in local working directory")
    unlink(app_dir, force = TRUE, recursive = TRUE)
    cli::cli_progress_step("updating '{app}'")
    gert::git_clone(path = app_dir,
      url = "https://github.com/mjfrigaard/shinyAppPkgs",
        branch = app,
        verbose = FALSE)
  }

  # switch to app folder
  setwd(app_dir)

  # remove .git files
  git_files <- list.files(app_dir, pattern = "^.git",
                          all.files = TRUE, full.names = TRUE)
  lapply(X = git_files, unlink, recursive = TRUE, force = TRUE)
  # remove .DS_Store files from inst/
  ds_store <- list.files(app_dir, pattern = ".DS_Store",
                          all.files = TRUE, full.names = TRUE)
  lapply(X = ds_store, unlink, recursive = TRUE, force = TRUE)
  # remove .Rbuildignore files from inst/
  rbuild_ignore <- list.files(app_dir, pattern = ".Rbuildignore",
                          all.files = TRUE, full.names = TRUE)
  lapply(X = rbuild_ignore, unlink, recursive = TRUE, force = TRUE)
  # # find rproj and rename it
  rproj <- list.files(app_dir, pattern = "shinyAppPkgs.Rproj",
                          all.files = TRUE, full.names = TRUE)
  new_rproj <- paste0(app_dir, "/", app, ".Rproj")
  file.rename(from = rproj, to = new_rproj)

  # fs::dir_tree(all = TRUE)

  # open new .Rproj
  if (open) {
    cli::cli_progress_step("opening '{app}' in new session")
    rstudioapi::openProject(new_rproj, newSession = TRUE)
    # reset wd
    setwd(original_dir)
  }
  # reset wd
  setwd(original_dir)
  cli::cli_progress_step("got '{app}'")
}
