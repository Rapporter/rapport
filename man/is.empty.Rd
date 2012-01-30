\name{is.empty}
\alias{is.empty}
\title{Empty Value}
\usage{
  is.empty(x, trim = FALSE, ...)
}
\arguments{
  \item{x}{an object to check}

  \item{trim}{trim whitespace? (by default removes only
  trailing spaces)}

  \item{...}{additional arguments for
  \code{\link{trim.space}}}
}
\description{
  Rails-inspired helper that checks if value is "empty",
  i.e. if it's of \code{NULL}, \code{NA}, \code{NaN},
  \code{FALSE}, empty string or 0.
}
\examples{
is.empty(NULL)     # returns [1] TRUE
is.empty(NA)       # returns [1] TRUE
is.empty(NaN)      # returns [1] TRUE
is.empty("")       # returns [1] TRUE
is.empty(0)        # returns [1] TRUE
is.empty(0.00)     # returns [1] TRUE
is.empty("foobar") # returns [1] FALSE
is.empty("    ")   # returns [1] FALSE
}

