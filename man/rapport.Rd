\name{rapport}
\alias{rapport}
\title{Evaluate Template}
\usage{
  rapport(fp, data = NULL, ..., env = new.env(),
    reproducible = FALSE, header.levels.offset = 0,
    graph.output = evalsOptions("graph.output"),
    file.name = getOption("rp.file.name"),
    file.path = getOption("rp.file.path"),
    graph.width = evalsOptions("width"),
    graph.height = evalsOptions("height"),
    graph.res = evalsOptions("res"),
    graph.hi.res = evalsOptions("hi.res"),
    graph.replay = evalsOptions("graph.recordplot"))
}
\arguments{
  \item{fp}{a template file pointer (see
  \code{\link{tpl.find}} for details)}

  \item{data}{a \code{data.frame} to be used in template}

  \item{...}{matches template inputs in format 'key =
  "value"'}

  \item{env}{an environment where template commands be
  evaluated (defaults to \code{new.env()}}

  \item{reproducible}{a logical value indicating if the
  call and data should be stored in template object, thus
  making it reproducible (see \code{\link{tpl.rerun}} for
  details)}

  \item{header.levels.offset}{number added to header levels
  (handy when using nested templates)}

  \item{file.name}{set the file name of saved plots and
  exported documents. A simple character string might be
  provided where \code{\%N} would be replaced by an
  auto-increment integer based on similar exported
  document's file name , \code{\%n} an auto-increment
  integer based on similar (plot) file names (see:
  \code{?evalsOptions}), \code{\%T} by the name of the
  template in action and \code{\%t} by some uniqe random
  characters based on \code{\link{tempfile}}.}

  \item{file.path}{path of a directory where to store
  generated images and exported reports}

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

  \item{graph.replay}{logical value indicating if plots
  need to be recorded for later replay (eg. while
  \code{print}ing \code{rapport} objects in R console)}
}
\value{
  a list with \code{rapport} class.
}
\description{
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
  Default parameters are read from \code{evalsOptions()}
  and the following \code{options}:

  \itemize{ \item 'rp.file.name', \item 'rp.file.path', }
}
\examples{
\dontrun{
rapport("example", ius2008, var = "leisure")
rapport("example", ius2008, var = "leisure", desc = FALSE, hist = TRUE, theme = "Set1")

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
\seealso{
  \code{\link{rapport-package}}
}

