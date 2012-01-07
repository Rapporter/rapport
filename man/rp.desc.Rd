\name{rp.desc}
\alias{rp.desc}
\title{Descriptive Statistics}
\usage{
  rp.desc(id.vars, measure.vars, fn, data = NULL,
    na.rm = TRUE, margins = NULL, subset = TRUE, fill = NA,
    add.missing = FALSE, total.name = "Total")
}
\arguments{
  \item{id.vars}{either a character vector with variable
  names from \code{data}, a numeric vector, or a
  \code{data.frame}}

  \item{measure.vars}{same as \code{id.vars}}

  \item{fn}{a list with functions or a character vector
  with function names}

  \item{data}{a \code{data.frame} holding variables
  specified in \code{id.vars} and \code{measure.vars}}

  \item{na.rm}{a logical value indicating whether \code{NA}
  values should be removed}

  \item{margins}{should margins be included? (see
  documentation for eponymous argument in
  \code{\link[reshape]{melt.data.frame}})}

  \item{subset}{a logical vector to subset the data before
  aggregating}

  \item{fill}{value to replace missing level combinations
  (see documentation for eponymous argument in
  \code{\link[reshape]{melt.data.frame}})}

  \item{add.missing}{show missing level combinations}

  \item{total.name}{a character string with name for
  "grand" margin (defaults to "Total")}
}
\value{
  a \code{data.frame} with aggregated data
}
\description{
  Aggregate table of descriptives according to functions
  provided in \code{fn} argument. This function follows
  melt/cast approach used in \code{reshape} package.
  Variable names specified in \code{measure.vars} argument
  are treated as \code{measure.vars}, while the ones in
  \code{id.vars} are treated as \code{id.vars} (see
  \code{\link[reshape]{melt.data.frame}} for details).
  Other its formal arguments match with corresponding
  arguments for \code{\link[reshape]{cast}} function. Some
  post-processing is done after reshaping, in order to get
  pretty row and column labels.
}
\examples{
rp.
rp.desc("cyl", "am", c(mean, sd), mtcars, margins = TRUE)
}

