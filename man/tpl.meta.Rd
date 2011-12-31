\name{tpl.meta}
\alias{tpl.meta}
\title{Header Metadata}
\usage{
  tpl.meta(fp, fields = NULL, use.header = FALSE,
    trim.white = TRUE)
}
\arguments{
  \item{fp}{a character vector containing template name
  (".tpl" extension is optional), file path or character
  vector with template/header contents (depending on value
  of \code{use.header} argument)}

  \item{fields}{a list of named lists containing key-value
  pairs that are to be passed to \code{\link{extract.meta}}
  function via \code{\link{do.call}}}

  \item{use.header}{a logical value indicating if the
  character vector provided in \code{fp} argument contains
  header data}

  \item{trim.white}{a logical value indicating if the extra
  spaces should removed from header fields before
  extraction}
}
\value{
  a list with template metadata
}
\description{
  Returns metadata stored in template's header section,
  usually template title, nickname of an author, template
  description and list of required packages.
}

