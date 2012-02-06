#' Encrypt a string
#'
#' A simple encryption function which reorders the characters in a given string based on a predefined key. As it can be seen: the used encryption is easy to crack, do not use this for sensitive data!
#' The key is set by default on library startup. It can be changed by modifying \code{options('.encrypt.key')} to any character string with same length as \code{options('.encrypt.chars')}.
#' E.g. \code{intToUtf8(sample(c(33, 36:38, 48:57, 64:90, 97:122, 192:246, 248:382), nchar(getOption('.encrypt.chars'))))} would return a quite complex but readable key.
#'
#' Default parameters are read from \code{options}:
#'
#' \itemize{
#'     \item '.encrypt.chars',
#'     \item '.encrypt.keys'.
#' }
#' @param message a string to encrypt
#' @return string
#' @seealso \code{\link{decrypt}}
#' @references Credits goes to Barry Rowlingson and Hadley Wickham: \url{https://stat.ethz.ch/pipermail/r-help/2010-March/232533.html}
#' @export
#' @examples \dontrun{
#' encrypt("Hello world!")
#' encrypt(paste(names(mtcars), collapse=" "))
#' }
encrypt <- function(message) {
	chartr(getOption('.encrypt.chars'), getOption('.encrypt.key'), message)
}

#' Decrypt a string
#'
#' Decrypts string encrypted by \code{\link{encrypt}}.
#'
#' Default parameters are read from \code{options}:
#'
#' \itemize{
#'     \item '.encrypt.chars',
#'     \item '.encrypt.keys'.
#' }
#' @param message a string to decrypt
#' @return string
#' @seealso \code{\link{encrypt}}
#' @references Credits goes to Barry Rowlingson and Hadley Wickham: \url{https://stat.ethz.ch/pipermail/r-help/2010-March/232533.html}
#' @export
#' @examples \dontrun{
#' decrypt("loRR7KT72R=!")
#' strsplit(decrypt("MrhKPzRK=tBrK0rK=2g~KT~K8BoPK1BKgMKhog2KPg2A"), " ")[[1]]
#' eval(parse(text=decrypt("rR7~HM~Pg2B40r,KP7Rkp2o=pc")))
#' }
decrypt <- function(message) {
	chartr(getOption('.encrypt.key'), getOption('.encrypt.chars'), message)
}
