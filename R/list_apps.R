#' List Branches of the moviesApp Repository
#'
#' @description
#' This function clones the 'moviesApp' GitHub repository, extracts the list
#' of branches along with their last update time, and then returns this information
#' as a tibble. The repository is cloned to a temporary directory, which is removed
#' after the function executes.
#'
#' @param regex An optional character string containing a regular expression
#'    (regex) to filter branch names
#'
#' @return A tibble with three columns: 'source', 'branch_name', and 'updated',
#'    listing the source of the branch, the branch name, and the last updated
#'    date.
#'
#'
#' @section How it works:
#' The function operates in several steps:
#' 1. It saves the current working directory to revert back to it later
#' 2. It clones the ['moviesApp'](https://github.com/mjfrigaard/moviesApp)
#'    repository from GitHub into a temporary directory
#' 3. It lists all branches of the cloned repository
#' 4. It separates the branch `name`s into `source` and `branch_name`
#' 5. It cleans up by deleting the temporary directory and restoring the original
#'    working directory
#'
#' Note that the function currently does not use the `regex` parameter to filter
#' branches. This parameter can be implemented in future versions to allow branch
#' filtering based on regular expressions.
#'
#' @export list_apps
#'
#' @examples
#' list_apps()
#' list_apps(regex = "tests")
list_apps <- function(regex = NULL) {

  # keep track
  original_dir <- getwd()

  # clone repo to temp dir
  tmp_git_dir <- file.path(tempdir(), 'moviesApp')

  gert::git_clone(url = "https://github.com/mjfrigaard/moviesApp",
    path =  tmp_git_dir, verbose = FALSE)
  # switch to git folder
  setwd(tmp_git_dir)

  # get tibble of branch names and last update in moviesApp
  all_branches <- gert::git_branch_list(local = NULL, repo = ".")

  branch_vars <- sep_cols(all_branches,
                          col = "name",
                          into = c("source", "branch_name"),
                          sep = "/")

  # return to original working directory
  setwd(original_dir)

  # remove git folder
  unlink(tmp_git_dir, force = TRUE, recursive = TRUE)

  # subset the branches columns
  branches_cols <- branch_vars[c("source", "branch_name", "updated")]

  # remove regex
  if (!is.null(regex)) {

      branch_set <- grepl(regex, branches_cols[["branch_name"]])
      branches_cols <- branches_cols[["branch_name"]][branch_set]

  }

  # return data
  return(branches_cols)


}