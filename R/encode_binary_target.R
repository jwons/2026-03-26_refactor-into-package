#' 4. Encode a binary character/factor target variable into 0s and 1s
#'
#' @param x A character or factor vector containing exactly two unique valid classes.
#' @param positive_class The string label that should be encoded as 1.
#'
#' @return A numeric vector of 1s and 0s.
#' @export
encode_binary_target <- function(x, positive_class = "Yes") {
  if (!positive_class %in% x) {
    warning(paste("The positive class", positive_class, "was not found in the vector."))
  }
  
  # ifelse naturally returns NA if the input is NA, which is exactly what we want
  encoded <- ifelse(x == positive_class, 1, 0)
  return(encoded)
}