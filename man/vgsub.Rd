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
  \code{x}. Taken from <a
  href="http://stackoverflow.com/a/6954308/457898">StackOverflow</a>.
}

