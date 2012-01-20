\docType{package}
\name{rapport}
\alias{rapport}
\alias{rapport-package}
\title{rapport templating system}
\usage{
  rapport(fp, data = NULL, ..., reproducible = FALSE,
    header.levels.offset = 0,
    rapport.mode = getOption("rapport.mode"))
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

  \item{header.levels.offset}{number added to header levels
  (handy when using nested templates)}

  \item{rapport.mode}{forcing rapport to run in
  \code{performance} or \code{debug} mode instead of normal
  behaviour. Only change this if you really know what you
  do! In \code{performance} mode \code{rapport} will assume
  all templates to be \code{strict} (see: \code{evals(...,
  check.output = FALSE)}), in \code{debug} mode
  \code{rapport} will halt on first error.}
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
rapport("example", ius2008, var="leisure")
rapport("example", ius2008, var="leisure", desc=FALSE, hist=T, themer="Set1")
rapport("example", ius2008, var="leisure", rapport.mode='debug')
rapport("example", ius2008, var="leisure", rapport.mode='performance')
## Or set \\code{'rapport.mode'} option to \\code{debug}, \\code{performance} or back to \\code{normal}.
}
}

