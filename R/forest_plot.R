#' Make a forest plot
#'
#' Makes a forest plot.
#'
#' @param tbl A tibble.
#' @param group_by_type Whether to group by effect size type.
#'
#' @importFrom rlang .data
#' @export
forest_plot <- function(tbl, group_by_type = TRUE) {

  if (group_by_type) {
    tbl <- tbl %>%
      dplyr::mutate(ppm_label = paste(.data$ppm_id, .data$estimate_type, sep = '-')) %>%
      dplyr::arrange(dplyr::desc(.data$estimate_type_long), dplyr::desc(.data$interval_lower)) %>%
      tibble::rowid_to_column('id') %>%
      dplyr::mutate(ppm_label = forcats::fct_reorder(.data$ppm_label, .data$id))
  } else {
    tbl <- tbl %>%
      dplyr::mutate(ppm_label = paste(.data$ppm_id, .data$estimate_type, sep = '-'))
  }

  ggplot2::ggplot(data = tbl,
                  ggplot2::aes(
                    x = .data$ppm_label,
                    y = .data$estimate,
                    ymin = .data$interval_lower,
                    ymax = .data$interval_upper,
                    col = .data$estimate_type_long
                  )) +
    ggplot2::geom_point(size = 2) +
    ggplot2::geom_errorbar(width = 0) +
    ggplot2::geom_hline(yintercept = 1, lty = 2) +  # add a dotted line at x=1 after flip
    ggplot2::coord_flip() +  # flip coordinates (puts labels on y axis)
    ggplot2::ylab("Mean (95% CI)") +
    ggplot2::scale_color_discrete(name = 'Estimate type') +
    ggplot2::ggtitle('PGS Performance Metrics', subtitle = 'Effect sizes per standard deviation') +
    ggplot2::theme_bw() +
    ggplot2::theme(axis.title.y = ggplot2::element_blank(),
                   axis.text.y = ggplot2::element_text(hjust=0))
}
