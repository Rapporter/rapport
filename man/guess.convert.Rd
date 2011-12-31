\name{guess.convert}
\alias{guess.convert}
\title{Guess Mode}
\usage{
  guess.convert(x, trim.white = FALSE)
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
  "Guesses" a mode of provided character vector and
  converts it to appropriate mode.
}
\examples{
\dontrun{
storage.mode(guess.mode("234"))

storage.mode(guess.mode("234.23"))

storage.mode(guess.mode("234.23.234"))

storage.mode(guess.mode("TRUE"))

storage.mode(guess.mode("TRUE         "))

storage.mode(guess.mode("     TRUE         ", TRUE))

}
}

