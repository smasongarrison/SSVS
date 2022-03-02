test_that("ssvs argument error checking works", {
  predictors <- c("cyl", "disp", "hp", "drat", "wt", "vs", "am", "gear", "carb", "mpg")
  outcome <- "qsec"

  expect_error(ssvs())
  expect_error(ssvs("nodata", predictors, outcome))
  expect_error(ssvs(mtcars, "novar", outcome))
  expect_error(ssvs(mtcars, predictors, "novar"))
  expect_error(ssvs(mtcars, predictors, outcome, inprob = 2))
  expect_error(ssvs(mtcars, predictors, outcome, burn = 0))
  expect_error(ssvs(mtcars, predictors, outcome, burn = 1000, runs = 1000))
  expect_error(ssvs(mtcars, predictors, outcome, burn = 0))
  expect_error(ssvs(mtcars, predictors, outcome, burn = 1.5))
  expect_error(ssvs(mtcars, predictors, outcome, runs = 0))
  expect_error(ssvs(mtcars, predictors, outcome, a1 = 0))
  expect_error(ssvs(mtcars, predictors, outcome, b1 = 0))
  expect_error(ssvs(mtcars, predictors, outcome, prec.beta = 0))
  expect_error(ssvs(mtcars, predictors, outcome, progress = "nobool"))
})

test_that("ssvs works", {
  predictors <- c("cyl", "disp", "hp", "drat", "wt", "vs", "am", "gear", "carb", "mpg")
  outcome <- "qsec"

  set.seed(1000)
  results_simple <- ssvs(data = mtcars, x = predictors, y = outcome, progress = FALSE)
  expect_equal(results_simple, readRDS(system.file("testdata/results_simple.rds", package = "SSVS")))
  set.seed(1000)
  results_a1b1 <- ssvs(data = mtcars, x = predictors, y = outcome, progress = FALSE, a1 = 0.05, b1 = 0.05)
  expect_equal(results_a1b1, readRDS(system.file("testdata/results_a1b1.rds", package = "SSVS")))
  expect_false(isTRUE(all.equal(results_simple, results_a1b1)))
})