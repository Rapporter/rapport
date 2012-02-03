\name{p}
\alias{p}
\title{Inline Printing}
\usage{
  p(x, wrap = getOption("p.wrap"),
    sep = getOption("p.sep"),
    copula = getOption("p.copula"), limit = 20L)
}
\arguments{
  \item{x}{an atomic vector to get merged for inline
  printing}

  \item{wrap}{string to wrap vector elements (defaults to
  \code{_}, i.e. underline in pandoc)}

  \item{sep}{a string with main separator (separates all
  vector elements but the last one)}

  \item{copula}{a string with last separator (usually a
  copula like "and")}

  \item{limit}{maximum character length (defaults to 20
  elements)}
}
\value{
  a string with concatenated vector contents
}
\description{
  Merge atomic vector elements in one string for pretty
  inline printing.
}
\details{
  Default parameters are read from \code{options}:

  \itemize{ \item 'p.wrap', \item 'p.sep', \item
  'p.copula'. }
}
\examples{
p(c("fee", "fi", "foo", "fam"))
## [1] "_fee_, _fi_, _foo_ and _fam_"
}

