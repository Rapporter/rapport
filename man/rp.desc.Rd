\name{rp.desc}
\alias{rp.desc}
\title{rp.desc}
\usage{
  rp.desc(dep, ndep = NULL, fn, data, na.rm = FALSE,
    margins = NULL, total.name = "Total")
}
\arguments{
  \item{dep}{character vector with names of dependent
  variables}

  \item{ndep}{character vector with names of independent
  variables}

  \item{fn}{a character vector or a named list with
  aggregation function(s)}

  \item{data}{\code{\link{data.frame}} object (defaults to
  value found in \code{rp.data.active})}

  \item{na.rm}{a logical value indicating whether the
  missing values should be removed}

  \item{margins}{vector of variable names which generate
  margins, or \code{TRUE} to generate both row and column
  margins. See \code{\link[reshape]{cast}} function for
  details.}

  \item{total.name}{length-one character vector with title
  for "Total" field}

  \item{...}{additional parameters for
  \code{\link[reshape]{cast}}}
}
\value{
  a \code{\link{data.frame}} with aggregated data
}
\description{
  Displays descriptive statistics of subsetted data
}
\details{
  Aggregates \code{\link{data.frame}} with given variables
  and returns output as \code{\link{data.frame}}.
}

