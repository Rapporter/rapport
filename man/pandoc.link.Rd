\name{pandoc.link}
\alias{pandoc.link}
\title{Create pandoc link}
\usage{
  pandoc.link(url, text = url)
}
\arguments{
  \item{url}{hyperlink}

  \item{text}{link text}
}
\value{
  character vector
}
\description{
  Create pandoc link
}
\examples{
pandoc.link('http://r-project.org')
pandoc.link('http://r-project.org', 'R')
}
\references{
  John MacFarlane (2012): _Pandoc User's Guide_.
  \url{http://johnmacfarlane.net/pandoc/README.html}
}

