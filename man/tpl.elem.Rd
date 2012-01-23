\name{tpl.elem}
\alias{tpl.elem}
\title{Template Elements}
\usage{
  tpl.elem(fp,
    extract = c("all", "heading", "inline", "block"),
    use.body = FALSE, skip.blank.lines = TRUE,
    skip.r.comments = FALSE, ...)
}
\arguments{
  \item{fp}{a template file pointer (see
  \code{\link{tpl.find}} for details)}

  \item{extract}{a string indicating which elements should
  be extracted from the template: headings, blocks, or code
  chunks (by default it returns all of the above)}

  \item{use.body}{a logical value indicating whether the
  whole template should be used, or just its body}

  \item{skip.blank.lines}{remove blank lines within R
  chunks}

  \item{skip.r.comments}{remove comments withing R chunks}

  \item{...}{additional arguments to be passed to
  \code{\link{grep}} and \code{\link{get.tags}} functions}
}
\value{
  a \code{data.frame} with 3 columns:
}
\description{
  Returns a \code{data.frame} containing summary of
  relevant template elements: \code{ind} - indice of
  current element in template's body, \code{type} - a
  string indicating the type of the content ("heading",
  "inline" or "block"), and \code{chunk} - a string
  containing R expression found in a code chunk.
}
\examples{
\dontrun{
    fp <- system.file("templates", "example.tpl", package = "rapport")
    tpl.elem(fp) # returns all elements (headings, inlines and blocks)

    ## returns only code blocks
    tpl.elem(fp, extract = "block")
}
}

