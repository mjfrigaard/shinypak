#' List Branches of the sap Repository
#'
#' @description
#' Clones the [`sap`](https://github.com/mjfrigaard/sap) GitHub repository to a
#' temporary directory, then returns its branches and their last update times as
#' a data frame. The temporary directory is removed before the function returns,
#' so nothing is left in your working directory.
#'
#' @param regex An optional character string containing a regular expression
#'    (regex) to filter branch names
#'
#' @return A data frame with two columns: `branch` (the branch name) and
#'    `last_updated` (the date the branch was last updated), ordered
#'    alphabetically by branch name. Branches named `HEAD`, `main`, and
#'    `gh-pages` are excluded.
#'
#' @section How it works:
#' 1. Saves the current working directory so it can be restored later
#' 2. Clones the [`sap`](https://github.com/mjfrigaard/sap) repository from
#'    GitHub into a temporary directory
#' 3. Lists all branches of the cloned repository
#' 4. Separates each branch `name` into `source` and `branch`
#' 5. Filters the branches to those matching `regex`, if one is supplied
#' 6. Deletes the temporary directory and restores the original working
#'    directory
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
  tmp_git_dir <- file.path(tempdir(), 'sap')

  gert::git_clone(url = "https://github.com/mjfrigaard/sap",
    path =  tmp_git_dir, verbose = FALSE)
  # switch to git folder
  setwd(tmp_git_dir)

  # get tibble of branch names and last update in sap
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

