#' List Branches of the sap Repository
#'
#' @description
#' Makes a bare, blobless clone of the [`sap`](https://github.com/mjfrigaard/sap)
#' GitHub repository in a temporary directory (branch names and commit history
#' only, no file contents), then returns its branches and their last update times as
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
#' 1. Clones the [`sap`](https://github.com/mjfrigaard/sap) repository from
#'    GitHub into a temporary directory with
#'    `git clone --bare --filter=blob:none` (requires git on the `PATH`)
#' 2. Lists all branches of the cloned repository
#' 3. Separates each branch `name` into `source` and `branch`
#' 4. Filters the branches to those matching `regex`, if one is supplied
#' 5. Deletes the temporary directory (even if an earlier step fails)
#'
#' @export list_apps
#'
#' @examplesIf interactive()
#' list_apps()
#' list_apps(regex = "tests")
list_apps <- function(regex = NULL) {

  # clone repo to a unique temp dir, removed on exit
  tmp_git_dir <- tempfile(pattern = "sap-")
  on.exit(unlink(tmp_git_dir, recursive = TRUE, force = TRUE), add = TRUE)

  tryCatch(
    git_clone_bare(url = "https://github.com/mjfrigaard/sap",
      path = tmp_git_dir),
    error = function(e) {
      cli::cli_abort("Could not clone 'sap' to list its branches.", parent = e)
    }
  )

  # get tibble of branch names and last update in sap
  all_branches <- gert::git_branch_list(local = NULL, repo = tmp_git_dir)

  branch_vars <- sep_cols(all_branches,
                          col = "name",
                          into = c("source", "branch"),
                          sep = "/")

  # subset the branches columns
  branches_cols <- branch_vars[c("branch", "updated")]

  # filter by regex
  if (!is.null(regex)) {
    keep <- grepl(regex, branches_cols[["branch"]])
    branches_cols <- branches_cols[keep, c("branch", "updated")]
  }

  # return data
  colnames(branches_cols) <- c("branch", "last_updated")
  # get unique
  unique_branches <- unique(branches_cols)
  # order
  ord_branches <- unique_branches[order(unique_branches$branch),]
  # remove non-listed branches
  branches <- ord_branches[ord_branches$branch %nin% c("HEAD", "main", "gh-pages"), ]
  return(branches)
}

#' Bare, blobless clone with the git command line
#'
#' `gert` (libgit2) can't make partial clones, so this calls `git` directly.
#'
#' @param url Repository URL
#' @param path Destination directory
#'
#' @return `path`, invisibly
#'
#' @noRd
git_clone_bare <- function(url, path) {
  if (!nzchar(Sys.which("git"))) {
    cli::cli_abort("{.fn list_apps} needs git installed and on the PATH.")
  }
  out <- suppressWarnings(system2(
    "git",
    c("clone", "--quiet", "--bare", "--filter=blob:none", shQuote(url), shQuote(path)),
    stdout = TRUE, stderr = TRUE
  ))
  status <- attr(out, "status")
  if (!is.null(status) && status != 0) {
    cli::cli_abort(c("git clone failed.", "x" = paste(out, collapse = "\n")))
  }
  invisible(path)
}
