\name{messagef}
\alias{messagef}
\title{Send Message with String Interpolated Messages}
\usage{
  messagef(s, ...)
}
\arguments{
  \item{s}{a character vector of format strings}

  \item{...}{values to be interpolated}
}
\description{
  Combines \code{warning} with \code{sprintf} thus allowing
  string interpolated diagnostic messages.
}
\examples{
\dontrun{
messagef("\%.3f is not larger than \%d and/or smaller than \%d", pi, 10, 40)
}
}

