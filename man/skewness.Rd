\name{skewness}
\alias{skewness}
\title{Skewness}
\usage{
  skewness(x, na.rm = FALSE)
}
\arguments{
  \item{x}{a \code{variable}, \code{matrix} or a
  \code{data.frame}}

  \item{na.rm}{should \code{NA}s be removed before
  computation?}
}
\description{
  Calculates skewness coefficient for given variable (see
  \code{\link{is.variable}}), \code{matrix} or a
  \code{data.frame}.
}
\examples{
set.seed(0)
x <- rnorm(100)
skewness(x)
skewness(matrix(x, 10))
skewness(mtcars)
rm(x)
}
\references{
  Tenjovic, L. (2000). Statistika u psihologiji -
  prirucnik. Centar za primenjenu psihologiju.
}

