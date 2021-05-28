collapse_traits <- function(traits_tbl) {
  traits_tbl %>%
    dplyr::group_by(pgs_id) %>%
    dplyr::mutate(mapped_traits = glue::glue('{trait} ({efo_id})')) %>%
    #dplyr::summarise(mapped_traits = paste(mapped_traits, collapse = '|')) %>%
    dplyr::mutate(trait = paste(mapped_traits, collapse = '|')) %>%
    dplyr::ungroup() %>%
    dplyr::select(-mapped_traits) %>%
    dplyr::distinct(pgs_id, .keep_all = TRUE)
}

extract_efo_ids <- function(string) {
  stringr::str_extract_all(string, r'{\((\w+)\)}') %>%
    unlist() %>%
    stringr::str_remove_all('[\\(|\\)]')
}

split_traits <- function(string) {
  stringr::str_split(string, '\\|', simplify = TRUE)
}
