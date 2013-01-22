\name{guess.input.type}
\alias{guess.input.type}
\title{Check Type}
\usage{
  guess.input.type(x)
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
rapport:::guess.input.type("factor")
rapport:::guess.input.type("character[1,20]")
rapport:::guess.input.type("fee, fi, foo, fam")
rapport:::guess.input.type("FALSE")
rapport:::guess.input.type("number[3]=123.456")
}
}

