\name{rp.round}
\alias{rp.round}
\title{Round numeric values}
\usage{
  rp.round(x, short = FALSE, digits = NULL)
}
\arguments{
  \item{x}{numeric value(s)}

  \item{short}{if \code{getOption('rp.decimal.short'}
  should be used instead of \code{getOption('rp.decimal'}.
  Can be overwritten by \code{digits} parameter, see
  below.}

  \item{digits}{(optional) number of decimals}
}
\value{
  character vector of rounded value(s)
}
\description{
  Round numeric values with default number of decimals
  (see: \code{getOption('rp.decimal'}) and decimal mark
  (see: \code{getOption('rp.decimal')}).
}
\details{
  Default parameters are read from \code{options}:

  \itemize{ \item 'rp.decimal', \item 'rp.decimal.short',
  \item 'rp.decimal.mark'. }
}
\note{
  This function is a simple demo for \code{\link{evals}}'s
  hooks.
}
\examples{
{
rp.round(22/7)
rp.round(22/7, short = TRUE)
rp.round(22/7, TRUE)
rp.round(22/7, digits = 10)
rp.round(matrix(runif(9), 3, 3))
}
}

