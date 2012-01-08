\name{e}
\alias{e}
\title{Extract Values from \code{htest} Objects}
\usage{
  e(x)
}
\arguments{
  \item{x}{\code{htest}-class object}
}
\value{
  named numeric vector with the value of statistic and its
  p-value
}
\description{
  Extract value of statistic and its p-value from
  \code{htest} object.
}
\examples{
\dontrun{
e(shapiro.test(rnorm(100))
}
}

