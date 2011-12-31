\name{is.string}
\alias{is.string}
\title{Strings}
\usage{
  is.string(x)
}
\arguments{
  \item{x}{an object to check}
}
\value{
  a logical value indicating whether provided object is a
  string
}
\description{
  Checks if provided object is a string i.e. a length-one
  character vector.
}
\examples{
is.string("foobar")          # [1] TRUE
    is.string(1)                 # [1] FALSE
    is.string(c("foo", "bar"))   # [1] FALSE
}

