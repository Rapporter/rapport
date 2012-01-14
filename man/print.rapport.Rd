\name{print.rapport}
\alias{print.rapport}
\title{Prints rapport}
\usage{
  \method{print}{rapport} (x, metadata = FALSE,
    inputs = FALSE, body = TRUE)
}
\arguments{
  \item{x}{any "rapport" class object}

  \item{metadata}{logical: print metadata?}

  \item{inputs}{logical: print input parameters?}

  \item{body}{logical: print body?}
}
\description{
  Default print method for "rapport" class objects.
}
\examples{
\dontrun{
rapport('univar-descriptive', data=mtcars, var='hp')
print(rapport('univar-descriptive', data=mtcars, var='hp'), metadata=T)
print(rapport('univar-descriptive', data=mtcars, var='hp'), metadata=T, inputs=T)
print(rapport('example', data=mtcars, x='hp', y='mpg'), metadata=T, inputs=T)
print(rapport('example', data=mtcars, x='hp', y='mpg'), metadata=T, inputs=T, body=F)
}
}

