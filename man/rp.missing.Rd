\name{rp.missing}
\alias{rp.missing}
\title{Missing Cases}
\usage{
  rp.missing(...)
}
\arguments{
  \item{...}{parameters to be passed to \code{rp.univar}
  function}
}
\value{
  a numeric value with number of missing vector elements
}
\description{
  Returns a number of missing (\code{NA}) values in a
  variable. This is a wrapper around
  \code{\link{rp.univar}} function with anonymous function
  passed to count number of \code{NA} elements in a
  variable.
}

