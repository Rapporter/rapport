\name{rp.percent}
\alias{rp.percent}
\title{Percent}
\usage{
  rp.percent(x, subset = NULL, na.rm = TRUE, pct = FALSE,
    ...)
}
\arguments{
  \item{x}{a numeric variable to be summarised}

  \item{subset}{an expression that evaluates to logical
  vector (defaults to \code{NULL})}

  \item{na.rm}{should missing values be}

  \item{pct}{print percent string too?}

  \item{...}{additional arguments for \code{\link{pct}}
  function}
}
\value{
  a numeric or string depending on the value of \code{pct}
}
\description{
  Calculates percentage of cases for provided variable and
  criteria specified in \code{subset} argument. Function
  accepts numeric, factor and logical variables for
  \code{x} parameter. If numeric and/or factor is provided,
  subsetting can be achieved via \code{subset} argument.
  Depending on value of \code{na.rm} argument, either valid
  (\code{na.rm = TRUE}) or all cases (\code{na.rm = FALSE})
  are taken into account. By passing logical variable to
  \code{x}, a sum of (\code{TRUE}) elements is calculated
  instead, and valid percents are used (\code{NA} are
  excluded).
}
\examples{
\dontrun{
set.seed(0)
x <- sample(5, 100, replace = TRUE)
rp.percent(x > 2)
}
}

