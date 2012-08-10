\name{lambda.test}
\alias{lambda.test}
\title{Goodman and Kruskal's lambda}
\usage{
  lambda.test(table, direction = 0)
}
\arguments{
  \item{table}{a \code{table} of two variables}

  \item{direction}{numeric value of \code{c(0,1,2)} where 1
  means the lambda value computed for row, 2 for columns
  and 0 for both}
}
\value{
  computed lambda value(s) for row/col of given table
}
\description{
  Computes Goodman and Kruskal's lambda for given table.
}
\examples{
\dontrun{
lambda.test(table(mtcars$am, mtcars$gear))
lambda.test(table(mtcars$am, mtcars$gear), 1)
lambda.test(table(mtcars$am, mtcars$gear), 2)
x <- data.frame(x = c(5, 4, 3), y = c(9, 8, 7), z = c(7, 11, 22), zz = c(1, 15, 8))
lambda.test(x)   # 0.1 and 0.18333
}
}

