#' @export
forest_plot <- function(tbl, group_by_type = TRUE) {

  if (group_by_type) {
    tbl <- tbl %>%
      dplyr::mutate(ppm_label = paste(ppm_id, estimate_type, sep = '-')) %>%
      dplyr::arrange(dplyr::desc(estimate_type_long), dplyr::desc(interval_lower)) %>%
      tibble::rowid_to_column('id') %>%
      dplyr::mutate(ppm_label = forcats::fct_reorder(ppm_label, id))
  } else {
    tbl <- tbl %>%
      dplyr::mutate(ppm_label = paste(ppm_id, estimate_type, sep = '-'))
  }

  ggplot2::ggplot(data = tbl,
                  ggplot2::aes(
                    x = ppm_label,
                    y = estimate,
                    ymin = interval_lower,
                    ymax = interval_upper,
                    col = estimate_type_long
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
