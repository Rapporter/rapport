#' Check Rapport Template
#'
#' Checks if the examples of given template can be run without any error.
#'
#' If everything went fine and you get a list of \code{success} equals to \code{TRUE} values, otherwise \code{success} returns \code{FALSE} with additional \code{message}
#' @param fp a character vector containing template name (".rapport" extension is optional), file path or a text to be split by line breaks
#' @export
#' @aliases tpl.check rapport.check.template
#' @examples \dontrun{
#' rapport.check.template('Example')
#' }
rapport.check.template <- function(fp) {

    examples <- tryCatch(rapport.example(fp, 'all'), error = function(e) e$message)

    if (is.character(examples))
        return(list(success = FALSE, message = sprintf('Errors found while running all examples: `%s`', examples)))

    errors <- NULL
    if (class(examples) == 'rapport')
        examples <- list(examples)
    for (example in examples)
        for (part in example$report) {
            if (part$type == 'block')
                errors <- c(errors, part$robject$msg$errors)
            else
                errors <- c(errors, part$msg$errors)
        }

    if (!is.null(errors))
        return(list(success = FALSE, message = sprintf('%s errors found while running examples: %s', length(errors), p(errors, wrap = '`'))))

    return(list(success = TRUE))
}
#' @export
tpl.check <- rapport.check.template

#' Check Report Chunks
#'
#' Checks for warnings and errors in report chunks.
#' @param rp \code{rapport} object
#' @param what what fields to check. defaults to all
check.report.chunks <- function(rp, what = c('errors', 'warnings', 'messages')) {
    stopifnot(is.rapport(rp))
    msg.type <- match.arg(what, several.ok = TRUE)
    chunks <- lapply(rp$report, function(chunk) {
        res <- list(
            type = chunk$type
            )
        if (chunk$type == 'block') {
            res$src <- chunk$robject$src
            res$msg <- chunk$robject$msg[msg.type]
        } else {
            res$src <- chunk$text$raw
            res$msg <- chunk$msg[msg.type]
        }
        if (!all(sapply(res$msg, is.null)))
            res
    })
    res <- chunks[!sapply(chunks, is.null)]
    if (length(res))
        res
}
