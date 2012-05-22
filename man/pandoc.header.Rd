\name{pandoc.header}
\alias{pandoc.header}
\title{Create header}
\usage{
  pandoc.header(x, level = 1, style = c("atx", "setext"))
}
\arguments{
  \item{x}{character vector}

  \item{level}{integer}

  \item{style}{atx or setext type of heading}
}
\value{
  character vector
}
\description{
  Creates a pandoc/markdown style header with given level.
}
\examples{
pandoc.header('Foo!', 2)
pandoc.header('Foo!', 2, 'setext')
cat(pandoc.header('Foo!', 2, 'setext'))
cat(pandoc.header('Foo **bar**!', 1, 'setext'))
}
\references{
  John MacFarlane (2012): _Pandoc User's Guide_.
  \url{http://johnmacfarlane.net/pandoc/README.html}
}

