\name{table.json}
\alias{table.json}
\title{Convert table-like structures to JSON object}
\usage{
  table.json(d, name.rows = "rows", name.cols = "cols",
    name.body = "body")
}
\arguments{
  \item{d}{either a \code{matrix} or a \code{data.frame}
  object}

  \item{name.rows}{a string naming object that contains row
  names}

  \item{name.cols}{a string naming object that contains
  columns names}

  \item{name.body}{a string naming object that contains
  table body}
}
\value{
  string with JSON object containing \code{rows},
  \code{cols} and \code{body} attributes.
}
\description{
  This function takes either a \code{\link{matrix}} or a
  \code{\link{data.frame}} object to extract column names,
  row names and the "body" of the table-like object, hence
  exports them to JSON.
}
\examples{
\dontrun{
    table.json(mtcars)

    set.seed(1)
    m <- matrix(sample(10, 100, TRUE), 10)
    table.json(m)
}
}

