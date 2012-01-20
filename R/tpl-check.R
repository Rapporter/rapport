##
## will merge/move to tempalte.R after I finish it

tpl.check <- function(fp) {
    examples <- tryCatch(tpl.example(fp), error = function(e) e$message)
    if (is.character(examples))
        stop(examples)
    errors <- grepl('<ERROR>', capture.output(examples))
    if (any(errors)) {
        cat(sprintf('\n%s errors found while running all examples in "%s". See warnings():\n\n', sum(errors), fp))
        return(invisible(FALSE))
    }
    ## TODO: check strict mode with rapport, like running the examples in "normal" and forced "performance" mode | identical
    cat(sprintf('\nWow, "%s" rocks!\n\n', fp))
    return(invisible(TRUE))
}

