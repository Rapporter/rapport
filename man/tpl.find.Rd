\name{tpl.find}
\alias{tpl.find}
\title{Read Template}
\usage{
  tpl.find(fp)
}
\arguments{
  \item{fp}{a character string containing a template path,
  a template name (for package-bundled templates only, and
  ".tpl" extension is optional), or template contents
  separated by newline (\code{\\n}), or a character vector
  with template contents.}
}
\value{
  a character vector with template contents
}
\description{
  Reads file either from template name, file path or URL,
  and splits it into lines for easier handling. "find" in
  \code{tpl.find} is borrowed from Emacs parlance - this
  function actually reads the template.
}

