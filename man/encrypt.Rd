\name{encrypt}
\alias{encrypt}
\title{Encrypt a string}
\usage{
  encrypt(message)
}
\arguments{
  \item{message}{a string to encrypt}
}
\value{
  string
}
\description{
  A simple encryption function which reorders the
  characters in a given string based on a predefined key.
  As it can be seen: the used encryption is easy to crack,
  do not use this for sensitive data! The key is set by
  default on library startup. It can be changed by
  modifying \code{options('.encrypt.key')} to any character
  string with same length as
  \code{options('.encrypt.chars')}. E.g.
  \code{intToUtf8(sample(c(33, 36:38, 48:57, 64:90, 97:122,
  192:246, 248:382), nchar(getOption('.encrypt.chars'))))}
  would return a quite complex but readable key.
}
\details{
  Default parameters are read from \code{options}:

  \itemize{ \item '.encrypt.chars', \item '.encrypt.keys'.
  }
}
\examples{
\dontrun{
encrypt("Hello world!")
encrypt(paste(names(mtcars), collapse=" "))
}
}
\references{
  Credits goes to Barry Rowlingson and Hadley Wickham:
  \url{https://stat.ethz.ch/pipermail/r-help/2010-March/232533.html}
}
\seealso{
  \code{decrypt}
}

