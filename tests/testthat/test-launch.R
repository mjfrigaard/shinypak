pkg_desc_lines <- c(
  "Package: testpkg",
  "Title: Test Package",
  "Version: 0.1.0",
  "Author: Test [aut]",
  "Maintainer: Test <test@test.com>",
  "Description: A test package.",
  "License: MIT"
)

describe("launch() routing — R package app", {

  test_that("uses runApp() for package app with .Rproj", {
    tmp <- withr::local_tempdir()
    app_dir <- file.path(tmp, "pkg-with-rproj")
    dir.create(app_dir)
    writeLines(pkg_desc_lines, file.path(app_dir, "DESCRIPTION"))
    file.create(file.path(app_dir, "pkg-with-rproj.Rproj"))
    file.create(file.path(app_dir, "app.R"))

    run_app_called <- FALSE
    local_mocked_bindings(
      load_all = function(...) invisible(NULL),
      .package = "pkgload"
    )
    local_mocked_bindings(
      runApp = function(...) { run_app_called <<- TRUE; invisible(NULL) },
      .package = "shiny"
    )
    withr::with_dir(tmp, launch("pkg-with-rproj"))
    expect_true(run_app_called)
  })

  test_that("uses runApp() for package app without .Rproj (Positron)", {
    tmp <- withr::local_tempdir()
    app_dir <- file.path(tmp, "pkg-no-rproj")
    dir.create(app_dir)
    writeLines(pkg_desc_lines, file.path(app_dir, "DESCRIPTION"))
    file.create(file.path(app_dir, "app.R"))
    # no .Rproj file

    run_app_called <- FALSE
    local_mocked_bindings(
      load_all = function(...) invisible(NULL),
      .package = "pkgload"
    )
    local_mocked_bindings(
      runApp = function(...) { run_app_called <<- TRUE; invisible(NULL) },
      .package = "shiny"
    )
    withr::with_dir(tmp, launch("pkg-no-rproj"))
    expect_true(run_app_called)
  })

})

describe("launch() routing — plain Shiny app", {

  test_that("uses shinyAppDir() for plain app without DESCRIPTION", {
    tmp <- withr::local_tempdir()
    app_dir <- file.path(tmp, "plain-app")
    dir.create(app_dir)
    file.create(file.path(app_dir, "app.R"))
    # no DESCRIPTION — not an R package

    shiny_app_dir_called <- FALSE
    local_mocked_bindings(
      shinyAppDir = function(...) { shiny_app_dir_called <<- TRUE; invisible(NULL) },
      .package = "shiny"
    )
    withr::with_dir(tmp, launch("plain-app"))
    expect_true(shiny_app_dir_called)
  })

})

describe("launch() when the app is not local", {

  test_that("clones the app with get_app() before launching", {
    tmp <- withr::local_tempdir()
    local_mocked_bindings(
      get_app = function(app, open) {
        dir.create(app)
        file.create(file.path(app, "app.R"))
      }
    )
    local_mocked_bindings(
      shinyAppDir = function(...) invisible(NULL),
      .package = "shiny"
    )
    withr::with_dir(tmp, expect_message(launch("new-app"), "cloned from"))
  })

  test_that("aborts when get_app() leaves no directory", {
    tmp <- withr::local_tempdir()
    local_mocked_bindings(get_app = function(app, open) invisible(NULL))
    withr::with_dir(tmp, expect_error(launch("new-app"), "Could not clone"))
  })

})

describe("launch() without app.R", {

  test_that("aborts when the directory has no app.R", {
    tmp <- withr::local_tempdir()
    dir.create(file.path(tmp, "no-app"))
    withr::with_dir(tmp, expect_error(launch("no-app"), "No 'app.R'"))
  })

})
