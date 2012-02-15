\name{elem.eval}
\alias{elem.eval}
\title{Evaluate Template Elements}
\usage{
  elem.eval(x, tag.open = get.tags("inline.open"),
    tag.close = get.tags("inline.close"),
    remove.comments = TRUE, rapport.mode = "normal", ...)
}
\arguments{
  \item{x}{a template file pointer (see
  \code{\link{tpl.find}} for details)}

  \item{tag.open}{a string containing opening tag}

  \item{tag.close}{a string containing closing tag}

  \item{remove.comments}{should comments be omitted on
  evaluation?}

  \item{rapport.mode}{see: \code{?rapport}}

  \item{...}{additional params for \code{grep}-like
  functions}
}
\description{
  This function grabs template elements from
  \code{\link{tpl.elem}} and evaluates them. For
  \code{rp.block}-classed elements just a vanilla
  \code{\link{evals}} call is carried out, while
  \code{rp.inline} and \code{rp.heading} classes have some
  additional post-evaluation processing (heading level is
  stored, as well as "raw" and evaluated chunk contents).
}
\details{
  Default parameters are read from \code{options}:

  \itemize{ \item 'inline.open', \item 'inline.close'. }
}
\keyword{internal}

