#' 1. Impute missing values in a numeric column
#'
#' @param df A data frame.
#' @param column_name The name of the column to impute (as a string).
#' @param method A string, either "mean" or "median". Default is "median".
#'
#' @return A data frame with the specified column's missing values imputed.
#' @export
impute_numeric_column <- function(df, column_name, method = "median") {
  if (!column_name %in% names(df)) {
    stop(paste("Column", column_name, "not found in data frame."))
  }
  if (!is.numeric(df[[column_name]])) {
    stop("Target column must be numeric.")
  }
  
  val_vector <- df[[column_name]]
  
  if (method == "median") {
    fill_val <- median(val_vector, na.rm = TRUE)
  } else if (method == "mean") {
    fill_val <- mean(val_vector, na.rm = TRUE)
  } else {
    stop("Method must be 'mean' or 'median'.")
  }
  
  df[[column_name]] <- ifelse(is.na(val_vector), fill_val, val_vector)
  return(df)
}