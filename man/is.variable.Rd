\name{is.variable}
\alias{is.variable}
\title{Variables}
\usage{
  is.variable(x)
}
\arguments{
  \item{x}{an object to be checked for "variable" format}
}
\value{
  a logical value indicating that provided object is a
  "variable"
}
\description{
  From our point of view, a \code{variable} is a
  non-\code{NULL} atomic vector that has no dimensions.
  This approach bypasses \code{factor} issues with
  \code{\link{is.vector}}, and also eliminates
  multidimensional vectors, such as matrices and arrays.
}
\examples{
is.variable(rnorm(100))  # [1] TRUE
is.variable(LETTERS)     # [1] TRUE
is.variable(NULL)        # [1] FALSE
is.variable(mtcars)      # [1] FALSE
is.variable(HairEyeColor[, , 1])  # [1] FALSE
is.variable(list())      # [1] FALSE
}

