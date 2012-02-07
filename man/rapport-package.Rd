\docType{package}
\name{rapport-package}
\alias{rapport-package}
\title{\emph{rapport}: an R engine for reproducible template generation}
\description{
  \emph{rapport} is an R package that facilitates creation
  of reproducible statistical report templates. Once
  created, \emph{rapport} templates can be exported to
  various external formats: \emph{HTML}, \emph{LaTeX},
  \emph{PDF}, \emph{ODT}, etc.
}
\details{
  For detailed introductions please check out our homepage:
  \url{http://rapport-package.info}.

  You may use the package-bundled templates with a minimal
  R knowledge - a quick tutorial is shown in the package
  demo: \code{demo(rapport)}.

  Apart from R, all you need to know to start writing your
  own templates is \emph{pandoc} markup syntax, and several
  \emph{rapport}-specific conventions that allow the
  reproducibility of the template. \emph{rapport} uses
  \emph{brew}-like tags to support dynamic inline and/or
  block evaluation of R code. Unlike many other
  report-writing conventions in R (\emph{Sweave},
  \emph{brew}, \emph{knitr}), \emph{rapport} converts
  generated output to a convenient form via \emph{ascii}
  package and appropriate preprocessing backend tools.
  \emph{rapport} also comes with support for plots: images
  are automatically saved to temporary file, and image path
  is returned or redrawn on demand.

  The output of \code{rapport} command depends on various
  package-specific options. Please skim through the summary
  of following options:

  \itemize{ \item \code{tpl.user}: a (user)name to show in
  exported report (defaults to \code{"Anonymous"}) \item
  \code{tpl.email}: a user's e-mail address to show in
  exported report (defaults to an empty string).  \item
  \code{rapport.mode} defines the manner in which
  \code{\link{rapport}} evaluates the templates - by
  default it is set to \code{normal}. In \code{normal} mode
  \code{link{rapport}} would check all non-strict templates
  (see: \code{\link{tpl.check}}) "linewise", and that can
  cause huge overhead, while \code{performance} mode would
  not perform cautious checks and evaluate all commands at
  once. That is not a problem if you write \code{strict}
  templates, which is really advised. \code{debug} mode is
  appropriate for developers, as it will interrupt the
  execution if template contains any errors.  \item By
  default \code{\link{rapport}} function saves plots to
  image files (see the settings below) and \code{print}
  method just shows the path(s) of the generated image(s).
  If you would like to see the plot(s) when calling
  \code{\link{rapport}} function from an interactive R
  console, please set \code{graph.record} and
  \code{graph.replay} options to \code{TRUE} beforehand. In
  that case all generated plots will be displayed after
  printing the \code{rapport} object. These options are set
  to \code{FALSE} by default although we find these
  settings really handy, as you can resize the images on
  the fly and export resized images to HTML/ODT/DOCX/PDF
  etc. If you would even like to save the actual
  environment of each generated plot (variables, data sets
  etc.) as an \code{RData} file, please set
  \code{graph.save.env} to \code{TRUE}.  \item
  \code{\link{rapport}} also has some options to set
  formatting style of numbers, characters and dates. The
  decimals needed for automatic rounding is defined in
  \code{rp.decimal} and \code{rp.decimal.short} options
  which are by default set to \code{4} and \code{2},
  respectively. Inline numeric values are presented in a
  short form, while the tables use the long form. The
  decimal mark can be set easily to e.g. \code{","} in
  \code{rp.decimal.mark} option, and the date format can be
  specified in POSIX format via \code{rp.date.format}
  option.  \item the exported graphs can be customised via
  following options: \itemize{ \item The most basic option
  is \code{style.theme} which points to a
  \code{\link{lattice}}/\code{trellis} theme, and uses
  default \emph{rapport} theme:
  \code{\link{theme.rapport}}. If you do not like this
  minimalistic bluish theme, you might reconsider using
  e.g. \code{standard.theme()} from \code{lattice},
  \code{ggplot2like()} or \code{theEconomist.theme()}
  themes available in \code{latticeExtra} package or either
  \code{custom.theme.black()} from \code{latticist}
  package. Of course, custom theme might be provided too -
  check out the \code{?custom.theme} from
  \code{latticeExtra} package or head directly to:
  \code{\link{trellis.par.get}}.  \item
  \code{theme.rapport} can deal with a great number of
  colour palettes. By default it uses \code{default} theme
  specified in \code{style.color.palette} option, which is
  both print and colourblind-friendly palette (visit
  \url{http://jfly.iam.u-tokyo.ac.jp/color/} for details).
  Of course, other palettes can be specified there, just
  check out \code{\link{brewer.pal.info}}. If you would
  like to get really colourful plots, you might consider
  setting \code{style.colorize} option to \code{TRUE} as it
  will choose random colours from a given palette for each
  plot.  \item By default \code{\link{rapport}} tries to
  generate images with Helvetica font family as it's a
  neat, OS independent font. If you don't like that, you
  can change the \code{style.font} option. Note that you
  might need to set the font family afterwards, especially
  on Windows machines (see \code{windowsFonts} for
  details).  \item While the most graph functions in
  \emph{rapport} can "decide" if showing a grid in the
  background is a good idea or not, there is a global
  option for all other graph functions: \code{graph.grid}.
  It is possible to render a grid for both axes
  (\code{"both"}) or separate axes only (\code{"x"} or
  \code{"y"}). \code{"none"} results in a blank background.
  \item The plots are saved to disk with
  \code{\link{rapport}} function, and the resulting files
  can be customised with several options: \itemize{ \item
  \code{graph.format} option holds the plot output format:
  \code{"png"}, \code{"jpg"}, \code{"bmp"}, \code{"tiff"},
  \code{"svg"} or \code{"pdf"} \item \code{graph.width} and
  \code{graph.height} options hold settings for plot width
  and height, respectively \item \code{graph.res} sets the
  default resolution in points per inch (\code{ppi}). If
  you would like to export images to high resolution
  regardless of the specified dimensions, set
  \code{graph.hi.res} option to \code{TRUE}. That can be
  really handy in HTML exports as the images get "zoomable"
  on click. Note: generating high resolution images has
  some overhead as plots are generated twice.  } } \item
  \code{\link{p}} function concatenates vector values to a
  nicely formatted string by using the values from global
  options (see help page for \code{p} for details).  \item
  Developers might find the list of options in
  \code{rp.tags} interesting, as it lets users to specify
  custom tags for \code{\link{rapport}} chunks. By changing
  the default values you may create custom reports and use
  your own syntax in custom templates. }
}

