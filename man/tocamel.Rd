\name{tocamel}
\alias{tocamel}
\title{CamelCase}
\usage{
  tocamel(x, sep = "[^[:alnum:]]", upper = FALSE, ...)
}
\arguments{
  \item{x}{a character vector to be converted to camelcase}

  \item{sep}{a string containing regular expression word
  delimiter}

  \item{upper}{a logical value indicating if the first
  letter of the first word should be capitalised (defaults
  to \code{FALSE})}

  \item{...}{additional arguments to be passed to
  \code{strsplit}}
}
\value{
  a character vector with strings put in camelcase
}
\description{
  Convert character vector to camelcase - capitalise first
  letter of each word.
}
\examples{
tocamel("foo.bar")
    ## [1] "fooBar"

    tocamel("foo.bar", upper = TRUE)
    ## [1] "FooBar"

    tocamel(c("foobar", "foo.bar", "camel_case", "a.b.c.d"))
    ## [1] "foobar"    "fooBar"    "camelCase" "aBCD"
}

