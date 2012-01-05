\name{rp.prettyascii}
\alias{rp.prettyascii}
\title{Return pretty ascii form}
\usage{
  rp.prettyascii(x)
}
\arguments{
  \item{x}{R object}
}
\value{
  ascii
}
\description{
  Some standard formatting is applied to the value which is
  returned as ascii object.
}
\examples{
\dontrun{
rp.prettyascii('Hallo, World?')
rp.prettyascii(22/7)
rp.prettyascii(matrix(runif(25), 5, 5))
rp.prettyascii(lm(hp~wt, mtcars))

}
}

