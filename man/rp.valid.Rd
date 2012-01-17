\name{rp.valid}
\alias{rp.valid}
\title{Valid Cases}
\usage{
  rp.valid(...)
}
\arguments{
  \item{...}{parameters to be passed to \code{rp.univar}
  function}
}
\value{
  a numeric value with number of valid (non-NA) vector
  elements
}
\description{
  Returns a number of valid (non-\code{NA}) values in a
  variable. This is a wrapper around
  \code{\link{rp.univar}} function with
  \code{\link{length}} function passed in \code{fn}
  argument, but with missing values previously removed.
  However, it's not possible to cancel \code{NA} omission
  with this function (doing so will yield error).
}

