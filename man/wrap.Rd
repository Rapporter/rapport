\name{wrap}
\alias{wrap}
\title{Wrap Vector Elements}
\usage{
  wrap(x, wrap = "\"")
}
\arguments{
  \item{x}{a vector to wrap}

  \item{wrap}{a string to wrap around vector elements}
}
\value{
  a string with wrapped elements
}
\description{
  Wraps vector elements with string provided in \code{wrap}
  argument.
}
\examples{
wrap(c("fee", "fi", "foo", "fam"), "_")
## [1] "_fee_" "_fi_"  "_foo_" "_fam_"
}

