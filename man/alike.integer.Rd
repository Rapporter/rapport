\name{alike.integer}
\alias{alike.integer}
\title{Check integers}
\usage{
  alike.integer(x)
}
\arguments{
  \item{x}{a numeric variable that is to be tested}
}
\value{
  a logical value that indicates that tested variable
  "looks like" integer
}
\description{
  This function tests if given variable "appears" to be an
  integer. To qualify as such, two conditions need to be
  satisfied: it should be stored as \code{\link{numeric}}
  object, and it should pass regular expression test if it
  consists only of digits.
}

