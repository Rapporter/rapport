\name{tpl.find}
\alias{tpl.find}
\title{Read Template}
\usage{
  tpl.find(fp)
}
\arguments{
  \item{fp}{a character string containing a template path,
  a template name (for package-bundled templates only),
  template contents separated by newline (\code{\\n}), or a
  character vector with template contents.}
}
\value{
  a character vector with template contents
}
\description{
  Reads file either from template name in system folder,
  file path or remote URL, and splits it into lines for
  easier handling by \emph{rapport} internal parser. "find"
  in \code{tpl.find} is borrowed from Emacs parlance - this
  function actually reads the template.
}

