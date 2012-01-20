\name{has.tags}
\alias{has.tags}
\title{Tag Existence}
\usage{
  has.tags(x, ...)
}
\arguments{
  \item{x}{a character value to check for tag strings}

  \item{...}{an argument list with tags to check}
}
\value{
  a logical value indicating if the string has passed the
  check
}
\description{
  Checks if a character vector elements contain specified
  tags. Note that this helper does not parse R code within
  tags, but just checks for tag existence in provided
  string!
}
\examples{
has.tags("<\% pi \%>", "<\%")
has.tags("<\% pi \%>", "<\%", "\%>", "<!--", "-->")
has.tags(c("<\% pi \%>", "<!-- foobar -->"), "<\%", "\%>", "<!--", "-->")
}

