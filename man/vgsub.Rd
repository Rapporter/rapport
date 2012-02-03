\name{vgsub}
\alias{vgsub}
\title{Vectorised String Replacement}
\usage{
  vgsub(pattern, replacement, x, ...)
}
\arguments{
  \item{pattern}{see eponymous argument for
  \code{\link{gsub}} function}

  \item{replacement}{see eponymous argument for
  \code{\link{gsub}} function}

  \item{x}{see eponymous argument for \code{\link{gsub}}
  function}

  \item{...}{additional arguments for \code{\link{gsub}}
  function}
}
\value{
  a character vector with string replacements
}
\description{
  A simple wrapper for \code{\link{gsub}} that replaces all
  patterns from \code{pattern} argument with ones in
  \code{replacement} over vector provided in argument
  \code{x}.
}
\references{
  See original thread for more details
  \url{http://stackoverflow.com/a/6954308/457898}. Special
  thanks to user Jean-Robert for this one!
}

