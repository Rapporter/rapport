\name{guess.mode}
\alias{guess.mode}
\title{Guess Mode}
\usage{
  guess.mode(x, trim.white = FALSE)
}
\arguments{
  \item{x}{an atomic vector to guess its mode}

  \item{trim.white}{a logical value indicating whether
  white spaces should be removed before guessing}
}
\value{
  an atomic vector with (hopefully) successfully guessed
  mode
}
\description{
  "Guesses" a mode of provided vector
}
\examples{
\dontrun{
storage.mode(guess.mode("234"))
## [1] "integer"
storage.mode(guess.mode("234.23"))
## [1] "double"
storage.mode(guess.mode("234.23.234"))
## [1] "character"
storage.mode(guess.mode("TRUE"))
## [1] "logical"
storage.mode(guess.mode("TRUE         "))
## [1] "character"
storage.mode(guess.mode("     TRUE         ", TRUE))
## [1] "logical"
}
}

