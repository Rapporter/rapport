\name{fml}
\alias{fml}
\title{Create Formula from Strings}
\usage{
  fml(left, right, join.left = " + ", join.right = " + ")
}
\arguments{
  \item{left}{a string with left-hand side formula
  argument}

  \item{right}{a character vector with right-hand side
  formula arguments}

  \item{join.left}{concatenation string for elements of
  character vector specified in \code{left}}

  \item{join.right}{concatenation string for elements of
  character vector specified in \code{right}}
}
\description{
  Takes multiple character arguments as left and right-hand
  side arguments of a formula, and concatenates them in a
  single string.
}
\examples{
fml("hp", c("am", "cyl"))    # "hp ~ am + cyl"
}

