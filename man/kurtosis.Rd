\name{kurtosis}
\alias{kurtosis}
\title{Kurtosis}
\usage{
  kurtosis(x, na.rm = FALSE)
}
\arguments{
  \item{x}{a \code{variable}, \code{matrix} or a
  \code{data.frame}}

  \item{na.rm}{should \code{NA}s be removed before
  computation?}
}
\description{
  Calculates kurtosis coefficient for given variable (see
  \code{\link{is.variable}}), \code{matrix} or a
  \code{data.frame}.
}
\examples{
set.seed(0)
x <- rnorm(100)
kurtosis(x)
kurtosis(matrix(x, 10))
kurtosis(mtcars)
rm(x)
}
\references{
  Tenjovic, L. (2000). Statistika u psihologiji -
  prirucnik. Centar za primenjenu psihologiju.
}

