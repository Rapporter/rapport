\name{check.name}
\alias{check.name}
\title{Naming Conventions}
\usage{
  check.name(x, size = 30L, ...)
}
\arguments{
  \item{x}{a character vector to test names}

  \item{size}{an integer value that indicates maximum name
  length}

  \item{...}{additional arguments to be passed to
  \code{\link{grepl}} function}
}
\value{
  a logical vector indicating which values satisfy the
  naming conventions
}
\description{
  Checks package-specific naming conventions: variables
  should start by a letter, followed either by a letter or
  a digit, while the words should be separated with dots or
  underscores.
}
\examples{
check.name("foo")               # [1] TRUE
check.name("foo.bar")           # [1] TRUE
check.name("foo_bar")           # [1] TRUE
check.name("foo.bar.234")       # [1] TRUE
check.name("foo.bar.234_asdf")  # [1] TRUE
check.name("234.asdf")          # [1] FALSE
check.name("_asdf")             # [1] FALSE
check.name(".foo")              # [1] FALSE
}

