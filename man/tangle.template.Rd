\name{tangle.template}
\alias{tangle.template}
\title{Extract R Code from Template}
\usage{
  tangle.template(fp, file = NULL, include.inline = FALSE,
    include.comments = TRUE, sep = "\n", ...)
}
\arguments{
  \item{fp}{template file pointer}

  \item{file}{if specified, saves R code to a file
  (defaults to NULL, which puts the code in \code{stdout})}

  \item{include.inline}{if \code{TRUE} (default), code from
  inline chunks will be included too}

  \item{include.comments}{if \code{TRUE} (default),
  comments will be included too}

  \item{sep}{separator for output to file}

  \item{...}{additional parameters for \code{\link{cat}}
  function}
}
\description{
  \code{tangle}-like function to extract R code from
  \emph{rapport} templates.
}
\examples{
\dontrun{
tangle.template("anova")
tangle.template("anova", file = "anova.R")
}
}

