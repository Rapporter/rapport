\name{tpl.header}
\alias{tpl.header}
\title{Template Header}
\usage{
  tpl.header(fp, open.tag = get.tags("header.open"),
    close.tag = get.tags("header.close"), ...)
}
\arguments{
  \item{fp}{a string containing template path, or a
  character vector with template contents}

  \item{open.tag}{a string with opening tag}

  \item{close.tag}{a string with closing tag}

  \item{...}{additional arguments to be passed to
  \code{\link{grep}} function}
}
\value{
  a character vector with template header contents
}
\description{
  Returns \code{rapport} template header from provided path
  or a character vector. In case you're refering to a
  template bundled with package, you don't need to provide
  a template extension.
}

