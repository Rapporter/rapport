\name{htest}
\alias{htest}
\title{Hypothesis Tests}
\usage{
  htest(x, ..., use.labels = getOption("rp.use.labels"),
    use.method.names = TRUE,
    colnames = c("Statistic", "p-value"))
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

  \item{use.method.names}{use the string provided in
  \code{method} attribute of \code{htest} object}

  \item{colnames}{a character string containing column
  names}
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
\details{
  Default parameters are read from \code{options}:

  \itemize{ \item 'rp.use.labels'. }
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

