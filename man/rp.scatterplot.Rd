\name{rp.scatterplot}
\alias{rp.scatterplot}
\title{Scatterplot}
\usage{
  rp.scatterplot(x, y, facet = NULL, data = NULL,
    theme = getOption("rp.color.palette"),
    colorize = getOption("rp.colorize"), ...)
}
\arguments{
  \item{x}{a numeric variable}

  \item{y}{a numeric variable}

  \item{facet}{an optional categorical variable to make
  facets by}

  \item{data}{an optional data frame from which the
  variables should be taken}

  \item{theme}{a color palette name from
  \code{\link{RColorBrewer}} or 'default'}

  \item{colorize}{if set the color is chosen from palette
  at random}

  \item{...}{additional parameters to \code{\link{xyplot}}}
}
\description{
  This function is a wrapper around \code{\link{xyplot}}
  which operates only on numeric variables with optional
  facet.
}
\examples{
\dontrun{
df <- transform(mtcars, cyl = factor(cyl, labels = c('4', '6', '8')), am = factor(am, labels = c('automatic', 'manual')), vs = factor(vs))
	rp.scatterplot(df$hp, df$wt)
	rp.scatterplot(df$hp, df$wt, facet=df$cyl)
	rp.label(df$hp) <- 'horsepower'; rp.label(df$wt) <- 'weight'; rp.scatterplot(df$hp, df$wt)
	rp.scatterplot(df$hp, df$wt, colorize=TRUE)
	with(df, rp.scatterplot(hp, wt, facet = am))
	rp.scatterplot(hp, wt, data=df)
	rp.scatterplot(hp, wt, am, df)
}
}

