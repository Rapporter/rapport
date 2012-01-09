\name{rp.barplot}
\alias{rp.barplot}
\title{Barplot}
\usage{
  rp.barplot(x, facet = NULL, data = NULL, groups = FALSE,
    auto.key = FALSE, horizontal = TRUE, percent = FALSE,
    theme = getOption("rp.color.palette"),
    colorize = getOption("rp.colorize"), ...)
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

  \item{theme}{a color palette name from
  \code{\link{RColorBrewer}} or 'default'}

  \item{colorize}{if set the color is chosen from palette
  at random}

  \item{...}{additional parameters to
  \code{\link{barchart}}}
}
\description{
  This function is a wrapper around \code{\link{barchart}}
  which operates only on factors with optional facet.
}
\examples{
\dontrun{
df <- transform(mtcars, cyl = factor(cyl, labels = c('4', '6', '8')), am = factor(am, labels = c('automatic', 'manual')), vs = factor(vs))
rp.barplot(df$cyl)
rp.barplot(df$cyl, horizontal = FALSE)
rp.barplot(df$cyl, facet=df$am)
rp.barplot(df$cyl, facet=df$am, horizontal=FALSE)
rp.barplot(df$cyl, facet=df$am, colorize=TRUE)
rp.barplot(df$cyl, facet=df$am, colorize=TRUE, groups=T)
rp.barplot(df$cyl, facet=df$am, colorize=TRUE, groups=T, horizontal=FALSE)
rp.label(df$cyl) <- 'Number of cylinders'; rp.barplot(df$cyl)
with(df, rp.barplot(cyl, facet = am))
rp.barplot(cyl, data=df)
rp.barplot(cyl, am, df)
}
}

