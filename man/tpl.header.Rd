\name{tpl.header}
\alias{tpl.header}
\title{Template Header}
\usage{
  tpl.header(fp, open.tag = get.tags("header.open"),
    close.tag = get.tags("header.close"), ...)
}
\arguments{
  \item{fp}{a template file pointer (see
  \code{\link{tpl.find}} for details)}

  \item{open.tag}{a string with opening tag (defaults to
  value of user-defined \code{"header.open"} tag)}

  \item{close.tag}{a string with closing tag (defaults to
  value of user-defined \code{"header.close"} tag)}

  \item{...}{additional arguments to be passed to
  \code{\link{grep}} function}
}
\value{
  a character vector with template header contents
}
\description{
  Returns \code{rapport} template header from provided path
  or a character vector.
}

