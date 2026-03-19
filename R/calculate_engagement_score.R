#' 3. Calculate a customer engagement score
#'
#' Formula: (logins * 0.2) + (purchases * 0.5) - (support_tickets * 0.3)
#' If the resulting score is negative, it should be set to 0.
#'
#' @param logins A numeric vector of login counts.
#' @param purchases A numeric vector of purchase counts.
#' @param support_tickets A numeric vector of support ticket counts.
#'
#' @return A numeric vector representing the engagement score, bounded at 0.
#' @export
calculate_engagement_score <- function(logins, purchases, support_tickets) {
  # Implementation goes here
}