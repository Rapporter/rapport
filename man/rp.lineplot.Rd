\name{rp.lineplot}
\alias{rp.lineplot}
\title{Lineplot}
\usage{
  rp.lineplot(x, y, facet = NULL, data = NULL,
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
  with custom panel. Only numeric variables are accepted
  with optional facet.
}
\examples{
\dontrun{
df <- transform(mtcars, cyl = factor(cyl, labels = c('4', '6', '8')), am = factor(am, labels = c('automatic', 'manual')), vs = factor(vs))
a <- aggregate(wt~gear, df, mean)
rp.lineplot(a$gear, a$wt)
rp.lineplot(1:length(df$hp), df$hp, facet=df$cyl)
rp.label(a$wt) <- 'weight'; rp.lineplot(a$gear, a$wt)
rp.lineplot(a$gear, a$wt, colorize=TRUE)
rp.lineplot(gear, wt, data=a)
}
}

