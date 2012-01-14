\name{rp.cor.plot}
\alias{rp.cor.plot}
\title{Scatterplot matrices}
\usage{
  rp.cor.plot(x, lower.panel = "panel.smooth",
    upper.panel = "panel.cor", data = NULL,
    theme = getOption("rp.color.palette"),
    colorize = getOption("rp.colorize"), ...)
}
\arguments{
  \item{x}{numeric variables}

  \item{lower.panel}{see: \code{\link{pairs}} parameter.
  Default set to \code{'panel.smooth'}.}

  \item{upper.panel}{see: \code{\link{pairs}} parameter.
  Default set to \code{'panel.cor'}.}

  \item{data}{an optional data frame from which the
  variables should be taken}

  \item{theme}{a color palette name from
  \code{\link{RColorBrewer}} or 'default'}

  \item{colorize}{if set the color is chosen from palette
  at random}

  \item{...}{additional parameters to \code{\link{pairs}}}
}
\description{
  This function is a wrapper around \code{\link{pairs}}
  which operates only on numeric variables. Panel options
  are: \code{c('panel.cor', 'panel.smooth', 'panel.hist')}.
  Custom panels may be also added.
}
\examples{
\dontrun{
df <- transform(mtcars, cyl = factor(cyl, labels = c('4', '6', '8')), am = factor(am, labels = c('automatic', 'manual')), vs = factor(vs))
rp.cor.plot(df)
rp.cor.plot(df, diag.panel='panel.hist')
}
}

