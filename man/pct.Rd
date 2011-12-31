\name{pct}
\alias{pct}
\title{Percent}
\usage{
  pct(x, decimals = 2,
    type = c("percent", "\%", "proportion"))
}
\arguments{
  \item{x}{a numeric value that is to be rendered to
  percent}

  \item{decimals}{an integer value indicating number of
  decimal places}

  \item{type}{a character value indicating whether percent
  or proportion value was provided (partial match is
  allowed)}
}
\value{
  a character value with formatted percent
}
\description{
  Appends a percent sign to provided numerical value.
  Rounding is carried out according to value passed in
  \code{decimals} formal argument (defaults to 2 decimal
  places).
}

