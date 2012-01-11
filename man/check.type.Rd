\name{check.type}
\alias{check.type}
\title{Check Type}
\usage{
  check.type(x)
}
\arguments{
  \item{x}{a character string containing input definition}
}
\description{
  Checks type of template input, based on provided sting.
  If input definition is syntactically correct, a list is
  returned, containing input type, size limits, and default
  value (for CSV options and boolean types only).
}
\examples{
\dontrun{
rapport:::check.type("factor")
rapport:::check.type("character[1,20]")
rapport:::check.type("fee, fi, foo, fam")
rapport:::check.type("FALSE")
rapport:::check.type("number[3]=123.456")
}
}

