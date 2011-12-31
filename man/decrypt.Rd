\name{decrypt}
\alias{decrypt}
\title{Decrypt a string}
\usage{
  decrypt(message)
}
\arguments{
  \item{message}{a string to decrypt}
}
\value{
  string
}
\description{
  Decrypts string encrypted by \code{encrypt}.
}
\examples{
\dontrun{
		decrypt("l;pp8C|8.pB!")
		strsplit(decrypt("Em0C1apCB2rmCSmCB.q*C|*CIr;1CjrCqEC0;q.C1q.7"), " ")[[1]]
		eval(parse(text=decrypt("mp8*vE*1q.rtSm,CE*1q.rt|*,C18pdn0.;;4ny")))
	}
}
\references{
  Credits goes to Barry Rowlingson and Hadley Wickham:
  \url{https://stat.ethz.ch/pipermail/r-help/2010-March/232533.html}
}
\seealso{
  \code{encrypt}
}

