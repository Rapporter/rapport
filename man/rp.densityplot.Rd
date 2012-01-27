\name{rp.densityplot}
\alias{rp.densityplot}
\title{Density plot}
\usage{
  rp.densityplot(x, facet = NULL, data = NULL,
    theme = getOption("stlye.color.palette"),
    colorize = getOption("stlye.colorize"), ...)
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
  \code{\link{densityplot}}}
}
\description{
  This function is a wrapper around
  \code{\link{densityplot}} which operates only on numeric
  vectors with optional facet.
}
\examples{
\dontrun{
df <- transform(mtcars, cyl = factor(cyl, labels = c('4', '6', '8')),
  am = factor(am, labels = c('automatic', 'manual')), vs = factor(vs))
rp.densityplot(df$hp)
rp.densityplot(df$hp, facet=df$am)
rp.densityplot(df$hp, df$am)
rp.label(df$hp) <- 'horsepower'; rp.densityplot(df$hp)
rp.densityplot(df$hp, colorize=TRUE)
with(df, rp.densityplot(hp, facet = am))
rp.densityplot(hp, data = df)
rp.densityplot(hp, am, df)
}
}

