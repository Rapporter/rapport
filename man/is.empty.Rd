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
  Rails-inspired helper that checks if vector values are
  "empty", i.e. if it's of \code{NULL}, \code{NA},
  \code{NaN}, \code{FALSE}, empty string or \code{0}. Note
  that unlike its `is.` siblings, `is.empty` is vectorised.
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

