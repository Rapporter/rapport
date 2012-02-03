\name{rp.hist}
\alias{rp.hist}
\title{Histogram}
\usage{
  rp.hist(x, facet = NULL, data = NULL,
    kernel.smooth = FALSE, ...)
}
\arguments{
  \item{x}{a numeric variable}

  \item{facet}{an optional categorical variable to make
  facets by}

  \item{data}{an optional data frame from which the
  variables should be taken}

  \item{kernel.smooth}{add kernel density plot?}

  \item{...}{additional parameters to
  \code{\link{histogram}}}
}
\description{
  This function is a wrapper around \code{\link{histogram}}
  which operates only on numeric vectors with optional
  facet.
}
\details{
  Default parameters are read from \code{options}:

  \itemize{ \item 'style.theme'. }
}
\examples{
\dontrun{
rp.hist(ius2008$edu)
rp.hist(ius2008$edu, facet=ius2008$gender)
rp.hist(ius2008$edu, ius2008$dwell)
rp.hist(ius2008$edu, kernel.smooth=TRUE)
with(ius2008, rp.hist(edu, facet = gender))
rp.hist(edu, data = ius2008)
rp.hist(edu, gender, ius2008)
}
}

