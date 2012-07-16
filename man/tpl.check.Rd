\name{tpl.check}
\alias{tpl.check}
\title{Check Template}
\usage{
  tpl.check(fp)
}
\arguments{
  \item{fp}{a character vector containing template name
  (".tpl" extension is optional), file path or a text to be
  split by line breaks}
}
\description{
  Checks if the examples of given template can be run
  without any error.
}
\details{
  If everything went fine and you get a list of
  \code{success} equals to \code{TRUE} values, otherwise
  \code{success} returns \code{FALSE} with additional
  \code{message}
}
\examples{
\dontrun{
tpl.check('example')
}
}

