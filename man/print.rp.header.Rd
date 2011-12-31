\name{print.rp.header}
\alias{print.rp.header}
\title{Print Template Header}
\usage{
  print.rp.header(x, type = c("text", "pandoc"))
}
\arguments{
  \item{x}{object of class \code{rp.header}. See
  \code{\link{tpl.header}} for details.}

  \item{type}{a string with output format. Defaults to
  plain text output.}
}
\description{
  Prints out the contents of template header (metadata and
  inputs) in human-readable format, so you can get insight
  about template requirements.
}

