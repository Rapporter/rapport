\name{rp.boxplot}
\alias{rp.boxplot}
\title{Boxplot}
\usage{
  rp.boxplot(x, y = NULL, facet = NULL, data = NULL,
    theme = getOption("rp.color.palette"),
    colorize = getOption("rp.colorize"), ...)
}
\arguments{
  \item{x}{a factor variable}

  \item{y}{a numeric variable}

  \item{facet}{an optional categorical variable to make
  facets by}

  \item{data}{an optional data frame from which the
  variables should be taken}

  \item{theme}{a color palette name from
  \code{\link{RColorBrewer}} or 'default'}

  \item{colorize}{if set the color is chosen from palette
  at random}

  \item{...}{additional parameters to \code{\link{bwplot}}}
}
\description{
  This function is a wrapper around \code{\link{bwplot}}
  which operates only on numeric variables with optional
  facet.
}
\examples{
\dontrun{
df <- transform(mtcars, cyl = factor(cyl, labels = c('4', '6', '8')), am = factor(am, labels = c('automatic', 'manual')), vs = factor(vs))
rp.boxplot(df$cyl)
	rp.boxplot(df$cyl, df$wt)
	rp.boxplot(df$cyl, df$hp, facet=df$am)
	rp.label(df$hp) <- 'horsepower'; rp.label(df$wt) <- 'weight'; rp.boxplot(df$cyl, df$wt)
	rp.boxplot(df$cyl, df$wt, colorize=TRUE)
	with(df, rp.scatterplot(hp, wt, facet = am))
	rp.boxplot(cyl, wt, data=df)
	rp.boxplot(cyl, wt, am, df)
}
}

