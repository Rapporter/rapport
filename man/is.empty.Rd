\name{is.empty}
\alias{is.empty}
\title{Empty Value}
\usage{
  is.empty(x, trim = TRUE, ...)
}
\arguments{
  \item{x}{an object to check its emptiness}

  \item{trim}{trim whitespace? (\code{TRUE} by default)}

  \item{...}{additional arguments for \code{\link{sapply}}}
}
\description{
  Rails-inspired helper that checks if vector values are
  "empty", i.e. if it's: \code{NULL}, zero-length,
  \code{NA}, \code{NaN}, \code{FALSE}, an empty string or
  \code{0}. Note that unlike its native R
  \code{is.<something>} sibling functions, \code{is.empty}
  is vectorised (hence the "values").
}
\examples{
\dontrun{
is.empty(NULL)     # [1] TRUE
is.empty(c())      # [1] TRUE
is.empty(NA)       # [1] TRUE
is.empty(NaN)      # [1] TRUE
is.empty("")       # [1] TRUE
is.empty(0)        # [1] TRUE
is.empty(0.00)     # [1] TRUE
is.empty("    ")   # [1] TRUE
is.empty("foobar") # [1] FALSE
is.empty("    ", trim = FALSE)    # [1] FALSE
# is.empty is vectorised!
all(is.empty(rep("", 10)))        # [1] TRUE
all(is.empty(matrix(NA, 10, 10))) # [1] TRUE
}
}

