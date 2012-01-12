\name{rp.qqplot}
\alias{rp.qqplot}
\title{Q-Q plot with Theoretical Distribution}
\usage{
  rp.qqplot(x, dist = qnorm, facet = NULL, data = NULL,
    theme = getOption("rp.color.palette"),
    colorize = getOption("rp.colorize"), ...)
}
\arguments{
  \item{x}{a numeric variable}

  \item{dist}{a theoretical distribution}

  \item{facet}{an optional categorical variable to make
  facets by}

  \item{data}{an optional data frame from which the
  variables should be taken}

  \item{theme}{a color palette name from
  \code{\link{RColorBrewer}} or 'default'}

  \item{colorize}{if set the color is chosen from palette
  at random}

  \item{...}{additional parameters to \code{\link{qqmath}}}
}
\description{
  This function is a wrapper around \code{\link{qqmath}}
  which operates only on a numeric variable with optional
  facet.
}
\examples{
\dontrun{
    df <- transform(mtcars, cyl = factor(cyl, labels = c('4', '6', '8')), am = factor(am, labels = c('automatic', 'manual')), vs = factor(vs))
    rp.qqplot(df$hp)
    rp.qqplot(df$hp, qunif)
    rp.label(df$hp) <- 'horsepower'; rp.qqplot(df$hp)
    rp.qqplot(df$hp, colorize=TRUE)
    rp.qqplot(df$hp, qunif, facet=df$am)
    with(df, rp.qqplot(hp))
    rp.qqplot(hp, data=df)
    rp.qqplot(hp, facet=am, data=df)
    rp.qqplot(hp, qunif, am, df)
}
}

