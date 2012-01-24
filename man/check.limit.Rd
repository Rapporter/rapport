\name{check.limit}
\alias{check.limit}
\title{Input Limits}
\usage{
  check.limit(x, max.lim = 50L)
}
\arguments{
  \item{x}{a character string containing limit substring}

  \item{max.lim}{an integer containing upper input limit}
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
rapport:::check.limit("[1,20]")
rapport:::check.limit("[1]")
rapport:::check.limit("[1, 0]")  # will throw error
}
}

