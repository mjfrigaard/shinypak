fake_branches <- data.frame(
  name = c("main", "origin/HEAD", "origin/main", "origin/gh-pages",
           "origin/22_webr", "origin/14_tests_suite", "origin/02.1_shiny-app"),
  updated = as.POSIXct(c(1, 2, 3, 4, 5, 6, 7), origin = "1970-01-01"),
  stringsAsFactors = FALSE
)

describe("list_apps()", {

  test_that("excludes HEAD, main, and gh-pages and sorts by branch", {
    local_mocked_bindings(
      git_clone = function(url, path, verbose) dir.create(path),
      git_branch_list = function(local, repo) fake_branches,
      .package = "gert"
    )
    apps <- list_apps()
    expect_named(apps, c("branch", "last_updated"))
    expect_equal(apps$branch, c("02.1_shiny-app", "14_tests_suite", "22_webr"))
  })

  test_that("filters branches with regex", {
    local_mocked_bindings(
      git_clone = function(url, path, verbose) dir.create(path),
      git_branch_list = function(local, repo) fake_branches,
      .package = "gert"
    )
    expect_equal(list_apps(regex = "tests")$branch, "14_tests_suite")
  })

  test_that("removes the temporary clone", {
    clone_path <- NULL
    local_mocked_bindings(
      git_clone = function(url, path, verbose) {
        clone_path <<- path
        dir.create(path)
      },
      git_branch_list = function(local, repo) fake_branches,
      .package = "gert"
    )
    list_apps()
    expect_false(dir.exists(clone_path))
  })

  test_that("aborts with a clear message and cleans up when the clone fails", {
    clone_path <- NULL
    local_mocked_bindings(
      git_clone = function(url, path, verbose) {
        clone_path <<- path
        dir.create(path)
        stop("network down")
      },
      .package = "gert"
    )
    expect_error(list_apps(), "Could not clone")
    expect_false(dir.exists(clone_path))
  })

})
