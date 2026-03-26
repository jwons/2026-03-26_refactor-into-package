library(testthat)

source("../../R/encode_binary_target.R")

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