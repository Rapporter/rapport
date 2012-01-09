\name{htest}
\alias{htest}
\title{Hypothesis Tests}
\usage{
  htest(x, ..., use.labels = TRUE)
}
\arguments{
  \item{x}{arguments to be passed to function specified in
  \code{test}}

  \item{...}{additional arguments for function specified in
  \code{test}}

  \item{use.labels}{a logical value indicating whether
  variable labels should be placed in row names. If set to
  \code{FALSE}, output of \code{deparse(substitute(x))}
  will be used.}
}
\value{
  a \code{data.frame} with applied tests in rows, and their
  results (statistic and p-value) in columns
}
\description{
  This function uses \code{\link{htest.short}}, to extract
  statistic and p-value from \code{htest}-classed object.
  Main advantage of using \code{htest} is that it's
  vectorised, and can accept multiple methods.
}
\examples{
\dontrun{
library(nortest)
htest(rnorm(100), shapiro.test)
htest(rnorm(100), lillie.test, ad.test, shapiro.test)
htest(mtcars, lillie.test)
htest(mtcars, lillie.test, ad.test, shapiro.test)
}
}

