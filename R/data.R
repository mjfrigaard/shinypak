#' App branches from the sap repository
#'
#' @description
#' A character vector of branch names from the
#' [`sap`](https://github.com/mjfrigaard/sap) GitHub repository. Each branch
#' corresponds to a Shiny application example from the
#' [Shiny App-Packages book](https://mjfrigaard.github.io/shiny-app-pkgs/).
#'
#' @format A data frame with 40 rows and 1 column:
#' \describe{
#'   \item{branch}{Character. The branch name (e.g., `"05_roxygen2"`).}
#' }
#'
#' @source \url{https://github.com/mjfrigaard/sap}
"branches"


#' Topic lookup table for the sap repository
#'
#' @description
#' Maps each branch of the [`sap`](https://github.com/mjfrigaard/sap) GitHub
#' repository to its book part and chapter in the
#' [Shiny App-Packages book](https://mjfrigaard.github.io/shiny-app-pkgs/).
#'
#' @format A data frame with 40 rows and 3 columns:
#' \describe{
#'   \item{branch}{Character. The branch name (e.g., `"05_roxygen2"`).}
#'   \item{part}{Character. The book part the branch belongs to (e.g.,
#'     `"App-packages"`, `"Tests"`, `"Deploy"`, `"Frameworks"`,
#'     `"Shiny & LLMs"`).}
#'   \item{chapter}{Character. The chapter topic (e.g., `"Documentation"`).}
#' }
#'
#' @source \url{https://github.com/mjfrigaard/sap}
"topic_lookup"
