\name{rp.hist}
\alias{rp.hist}
\title{Histogram}
\usage{
  rp.hist(x, facet = NULL, data = NULL,
    theme = getOption("rp.color.palette"),
    colorize = getOption("rp.colorize"), ...)
}
\arguments{
  \item{x}{a numeric variable}

  \item{facet}{an optional categorical variable to make
  facets by}

  \item{data}{an optional data frame from which the
  variables should be taken}

  \item{theme}{a color palette name from
  \code{\link{RColorBrewer}} or 'default'}

  \item{colorize}{if set the color is chosen from palette
  at random}

  \item{...}{additional parameters to
  \code{\link{histogram}}}
}
\description{
  This function is a wrapper around \code{\link{histogram}}
  which operates only on numeric vectors with optional
  facet.
}
\examples{
\dontrun{
df <- transform(mtcars, cyl = factor(cyl, labels = c('4', '6', '8')),
	    am = factor(am, labels = c('automatic', 'manual')), vs = factor(vs))
	rp.hist(df$hp)
	rp.hist(df$hp, facet=df$am)
	rp.hist(df$hp, df$am)
	rp.label(df$hp) <- 'horsepower'; rp.hist(df$hp)
	rp.hist(df$hp, colorize=TRUE)
	with(df, rp.hist(hp, facet = am))
	rp.hist(hp, data = df)
	rp.hist(hp, am, df)
}
}

