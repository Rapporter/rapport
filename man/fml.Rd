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
}
\value{
  a string with formula
}
\description{
  Takes left and right-hand side arguments of a formula
}
\examples{
fml("hp", c("am", "cyl"))
}

