library(testthat)
library(dplyr)

source("../../R/impute_numeric_column.R")

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