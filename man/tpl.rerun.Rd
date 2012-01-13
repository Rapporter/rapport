\name{tpl.rerun}
\alias{tpl.rerun}
\title{Reproduce Template}
\usage{
  tpl.rerun(tpl)
}
\arguments{
  \item{tpl}{a \code{rapport} object}
}
\description{
  Runs template with data and arguments included in
  \code{rapport} object. In order to get reproducible
  example, you have to make sure that \code{reproducible}
  argument is set to \code{TRUE} in \code{rapport}
  function.
}
\examples{
\dontrun{
tmp <- rapport("example", mtcars, x = "hp", y = "mpg", reproducible = TRUE)
tpl.rerun(tmp)
}
}

