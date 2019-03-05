
#' Class MolgenisSession.
#'
#' A Session on a MOLGENIS server.
#'
#' @param host     Hostname of the MOLGENIS server
#' @param username username used to authenticate
#' @param password password used to authenticate
#'
#' @import methods
#' @export
setClass("MolgenisSession",
         representation = representation(host = "character", token = "character"))

#' Log in on a MOLGENIS server
#'
#' @param session  the current session
#' @param username the username to use to log in
#' @param password the password to use to log in
#'
#' @export
setGeneric(
  name = "login",
  def = function(session, username, password)
  {
    standardGeneric("login")
  }
)

#' Log in on a MOLGENIS server
#'
#' @importFrom rjson fromJSON toJSON
#' @importFrom RCurl postForm
#'
#' @param session  the current session
#' @param username the username to use to log in
#' @param password the password to use to log in
#'
#' @export
setMethod("login", "MolgenisSession",
          function(session,
                   username = NULL,
                   password = NULL) {
            jsonRequest <-
              toJSON(list(username = username, password = password))
            jsonResponse <-
              postForm(url, .opts = list(
                postfields = jsonRequest,
                httpheader = c('Content-Type' = 'application/json')
              ))
            response <- fromJSON(jsonResponse)
            session$token <- response$token
          })

#' Create a MOLGENIS Session
#'
#' @return a [MolgenisSession] object.
#'
#' @param host  the MOLGENIS hostname
#' @param token the authentication token
#'
#' @export
Session <- function(host, token = NULL) {
  new("MolgenisSession", host = host, token = token)
}
