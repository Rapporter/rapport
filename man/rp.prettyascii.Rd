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
\details{
  Default parameters are read from \code{options}:

  \itemize{ \item 'rp.decimal', \item 'rp.decimal.short',
  \item 'rp.decimal.mark'. }
}
\examples{
\dontrun{
rp.prettyascii('Hello, World?')
rp.prettyascii(22/7)
rp.prettyascii(matrix(runif(25), 5, 5))
rp.prettyascii(lm(hp~wt, mtcars))
rp.prettyascii(summary(mtcars$hp))
rp.prettyascii(htest(rnorm(100), shapiro.test))
rp.prettyascii(table(mtcars$am,mtcars$gear))
rp.prettyascii(data.frame(x=1:2, y=3:4))
rp.prettyascii(data.frame(x=1:2, y=3:4, z=c(22/7, pi)))
rp.prettyascii(mtcars)
rp.prettyascii(table(mtcars$am))

## it is better to \\code{cat} the output
cat(rp.prettyascii(rp.freq("gender", data = ius2008)))
}
}

