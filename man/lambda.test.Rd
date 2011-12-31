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
  numeric
}
\description{
  Computes Goodman and Kruskal's lambda for given table.
}

