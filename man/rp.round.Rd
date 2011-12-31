\name{rp.round}
\alias{rp.round}
\title{Round numeric values}
\usage{
  rp.round(x, scientific = FALSE)
}
\arguments{
  \item{x}{numeric value(s)}

  \item{scientific}{see \code{format}'s manual: Either a
  logical specifying whether elements of a real or complex
  vector should be encoded in scientific format, or an
  integer penalty (see ‘options("scipen")’).  Missing
  values correspond to the current default penalty.}
}
\value{
  character vector of rounded value(s)
}
\description{
  Round numeric values with default number of decimals
  (see: \code{getOption('rp.decimal'}) and decimal mark
  (see: \code{getOption('rp.decimal')}).
}
\note{
  This function is a simple demo for \code{\link{evals}}'s
  hooks.
}
\examples{
{
	rp.round(22/7)
	rp.round(matrix(runif(9),3,3))
}
}

