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
#' # clone_app("main")
clone_app <- function(app = "main", open = TRUE, ...) {

  local_dir <- paste0("inst/", app)

  fs::dir_create(local_dir)

  gert::git_clone(path = local_dir,
    url = "https://github.com/mjfrigaard/moviesApp",
    branch = app,
    ...)

  # # fs::dir_tree(repo, all = TRUE)
  # # fs::dir_tree(local_dir, all = TRUE)
  #
  # branch <- gert::git_branch(repo)
  #
  # # copy files over to local directory
  # if (branch == app) {
  #   fs::dir_copy(path = repo, new_path = local_dir, overwrite = TRUE)
  # }
  #
  # # remove .git files from inst/
  # git_files <- list.files(local_dir, pattern = "^.git",
  #                         all.files = TRUE, full.names = TRUE)
  # lapply(X = git_files, unlink, recursive = TRUE, force = TRUE)
  # # remove .DS_Store files from inst/
  # ds_store <- list.files(local_dir, pattern = ".DS_Store",
  #                         all.files = TRUE, full.names = TRUE)
  # lapply(X = ds_store, unlink, recursive = TRUE, force = TRUE)
  # # remove .Rbuildignore files from inst/
  # rbuild_ignore <- list.files(local_dir, pattern = ".Rbuildignore",
  #                         all.files = TRUE, full.names = TRUE)
  # lapply(X = rbuild_ignore, unlink, recursive = TRUE, force = TRUE)
  # # find rproj and rename it
  # rproj <- list.files(local_dir, pattern = "moviesApp.Rproj",
  #                         all.files = TRUE, full.names = TRUE)
  # new_rproj <- paste0(local_dir, "/", app, ".Rproj")
  # file.rename(from = rproj, to = new_rproj)
  #
  # # clean up repo in root
  # unlink(x = repo, recursive = TRUE, force = TRUE)
  #
  # # open new .Rproj
  # if (open) {
  #   rstudioapi::openProject(new_rproj, newSession = TRUE)
  # }

}
