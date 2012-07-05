#' Check Template
#'
#' Checks if the examples of given template can be run without any error.
#'
#' If everything went fine and you get a list of \code{success} equals to \code{TRUE} values, otherwise \code{success} returns \code{FALSE} with additional \code{message}
#' @param fp a character vector containing template name (".tpl" extension is optional), file path or a text to be split by line breaks
#' @export
#' @examples \dontrun{
#' tpl.check('example')
#' }
tpl.check <- function(fp) {

    examples <- tryCatch(tpl.example(fp, 'all'), error = function(e) e$message)

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
