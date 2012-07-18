\name{is.boolean}
\alias{is.boolean}
\title{Boolean}
\usage{
  is.boolean(x)
}
\arguments{
  \item{x}{an object to check}
}
\value{
  a logical value indicating whether provided object is a
  boolean
}
\description{
  Checks if provided object is a boolean i.e. a length-one
  logical vector.
}
\examples{
\dontrun{
    is.boolean(TRUE)                # [1] TRUE
    # the following will work on most systems, unless you have tweaked global Rprofile
    is.boolean(T)                   # [1] TRUE
    is.boolean(1)                   # [1] FALSE
    is.string(c("foo", "bar"))      # [1] FALSE
}
}

