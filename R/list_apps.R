#' List available app packages
#'
#' @param regex passed to list.files(pattern)
#'
#' @return tibble of available app-packages
#'
#' @export list_apps
#'
#' @examples
#' list_app_pkgs()
#' list_app_pkgs(regex = "tests")
list_apps <- function(regex) {

  # keep track
  original_dir <- getwd()

  # clone repo to temp dir
  tmp_git_dir <- file.path(tempdir(), 'moviesApp')
  gert::git_clone("https://github.com/mjfrigaard/moviesApp", tmp_git_dir)
  # switch to git folder
  setwd(tmp_git_dir)

  # get list of branches in moviesApp in temp dir
  gert::git_remote_list()

  # return to original working directory
  setwd(original_dir)

  # remove git folder
  unlink(tmp_git_dir, force = TRUE, recursive = TRUE)

}
