\name{check.name}
\alias{check.name}
\title{Naming Conventions}
\usage{
  check.name(x, min.size = 1L, max.size = 30L, ...)
}
\arguments{
  \item{x}{a character vector to test names}

  \item{min.size}{an integer value that indicates minimum
  name length}

  \item{max.size}{an integer value that indicates maximum
  name length}

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
rapport:::check.name("foo")               # [1] TRUE
rapport:::check.name("foo.bar")           # [1] TRUE
rapport:::check.name("foo_bar")           # [1] TRUE
rapport:::check.name("foo.bar.234")       # [1] TRUE
rapport:::check.name("foo.bar.234_asdf")  # [1] TRUE
rapport:::check.name("234.asdf")          # [1] FALSE
rapport:::check.name("_asdf")             # [1] FALSE
rapport:::check.name(".foo")              # [1] FALSE
}

