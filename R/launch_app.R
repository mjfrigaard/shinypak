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
#' # launch_app("07_roxygen2")
launch_app <- function(app) {

  if (!dir.exists(app)) {
    clone_app(app = app, open = FALSE)
  }

  pkg_status <- is_r_pkg(app)

  if (pkg_status) {
    is_pkg <- TRUE
    is_app <- FALSE
  } else {
    is_app <- TRUE
    is_pkg <- FALSE
  }

  all_files <- list.files(path = app,
                          full.names = TRUE,
                          all.files = TRUE,
                          include.dirs = TRUE)

  app_dot_r_regex <- c("app.R$")

  if (any(grepl(app_dot_r_regex, all_files))) {
    app_file <- all_files[grepl(app_dot_r_regex, all_files)]
    has_app_dot_r <- TRUE
  }

  if (is_pkg & !is_app & has_app_dot_r) {
      pkgload::load_all(path = app,
        helpers = FALSE, attach_testthat = FALSE)
      withr::local_options(list(shiny.autoload.r = FALSE))
      shiny::runApp(appDir = app)
  }

  if (!is_pkg & is_app & has_app_dot_r) {
        shiny::runApp(appDir = app)
  }

}

