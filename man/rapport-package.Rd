\docType{package}
\name{rapport-package}
\alias{rapport-package}
\title{rapport: An R engine for reproducible template generation}
\description{
  \emph{rapport} is an R package that facilitates creation
  of reproducible statistical report templates. Once
  created, \emph{rapport} templates can be exported to
  various external formats: \emph{HTML}, \emph{LaTeX},
  \emph{PDF}, \emph{ODT}, etc.
}
\details{
  For a more detailed introduction please check out our
  homepage located at:

  \link{http://rapport-package.info}

  You may use the package bundled templates with minimal R
  knowledge, a quick tutorial is shown in the demo:

  \code{demo(rapport)}

  Apart from R, all you need to know to start writing your
  own templates is \emph{pandoc} markup syntax, and several
  \emph{rapport}-specific conventions that allow the
  reproducibility of the template. \emph{rapport} uses
  \emph{brew}-like tags to support dynamic inline and/or
  block evaluation of R code. Unlike many other
  report-writing conventions in R (\emph{Sweave},
  \emph{brew}), \emph{rapport} converts generated output in
  a convenient form via \emph{ascii} package and several
  optional backends. \emph{rapport} also comes with support
  for plots: images are automatically saved to temporary
  file, and image path is returned or redrawn on graphic
  device on demand.

  Please see the available, package specific options below:

  \itemize{ \item 'tpl.user': (user)name to show on
  exported reports. Set to 'Anonymous' by default.  \item
  'tpl.email': e-mail address of user to show on exported
  reports. Set to '' by default.  \item 'rapport.mode'
  definies the mode how \code{\link{rapport}} evaluates
  templates - by default it is set to \code{normal}. In
  \code{normal} mode \code{link{rapport}} would check all
  non-strict templates (see: \code{\link{tpl.check}})
  line-by-line which can have quite much overhead, while
  \code{performance} mode would not deal with cautious
  checks and evaluate all commands at once. That is not a
  problem if you use/write strict templates, which is
  really advised. \code{debug} mode is for developpers
  which will result in immediate `stop` of the run while
  hitting any "small error".  \item By default
  \code{\link{rapport}} saves plots to image files (see the
  settings below) and \code{print} method just shows a
  textual representation of the generated report with links
  to the files. If you would like to see the generated
  images in R console too, please modify
  \code{graph.record} and \code{graph.replay} options to
  \code{TRUE} before running \code{\link{rapport}} which
  would show all generated images after printing out a
  \code{rapport} object one by one. These options are set
  to \code{FALSE} by default although we find these
  settings realy handy: as you can resize the images on the
  fly and export resized images to HTML/odt/docx/pdf etc.
  If you would even like to save the actual environment of
  each generated plot (variables, data sets etc.) as an
  \code{RData} file, please set \code{graph.save.env} to
  \code{TRUE}.  \item \code{\link{rapport}} also has some
  options of course to set formatting stlye of numbers,
  characters and eg. date. The decimals needed for automtic
  rounding is defined by \code{rp.decimal} and
  {rp.decimal.short} which are by default set to \code{4}
  and \code{2}. Inline texts regularly use the short, while
  tables tend to use long form for rounded values. The
  decimal mark can be set easily to eg. \code{,} by
  \code{rp.decimal.mark}. The format of date can be
  specified in \code{rp.date.format} option (POSIX format).
  \item the exported graphs can be customized by several
  options too: \itemize{ \item The most basic option is
  \code{style.theme} which points to a
  \code{lattice}/\code{trellis} theme, by default to
  rapport custom theme: \code{\link{theme.rapport}}. If you
  do not like this minimalistic, a bit bluish them, you
  might consider using eg. \code{standard.theme()} from
  lattice, \code{ggplot2like()} or
  \code{theEconomist.theme()} from latticeExtra package or
  either \code{custom.theme.black()} from latticist
  package. Of course custom theme might be provided also,
  check out \code{?custom.theme} from latticeExtra package
  or head directly to: \code{?trellis.par.get()}.  \item
  \code{theme.rapport} can deal with a great number of
  color palettes. By default it uses \code{default} theme
  specified in \code{style.color.palette} option, which is
  a print- and blind-friendly colorset. Check out at:
  \url{http://jfly.iam.u-tokyo.ac.jp/color/}. Of course
  other palettes can be specified there, for a start check
  out \code{brewer.pal.info}. If you would like to get
  really colorful plots, you might consider setting
  \code{style.colorize} option to \code{TRUE} as it will
  choose random colors from given palette for each plot.
  \item By default \code{\link{rapport}} tries to generate
  images with Helvetica font family as being an OS
  independent but neat font. If you do not like that you
  may alter \code{style.font} option to something else.
  Note that you might need to initialize that font family
  before usage (especiall on Windows machines, see:
  \code{?windowsFonts}).  \item While most graph functions
  in rapport can decide if showing a grid in the background
  is a good idea or not, there is a global option for all
  other graph functions: \code{graph.grid}. It is possible
  to render a grid for \code{both}, only for \code{x} or
  solely to \code{y} axis. \code{none} results in a blank
  background.  \item The plots are saved to disk by
  \code{\link{rapport}}, which files can be customized with
  several options: \code{graph.format} sets the file type
  (png, jpg, bmp, tiff, svg or pdf), \code{graph.width} and
  \code{graph.height} set the required dimesions with
  \code{graph.res} nominal resolution in ppi. If you would
  export images to high resolution files too besides the
  above specified dimesion, set \code{graph.hi.res} to
  \code{TRUE}. That is really handy in HTML exports as the
  images get zoomable by click. Note: generating hi-res
  images have some overhead as plots are run twice.  }
  \item \code{\link{p}} function which concatenates vector
  values to a nicely formatted string have some handy
  global options too, which are to be modified in a
  localised environment. The separator between multiple
  items can be set by \code{p.sep} from which the last
  would be \code{p.copula}. Based on that I would eg. set
  \code{p.copula} to \code{és} for Hungarian templates.
  \item Developpers might be interested in the list of
  options in \code{rp.tags} which let users specify custom
  tags for \code{\link{rapport}}. By changing the default
  values you may create and use your own syntax for writing
  and using templates. }
}

