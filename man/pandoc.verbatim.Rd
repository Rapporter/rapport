\name{pandoc.verbatim}
\alias{pandoc.verbatim}
\title{Add verbatim}
\usage{
  pandoc.verbatim(x,
    style = c("inline", "indent", "delim"), attrs = "")
}
\arguments{
  \item{x}{character vector}

  \item{style}{show code \code{inline} or in a separate
  (\code{indent}ed or \code{delim}ited) block}

  \item{attrs}{(optionally) pass ID, classes and any
  attribute to the \code{delimited} block}
}
\value{
  character vector
}
\description{
  Pandoc style verbatim format (e.g. \code{`FOO`}) is added
  to character string.
}
\examples{
## different styles/formats
pandoc.verbatim('FOO')
pandoc.verbatim('FOO', 'indent')
cat(pandoc.verbatim(c('FOOO\\nBAR  ', ' I do R'), 'indent'))
cat(pandoc.verbatim(c('FOOO\\nBAR  ', ' I do R'), 'delim'))

## add highlighting and HTML/LaTeX ID and classes (even custom attribute)
cat(pandoc.verbatim(c('cat("FOO")', 'mean(bar)'), 'delim', '.R #MyCode custom_var="10"'))
}
\references{
  John MacFarlane (2012): _Pandoc User's Guide_.
  \url{http://johnmacfarlane.net/pandoc/README.html}
}
\seealso{
  \code{\link{pandoc.emphasis}}
  \code{\link{pandoc.strikeout}}
  \code{\link{pandoc.strong}}
}

