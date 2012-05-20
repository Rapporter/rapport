\name{pandoc.image}
\alias{pandoc.image}
\title{Create pandoc image tags}
\usage{
  pandoc.image(img, caption = "")
}
\arguments{
  \item{img}{image path}

  \item{caption}{text}
}
\value{
  character vector
}
\description{
  Creates a pandoc style image hyperlink.
}
\examples{
pandoc.image('foo.png')
pandoc.image('foo.png', 'Nice image, huh?')
}
\references{
  John MacFarlane (2012): _Pandoc User's Guide_.
  \url{http://johnmacfarlane.net/pandoc/README.html}
}

