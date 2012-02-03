\docType{package}
\name{rapport}
\alias{rapport}
\alias{rapport-package}
\title{rapport: An R engine for reproducible template generation}
\usage{
  rapport(fp, data = NULL, ..., reproducible = FALSE,
    header.levels.offset = 0,
    rapport.mode = getOption("rapport.mode"),
    graph.output = getOption("graph.format"),
    graph.width = getOption("graph.width"),
    graph.height = getOption("graph.height"),
    graph.res = getOption("graph.res"),
    graph.hi.res = getOption("graph.hi.res"))
}
\arguments{
  \item{fp}{a template file pointer (see
  \code{\link{tpl.find}} for details)}

  \item{data}{a \code{data.frame} to be used in template}

  \item{...}{matches template inputs in format 'key =
  "value"'}

  \item{reproducible}{a logical value indicating if the
  call and data should be stored in template object, thus
  making it reproducible (see \code{\link{tpl.rerun}} for
  details)}

  \item{header.levels.offset}{number added to header levels
  (handy when using nested templates)}

  \item{rapport.mode}{forces \code{rapport} to run in
  \emph{performance} or \emph{debug} mode instead of normal
  behaviour. Change this only if you really know what are
  you doing! In \code{performance} mode \code{rapport} will
  evaluate all templates in \code{strict} mode (see:
  \code{evals(..., check.output = FALSE)}), while in
  \code{debug} mode \code{rapport} will halt on first
  error.}

  \item{graph.output}{the required file format of saved
  plots (optional)}

  \item{graph.width}{the required width of saved plots
  (optional)}

  \item{graph.height}{the required height of saved plots
  (optional)}

  \item{graph.res}{the required nominal resolution in ppi
  of saved plots (optional)}

  \item{graph.hi.res}{logical value indicating if high
  resolution (1280x~1280) images would be also generated}
}
\value{
  a list with \code{rapport} class.
}
\description{
  \emph{rapport} is an R package that facilitates creation
  of reproducible statistical report templates. Once
  created, \emph{rapport} templates can be exported to
  various external formats: \emph{HTML}, \emph{LaTeX},
  \emph{PDF}, \emph{ODT}, etc. Apart from R, all you need
  to know to start writing your own templates is
  \emph{pandoc} markup syntax, and several
  \emph{rapport}-specific conventions that allow the
  reproducibility of the template. \emph{rapport} uses
  \emph{brew}-like tags to support dynamic inline and/or
  block evaluation of R code. Unlike many other
  report-writing conventions in R (\emph{Sweave},
  \emph{brew}), \emph{rapport} converts generated output in
  a convenient form via \emph{acii} function.
  \emph{rapport} also comes with support for plots: images
  are automatically saved to temporary file, and image path
  is returned.

  This is the central function in the \code{rapport}
  package, and hence eponymous. In following lines we'll
  use \code{rapport} to denote the function, not the
  package. \code{rapport} requires a template file, while
  dataset (\code{data} argument) can be optional, depending
  on the value of \code{Data required} field in template
  header. Template inputs are matched with \code{...}
  argument, and should be provided in \code{x = value}
  format, where \code{x} matches input name and
  \code{value}, wait for it... input value! See
  \code{\link{tpl.inputs}} for more details on template
  inputs.
}
\details{
  Default parameters are read from \code{options}:

  \itemize{ \item 'rapport.mode', \item 'graph.format',
  \item 'graph.width', \item 'graph.height', \item
  'graph.res', \item 'graph.hi.res'. }
}
\examples{
\dontrun{
rapport("example", ius2008, var = "leisure")
rapport("example", ius2008, var = "leisure", desc = FALSE, hist = TRUE, theme = "Set1")
rapport("example", ius2008, var = "leisure", rapport.mode = 'debug')
rapport("example", ius2008, var = "leisure", rapport.mode = 'performance')
## Or set \\code{'rapport.mode'} option to \\code{debug}, \\code{performance} or back to \\code{normal}.

## generating high resolution images also
rapport("example", ius2008, var="leisure", hist = TRUE, graph.hi.res = TRUE)
rapport.html("nortest", ius2008, var = "leisure", graph.hi.res=T)
## generating only high resolution image
rapport("example", ius2008, var="leisure", hist = TRUE, graph.width = 1280, graph.height = 1280)
## nested templates cannot get custom setting, use custom rapport option:
options('graph.hi.res' = TRUE)
rapport('descriptives-multivar', data=ius2008, vars=c("gender", 'age'))
}
}

