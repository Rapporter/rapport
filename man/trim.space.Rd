\name{trim.space}
\alias{trim.space}
\title{Trim Spaces}
\usage{
  trim.space(x,
    what = c("both", "leading", "trailing", "none"),
    space.regex = "[:space:]", ...)
}
\arguments{
  \item{x}{a character vector which values need whitespace
  trimming}

  \item{what}{which part of the string should be trimmed.
  Defaults to \code{both} which removes trailing and
  leading spaces. If \code{none}, no trimming will be
  performed.}

  \item{space.regex}{a character value containing a regex
  that defines a space character}

  \item{...}{additional arguments for \code{\link{gsub}}
  function}
}
\value{
  a character vector with (hopefully) trimmed spaces
}
\description{
  Removes leading and/or trailing space(s) from a character
  vector. By default, it removes both leading and trailing
  spaces.
}

