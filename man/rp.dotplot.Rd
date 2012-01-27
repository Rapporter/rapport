\name{rp.dotplot}
\alias{rp.dotplot}
\title{Dotplot}
\usage{
  rp.dotplot(x, facet = NULL, data = NULL, groups = FALSE,
    auto.key = FALSE, horizontal = TRUE,
    theme = getOption("stlye.color.palette"),
    colorize = getOption("stlye.colorize"), ...)
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

  \item{theme}{a color palette name from
  \code{\link{RColorBrewer}} or 'default'}

  \item{colorize}{if set the color is chosen from palette
  at random}

  \item{...}{additional parameters to
  \code{\link{dotplot}}}
}
\description{
  This function is a wrapper around \code{\link{dotplot}}
  which operates only on factors with optional facet.
}
\examples{
\dontrun{
df <- transform(mtcars, cyl = factor(cyl, labels = c('4', '6', '8')), am = factor(am, labels = c('automatic', 'manual')), vs = factor(vs))
rp.dotplot(df$cyl)
rp.dotplot(df$cyl, horizontal = FALSE)
rp.dotplot(df$cyl, facet=df$am)
rp.dotplot(df$cyl, facet=df$am, horizontal=FALSE)
rp.dotplot(df$cyl, facet=df$am, colorize=TRUE)
rp.dotplot(df$cyl, facet=df$am, colorize=TRUE, groups=T)
rp.label(df$cyl) <- 'Number of cylinders'; rp.dotplot(df$cyl)
with(df, rp.dotplot(cyl, facet = am))
rp.dotplot(cyl, data=df)
rp.dotplot(cyl, am, df)
}
}

