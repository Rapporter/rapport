\name{purge.comments}
\alias{purge.comments}
\title{Purge Comments}
\usage{
  purge.comments(x,
    comment.open = get.tags("comment.open"),
    comment.close = get.tags("comment.close"))
}
\arguments{
  \item{x}{a character string to remove comments from}

  \item{comment.open}{a string containing opening tag}

  \item{comment.close}{a string containing closing tag}
}
\value{
  a string with removed pandoc comments
}
\description{
  Remove comments from provided character vector.
}
\details{
  Default parameters are read from \code{options}:

  \itemize{ \item 'comment.open', \item 'comment.close'. }
}

