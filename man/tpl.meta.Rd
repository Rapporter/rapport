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
  header data}

  \item{trim.white}{a logical value indicating if the extra
  spaces should removed from header fields before
  extraction}
}
\value{
  a list with template metadata
}
\description{
  Displays summary of template metadata stored in a header
  section. This part of template header consists of several
  \emph{key: value} pairs, which define some basic template
  info, such as \emph{Title}, \emph{Example} etc. If you're
  familiar with package development in R, you'll probably
  find this approach very similar to \code{DESCRIPTION}
  file.
}
\details{
  \strong{Mandatory Fields}

  The following fields must be specified in the template
  header and their size limits must be taken into account:

  \itemize{ \item \emph{Title} - a template title (at most
  500 characters) \item \emph{Author} - author's (nick)name
  (at most 100 characters) \item \emph{Description} -
  template description (at most 5000 characters) }

  \strong{Optional Fields}

  Some fields are not required by the template. However,
  you should reconsider including them in the template, so
  that the other users could get a better impression of
  what your template does. These are currently supported
  fields:

  \itemize{ \item \emph{Email} - author's email address
  (defaults to \code{NULL}) \item \emph{Packages} - a
  comma-separated list of packages required by the template
  (defaults to \code{NA}) \item \emph{Data required} - is
  dataset required by a template? Field accepts \code{TRUE}
  or \code{FALSE}, and defaults to \code{FALSE}.  \item
  \emph{Example} - newline-separated example calls to
  \code{rapport} function, including template data and
  inputs (defaults to \code{NULL}) }

  Upon successful execution, \code{rp.meta}-class object is
  returned invisibly.
}

