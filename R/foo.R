# library(gridExtra)
#
# # read in sample visit-sequences.csv data provided in source
# # https://gist.github.com/kerryrodden/7090426#file-visit-sequences-csv
# sequences <- read.csv(
#   system.file("examples/visit-sequences.csv",package="sunburstR")
#   ,header=F
#   ,stringsAsFactors = FALSE
# )
#
# class(sequences)
#
# sunburstR::sunburst(sequences)
# library(tidyverse)
#
# bar <-
#   foo@ancestry_frequencies %>%
#   dplyr::rowwise() %>%
#   dplyr::mutate(label = paste(dplyr::c_across(-frequency), collapse = '-')) %>%
#   dplyr::select(label, frequency)
#
# bar <-
#   foo@ancestry_frequencies %>%
#   dplyr::filter(pgs_id == 'PGS000004') %>%
#   dplyr::rowwise() %>%
#   dplyr::mutate(label = paste(dplyr::c_across(-frequency), collapse = '-')) %>%
#   dplyr::select(label, frequency)
#
# sunburstR::sunburst(bar)
#
#
# library(plotly)
#
# fig <- plot_ly(
#   labels = c("Eve", "Cain", "Seth", "Enos", "Noam", "Abel", "Awan", "Enoch", "Azura"),
#   parents = c("", "Eve", "Eve", "Seth", "Seth", "Eve", "Eve", "Awan", "Eve"),
#   values = c(10, 14, 12, 10, 2, 6, 6, 4, 4),
#   type = 'sunburst'
# )
#
# fig
#
#
# zar <- foo@ancestry_frequencies %>%
#   dplyr::filter(pgs_id == 'PGS000004', stage == 'eval')
#
# p1 <- plot_ly(
#   labels = zar$ancestry_class_symbol,
#   parents = 'E',
#   values = zar$frequency,
#   type = 'sunburst'
# )
#
# p0 <- plot_ly()
#
#
# p1 <- add_trace(
#   p0,
#   labels = zar$ancestry_class_symbol,
#   parents = 'E',
#   values = zar$frequency,
#   type = 'sunburst',
#   domain = list(column = 0)
# )
#
#
# ancestry_plot <- function(tbl) {
#
#   gwas_tbl <- dplyr::filter(tbl, stage == 'gwas')
#   dev_tbl <- dplyr::filter(tbl, stage == 'dev')
#   eval_tbl <- dplyr::filter(tbl, stage == 'eval')
#
#   p0 <- plot_ly()
#
#   p0 %>%
#     add_trace(
#       labels = gwas_tbl$ancestry_class_symbol,
#       parents = 'G',
#       values = gwas_tbl$frequency,
#       type = 'sunburst',
#       domain = list(column = 0)
#     ) %>%
#     add_trace(
#       labels = dev_tbl$ancestry_class_symbol,
#       parents = 'D',
#       values = dev_tbl$frequency,
#       type = 'sunburst',
#       domain = list(column = 1)
#     ) %>%
#     add_trace(
#       labels = eval_tbl$ancestry_class_symbol,
#       parents = 'E',
#       values = eval_tbl$frequency,
#       type = 'sunburst',
#       domain = list(column = 2)
#     ) %>%
#     layout(grid = list(columns = 3, rows = 1),
#            margin = list(
#              l = 0,
#              r = 0,
#              b = 0,
#              t = 0
#            ))
# }
#
#
# my_plot <- ancestry_plot(dplyr::filter(foo@ancestry_frequencies, pgs_id == 'PGS000004'))
# my_plot2 <- ancestry_plot(dplyr::filter(foo@ancestry_frequencies, pgs_id == 'PGS000008'))
#
#
# subplot(my_plot, my_plot2, nrows = 2)
# grid.arrange(my_plot, my_plot2, ncol = 2)
# subplot(ply1, ply2, nrows=1)
