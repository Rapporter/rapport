\name{is.tabular}
\alias{is.tabular}
\title{Tabular Structure}
\usage{
  is.tabular(x)
}
\arguments{
  \item{x}{an object to be checked for "tabular" format}
}
\value{
  a logical value indicating that provided object has
  tabular structure
}
\description{
  Checks if object has "tabular" structure (not to confuse
  with \code{\link{table}}) - in this particular case, that
  means \code{\link{matrix}} and \code{\link{data.frame}}
  objects only.
}
\examples{
is.tabular(HairEyeColor[, , 1])  # [1] TRUE
is.tabular(mtcars)               # [1] TRUE
is.tabular(table(mtcars$cyl))    # [1] FALSE
is.tabular(rnorm(100))           # [1] FALSE
is.tabular(LETTERS)              # [1] FALSE
is.tabular(pi)                   # [1] FALSE
}

