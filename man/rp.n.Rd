\name{rp.n}
\alias{rp.n}
\title{Sample Size}
\usage{
  rp.n(...)
}
\arguments{
  \item{...}{arguments to be passed to \code{rp.univar}
  function}
}
\value{
  a numeric value specifying vector length
}
\description{
  Returns sample size with \code{NA}s included. This is a
  wrapper around \code{\link{rp.univar}} function with
  \code{\link{length}} function passed in \code{fn}
  argument. However, it will not account for missing values
  regardless of the value of \code{na.rm} argument. In
  order to get a number of valid responses, use
  \code{\link{rp.valid}}.
}

