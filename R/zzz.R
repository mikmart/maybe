.onLoad <- function(...) {
  S7::methods_register()
}

local({
  wrap <- function(fn) function(m, f, ...) fn(m, f, ...)
  fmap <- S7::new_external_generic("monad", "fmap", "m")
  bind <- S7::new_external_generic("monad", "bind", "m")
  join <- S7::new_external_generic("monad", "join", "m")
  S7::method(fmap, S7::new_S3_class("maybe")) <- wrap(maybe_map)
  S7::method(bind, S7::new_S3_class("maybe")) <- wrap(and_then)
  S7::method(join, S7::new_S3_class("maybe")) <- function(m) maybe_flatten(m)
})
