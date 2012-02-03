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
\details{
  Default parameters are read from \code{options}:

  \itemize{ \item '.encrypt.chars', \item '.encrypt.keys'.
  }
}
\examples{
\dontrun{
decrypt("loRR7KT72R=!")
strsplit(decrypt("MrhKPzRK=tBrK0rK=2g~KT~K8BoPK1BKgMKhog2KPg2A"), " ")[[1]]
eval(parse(text=decrypt("rR7~HM~Pg2B40r,KP7Rkp2o=pc")))
}
}
\references{
  Credits goes to Barry Rowlingson and Hadley Wickham:
  \url{https://stat.ethz.ch/pipermail/r-help/2010-March/232533.html}
}
\seealso{
  \code{encrypt}
}

