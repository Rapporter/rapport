\name{rp.round}
\alias{rp.round}
\title{Round numeric values}
\usage{
  rp.round(x)
}
\arguments{
  \item{x}{numeric value(s)}
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

