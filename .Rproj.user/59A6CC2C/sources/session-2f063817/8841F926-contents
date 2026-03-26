library(testthat)
library(dplyr)

source("../../R/impute_numeric_column.R")
source("../../R/cap_outliers.R")
source("../../R/calculate_engagement_score.R")
source("../../R/encode_binary_target.R")
source("../../R/calculate_precision.R")

## ------------------------------------------------------------------------
## Group 1: impute_numeric_column
## ------------------------------------------------------------------------

test_that("impute_numeric_column works for simple, edge, and error cases", {
  
  df_test <- tibble(id = 1:5, charges = c(10, 20, NA, 40, 50), char_col = letters[1:5])
  
  # Simple Expected
  expect_equal(
    impute_numeric_column(df_test, "charges", method = "median")$charges,
    c(10, 20, 30, 40, 50) # Median of 10, 20, 40, 50 is 30
  )
  expect_equal(
    impute_numeric_column(df_test, "charges", method = "mean")$charges,
    c(10, 20, 30, 40, 50) # Mean is also 30
  )
  
  # Edge Cases
  df_no_na <- tibble(charges = c(10, 20, 30))
  expect_equal(
    impute_numeric_column(df_no_na, "charges")$charges,
    c(10, 20, 30) # Unchanged
  )
  
  df_all_na <- tibble(charges = c(NA_real_, NA_real_))
  expect_true(
    all(is.na(impute_numeric_column(df_all_na, "charges")$charges)) # Median of NAs is NA
  )
  
  # Error Cases
  expect_error(impute_numeric_column(df_test, "missing_column"))
  expect_error(impute_numeric_column(df_test, "char_col"))
})


## ------------------------------------------------------------------------
## Group 2: cap_outliers
## ------------------------------------------------------------------------

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


## ------------------------------------------------------------------------
## Group 3: calculate_engagement_score
## ------------------------------------------------------------------------

test_that("calculate_engagement_score works for simple, edge, and error cases", {
  
  # Simple Expected: (10 * 0.2) + (2 * 0.5) - (1 * 0.3) = 2.0 + 1.0 - 0.3 = 2.7
  expect_equal(calculate_engagement_score(logins = 10, purchases = 2, support_tickets = 1), 2.7)
  
  # Edge Cases
  # Negative calculation: (0 * 0.2) + (0 * 0.5) - (10 * 0.3) = -3.0 -> should floor to 0
  expect_equal(calculate_engagement_score(logins = 0, purchases = 0, support_tickets = 10), 0)
  
  expect_equal(calculate_engagement_score(numeric(0), numeric(0), numeric(0)), numeric(0))
  
  # Error Cases
  expect_error(calculate_engagement_score(logins = c(1, 2), purchases = 1, support_tickets = 1)) # Length mismatch
})


## ------------------------------------------------------------------------
## Group 4: encode_binary_target
## ------------------------------------------------------------------------

test_that("encode_binary_target works for simple, edge, and error cases", {
  
  # Simple Expected
  expect_equal(
    encode_binary_target(c("Yes", "No", "Yes"), positive_class = "Yes"),
    c(1, 0, 1)
  )
  
  # Edge Cases
  expect_equal(
    encode_binary_target(c("Yes", "Yes"), positive_class = "Yes"),
    c(1, 1) # All positive
  )
  expect_equal(
    encode_binary_target(c("Yes", NA, "No"), positive_class = "Yes"),
    c(1, NA, 0) # NAs propagate
  )
  
  # Error/Warning Cases
  expect_warning(
    encode_binary_target(c("No", "No"), positive_class = "Yes") # Positive class missing
  )
})


## ------------------------------------------------------------------------
## Group 5: calculate_precision
## ------------------------------------------------------------------------

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