\name{grab.chunks}
\alias{grab.chunks}
\title{Inline Chunk Contents}
\usage{
  grab.chunks(x, tag.open = get.tags("inline.open"),
    tag.close = get.tags("inline.close"), include = FALSE,
    ...)
}
\arguments{
  \item{x}{a character vector}

  \item{tag.open}{a character value with opening tag
  regular expression}

  \item{tag.close}{a character value with closing tag
  regular expression}

  \item{include}{a logical value indicating whether chunks
  should be returned (defaults to \code{FALSE})}

  \item{...}{additional arguments for
  \code{\link{gregexpr}} function}
}
\value{
  a character vector with code chunks
}
\description{
  Returns inline code chunks with or without tags that wrap
  them.
}
\details{
  Default parameters are read from \code{options}:

  \itemize{ \item 'inline.open', \item 'inline.close'. }
}
\examples{
\dontrun{
s <- c("As you know, pi equals <\%pi\%>",  "2 raised to the power of 3 is <\%2^3\%>")
grab.chunks(s, "<\%", "\%>", FALSE)
## [1] "pi"  "2^3"
grab.chunks(s, "<\%", "\%>", FALSE)
## [1] "<\%pi\%>"  "<\%2^3\%>"
}
}

