\name{warningf}
\alias{warningf}
\title{Send Warning with String Interpolated Messages}
\usage{
  warningf(s, ...)
}
\arguments{
  \item{s}{a character vector of format strings}

  \item{...}{values to be interpolated}
}
\description{
  Combines \code{warning} with \code{sprintf} thus allowing
  string interpolated warnings.
}
\examples{
\dontrun{
warningf("\%.3f is not larger than \%d and/or smaller than \%d", pi, 10, 40)
}
}

