\name{adj.rle}
\alias{adj.rle}
\title{Adjacent Values Run Length Encoding}
\usage{
  adj.rle(x)
}
\arguments{
  \item{x}{a numeric vector with}
}
\value{
  a list with two elements: vector of run lengths, and
  another list of values corresponding to generated
  sequences' lengths.
}
\description{
  Similar to \code{\link{rle}} function, this function
  detects "runs" of adjacent integers, and displays vector
  of run lengths and list of corresponding integer
  sequences.
}
\author{
  Gabor Grothendieck <ggrothendieck@gmail.com>
}
\references{
  See original thread for more details
  \url{http://stackoverflow.com/a/8467446/457898}. Special
  thanks to Gabor Grothendieck for this one!
}

