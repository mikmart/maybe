#' @exportS3Method monad::fmap
fmap.maybe <- function(m, f, ...) {
  maybe_map(m, f, ...)
}

#' @exportS3Method monad::bind
bind.maybe <- function(m, f, ...) {
  and_then(m, f, ...)
}

#' @exportS3Method monad::join
join.maybe <- function(m) {
  maybe_flatten(m)
}
