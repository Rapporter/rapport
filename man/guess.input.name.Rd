\name{guess.input.name}
\alias{guess.input.name}
\title{Input Name Validation}
\usage{
  guess.input.name(x, min.size = 1L, max.size = 30L, ...)
}
\arguments{
  \item{x}{a character vector to test names}

  \item{min.size}{an integer value that indicates minimum
  name length}

  \item{max.size}{an integer value that indicates maximum
  name length}

  \item{...}{additional arguments to be passed to
  \code{\link{grepl}} function}
}
\value{
  a logical vector indicating which values satisfy the
  naming conventions
}
\description{
  Checks \code{rapport} input naming conventions: input
  names should start with a letter, followed either by a
  letter or a digit, while the words should be separated
  with dots or underscores.
}

