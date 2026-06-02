#' Count card rarity by grouping variable
#'
#' @param grouping_var A column to group by (unquoted).
#' @return A tibble with counts of each rarity by group.
#' @importFrom dplyr count
#' @importFrom tidyr pivot_wider
#' @export
#rarity_by_release <- function(grouping_var) {

#  dat <- load_data()

#  dat |>
#    count({{grouping_var}}, rarity) |>
#    group_by({{grouping_var}}) |>
#    mutate(pct = n / sum(n)) |>
#    pivot_wider(
#      names_from = rarity,
#      values_from = pct
#    )
#
#}

rarity_by_release <- function(grouping_var) {
  load_data() |>
    dplyr::count({{ grouping_var }}, rarity, name = "n") |>
    dplyr::mutate(pct = n / sum(n), .by = {{ grouping_var }}) |>
    tidyr::pivot_wider(
      names_from = rarity,
      values_from = pct
    )
}
