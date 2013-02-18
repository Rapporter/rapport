\name{tpl.meta}
\alias{tpl.meta}
\title{Header Metadata}
\usage{
  tpl.meta(fp, fields = NULL, use.header = FALSE,
    trim.white = TRUE)
}
\arguments{
  \item{fp}{a template file pointer (see
  \code{\link{tpl.find}} for details)}

  \item{fields}{a list of named lists containing key-value
  pairs of field titles and corresponding regexes}

  \item{use.header}{a logical value indicating if the
  character vector provided in \code{fp} argument contains
  only header data and not the whole template}

  \item{trim.white}{a logical value indicating if the extra
  spaces should removed from header fields before
  extraction}
}
\value{
  a named list with template metadata
}
\description{
  Displays summary of template metadata stored in a header
  section. This part of template header consists of several
  YAML \code{key: value} pairs, which contain some basic
  information about the template, just much like the
  \code{DESCRIPTION} file in \code{R} packages does.
  Current implementation supports following fields:
}
\details{
  \itemize{ \item \code{title} - a template title
  (required) \item \code{author} - author's (nick)name
  (required) \item \code{description} - template
  description (required) \item \code{email} - author's
  email address \item \code{packages} - YAML list of
  packages required by the template (if any) \item
  \code{example} - example calls to \code{rapport}
  function, including template data and inputs }

  As of version \code{0.5}, \code{dataRequired} field is
  deprecated. \code{rapport} function will automatically
  detect if the template requires a dataset based on the
  presence of \emph{standalone} inputs.
}

