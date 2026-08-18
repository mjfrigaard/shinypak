#' Inverted version of `%in%`
#'
#' @description
#' Returns `TRUE` for elements of `x` that are *not* in `table`.
#'
#' @export
#'
#' @keywords internal
#'
#' @rdname nin
#'
#' @examples
#' 1 %nin% 1:10
#' "A" %nin% 1:10
`%nin%` <- function(x, table) {
  match(x, table, nomatch = 0) == 0
}
