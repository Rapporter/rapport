\name{trim.space}
\alias{trim.space}
\title{Trim Spaces}
\usage{
  trim.space(x, leading = FALSE, trailing = TRUE,
    re = "[:space:]", ...)
}
\arguments{
  \item{x}{a character vector which needs whitespace
  trimming}

  \item{leading}{a logical value indicating if leading
  spaces should be removed (defaults to \code{FALSE})}

  \item{trailing}{a logical value indicating if trailing
  spaces should be removed (defaults to \code{TRUE})}

  \item{re}{a character value containing a regex that
  defines a space character}

  \item{...}{additional arguments for \code{\link{gsub}}
  function}
}
\value{
  a character vector with removed spaces
}
\description{
  Removes leading and/or trailing space(s) from a character
  vector value. By default, it removes only trailing
  spaces. In order to trim both leading and trailing
  spaces, pass \code{TRUE} to both \code{leading} and
  \code{trailing} arguments.
}

