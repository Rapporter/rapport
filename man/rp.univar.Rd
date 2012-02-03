\name{rp.univar}
\alias{rp.univar}
\title{Descriptive Statistics}
\usage{
  rp.univar(x, subset = NULL, fn, na.rm = TRUE, ...)
}
\arguments{
  \item{x}{a numeric variable to be summarised}

  \item{subset}{an expression that evaluates to logical
  vector (defaults to \code{NULL}, in which case the
  function specified in \code{fun} is applied on a vector)}

  \item{fn}{a function or a function name to be applied on
  a variable or it's subset}

  \item{na.rm}{a logical value indicating whether
  \code{NA}'s should be removed (defaults to \code{TRUE})}

  \item{...}{additional arguments for function specified in
  \code{fn}}
}
\value{
  a numeric
}
\description{
  This function operates only on vectors or their subsets,
  by calculating a descriptive statistic specified in
  \code{fn} argument.
}

