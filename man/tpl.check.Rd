\name{tpl.check}
\alias{tpl.check}
\title{Check Template}
\usage{
  tpl.check(fp)
}
\arguments{
  \item{fp}{a character vector containing template name
  (".tpl" extension is optional), file path or a text to be
  split by lines}
}
\value{
  list of logicals - see details above
}
\description{
  Checks if the examples of given template can be run
  without any error and if the same output would be
  returned by calling the template in "strict" mode.
}
\details{
  Strict mode is a huge performance gain (principally with
  nested templates where the overhead of extra checks lead
  to exponential slowdown with every level of nested
  hierarchy) based on \code{evals}' \code{check.output}
  parameter: no checks would be performed on template body
  about outputs. Thanks to this, strict mode templates
  should be written considering the following requirements:

  \itemize{ \item each block should return on the last line
  of the code, \item each block should always return
  something on the last line (if you do not want to return
  anything, add \code{NULL} to the last line), \item ggplot
  and lattice graphs should be always printed (of course on
  the last line), \item a block resulting in a plot should
  not alter variables and data sets, \item the template
  should be checked before live run with \code{tpl.check}.
  }

  \code{tpl.check} will print on the console some text
  messages about the result of the test (errors etc.), but
  will also return a \code{list} invisible. List elements:

  \itemize{ \item run: if all blocks could run without
  error (TRUE/FALSE), \item strict: if rapport in
  "performance" (strict) mode returns the same output
  (TRUE/FALSE). }

  If everything went fine and you get two \code{TRUE}
  values, update your template to use "performance" mode on
  default by adding "Strict: TRUE" to template header.
}
\examples{
\dontrun{
tpl.check('example')
}
}

