\name{tpl.find}
\alias{tpl.find}
\title{Read Template}
\usage{
  tpl.find(fp)
}
\arguments{
  \item{fp}{a character vector containing template name
  (".tpl" extension is optional), file path or a text to be
  split by lines}
}
\value{
  a character vector with template contents
}
\description{
  Reads file either from template name, file path or URL,
  and splits it into lines for easier handling. "find" in
  \code{tpl.find} is borrowed from Emacs parlance - this
  function reads, and does not search for a template.
}

