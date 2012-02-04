\name{tpl.example}
\alias{tpl.example}
\title{Template Examples}
\usage{
  tpl.example(fp, index = NULL, env = .GlobalEnv)
}
\arguments{
  \item{fp}{a template file pointer (see
  \code{\link{tpl.find}} for details)}

  \item{index}{a numeric vector indicating the example
  index - meaningful only for templates with multiple
  examples. Accepts vector of integers to match IDs of
  template example. Using 'all' (character string) as index
  will return all examples.}

  \item{env}{an environment where example will be evaluated
  (defaults to \code{.GlobalEnv})}
}
\description{
  Displays template examples defined in \code{Example}
  section. Handy to check out what template does and how
  does it look like once it's rendered. If multiple
  examples are available, and \code{index} argument is
  \code{NULL}, you will be prompted for input. If only one
  example is available in the header, user is not prompted
  for input action, and given template is evaluated
  automatically. At any time you can provide an integer
  vector with example indices to \code{index} argument, and
  specified examples will be evaluated without prompting,
  thus returning a list of \code{rapport} objects. Example
  output can be easily exported to various formats (HTML,
  ODT, etc.) - check out documentation for
  \code{tpl.export} for more info.
}
\examples{
\dontrun{
tpl.example('example')
tpl.example('example', 1:2)
tpl.example('example', 'all')
tpl.example('crosstable')
tpl.export(tpl.example('crosstable'))
}
}

