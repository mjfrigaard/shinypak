#' List Branches of the shinyAppPkgs Repository
#'
#' @description
#' This function clones the 'shinyAppPkgs' GitHub repository, extracts the list
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
#' 2. It clones the ['shinyAppPkgs'](https://github.com/mjfrigaard/shinyAppPkgs)
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
  tmp_git_dir <- file.path(tempdir(), 'shinyAppPkgs')

  gert::git_clone(url = "https://github.com/mjfrigaard/shinyAppPkgs",
    path =  tmp_git_dir, verbose = FALSE)
  # switch to git folder
  setwd(tmp_git_dir)

  # get tibble of branch names and last update in shinyAppPkgs
  all_branches <- gert::git_branch_list(local = NULL, repo = ".")

  branch_vars <- sep_cols(all_branches,
                          col = "name",
                          into = c("source", "branch"),
                          sep = "/")

  # return to original working directory
  setwd(original_dir)

  # remove git folder
  unlink(tmp_git_dir, force = TRUE, recursive = TRUE)

  # subset the branches columns
  branches_cols <- branch_vars[c("branch", "updated")]

  # remove regex
  if (!is.null(regex)) {

      branch_set <- grep(regex, branches_cols[["branch"]], value = TRUE)
      branches_cols <- subset(x = branches_cols,
                              branch %in% branch_set,
                              select = c(branch, updated))

  }

  # return data
  colnames(branches_cols) <- c("branch", "last_updated")
  # get unique
  unique_branches <- unique(branches_cols)
  # order
  ord_branches <- unique_branches[order(unique_branches$branch),]
  # remove non-listed branches
  branches <- subset(x = ord_branches,
                     branch %nin% c("HEAD", "main", "gh-pages"))
  return(branches)
}

