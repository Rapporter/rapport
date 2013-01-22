\name{guess.input.limits}
\alias{guess.input.limits}
\title{Input Limits}
\usage{
  guess.input.limits(x, input.type)
}
\arguments{
  \item{x}{a character string containing limit substring or
  a named list with limit values}

  \item{input.type}{type of input field}
}
\value{
  a named list with \code{min}imal and \code{max}imal input
  limit
}
\description{
  Checks input limits based on provided string. If provided
  string is syntactically correct, a list with integers
  containing limit boundaries (minimum and maximum value)
  is returned. If provided input limit exceeds value
  specified in \code{max.lim} argument, it will be coerced
  to \code{max.lim} and warning will be returned. Default
  upper input limit is 50 (variables).
}
\examples{
\dontrun{
rapport:::guess.input.limits("[1,20]")
rapport:::guess.input.limits("[1]")
rapport:::guess.input.limits("[1, 0]")  # will throw error (min limit larger than max limit)
rapport:::guess.input.limits("")        # returns list(min = 1, max = 1)
}
}

