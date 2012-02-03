##
## will merge/move to template.R after finishing/polishing it
## TODO: revise returned text messages :)

#' Check Template
#'
#' Checks if the examples of given template can be run without any error and if the same output would be returned by calling the template in "strict" mode.
#'
#' Strict mode is a huge performance gain (principally with nested templates where the overhead of extra checks lead to exponential slowdown with every level of nested hierarchy) based on \code{evals}' \code{check.output} parameter: no checks would be performed on template body about outputs. Thanks to this, strict mode templates should be written considering the following requirements:
#'
#' \itemize{
#'     \item each block should return on the last line of the code,
#'     \item each block should always return something on the last line (if you do not want to return anything, add \code{NULL} to the last line),
#'     \item ggplot and lattice graphs should be always printed (of course on the last line),
#'     \item a block resulting in a plot should not alter variables and data sets,
#'     \item the template should be checked before live run with \code{tpl.check}.
#' }
#'
#' \code{tpl.check} will print on the console some text messages about the result of the test (errors etc.), but will also return a \code{list} invisible. List elements:
#'
#' \itemize{
#'     \item run: if all blocks could run without error (TRUE/FALSE),
#'     \item strict: if rapport in "performance" (strict) mode returns the same output (TRUE/FALSE).
#' }
#'
#' If everything went fine and you get two \code{TRUE} values, update your template to use "performance" mode on default by adding "Strict: TRUE" to template header.
#' @param fp a character vector containing template name (".tpl" extension is optional), file path or a text to be split by lines
#' @return list of logicals - see details above
#' @export
#' @examples \dontrun{
#' tpl.check('example')
#' }
tpl.check <- function(fp) {
    rapport.mode <- getOption('rapport.mode')
    options('rapport.mode' = 'normal')
    examples <- tryCatch(tpl.example(fp, 'all'), error = function(e) e$message)
    options('rapport.mode' = rapport.mode)
    if (is.character(examples)) {
        cat(sprintf('\nErrors found while running all examples in "%s": %s\n', fp, examples))
        return(invisible(list(run = FALSE, strict = FALSE)))
    }
    examples <- capture.output(examples)
    errors <- grepl('<ERROR>', examples)
    if (any(errors)) {
        cat(sprintf('\n%s errors found while running all examples in "%s". See warnings():\n\n', sum(errors), fp))
        return(invisible(list(run = FALSE, strict = FALSE)))
    }
    options('rapport.mode' = 'performance')
    examples.performance <- tryCatch(tpl.example(fp, 'all'), error = function(e) e$message)
    options('rapport.mode' = rapport.mode)
    if (is.character(examples.performance)) {
        cat(sprintf('\nErrors found while running all examples in "%s" (strict mode): %s\n', fp, examples.performance))
        return(invisible(list(run = TRUE, strict = FALSE)))
    }
    examples.performance <- tryCatch(capture.output(examples.performance), error = function(e) e$message)
    if (all(examples.performance == "ggplot2 and trellis objects must be printed in strict mode!")) {
        cat(sprintf('\n"%s" template examples run without error, but it does not support strict mode: "%s"\n', fp, examples.performance))
        return(invisible(list(run = TRUE, strict = FALSE)))
    }
    errors <- grepl('<ERROR>', examples.performance)
    if (any(errors)) {
        cat(sprintf('\n"%s" template examples run without error, but it does not support strict mode: %s errors found while running all examples in strict mode. See warnings():\n\n', fp, sum(errors)))
        return(invisible(list(run = TRUE, strict = FALSE)))
    }
    examples <- gsub('.*.png$', '<IMAGE HERE>', examples)
    examples.performance <- gsub('.*.png$', '<IMAGE HERE>', examples.performance)
    res <- identical(examples, examples.performance)
    if (res) {
        cat(sprintf('\n"%s" template examples run without error - even in strict mode, which resulted in the same output compared to normal run.\nConsider adding "Strict: TRUE" line to template header!\n\n', fp))
        return(invisible(list(run = TRUE, strict = TRUE)))
    } else {
        cat(sprintf('\n"%s" template examples run without error, but it does not support strict mode!\n\n', fp))
        return(invisible(list(run = TRUE, strict = FALSE)))
    }
}
