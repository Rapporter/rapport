\name{tpl.inputs}
\alias{tpl.inputs}
\title{Template Inputs}
\usage{
  tpl.inputs(fp, use.header = TRUE)
}
\arguments{
  \item{fp}{a character vector containing template name
  (".tpl" extension is optional), file path or a text to be
  split by lines}

  \item{use.header}{a logical value indicating wether the
  header section is provided in \code{h} argument}
}
\value{
  a list with variable info
}
\description{
  Grabs variable definitions from template header.
}

