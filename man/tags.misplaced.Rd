\name{tags.misplaced}
\alias{tags.misplaced}
\title{Misplaced Tags}
\usage{
  tags.misplaced(x, tag.open = get.tags("inline.open"),
    tag.close = get.tags("inline.close"))
}
\arguments{
  \item{x}{a string to check for misplaced tags}

  \item{tag.open}{a string containing opening tag}

  \item{tag.close}{a string containing closing tag}
}
\value{
  if no tags, or no mismatches are found, original string
  is returned, otherwise the function will return
  appropriate error
}
\description{
  Searches for misplaced tags.
}
\details{
  Default parameters are read from \code{options}:

  \itemize{ \item 'inline.open, \item 'inline.close'. }
}

