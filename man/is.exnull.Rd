\name{is.exnull}
\alias{is.exnull}
\title{Existed object with the value NULL}
\usage{
is.exnull(x)
}
\arguments{
  \item{x}{an object to check}
}
\value{
a logical value indicating whether provided object exists
but the value of that is NULL
}
\description{
Checks if provided object exists but the value of that is
NULL.
}
\examples{
is.exnull(1)		  # [1] FALSE
is.exnull("")	  # [1] FALSE
is.exnull(NULL) 	# [1] TRUE
}

