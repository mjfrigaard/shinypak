fake_branches <- data.frame(
  name = c("main", "gh-pages", "22_webr", "14_tests_suite", "02.1_shiny-app"),
  updated = as.POSIXct(c(1, 2, 3, 4, 5), origin = "1970-01-01"),
  stringsAsFactors = FALSE
)

describe("list_apps()", {

  test_that("excludes HEAD, main, and gh-pages and sorts by branch", {
    local_mocked_bindings(
      git_clone_bare = function(url, path) dir.create(path)
    )
    local_mocked_bindings(
      git_branch_list = function(local, repo) fake_branches,
      .package = "gert"
    )
    apps <- list_apps()
    expect_named(apps, c("branch", "last_updated"))
    expect_equal(apps$branch, c("02.1_shiny-app", "14_tests_suite", "22_webr"))
  })

  test_that("filters branches with regex", {
    local_mocked_bindings(
      git_clone_bare = function(url, path) dir.create(path)
    )
    local_mocked_bindings(
      git_branch_list = function(local, repo) fake_branches,
      .package = "gert"
    )
    expect_equal(list_apps(regex = "tests")$branch, "14_tests_suite")
  })

  test_that("removes the temporary clone", {
    clone_path <- NULL
    local_mocked_bindings(
      git_clone_bare = function(url, path) {
        clone_path <<- path
        dir.create(path)
      }
    )
    local_mocked_bindings(
      git_branch_list = function(local, repo) fake_branches,
      .package = "gert"
    )
    list_apps()
    expect_false(dir.exists(clone_path))
  })

  test_that("aborts with a clear message and cleans up when the clone fails", {
    clone_path <- NULL
    local_mocked_bindings(
      git_clone_bare = function(url, path) {
        clone_path <<- path
        dir.create(path)
        stop("network down")
      }
    )
    expect_error(list_apps(), "Could not clone")
    expect_false(dir.exists(clone_path))
  })

})

describe("git_clone_bare()", {

  test_that("makes a bare clone of a local repository", {
    src <- withr::local_tempdir()
    gert::git_init(src)
    writeLines("x", file.path(src, "x.txt"))
    gert::git_add("x.txt", repo = src)
    gert::git_commit("init", repo = src,
      author = gert::git_signature("t", "t@t.com"))
    dest <- file.path(withr::local_tempdir(), "bare.git")
    expect_equal(git_clone_bare(url = src, path = dest), dest)
    expect_true(file.exists(file.path(dest, "HEAD")))
    expect_false(dir.exists(file.path(dest, ".git")))
  })

  test_that("aborts when git clone fails", {
    missing_repo <- file.path(withr::local_tempdir(), "nope")
    dest <- file.path(withr::local_tempdir(), "bare.git")
    expect_error(git_clone_bare(url = missing_repo, path = dest),
      "git clone failed")
  })

  test_that("aborts when git is not on the PATH", {
    withr::local_envvar(PATH = "")
    expect_error(git_clone_bare(url = "x", path = "y"),
      "needs git installed")
  })

})
