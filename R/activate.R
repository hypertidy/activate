#' Determine the context of subsequent manipulations
#'
#' Many objects are composed of multiple named entities and it necessary to specify which
#' sub-object is referenced during manipulations. The
#' `activate` verb does just that affects all subsequent manipulations
#' until a new sub-object is activated. `active` is a simple query function to get
#' the currently active context.
#'
#' @param .data,x An object with named entities
#'
#' @param what What should get activated? See methods for specifics.
#'
#' @param value the name to be used as the active sub-object
#' @return A object of class `.data`
#'
#' @export
#'
#' @examples
#'
#' # See dev tidygraph and dev ncdump for some real examples, but as seen
#' # we can activate a generic object by setting or getting attr(x, 'active').
#' my_object <- structure(list(x = 1, y = 25), active = "y")
#' active(my_object)
#' activate(my_object, "x")
activate <- function(.data, what) {
  UseMethod('activate')
}
#' @export
activate.default <- function(.data, what) {
  what_name <- deparse(substitute(what))
  if (what_name %in% names(.data)) what <- what_name
  active(.data) <- what
  .data
}

#' @rdname activate
#' @export
active <- function(x) {
 UseMethod("active")
}
#' @rdname activate
#' @export
active.default <- function(x) {
  warning("determining active status of object not recognized as activatable")
  val <- attr(x, 'active')
}
#' @rdname activate
#' @export
`active<-` <- function(x, value) {
  UseMethod("active<-")
}
#' @rdname activate
#' @export
`active<-.default` <- function(x, value) {
  warning("activating as a default, this object not recognized as activatable")
  attr(x, 'active') <- value
  x
}
