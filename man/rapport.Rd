\docType{package}
\name{rapport}
\alias{rapport}
\alias{rapport-package}
\title{rapport templating system}
\usage{
  rapport(fp, data = NULL, ..., reproducible = FALSE,
    nested.levels.offset = 1)
}
\arguments{
  \item{fp}{a string containing a template name/path or a
  character vector with template contents}

  \item{data}{a \code{data.frame} to be used in template}

  \item{...}{matches template inputs in format 'key =
  "value"'}

  \item{reproducible}{a logical value indicating if the
  call and data should be stored in template object, thus
  making it reproducible (see \code{\link{tpl.rerun}} for
  details)}

  \item{nested.levels.offset}{number added to nested
  templates' header level}
}
\value{
  a list with \code{rapport} class.
}
\description{
  Description goes here.

  Evaluates template file and returns a list with
  \code{rapport} class.
}
\examples{
\dontrun{
rapport("example", ius2008, var="it.leisure", desc=FALSE, hist=T, color="green")
}
}

