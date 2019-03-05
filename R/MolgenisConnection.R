
#' @include MolgenisDriver.R
#' @include MolgenisSession.R
NULL

#' Class MolgenisConnection.
#'
#' A MOLGENIS connection implementing the DataSHIELD Interface (DSI).
#'
#' @import methods
#' @import DSI
#'
#' @export
setClass(
  "MolgenisConnection",
  contains = "DSConnection",
  slots = list(name = "character", session = "MolgenisSession")
)
