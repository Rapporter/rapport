\name{rp.densityplot}
\alias{rp.densityplot}
\title{Density plot}
\usage{
  rp.densityplot(x, facet = NULL, data = NULL, ...)
}
\arguments{
  \item{x}{a numeric variable}

  \item{facet}{an optional categorical variable to make
  facets by}

  \item{data}{an optional data frame from which the
  variables should be taken}

  \item{...}{additional parameters to
  \code{\link{densityplot}}}
}
\description{
  This function is a wrapper around
  \code{\link{densityplot}} which operates only on numeric
  vectors with optional facet.
}
\examples{
\dontrun{
rp.densityplot(ius2008$edu)
rp.densityplot(ius2008$edu, facet = ius2008$gender)
rp.densityplot(ius2008$edu, ius2008$dwell)
with(ius2008, rp.densityplot(edu, facet = gender))
rp.densityplot(edu, data = ius2008)
rp.densityplot(edu, gender, ius2008)
}
}

