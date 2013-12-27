\name{tpl.info}
\alias{tpl.info}
\title{Template Info}
\usage{
tpl.info(fp, meta = TRUE, inputs = TRUE)
}
\arguments{
  \item{fp}{a template file pointer (see
  \code{\link{tpl.find}} for details)}

  \item{meta}{return template metadata? (defaults to
  \code{TRUE})}

  \item{inputs}{return template inputs? (defaults to
  \code{TRUE})}
}
\description{
Provides information about template metadata and/or inputs.
See \code{\link{tpl.meta}} and \code{\link{tpl.inputs}} for
details.
}
\examples{
\dontrun{
tpl.info('Example')  # return both metadata and inputs
tpl.info('Crosstable', inputs = FALSE)  # return only template metadata
tpl.info('Correlation', meta = FALSE)  # return only template inputs
}
}
\seealso{
{ \code{\link{tpl.meta}} \code{\link{tpl.inputs}} }
}

