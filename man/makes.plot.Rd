\name{makes.plot}
\alias{makes.plot}
\title{Check plot creation}
\usage{
  makes.plot(cmd)
}
\arguments{
  \item{cmd}{an expression that is to be tested}
}
\value{
  a logical value
}
\description{
  This function checks if given expression generates a
  plot.
}
\examples{
\dontrun{
    makes.plot(plot(rnorm(100))) # returns TRUE
    makes.plot(sample(10))       # returns FALSE
}
}
\author{
  Hadley Wickham <h.wickham@gmail.com>
}
\references{
  See original thread for more details
  (\url{http://stackoverflow.com/a/2744434/457898}).
  Special thanks to Hadley Wickham for this one!
}

