\name{rp.qqplot}
\alias{rp.qqplot}
\title{Q-Q plot with Theoretical Distribution}
\usage{
  rp.qqplot(x, dist = qnorm, facet = NULL, data = NULL,
    ...)
}
\arguments{
  \item{x}{a numeric variable}

  \item{dist}{a theoretical distribution}

  \item{facet}{an optional categorical variable to make
  facets by}

  \item{data}{an optional data frame from which the
  variables should be taken}

  \item{...}{additional parameters to \code{\link{qqmath}}}
}
\description{
  This function is a wrapper around \code{\link{qqmath}}
  which operates only on a numeric variable with optional
  facet.
}
\details{
  Default parameters are read from \code{options}:

  \itemize{ \item 'style.theme'. }
}
\examples{
\dontrun{
rp.qqplot(ius2008$age)
rp.qqplot(ius2008$age, qunif)
rp.qqplot(ius2008$age, qunif, facet = ius2008$gender)

with(ius2008, rp.qqplot(age))
rp.qqplot(age, data = ius2008)
rp.qqplot(age, facet = gender, data = ius2008)
rp.qqplot(age, qunif, gender, ius2008)
rp.qqplot(ius2008$age, panel = function(x) {panel.qqmath(x); panel.qqmathline(x, distribution = qnorm)} )
}
}

