\name{rp.name}
\alias{rp.name}
\title{Variable Name}
\usage{
  rp.name(x)
}
\arguments{
  \item{x}{an R (atomic or data.frame/list) object to
  extract names from}
}
\value{
  a character value with variable's label
}
\description{
  This function returns character value previously stored
  in variable's \code{name} attribute. If none found, the
  function defaults to object's name.
}
\examples{
\dontrun{
rp.name(mtcars$am)
x <- 1:10; rp.name(x)
}
}

