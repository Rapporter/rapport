\name{rapport.rerun}
\alias{rapport.rerun}
\title{Reproduce Template}
\usage{
rapport.rerun(tpl)
}
\arguments{
  \item{tpl}{a \code{rapport} object}
}
\description{
Runs template with data and arguments included in
\code{rapport} object. In order to get reproducible
example, you have to make sure that \code{reproducible}
argument is set to \code{TRUE} in \code{rapport} function.
}
\examples{
\dontrun{
tmp <- rapport("Example", mtcars, v = "hp", reproducible = TRUE)
rapport.rerun(tmp)
}
}

