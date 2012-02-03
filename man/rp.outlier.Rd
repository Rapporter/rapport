\name{rp.outlier}
\alias{rp.outlier}
\title{Outlier test}
\usage{
  rp.outlier(x)
}
\arguments{
  \item{x}{a numeric vector of values}
}
\value{
  vector of outlier values
}
\description{
  A simple test for outliers. This functions returns all
  extreme values (if any) found in the specified vector.
}
\examples{
\dontrun{
rp.outlier(mtcars$hp)
rp.outlier(c(rep(1,100), 200))
rp.outlier(c(rep(1,100), 200,201))
}
}
\references{
  { Credit goes to PaulHurleyuk:
  \url{http://stackoverflow.com/a/1444548/564164}

  \itemize{ \item Lund, R. E. 1975, "Tables for An
  Approximate Test for Outliers in Linear Models",
  Technometrics, vol. 17, no. 4, pp. 473-476.  \item
  Prescott, P. 1975, "An Approximate Test for Outliers in
  Linear Models", Technometrics, vol. 17, no. 1, pp.
  129-132. } }
}

