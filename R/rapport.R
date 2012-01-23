#' rapport: An R engine for reproducible template generation
#'
#' \emph{rapport} is an R package that facilitates creation of reproducible statistical report templates. Once created, \emph{rapport} templates can be exported to various external formats: \emph{HTML}, \emph{LaTeX}, \emph{PDF}, \emph{ODT}, etc. Apart from R, all you need to know to start writing your own templates is \emph{pandoc} markup syntax, and several \emph{rapport}-specific conventions that allow the reproducibility of the template. \emph{rapport} uses \emph{brew}-like tags to support dynamic inline and/or block evaluation of R code. Unlike many other report-writing conventions in R (\emph{Sweave}, \emph{brew}), \emph{rapport} converts generated output in a convenient form via \emph{acii} function. \emph{rapport} also comes with support for plots: images are automatically saved to temporary file, and image path is returned.
#'
#' @docType package
#' @name rapport
#' @aliases rapport-package
NULL
