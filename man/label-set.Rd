\name{label<-}
\alias{label<-}
\alias{rp.label<-}
\title{Set Variable Label}
\usage{
label(var) <- value
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
label(mtcars$mpg) <- "fuel consumption"
x <- rnorm(100)
(label(x) <- "pseudo-random normal variable")
}
}
\seealso{
\code{\link{label}}
}

