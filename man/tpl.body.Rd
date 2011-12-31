\name{tpl.body}
\alias{tpl.body}
\title{Template Body}
\usage{
  tpl.body(fp, htag = get.tags("header.close"), ...)
}
\arguments{
  \item{fp}{a string containing a path to template, or a
  character vector with template lines}

  \item{htag}{a string with closing body tag}

  \item{...}{additional arguments to be passed to
  \code{\link{grep}} function}
}
\value{
  a character vector with template body contents
}
\description{
  Returns template body contents from provided path or a
  character vector.
}

