\name{check.input.value.length}
\alias{check.input.value.length}
\title{Input value length}
\usage{
  check.input.value.length(input, value = NULL,
    is.nchar.check = FALSE)
}
\arguments{
  \item{input}{}

  \item{value}{}

  \item{is.nchar.check}{}
}
\description{
  Checks input \code{value} (if any) against provided
  \code{length} rules. Must be called after
  \code{\link{guess.input.length}}, and for
  \code{standalone} inputs only (this check is performed in
  \code{\link{guess.input}}).
}

