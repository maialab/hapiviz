#' @export
hl <- function(url_pattern = NULL) {
  function(value, index = NULL, colname = NULL) {
    url <- glue::glue(url_pattern)
    htmltools::tags$a(href = url, target = "_blank", as.character(value))
  }
}

hl_trait <- function(.data, efo_id_col, trait_name_col) {
  function(value, index = NULL, colname = NULL) {
    url <- 'https://www.pgscatalog.org/trait/'
    htmltools::tags$a(href = url, target = "_blank", as.character(value))
  }
}

html_link <- function(href, content) {
  sprintf('<a href="%s" target="_blank">%s</a>', href, content)
}
