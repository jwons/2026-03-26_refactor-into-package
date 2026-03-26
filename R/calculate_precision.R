#' 5. Calculate Model Precision
#'
#' Precision is defined as: True Positives / (True Positives + False Positives)
#'
#' @param actual A numeric vector of actual outcomes (1s and 0s).
#' @param predicted A numeric vector of predicted outcomes (1s and 0s).
#'
#' @return A single numeric value representing the precision. If the denominator 
#'   is 0 (no positive predictions), the function should return NA.
#' @export
calculate_precision <- function(actual, predicted) {
  if (length(actual) != length(predicted)) {
    stop("Actual and predicted vectors must be the same length.")
  }
  
  true_positives <- sum(actual == 1 & predicted == 1, na.rm = TRUE)
  false_positives <- sum(actual == 0 & predicted == 1, na.rm = TRUE)
  
  denominator <- true_positives + false_positives
  
  if (denominator == 0) {
    return(NA_real_)
  }
  
  return(true_positives / denominator)
}