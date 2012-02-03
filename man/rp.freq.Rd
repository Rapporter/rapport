\name{rp.freq}
\alias{rp.freq}
\title{Frequency Table}
\usage{
  rp.freq(f.vars, data, na.rm = TRUE, include.na = FALSE,
    drop.unused.levels = FALSE, count = TRUE, pct = TRUE,
    cumul.count = TRUE, cumul.pct = TRUE,
    total.name = "Total")
}
\arguments{
  \item{f.vars}{a character vector with variable names}

  \item{data}{a \code{data.frame}}

  \item{na.rm}{should missing values be removed?}

  \item{include.na}{should missing values be included in
  frequency table?}

  \item{drop.unused.levels}{should empty level combinations
  be left out}

  \item{count}{show frequencies?}

  \item{pct}{show percentage?}

  \item{cumul.count}{show cumulative frequencies?}

  \item{cumul.pct}{show cumulative percentage?}

  \item{total.name}{a sting containing footer label
  (defaults to "Total")}
}
\value{
  a \code{data.frame} with a frequency table
}
\description{
  Display frequency table with counts, percentage, and
  cumulatives.
}
\examples{
\dontrun{
rp.freq(c("am", "cyl", "vs"), mtcars)
}
}

