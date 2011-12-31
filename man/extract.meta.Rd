\name{extract.meta}
\alias{extract.meta}
\title{Extract Template Metadata}
\usage{
  extract.meta(x, title, regex, replacement = "\\1",
    short = NULL, trim.white = TRUE, mandatory = TRUE, ...)
}
\arguments{
  \item{x}{a string containing template metadata}

  \item{title}{a string containint metadata field title
  (can be regex-powered)}

  \item{regex}{a string with regular expression to match
  field value}

  \item{replacement}{a string containing a backreference to
  matched string (defaults to first match \code{\\1})}

  \item{short}{a string with a short name for given
  metadata field}

  \item{trim.white}{a logical value indicating whether
  trailing and leading whitespaces of the given string
  should be removed before extraction}

  \item{mandatory}{a logical value indicating required
  field}

  \item{...}{additional parameters for \code{grepl}
  function}
}
\value{
  a list with matched content, or \code{NULL} if the field
  is not required
}
\description{
  Check if template metadata field matches provided format,
  and return matched value in a list.
}
\examples{
\dontrun{
    extract.metadata("Name: John Smith", "Name", "[[:alpha:]]+( [[:alpha:]]+)?")
    ## $name
    ## [1] "John Smith"

    extract.metadata("Name: John", "Name", "[[:alpha:]]+( [[:alpha:]]+)?")
    ## $name
    ## [1] "John"
}
}

