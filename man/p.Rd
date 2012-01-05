\name{p}
\alias{p}
\title{Inline Printing}
\usage{
  p(x, sep.last = "and", wrap = "_", sep = ", ",
    limit = 20L)
}
\arguments{
  \item{x}{an atomic vector to merge its elements}

  \item{sep.last}{last separator}

  \item{wrap}{string to wrap results}

  \item{sep}{main separator}

  \item{limit}{maximum character length}
}
\value{
  a string with catenated vector contents
}
\description{
  Merge atomic vector elements in one string for pretty
  inline printing.
}
\examples{
p(c("fee", "fi", "foo", "fam"))
## [1] "_fee_, _fi_, _foo_ and _fam_"
}

