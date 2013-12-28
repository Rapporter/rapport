\name{tpl.tangle}
\alias{tpl.tangle}
\title{Extract template chunk contents}
\usage{
tpl.tangle(fp, file = "", show.inline.chunks = FALSE)
}
\arguments{
  \item{fp}{template file pointer (see
  \code{\link{rapport:::rapport.read}} for details)}

  \item{file}{see \code{file} argument in \code{\link{cat}}
  function documentation}

  \item{show.inline.chunks}{extract contents of inline
  chunks as well? (defaults to \code{FALSE})}
}
\value{
(invisibly) a list with either inline or block chunk
contents
}
\description{
\code{rapport}'s alternative to \code{\link{Stangle}} -
extracts contents of template chunks. If \code{file}
argument
}

