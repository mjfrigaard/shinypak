#' Launch shiny app
#'
#' @param app application branch
#'
#' @return shiny app
#'
#' @export
#'
#' @examples
#' # launch("02_movies-app")
#' # launch("07_roxygen2")
launch <- function(app) {

  if (!dir.exists(app)) {
    cli::cli_progress_message("cloning {app} from 'moviesApp'")
    get_app(app = app, open = FALSE)
    if (!dir.exists(app)) {
      cli::cli_alert_success("{app} cloned from 'moviesApp'")
    }
  }
  app_dot_r <- list.files(path = app,
                          pattern = "app.R$",
                          full.names = TRUE,
                          all.files = FALSE,
                          include.dirs = FALSE)
  has_app_dot_r <- any(grepl(pattern = "app.R$",
                             x = app_dot_r))

  # launch app-package (load first)
  if (isTRUE(is_r_package(app)) & isTRUE(has_app_dot_r)) {
      pkgload::load_all(path = app,
        helpers = FALSE,
        attach_testthat = FALSE)
      withr::local_options(list(shiny.autoload.r = FALSE))
      cli::cli_alert_success("Launching app with shiny::runApp('{app}')")
      shiny::runApp(appDir = app)
  } else if (isFALSE(is_r_package(app)) & isTRUE(has_app_dot_r)) {
      cli::cli_alert_success("Launching app with: shiny::shinyAppDir('{app_dot_r}')")
      shiny::shinyAppDir(appDir = app)
  }
}


