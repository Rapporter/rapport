\name{tpl.info}
\alias{tpl.info}
\title{Template Info}
\usage{
  tpl.info(fp, meta = TRUE, inputs = TRUE)
}
\arguments{
  \item{fp}{a string containing a path to template, or a
  character vector with template lines}

  \item{meta}{return template metadata? (defaults to
  \code{TRUE})}

  \item{inputs}{return template inputs? (defaults to
  \code{TRUE})}
}
\description{
  Provides information about template metadata and inputs.
}
\examples{
\dontrun{
tpl.info('example')  # return both metadata and inputs
tpl.info('crosstable', inputs = FALSE)  # return only template metadata
tpl.info('correlations', meta = FALSE)  # return only template inputs
}
}

