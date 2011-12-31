\name{tpl.example}
\alias{tpl.example}
\title{Template examples}
\usage{
  tpl.example(template)
}
\arguments{
  \item{template}{character string: name of a template to
  check out}
}
\value{
  rapport class
}
\description{
  Runs the "Example" field found in specified template.
  Handy to check out what a template does and looks like.
  Could be easily exported to HTML, odt etc. - check out
  the examples below.
}
\examples{
\dontrun{
tpl.example('example')
tpl.example('crosstable')
tpl.export(tpl.example('crosstable'))
}
}

