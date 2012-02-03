\name{rp.barplot}
\alias{rp.barplot}
\title{Barplot}
\usage{
  rp.barplot(x, facet = NULL, data = NULL, groups = FALSE,
    auto.key = FALSE, horizontal = TRUE, percent = FALSE,
    ...)
}
\arguments{
  \item{x}{a numeric variable}

  \item{facet}{an optional categorical variable to make
  facets by}

  \item{data}{an optional data frame from which the
  variables should be taken}

  \item{horizontal}{see \code{\link{xyplot}}}

  \item{groups}{see \code{\link{xyplot}}}

  \item{percent}{an option to show percentages (100% for a
  category) instead of number of cases. Handy with
  \code{groups=TRUE}. Default value: FALSE without groups,
  TRUE with groups.}

  \item{auto.key}{see \code{\link{xyplot}}}

  \item{...}{additional parameters to
  \code{\link{barchart}}}
}
\description{
  This function is a wrapper around \code{\link{barchart}}
  which operates only on factors with optional facet.
}
\details{
  Default parameters are read from \code{options}:

  \itemize{ \item 'style.theme'. }
}
\examples{
\dontrun{
rp.barplot(ius2008$game)
rp.barplot(ius2008$game, horizontal = FALSE)
rp.barplot(ius2008$game, facet = ius2008$gender)
rp.barplot(ius2008$game, facet = ius2008$dwell, horizontal = FALSE, layout = c(1,3))
rp.barplot(ius2008$game, facet = ius2008$gender, groups = TRUE)
with(ius2008, rp.barplot(game, facet = gender))
rp.barplot(gender, data = ius2008)
rp.barplot(dwell, gender, ius2008)
}
}

