describe("branches dataset", {

  test_that("contains 42 app branches", {
    expect_equal(nrow(branches), 42L)
  })

  test_that("does not contain removed branches", {
    removed <- c(
      "01_whole-app-game",
      "06.1_pkg-exports", "06.2_pkg-imports",
      "08_launch-app",
      "27_llm-shinychat",
      "DEV", "gh-pages", "main"
    )
    expect_false(any(removed %in% branches$branch))
  })

  test_that("contains renamed branches", {
    expect_true("06.1_exports" %in% branches$branch)
    expect_true("06.2_imports" %in% branches$branch)
    expect_true("08_launch" %in% branches$branch)
  })

  test_that("contains new LLM branches", {
    expect_true("31_llm-gander" %in% branches$branch)
    expect_true("32_llm-btw" %in% branches$branch)
  })

  test_that("frameworks precede LLM chapters", {
    fw_idx  <- which(branches$branch == "25_golem")
    llm_idx <- which(branches$branch == "28_llm-shiny-assist")
    expect_lt(fw_idx, llm_idx)
  })

})

describe("topic_lookup dataset", {

  test_that("has 42 rows and 3 columns", {
    expect_equal(nrow(topic_lookup), 42L)
    expect_equal(ncol(topic_lookup), 3L)
  })

  test_that("branch column matches branches dataset", {
    expect_equal(sort(topic_lookup$branch), sort(branches$branch))
  })

  test_that("framework branches have correct part", {
    fw <- subset(topic_lookup,
                 branch %in% c("25_golem", "26_leprechaun", "27_rhino"))
    expect_true(all(fw$part == "Frameworks"))
  })

  test_that("LLM branches 28-32 have correct part", {
    llm_branches <- c(
      "28_llm-shiny-assist", "29_llm-ellmer",
      "30_llm-chores", "31_llm-gander", "32_llm-btw"
    )
    llm <- subset(topic_lookup, branch %in% llm_branches)
    expect_true(all(llm$part == "Shiny & LLMs"))
  })

  test_that("new branches have correct chapter values", {
    gander_row <- subset(topic_lookup, branch == "31_llm-gander")
    btw_row    <- subset(topic_lookup, branch == "32_llm-btw")
    expect_equal(gander_row$chapter, "LLMs with gander package")
    expect_equal(btw_row$chapter,    "LLMs with btw package")
  })

  test_that("renamed branches map to correct chapters", {
    exports_row <- subset(topic_lookup, branch == "06.1_exports")
    imports_row <- subset(topic_lookup, branch == "06.2_imports")
    launch_row  <- subset(topic_lookup, branch == "08_launch")
    expect_equal(exports_row$chapter, "Dependencies")
    expect_equal(imports_row$chapter, "Dependencies")
    expect_equal(launch_row$chapter,  "Launch")
  })

  test_that("no NA values in branch or part columns", {
    expect_false(any(is.na(topic_lookup$branch)))
    expect_false(any(is.na(topic_lookup$part)))
  })

})
