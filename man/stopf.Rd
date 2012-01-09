\name{stopf}
\alias{stopf}
\title{Stop Execution with String Interpolated Messages}
\usage{
  stopf(s, ...)
}
\arguments{
  \item{s}{a character vector of format strings}

  \item{...}{values to be interpolated}
}
\value{
  a string containing message that follows execution
  termination
}
\description{
  This helper combines \code{stop} function with
  \code{sprintf} thus allowing string interpolated messages
  when execution is halted.
}
\examples{
\dontrun{
stopf("\%.3f is not larger than \%d and/or smaller than \%d", pi, 10, 40)
}
}

