library(testthat)
library(dplyr)

source("../../R/FUNCTION_NAME.R")

test_that("FUNCTION_NAME does EXPECTED BEHAVIOR in SIMPLE CASE", {
  
  df_test <- tibble(col_name = 1:5, col_name_2 = c(10, 20, NA, 40, 50), col_name_3 = letters[1:5])
  
  expect_equal(
    FUNCTION_NAME(df_test),
    45
  )
  
  expect_true(
    !is.na(FUNCTION_NAME(df_test))
  )
  
  # Error Cases
  df_all_na <- tibble(charges = c(NA_real_, NA_real_))
  expect_error(FUNCTION_NAME(df_all_na))
})