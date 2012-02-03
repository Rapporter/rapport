\name{rp.boxplot}
\alias{rp.boxplot}
\title{Boxplot}
\usage{
  rp.boxplot(x, y = NULL, facet = NULL, data = NULL, ...)
}
\arguments{
  \item{x}{a factor variable}

  \item{y}{a numeric variable}

  \item{facet}{an optional categorical variable to make
  facets by}

  \item{data}{an optional data frame from which the
  variables should be taken}

  \item{...}{additional parameters to \code{\link{bwplot}}}
}
\description{
  This function is a wrapper around \code{\link{bwplot}}
  which operates only on numeric variables with optional
  facet.
}
\details{
  Default parameters are read from \code{options}:

  \itemize{ \item 'style.theme'. }
}
\examples{
\dontrun{
rp.boxplot(ius2008$age)
rp.boxplot(ius2008$age, ius2008$gender)
rp.boxplot(ius2008$age, ius2008$dwell, facet = ius2008$gender)
with(ius2008, rp.scatterplot(age, dwell, facet = gender))
rp.boxplot(age, dwell, data = ius2008)
rp.boxplot(age, dwell, gender, ius2008)
}
}

