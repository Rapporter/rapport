##'	Encrypt a string
##' 
##' A simple encryption function which reorders the characters in a given string based on a predefined key. As it can be seen: the used encryption is easy to crack, do not use this for sensitive data!
##' The key is set by default on library startup. It can be changed by modifying \code{options('.encrypt.key')} to any character string with same lenght as \code{options('.encrypt.chars')}.
##' E.g. \code{intToUtf8(sample(c(33, 36:38, 48:57, 64:90, 97:122, 192:246, 248:382), nchar(getOption('.encrypt.chars')))))} would return a quite complex but readable key.
##'	@param message a string to encrypt
##'	@return string
##'	@seealso \code{decrypt}
##'	@references Credits goes to Barry Rowlingson and Hadley Wickham: \url{https://stat.ethz.ch/pipermail/r-help/2010-March/232533.html}
##'	@export
##' @examples \dontrun{
##'		encrypt("Hello world!")
##'		encrypt(paste(names(mtcars), collapse=" "))
##'	}
encrypt <- function(message) {
	chartr(getOption('.encrypt.chars'), getOption('.encrypt.key'), message)
}

##'	Decrypt a string
##' 
##' Decrypts string encrypted by \code{encrypt}.
##'	@param message a string to decrypt
##'	@return string
##'	@seealso \code{encrypt}
##'	@references Credits goes to Barry Rowlingson and Hadley Wickham: \url{https://stat.ethz.ch/pipermail/r-help/2010-March/232533.html}
##'	@export
##' @examples \dontrun{
##'		decrypt("l;pp8C|8.pB!")
##'		strsplit(decrypt("Em0C1apCB2rmCSmCB.q*C|*CIr;1CjrCqEC0;q.C1q.7"), " ")[[1]]
##'		eval(parse(text=decrypt("mp8*vE*1q.rtSm,CE*1q.rt|*,C18pdn0.;;4ny")))
##'	}
decrypt <- function(message) {
	chartr(getOption('.encrypt.key'), getOption('.encrypt.chars'), message)
}
