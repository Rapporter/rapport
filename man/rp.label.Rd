\name{rp.label}
\alias{rp.label}
\title{Get Variable Label}
\usage{
  rp.label(x, fallback = TRUE, simplify = TRUE)
}
\arguments{
  \item{x}{an R object to extract labels from}

  \item{fallback}{a logical value indicating if labels
  should fallback to object name(s)}

  \item{simplify}{coerce results to a vector (\code{TRUE}
  by default), otherwise, a \code{list} is returned}
}
\value{
  a character vector with variable's label(s)
}
\description{
  This function returns character value previously stored
  in variable's \code{label} attribute. If none found, and
  \code{fallback} argument is set to \code{TRUE} (default),
  the function returns object's name (retrieved by
  \code{deparse(substitute(x))}), otherwise \code{NA} is
  returned with a warning notice.
}
\examples{
\dontrun{
x <- rnorm(100)
rp.label(x)         # returns "x"
rp.label(x, FALSE)  # returns NA and issues a warning

rp.label(mtcars$hp) <- "Horsepower"
rp.label(mtcars)         # returns "Horsepower" instead of "hp"
rp.label(mtcars, FALSE)  # returns NA where no labels are found
rp.label(sleep, FALSE)   # returns NA for each variable and issues a warning
}
}

