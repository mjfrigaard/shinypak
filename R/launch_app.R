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

  clone_app(app = app, open = FALSE)

  setwd(app)

  withr::local_options(list(shiny.autoload.r = FALSE))

  shiny::runApp()

}
