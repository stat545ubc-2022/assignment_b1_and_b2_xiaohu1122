#' Scatter Plot of Two Continuous Variables Colored by Categorical Groups
#'
#' Plot a scatter plot of two continuous variables and colored the points
#' by a categorical variable.
#'
#' @param data Data frame containing the data.
#' @param x String of the first continuous variable name from the data frame to pass to
#' \code{tidyverse::ggplot()}. This is the x variable of the scatter plot.
#' @param y String of the second continuous variable name from the data frame to pass to
#' \code{tidyverse::ggplot()}. This is the y variable of the scatter plot.
#' @param group Character of name of categorical variable that points are be colored by
#' @param lm If \code{TRUE} (the default), uses the \code{geom_smooth()} function
#' to fit a linear regression line to the scatter plot. If \code{FALSE},
#' there is no linear regression line.
#' @return A plot
#'
#' @examples
#' library(datateachr)
#' scatter_bygroup(cancer_sample, "radius_mean", "concave_points_mean", "diagnosis")
#' scatter_bygroup(cancer_sample, "radius_mean", "concave_points_mean", "diagnosis",FALSE)
#' @export

scatter_bygroup <- function(data, x, y, group, lm = TRUE){

  if(!(is.character(x)&is.character(y)&is.character(group))) {
    stop('I am so sorry, but this function only works for character inputs!')
  }

  g <-
    ggplot2::ggplot(data,ggplot2::aes(.data[[x]], .data[[y]], color = .data[[group]])) +
    ggplot2::geom_point(size = 1.5,
               alpha = 0.5) +
    ggplot2::labs(title = "Scatter Plot Colored by Groups",
         color = group,
         x = x,
         y = y)+
    ggplot2::theme(
      text = ggplot2::element_text(size = 10),
      plot.title = ggplot2::element_text(face = "bold"),
      axis.title = ggplot2::element_text(face = "bold"),
      legend.title = ggplot2::element_text(face = "bold"),
    )

  if (lm) {
    g <- g + ggplot2::geom_smooth(method = "lm", formula = y ~ x)
  }

  return (g)
}
