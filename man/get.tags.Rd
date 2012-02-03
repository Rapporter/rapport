\name{get.tags}
\alias{get.tags}
\title{Tag Values}
\usage{
  get.tags(tag.type = c("all", "chunk.open", "chunk.close", "inline.open", "inline.close", "header.open", "header.close", "comment.open", "comment.close"),
    preset = c("user", "default"))
}
\arguments{
  \item{tag.type}{a character value with tag value name}

  \item{preset}{a character value specifying which preset
  to return}
}
\value{
  either a list (default) or a character value with tag
  regexes
}
\description{
  Returns report tag vales (usually regexes): either
  user-defined, or the default ones.
}
\details{
  Default parameters are read from \code{options}:

  \itemize{ \item 'chunk.open', \item 'chunk.close', \item
  'inline.open', \item 'inline.close', \item 'header.open',
  \item 'header.close', \item 'comment.open', \item
  'comment.close'. }
}
\examples{
get.tags()        # same as 'get.tags("all")'
get.tags("chunk.open")
}

