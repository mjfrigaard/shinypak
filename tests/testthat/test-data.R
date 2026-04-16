describe("branches dataset", {

  test_that("contains 40 app branches", {
    expect_equal(nrow(branches), 40L)
  })

  test_that("does not contain removed branches", {
    removed <- c(
      "01_whole-app-game",
      "06.1_pkg-exports", "06.2_pkg-imports",
      "08_launch-app",
      "25_llm-shinychat",
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
    expect_true("29_llm-gander" %in% branches$branch)
    expect_true("30_llm-btw" %in% branches$branch)
  })

  test_that("frameworks precede LLM chapters", {
    fw_idx  <- which(branches$branch == "23_golem")
    llm_idx <- which(branches$branch == "26_llm-shiny-assist")
    expect_lt(fw_idx, llm_idx)
  })

})

describe("topic_lookup dataset", {

  test_that("has 40 rows and 3 columns", {
    expect_equal(nrow(topic_lookup), 40L)
    expect_equal(ncol(topic_lookup), 3L)
  })

  test_that("branch column matches branches dataset", {
    expect_equal(sort(topic_lookup$branch), sort(branches$branch))
  })

  test_that("framework branches have correct part", {
    fw <- subset(topic_lookup,
                 branch %in% c("23_golem", "24_leprechaun", "25_rhino"))
    expect_true(all(fw$part == "Frameworks"))
  })

  test_that("LLM branches 26-30 have correct part", {
    llm_branches <- c(
      "26_llm-shiny-assist", "27_llm-ellmer",
      "28_llm-chores", "29_llm-gander", "30_llm-btw"
    )
    llm <- subset(topic_lookup, branch %in% llm_branches)
    expect_true(all(llm$part == "Shiny & LLMs"))
  })

  test_that("new branches have correct chapter values", {
    gander_row <- subset(topic_lookup, branch == "29_llm-gander")
    btw_row    <- subset(topic_lookup, branch == "30_llm-btw")
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
