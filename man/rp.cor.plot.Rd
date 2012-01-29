\name{rp.cor.plot}
\alias{rp.cor.plot}
\title{Scatterplot matrices}
\usage{
  rp.cor.plot(x, lower.panel = "panel.smooth",
    upper.panel = "panel.cor", data = NULL, ...)
}
\arguments{
  \item{x}{numeric variables}

  \item{lower.panel}{see: \code{\link{pairs}} parameter.
  Default set to \code{'panel.smooth'}.}

  \item{upper.panel}{see: \code{\link{pairs}} parameter.
  Default set to \code{'panel.cor'}.}

  \item{data}{an optional data frame from which the
  variables should be taken}

  \item{...}{additional parameters to \code{\link{pairs}}}
}
\description{
  This function is a wrapper around \code{\link{pairs}}
  which operates only on numeric variables. Panel options
  are: \code{c('panel.cor', 'panel.smooth', 'panel.hist')}.
  Custom panels may be also added.
}
\note{
  This plot is not a lattice/trellis chart - like other
  \code{rp.*} plots.
}
\examples{
\dontrun{
## setting rp.names first
df <- mtcars
for (i in 1:ncol(df))
  attr(df[, i], "name") <- names(df)[i]
rp.cor.plot(df)
rp.cor.plot(df, diag.panel = 'panel.hist')
}
}

