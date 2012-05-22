\name{pandoc.table}
\alias{pandoc.table}
\title{Create a table}
\usage{
  pandoc.table(t, caption, digits = 2, decimal.mark = ".",
    justify = "left")
}
\arguments{
  \item{t}{data frame, matrix or table}

  \item{caption}{string}

  \item{digits}{see \code{prettyNum}}

  \item{decimal.mark}{see \code{prettyNum}}

  \item{justify}{see \code{prettyNum}}
}
\value{
  character vector
}
\description{
  Creates a pandoc style "grid" table with optional
  caption.
}
\note{
  Pandoc does not support justify parameter for grid tables
  ATM. ## TODO: multiline?
}
\examples{
cat(pandoc.table(mtcars))

## caption
cat(pandoc.table(mtcars, 'Motor Trend Car Road Tests'))

## other input/output formats
cat(pandoc.table(mtcars, decimal.mark = ','))
cat(pandoc.table(mtcars, decimal.mark = ',', justify = 'right'))
cat(pandoc.table(matrix(sample(1:1000, 25), 5, 5)))
cat(pandoc.table(matrix(runif(25), 5, 5)))
cat(pandoc.table(matrix(runif(25), 5, 5), digits = 5))
cat(pandoc.table(table(mtcars$am, mtcars$gear)))
cat(pandoc.table(table(state.division, state.region)))
cat(pandoc.table(table(state.division, state.region), justify = 'centre'))
m <- data.frame(a=1:5, b=runif(5), c=c('a', 'bb', 'ccc', 'dddd', 'eeeee'))
cat(pandoc.table(m))
}
\references{
  John MacFarlane (2012): _Pandoc User's Guide_.
  \url{http://johnmacfarlane.net/pandoc/README.html}
}

