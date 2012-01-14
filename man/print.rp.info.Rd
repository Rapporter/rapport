\name{print.rp.info}
\alias{print.rp.info}
\title{Print Template Header}
\usage{
  \method{print}{rp.info} (x, type = c("text", "pandoc"))
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

