library(testthat)

source("../../R/cap_outliers.R")

test_that("cap_outliers works for simple, edge, and error cases", {
  
  vec_test <- c(-100, 10, 20, 30, 40, 50, 1000)
  
  # Simple Expected (using 10% and 90% for easier mental math)
  capped <- cap_outliers(vec_test, lower_quantile = 0.1, upper_quantile = 0.9)
  expect_true(min(capped) > -100)
  expect_true(max(capped) < 1000)
  
  # Edge Cases
  vec_identical <- c(5, 5, 5, 5)
  expect_equal(cap_outliers(vec_identical), vec_identical) # Unchanged
  
  # Error Cases
  expect_error(cap_outliers(letters[1:5]))
  expect_error(cap_outliers(vec_test, lower_quantile = 0.9, upper_quantile = 0.1)) # Reversed
})