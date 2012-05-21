\name{trim.space}
\alias{trim.space}
\title{Trim Spaces}
\usage{
  trim.space(x, leading = TRUE, trailing = TRUE,
    re = "[:space:]", ...)
}
\arguments{
  \item{x}{a character vector which values need whitespace
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
  vector value. By default, it removes both leading and
  trailing spaces. In order to get fine-tune control on
  trailing, pass appropriate logical values to
  \code{leading} and \code{trailing} arguments.
}

