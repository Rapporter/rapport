\name{pct}
\alias{pct}
\title{Percent}
\usage{
  pct(x, digits = panderOptions("digits"),
    type = c("percent", "\%", "proportion"),
    check.value = TRUE)
}
\arguments{
  \item{x}{a numeric value that is to be rendered to
  percent}

  \item{digits}{an integer value indicating number of
  decimal places}

  \item{type}{a character value indicating whether percent
  or proportion value was provided (partial match is
  allowed)}

  \item{check.value}{perform a sanity check to see if
  provided numeric value is correct}
}
\value{
  a character value with formatted percent
}
\description{
  Appends a percent sign to provided numerical value.
  Rounding is carried out according to value passed in
  \code{decimals} formal argument (defaults to value
  specified in \code{panderOptions('digits')}).
}

