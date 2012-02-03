\name{rp.label}
\alias{rp.label}
\title{Get Variable Label}
\usage{
  rp.label(x, fallback = TRUE)
}
\arguments{
  \item{x}{an R object to extract labels from}

  \item{fallback}{a logical value indicating if labels
  should fallback to object name(s)}
}
\value{
  a character vector with variable's label(s)
}
\description{
  This function returns character value previously stored
  in variable's \code{label} attribute. If none found, the
  function defaults to object's name (retrieved by
  \code{deparse(substitute(x))}).
}
\examples{
\dontrun{
x <- rnorm(100)
rp.label(x)         # returns "x"
rp.label(x, FALSE)  # fails with error message

rp.label(mtcars$hp) <- "Horsepower"
rp.label(mtcars)         # returns "Horsepower" instead of "hp"
rp.label(mtcars, FALSE)  # returns NA where no labels are found
}
}

