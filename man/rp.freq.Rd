\name{rp.freq}
\alias{rp.freq}
\title{Frequency Table}
\usage{
  rp.freq(f.vars, data, na.rm = TRUE, include.na = FALSE,
    drop.unused.levels = FALSE, count = TRUE, pct = TRUE,
    cum.n = TRUE, cum.pct = TRUE)
}
\arguments{
  \item{f.vars}{a character vector with variable names}

  \item{data}{a \code{data.frame}}

  \item{na.rm}{should missing values be removed?}

  \item{include.na}{should missing values be included in
  frequency table?}

  \item{drop.levels}{should unused levels be removed}

  \item{count}{show frequencies?}

  \item{pct}{show percentage?}

  \item{cum.n}{show cumulative frequencies?}

  \item{cum.pct}{}
}
\value{
  a \code{data.frame} with frequencies
}
\description{
  Diplay frequency table
}
\examples{
\dontrun{
rp.freq(c("am", "cyl", "vs"), mtcars)
}
}

