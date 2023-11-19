#' Clone application from Shiny App-Packages
#'
#' @param app name of app
#' @param open open app in new Posit Workbench session
#' @param ... additional arguments passed to `gert::git_clone()`
#'
#' @return shiny app (or app-package) branch
#'
#' @export clone_app
#'
#' @examples
#' # clone_app("02_movies-app")
clone_app <- function(app = "main", open = TRUE) {

  # keep track
  original_dir <- getwd()

  # clone repo to temp dir
  app_dir <- file.path(original_dir, app)

  if (!dir.exists(app_dir)) {
    gert::git_clone(path = app_dir,
      url = "https://github.com/mjfrigaard/moviesApp",
      branch = app)
  } else {
    unlink(app_dir, force = TRUE, recursive = TRUE)
    gert::git_clone(path = app_dir,
      url = "https://github.com/mjfrigaard/moviesApp",
      branch = app)
  }


  # switch to git folder
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
  rproj <- list.files(app_dir, pattern = "moviesApp.Rproj",
                          all.files = TRUE, full.names = TRUE)
  new_rproj <- paste0(app_dir, "/", app, ".Rproj")
  file.rename(from = rproj, to = new_rproj)

  # fs::dir_tree(all = TRUE)

  # open new .Rproj
  if (open) {
    rstudioapi::openProject(new_rproj, newSession = TRUE)
  }

  # reset wd
  setwd(original_dir)

}
