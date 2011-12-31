\name{rp.label}
\alias{rp.label}
\title{Get variable label}
\usage{
  rp.label(var)
}
\arguments{
  \item{var}{an atomic vector}
}
\value{
  a character value with variable's label
}
\description{
  This function returns character value previously stored
  in variable's \code{label} attribute. If none found, the
  function fallbacks to object's name.
}
\examples{
\dontrun{
	rp.label(mtcars$am)
	x <- 1:10; rp.label(x)
}
}

