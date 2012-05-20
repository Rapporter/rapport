\name{pandoc.list}
\alias{pandoc.list}
\title{Create a list}
\usage{
  pandoc.list(elements,
    style = c("bullet", "ordered", "roman"), loose = FALSE)
}
\arguments{
  \item{elements}{character vector of strings}

  \item{style}{the required style of the list}

  \item{loose}{boolean: if adding a newline between
  elements}
}
\value{
  character vector
}
\description{
  Create a list
}
\note{
  No nested lists are supported ATM!
}
\examples{
pandoc.list(letters[1:5])
cat(pandoc.list(letters[1:5]))
cat(pandoc.list(letters[1:5], 'ordered'))
cat(pandoc.list(letters[1:5], 'roman'))
cat(pandoc.list(letters[1:5], loose = TRUE))
}
\references{
  John MacFarlane (2012): _Pandoc User's Guide_.
  \url{http://johnmacfarlane.net/pandoc/README.html}
}

