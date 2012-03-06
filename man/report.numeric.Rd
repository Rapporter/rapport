\name{report.numeric}
\alias{report.numeric}
\title{Report a numeric object}
\usage{
  report.numeric(x, digits = 5, decimal.mark = ".",
    tpl = "classes/numeric.tpl", ...)
}
\arguments{
  \item{x}{}

  \item{digits}{}

  \item{decimal.mark}{}

  \item{tpl}{}

  \item{...}{}
}
\description{
  Report a numeric object
}
\examples{
\dontrun{
report(pi)
report(pi, 20)
report(pi, 20)
report(pi, 5, ',')
report(pi, decimal.mark = '|')
report(1:10/3, decimal.mark = '|')
report(matrix(1:25, 5, 5))
}
}

