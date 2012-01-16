\name{elem.eval}
\alias{elem.eval}
\title{Evaluate Template Elements}
\usage{
  elem.eval(x, tag.open = get.tags("inline.open"),
    tag.close = get.tags("inline.close"),
    remove.comments = TRUE, ...)
}
\arguments{
  \item{x}{template file pointer}

  \item{tag.open}{a string containing opening tag}

  \item{tag.close}{a string containing closing tag}

  \item{remove.comments}{should comments be omitted on
  evaluation?}

  \item{...}{additional params for \code{grep}-like
  functions}
}
\description{
  This function grabs template elements from
  \code{\link{tpl.elem}} and evaluates them. For
  \code{rp.block}-classed elements just a vanilla
  \code{\link{evals}} call is carried out, while
  \code{rp.inline} and \code{rp.heading} classes have some
  additional post-evaluation proccesing (heading level is
  stored, as well as "raw" and evaluated chunk contents).
}
\keyword{internal}

