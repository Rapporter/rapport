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
#'          \item \code{\%n}: an auto-increment integer based on similar (plot) file names (see: \code{?evalsOptions}),
#'          \item \code{\%N}: an auto-increment integer based on similar exported document's file name
#'      }
#'     \item \code{rp.file.path}: a directory where generated images and exported documents would take place.
#'     \item By default \code{\link{rapport}} function saves plots to image files (see the settings in \code{evalsOptions()}) and \code{print} method just shows the path(s) of the generated image(s). If you would like to see the plot(s) when calling \code{\link{rapport}} function from an interactive R console, please set \code{evalsOptions('graph.recordplot')} and \code{graph.replay} options to \code{TRUE} beforehand. In that case all generated plots will be displayed after printing the \code{rapport} object. These options are set to \code{FALSE} by default although we find these settings really handy, as you can resize the images on the fly and export resized images to HTML/ODT/DOCX/PDF etc. If you would even like to save the actual environment of each generated plot (variables, data sets etc.) as an \code{RData} file, please set \code{evalsOptions('graph.env')} to \code{TRUE}.
#'     \item \code{\link{rapport}} also has some options to set formatting style of numbers, characters and dates specified in \code{panderOptions()}
#'     \item the exported graphs can be customised via further \code{panderOptions}
#'}
#' @docType package
#' @importFrom reshape melt melt.data.frame melt.table cast
#' @seealso \code{pander} package: \url{http://rapporter.github.com/pander/}
#' @name rapport-package
NULL
