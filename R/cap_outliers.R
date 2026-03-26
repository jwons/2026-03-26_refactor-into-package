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
  if (!is.numeric(x)) {
    stop("Input vector must be numeric.")
  }
  if (lower_quantile >= upper_quantile) {
    stop("Lower quantile must be strictly less than upper quantile.")
  }
  
  bounds <- quantile(x, probs = c(lower_quantile, upper_quantile), na.rm = TRUE)
  
  x_capped <- ifelse(x < bounds[1], bounds[1], x)
  x_capped <- ifelse(x_capped > bounds[2], bounds[2], x_capped)
  
  return(x_capped)
}