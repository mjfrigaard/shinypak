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

  # get tibble of branch names and last update in moviesApp
  all_branches <- gert::git_branch_list(local = NULL, repo = ".")

  branch_cols <- sep_cols(all_branches,
                          col = "name",
                          into = c("source", "branch_name"),
                          sep = "/")

  # return to original working directory
  setwd(original_dir)

  # remove git folder
  unlink(tmp_git_dir, force = TRUE, recursive = TRUE)

  # return data
  branch_cols[c("source", "updated")]

}
