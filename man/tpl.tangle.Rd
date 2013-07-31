\name{tpl.tangle}
\alias{tpl.tangle}
\title{Extract template chunk contents}
\usage{
  tpl.tangle(fp, file = NULL, show.inline.chunks = TRUE)
}
\arguments{
  \item{fp}{template file pointer}

  \item{file}{output file - if \code{NULL} (default),
  output is flushed to \code{stdout}.}

  \item{show.inline.chunks}{extract contents of inline
  chunks as well? (defaults to \code{TRUE})}
}
\description{
  \code{rapport}'s alternative to \code{\link{Stangle}} -
  extracts contents of template chunks.
}

