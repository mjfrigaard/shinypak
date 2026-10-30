describe("get_app() .Rproj rename", {

  test_that("renames sap.Rproj to {app}.Rproj when found", {
    tmp <- withr::local_tempdir()
    local_mocked_bindings(
      git_clone = function(path, url, branch, verbose) {
        dir.create(path, recursive = TRUE, showWarnings = FALSE)
        file.create(file.path(path, "sap.Rproj"))
        invisible(path)
      },
      .package = "gert"
    )
    withr::with_dir(tmp, get_app("test-app", open = FALSE))
    expect_true(file.exists(file.path(tmp, "test-app", "test-app.Rproj")))
    expect_false(file.exists(file.path(tmp, "test-app", "sap.Rproj")))
  })

  test_that("skips rename without error when no sap.Rproj (Positron)", {
    tmp <- withr::local_tempdir()
    local_mocked_bindings(
      git_clone = function(path, url, branch, verbose) {
        dir.create(path, recursive = TRUE, showWarnings = FALSE)
        invisible(path)
      },
      .package = "gert"
    )
    withr::with_dir(tmp, {
      expect_no_error(get_app("test-app", open = FALSE))
    })
    expect_true(dir.exists(file.path(tmp, "test-app")))
    # no stray .Rproj file created
    rproj_files <- list.files(file.path(tmp, "test-app"), pattern = "\\.Rproj$")
    expect_length(rproj_files, 0L)
  })

})

describe("get_app() open = TRUE", {

  test_that("passes directory path (not .Rproj) to openProject", {
    tmp <- withr::local_tempdir()
    captured_path <- NULL
    local_mocked_bindings(
      git_clone = function(path, url, branch, verbose) {
        dir.create(path, recursive = TRUE, showWarnings = FALSE)
        invisible(path)
      },
      .package = "gert"
    )
    local_mocked_bindings(
      openProject = function(path, newSession) {
        captured_path <<- path
        invisible(NULL)
      },
      .package = "rstudioapi"
    )
    withr::with_dir(tmp, get_app("test-app", open = TRUE))
    expect_true(dir.exists(captured_path))
    expect_false(grepl("\\.Rproj$", captured_path))
  })

  test_that("openProject path is app directory, not parent", {
    tmp <- withr::local_tempdir()
    captured_path <- NULL
    local_mocked_bindings(
      git_clone = function(path, url, branch, verbose) {
        dir.create(path, recursive = TRUE, showWarnings = FALSE)
        invisible(path)
      },
      .package = "gert"
    )
    local_mocked_bindings(
      openProject = function(path, newSession) {
        captured_path <<- path
        invisible(NULL)
      },
      .package = "rstudioapi"
    )
    withr::with_dir(tmp, get_app("test-app", open = TRUE))
    expect_equal(basename(captured_path), "test-app")
  })

})

describe("get_app() clone failure", {

  test_that("keeps the existing copy and leaves no temp folder", {
    tmp <- withr::local_tempdir()
    dir.create(file.path(tmp, "test-app"))
    file.create(file.path(tmp, "test-app", "keep.R"))
    local_mocked_bindings(
      git_clone = function(path, url, branch, verbose) stop("network down"),
      .package = "gert"
    )
    withr::with_dir(tmp, {
      expect_error(get_app("test-app", open = FALSE), "Could not clone")
    })
    expect_true(file.exists(file.path(tmp, "test-app", "keep.R")))
    expect_length(list.files(tmp, pattern = "^\\.shinypak-", all.files = TRUE), 0L)
  })

})

describe("get_app() cleanup", {

  test_that("removes .git files, .DS_Store, and .Rbuildignore", {
    tmp <- withr::local_tempdir()
    local_mocked_bindings(
      git_clone = function(path, url, branch, verbose) {
        dir.create(file.path(path, ".git"), recursive = TRUE)
        file.create(file.path(path, c(".gitignore", ".DS_Store",
                                      ".Rbuildignore", "app.R")))
        invisible(path)
      },
      .package = "gert"
    )
    withr::with_dir(tmp, get_app("test-app", open = FALSE))
    files <- list.files(file.path(tmp, "test-app"), all.files = TRUE,
                        no.. = TRUE)
    expect_equal(files, "app.R")
  })

  test_that("replaces an existing copy after a successful clone", {
    tmp <- withr::local_tempdir()
    dir.create(file.path(tmp, "test-app"))
    file.create(file.path(tmp, "test-app", "old.R"))
    local_mocked_bindings(
      git_clone = function(path, url, branch, verbose) {
        dir.create(path, recursive = TRUE)
        file.create(file.path(path, "new.R"))
        invisible(path)
      },
      .package = "gert"
    )
    withr::with_dir(tmp, get_app("test-app", open = FALSE))
    expect_true(file.exists(file.path(tmp, "test-app", "new.R")))
    expect_false(file.exists(file.path(tmp, "test-app", "old.R")))
  })

  test_that("returns the app path invisibly", {
    tmp <- withr::local_tempdir()
    local_mocked_bindings(
      git_clone = function(path, url, branch, verbose) dir.create(path),
      .package = "gert"
    )
    withr::with_dir(tmp, {
      expect_invisible(res <- get_app("test-app", open = FALSE))
      expect_equal(basename(res), "test-app")
    })
  })

})
