quincunx_ppm_forest_plot <- function(ppm) {

  if(isS4(ppm) && identical(class(ppm), 'performance_metrics'))

  ggplot(data = tbl,
         aes(
           x = ppm_id,
           y = estimate,
           ymin = interval_lower,
           ymax = interval_upper,
           col = estimate_type_long
         )) +
    geom_point(size = 2) +
    geom_errorbar(width = 0) +
    # geom_pointrange() +
    geom_hline(yintercept = 1, lty = 2) +  # add a dotted line at x=1 after flip
    coord_flip() +  # flip coordinates (puts labels on y axis)
    xlab("Label") + ylab("Mean (95% CI)") +
    theme_bw()  # use a white background

}
