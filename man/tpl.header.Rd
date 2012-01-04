\name{tpl.header}
\alias{tpl.header}
\title{Template Header}
\usage{
  tpl.header(fp, open.tag = get.tags("header.open"),
    close.tag = get.tags("header.close"), ...)
}
\arguments{
  \item{fp}{a string containing a path to template, or a
  character vector with template lines}

  \item{open.tag}{a string with opening tag}

  \item{close.tag}{a string with closing tag}

  \item{...}{additional arguments to be passed to
  \code{\link{grep}} function}
}
\value{
  a character vector with template header contents
}
\description{
  Returns template header from provided path or a character
  vector.
}

