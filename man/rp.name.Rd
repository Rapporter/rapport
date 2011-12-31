\name{rp.name}
\alias{rp.name}
\title{Get variable name}
\usage{
  rp.name(var)
}
\arguments{
  \item{var}{an atomic vector}
}
\value{
  a character value with variable's label
}
\description{
  This function returns character value previously stored
  in variable's \code{name} attribute. If none found, the
  function fallbacks to object's name.
}
\examples{
\dontrun{
rp.name(mtcars$am)
x <- 1:10; rp.name(x)
}
}

