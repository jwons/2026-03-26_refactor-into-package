#' 2. Cap outliers using quantiles
#'
#' @param x A numeric vector.
#' @param lower_quantile A numeric value between 0 and 1. Default is 0.05.
#' @param upper_quantile A numeric value between 0 and 1. Default is 0.95.
#'
#' @return A numeric vector where values below the lower quantile are replaced 
#'   with the lower quantile value, and values above the upper quantile are 
#'   replaced with the upper quantile value.
#' @export
cap_outliers <- function(x, lower_quantile = 0.05, upper_quantile = 0.95) {
  # Implementation goes here
}