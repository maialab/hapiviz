#' @importFrom rlang .data
quincunx_ppm_forest_plot <- function(ppm) {
  if (isS4(ppm) && identical(class(ppm), 'performance_metrics'))

    ggplot2::ggplot(
      data = ppm@pgs_effect_sizes,
      ggplot2::aes(
        x = .data$ppm_id,
        y = .data$estimate,
        ymin = .data$interval_lower,
        ymax = .data$interval_upper,
        col = .data$estimate_type_long
      )
    ) +
    ggplot2::geom_point(size = 2) +
    ggplot2::geom_errorbar(width = 0) +
    # geom_pointrange() +
    ggplot2::geom_hline(yintercept = 1, lty = 2) +  # add a dotted line at x=1 after flip
    ggplot2::coord_flip() +  # flip coordinates (puts labels on y axis)
    ggplot2::xlab("Label") + ggplot2::ylab("Mean (95% CI)") +
    ggplot2::theme_bw()  # use a white background

}
