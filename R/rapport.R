#' \emph{rapport}: an R engine for reproducible template generation
#'
#' \emph{rapport} is an R package that facilitates creation of reproducible statistical report templates. Once created, \emph{rapport} templates can be exported to various external formats: \emph{HTML}, \emph{LaTeX}, \emph{PDF}, \emph{ODT}, etc.
#'
#' For detailed introductions please check out our homepage: \url{http://rapport-package.info}.
#'
#' You may use the package-bundled templates with a minimal R knowledge - a quick tutorial is shown in the package demo: \code{demo(rapport, ask = FALSE)}.
#'
#' Apart from R, all you need to know to start writing your own templates is \emph{Pandoc}'s markup syntax, and several \emph{rapport}-specific conventions that allow the reproducible of the template. \emph{rapport} uses \emph{brew}-like tags to support dynamic inline and/or block evaluation of R code. Unlike many other report-writing conventions in R (\emph{Sweave}, \emph{brew}, \emph{knitr}), \emph{rapport} converts generated output to a convenient form via \emph{pander} package and \code{pandoc} as the document converting backend. \emph{rapport} also comes with support for plots: images are automatically saved to temporary file, and image path is returned or redrawn on demand.
#'
#' The output of \code{rapport} command depends on various package-specific options. Please skim through the summary of following options:
#'
#' \itemize{
#'     \item \code{tpl.user}: a (user)name to show in exported report (defaults to \code{"Anonymous"})
#'     \item \code{rp.file.name}: a general filename of generated images and exported documents without extension. Some helper pseudo-code would be replaced with handy strings while running \code{\link{rapport}} and \code{\link{tpl.export}}:
#'      \itemize{
#'          \item \code{\%t}: unique random character strings based on \code{\link{tempfile}},
#'          \item \code{\%T}: template name in action,
#'          \item \code{\%n}: an auto-increment integer based on similar (plot) file names (see: \code{?evals.option}),
#'          \item \code{\%N}: an auto-increment integer based on similar exported document's file name
#'      }
#'     \item \code{rp.file.path}: a directory where generated images and exported documents would take place.
#'     \item By default \code{\link{rapport}} function saves plots to image files (see the settings in \code{evals.option()}) and \code{print} method just shows the path(s) of the generated image(s). If you would like to see the plot(s) when calling \code{\link{rapport}} function from an interactive R console, please set \code{evals.option('graph.recordplot')} and \code{graph.replay} options to \code{TRUE} beforehand. In that case all generated plots will be displayed after printing the \code{rapport} object. These options are set to \code{FALSE} by default although we find these settings really handy, as you can resize the images on the fly and export resized images to HTML/ODT/DOCX/PDF etc. If you would even like to save the actual environment of each generated plot (variables, data sets etc.) as an \code{RData} file, please set \code{evals.option('graph.env')} to \code{TRUE}.
#'     \item \code{\link{rapport}} also has some options to set formatting style of numbers, characters and dates specified in \code{pander.option()}
#'     \item the exported graphs can be customised via following options:
#'     \itemize{
#'         \item The most basic option is \code{style.theme} which points to a \code{\link{lattice}}/\code{trellis} theme, and uses default \emph{rapport} theme: \code{\link{theme.rapport}}. If you do not like this minimalistic bluish theme, you might reconsider using e.g. \code{standard.theme()} from \code{lattice}, \code{ggplot2like()} or \code{theEconomist.theme()} themes available in \code{latticeExtra} package or either \code{custom.theme.black()} from \code{latticist} package. Of course, custom theme might be provided too - check out the \code{?custom.theme} from \code{latticeExtra} package or head directly to: \code{\link{trellis.par.get}}.
#'         \item \code{theme.rapport} can deal with a great number of colour palettes. By default it uses \code{default} theme specified in \code{style.color.palette} option, which is both print and colourblind-friendly palette (visit \url{http://jfly.iam.u-tokyo.ac.jp/color/} for details). Of course, other palettes can be specified there, just check out \code{\link{brewer.pal.info}}. If you would like to get really colourful plots, you might consider setting \code{style.colorize} option to \code{TRUE} as it will choose random colours from a given palette for each plot.
#'         \item By default \code{\link{rapport}} tries to generate images with Helvetica font family as it's a neat, OS independent font. If you don't like that, you can change the \code{style.font} option. Note that you might need to set the font family afterwards, especially on Windows machines (see \code{windowsFonts} for details).
#'         \item While the most graph functions in \emph{rapport} can "decide" if showing a grid in the background is a good idea or not, there is a global option for all other graph functions: \code{graph.grid}. It is possible to render a grid for both axes (\code{"both"}) or separate axes only (\code{"x"} or \code{"y"}). \code{"none"} results in a blank background.
#'         \item The plots are saved to disk with \code{\link{rapport}} function, and the resulting files can be customised with several options in \code{evals.option()}.
#'         \item And there are also other options (e.g. affecting the cache), for full details check out:
#'         \itemize{
#'              \item \code{rapport.option} - TODO,
#'              \item \code{pander.option},
#'              \item \code{evals.option}
#' }
#'     }
#' }
#' @docType package
#' @importFrom reshape melt melt.data.frame melt.table cast
#' @importFrom RColorBrewer brewer.pal brewer.pal.info
#' @seealso \code{pander} package: \url{http://daroczig.github.com/pander/}
#' @name rapport-package
NULL
