\name{elem.eval}
\alias{elem.eval}
\title{Evaluate Template Element}
\usage{
  elem.eval(x, ...)
}
\arguments{
  \item{x}{either a list with character vector}

  \item{...}{additional arguments passed to other
  evaluation methods}
}
\description{
  This is a generic method that evaluates R code found in
  \code{rapport} template elements. Currently there are two
  types of template elements: \code{blocks} of R code
  (similar to chunks in \code{Sweave}) or \code{inline}
  elements.
}

