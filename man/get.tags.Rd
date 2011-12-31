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
  names
}
\description{
  Returns report tag vales: either ones that were set by
  user, or the default ones.
}

