\name{tpl.example}
\alias{tpl.example}
\title{Template Examples}
\usage{
  tpl.example(fp, index = NULL)
}
\arguments{
  \item{fp}{a character vector containing template name
  (".tpl" extension is optional), file path or a text to be
  split by lines}

  \item{index}{a numeric vector indicating the example
  index. Meaningful only while running templates with
  multiple examples specified, otherwise omitted. In most
  cases this should be a single numeric value. If multiple
  numbers are provided, the examples are returned in a
  list. Using 'all' (character string) as index will return
  all examples.}
}
\description{
  Runs the "Example" field found in specified template.
  Handy to check out what template does and how does it
  look like once rendered. If multiple examples are
  available, and \code{index} argument is \code{NULL}, you
  will be prompted for input. Example output can be easily
  exported to various formats (HTML, ODT, etc.) - check out
  documentation for \code{tpl.export} for more info.
}
\examples{
\dontrun{
tpl.example('example')
tpl.example('crosstable')
tpl.export(tpl.example('crosstable'))
tpl.example('example', 1:2)
tpl.example('example', 'all')
}
}

