\name{tpl.renew}
\alias{tpl.renew}
\title{Renew deprecated template}
\usage{
  tpl.renew(fp, file = NULL)
}
\arguments{
  \item{fp}{pointer to an old template (see
  \code{\link{tpl.find}} for details)}

  \item{file}{a path to output file. If \code{NULL}, result
  will be flushed to stdout.}
}
\description{
  Convert old-style template to new-style one (what we
  really do is just replacing old header syntax with YAML
  one).
}

