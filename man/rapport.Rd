\docType{package}
\name{rapport}
\alias{rapport}
\alias{rapport-package}
\title{rapport templating system}
\usage{
  rapport(fp, data = NULL, ...)
}
\arguments{
  \item{fp}{a string containing a template path or a
  character vector with template contents}

  \item{data}{a \code{data.frame} that is to be used with
  given template}

  \item{...}{matches template variables in format 'key =
  "value"'}
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
    ## only a template name can be passed
    tpl.eval(name = "example")

    ## or a path to the template
    tpl.eval(system.file("templates", "example.tpl", package = "rapport"))
}
}

