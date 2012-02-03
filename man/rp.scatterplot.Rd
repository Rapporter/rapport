\name{rp.scatterplot}
\alias{rp.scatterplot}
\title{Scatterplot}
\usage{
  rp.scatterplot(x, y, facet = NULL, data = NULL, ...)
}
\arguments{
  \item{x}{a numeric variable}

  \item{y}{a numeric variable}

  \item{facet}{an optional categorical variable to make
  facets by}

  \item{data}{an optional data frame from which the
  variables should be taken}

  \item{...}{additional parameters to \code{\link{xyplot}}}
}
\description{
  This function is a wrapper around \code{\link{xyplot}}
  which operates only on numeric variables with optional
  facet.
}
\details{
  Default parameters are read from \code{options}:

  \itemize{ \item 'style.theme'. }
}
\examples{
\dontrun{
rp.scatterplot(ius2008$edu, ius2008$age)
rp.scatterplot(ius2008$edu, ius2008$age, facet=ius2008$gender)
with(ius2008, rp.scatterplot(edu, age, facet = gender))
rp.scatterplot(edu, age, data=ius2008)
rp.scatterplot(edu, age, gender, ius2008)
}
}

