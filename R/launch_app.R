#' Launch shiny app
#'
#' @param app application branch
#'
#' @return shiny app
#'
#' @export
#'
#' @examples
#' # launch_app("02_movies-app")
launch_app <- function(app) {

  # keep track
  original_dir <- getwd()

  # get current folders
  current_dirs <- list.dirs(path = original_dir,
                            full.names = FALSE)

  if (any(app %in% current_dirs)) {
    setwd(app)
    withr::local_options(list(shiny.autoload.r = FALSE))
    shiny::runApp()
  } else {
    clone_app(app = app, open = FALSE)
    setwd(app)
    withr::local_options(list(shiny.autoload.r = FALSE))
    shiny::runApp()
  }

  setwd(original_dir)

}
