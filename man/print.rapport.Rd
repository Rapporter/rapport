\name{print.rapport}
\alias{print.rapport}
\title{Prints rapport}
\usage{
  \method{print}{rapport} (x, ...)
}
\arguments{
  \item{x}{any "rapport" class object}

  \item{...}{ignored}
}
\description{
  Default print method for "rapport" class objects which
  show the report body.
}
\examples{
\dontrun{
rapport('univar-descriptive', data=mtcars, var='hp')
print(rapport('univar-descriptive', data=mtcars, var='hp'))
}
}

