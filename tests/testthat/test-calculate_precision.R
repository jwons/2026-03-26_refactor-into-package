library(testthat)

source("../../R/calculate_precision.R")

test_that("calculate_precision works for simple, edge, and error cases", {
  
  # Simple Expected
  actual    <- c(1, 0, 1, 0, 1)
  predicted <- c(1, 1, 0, 0, 1)
  # True Positives: 2 (Index 1, 5)
  # False Positives: 1 (Index 2)
  # Precision = 2 / (2 + 1) = 2/3
  expect_equal(calculate_precision(actual, predicted), 2/3)
  
  # Edge Cases
  all_zero_preds <- c(0, 0, 0, 0)
  all_zero_actuals <- c(1, 0, 1, 0)
  # Denominator is 0
  expect_identical(calculate_precision(all_zero_actuals, all_zero_preds), NA_real_)
  
  # Error Cases
  expect_error(calculate_precision(c(1, 0), c(1, 0, 1))) # Length mismatch
})