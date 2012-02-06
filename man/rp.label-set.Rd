\name{rp.label<-}
\alias{rp.label<-}
\title{Set Variable Label}
\usage{
  rp.label(var) <- value
}
\arguments{
  \item{var}{a variable (see \code{\link{is.variable}} for
  details)}

  \item{value}{a character value that is to be set as
  variable label}
}
\description{
  This function sets a label to a variable, by storing a
  character string to its \code{label} attribute.
}
\examples{
\dontrun{
rp.label(mtcars$mpg) <- "fuel consumption"
x <- rnorm(100); ( rp.label(x) <- "pseudo-random normal variable" )
}
}
\seealso{
  \code{\link{rp.label}}
}

