\name{rp.label<-}
\alias{rp.label<-}
\title{Set variable label}
\usage{
  rp.label(var) <- value
}
\arguments{
  \item{var}{an atomic vector}

  \item{value}{a character value that is to be set as
  variable label}
}
\description{
  this function sets a label to an \code{\link{atomic}}
  vector, by storing a character value to its \code{label}
  attribute.
}
\examples{
\dontrun{
rp.label(mtcars$mpg) <- "fuel consumption"
x <- rnorm(100); ( rp.label(x) <- "pseudo-random normal variable" )
}
}
\seealso{
  \code{rp.label}
}

