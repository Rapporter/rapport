\name{rp.dotplot}
\alias{rp.dotplot}
\title{Dotplot}
\usage{
  rp.dotplot(x, facet = NULL, data = NULL, groups = FALSE,
    auto.key = FALSE, horizontal = TRUE, ...)
}
\arguments{
  \item{x}{a factor variable}

  \item{facet}{an optional categorical variable to make
  facets by}

  \item{data}{an optional data frame from which the
  variables should be taken}

  \item{horizontal}{see \code{\link{xyplot}}}

  \item{groups}{see \code{\link{xyplot}}}

  \item{auto.key}{see \code{\link{xyplot}}}

  \item{...}{additional parameters to
  \code{\link{dotplot}}}
}
\description{
  This function is a wrapper around \code{\link{dotplot}}
  which operates only on factors with optional facet.
}
\details{
  Default parameters are read from \code{options}:

  \itemize{ \item 'style.theme'. }
}
\examples{
\dontrun{
rp.dotplot(ius2008$game)
rp.dotplot(ius2008$game, horizontal = FALSE)
rp.dotplot(ius2008$game, facet = ius2008$dwell)
rp.dotplot(ius2008$dwell, facet = ius2008$gender, horizontal = FALSE)
rp.dotplot(ius2008$game, facet = ius2008$dwell, groups = TRUE)
with(ius2008, rp.dotplot(gender, facet = dwell))
rp.dotplot(game, data = ius2008)
rp.dotplot(dwell, gender, ius2008)
}
}

