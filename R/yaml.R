#' Convert to YAML
#'
#' A simple method to convert various (err: a few) R objects to YAML syntax.
#' @param o R object
#' @param indent.level indentation level
#' @return string
#' @export
toYAML <- function(o, indent.level = 0)
    UseMethod('toYAML', o)


#' @export
toYAML.list <- function(o, indent.level = 0) {

    ol  <- length(o)
    res <- paste(sapply(1:ol, function(i) {
        res   <- ''
        if (!is.null(names(o[i])) && (names(o[i]) != '')) {
            res <- paste0(res, paste(rep(' ', indent.level * 2), collapse = ''), names(o[i]), ':')
            if (length(o[[i]]) <= 1 && !is.list(o[[i]]))
                res <- paste(res, toYAML(o[[i]], indent.level + 1), '\n')
            else
                res <- paste0(res, '\n', toYAML(o[[i]], indent.level + 1))
        } else {
            res <- paste0(res, paste(rep(' ', max(indent.level - 1, 0) * 2), collapse = ''), '- ')
            if (length(o[[i]]) <= 1)
                res <- paste0(res, paste(rep(' ', indent.level * 2), collapse = ''), o[i], '\n')
            else
                res <- paste0(res, toYAML(o[[i]][1], (indent.level - 1)), toYAML(o[[i]][2:length(o[[i]])], indent.level))
        }
        res
    }), collapse = '')

    res

}


#' @export
toYAML.numeric <- function(o, indent.level = 0) {

    if (length(o) == 0)
        return('[]')

    if (length(o) == 1)
        return(o)

    paste0(paste(sapply(o, function(x) paste0(paste(rep(' ', (indent.level - 1) * 2), collapse = ''), '- ', x)), collapse = '\n'), '\n')

}


#' @export
toYAML.character <- toYAML.numeric


#' @export
toYAML.NULL <- function(o, indent.level = 0)
    return('~')


#' @export
toYAML.logical <- function(o, indent.level = 0)
    toYAML(as.character(o, indent.level))


#' @export
toYAML.default <- function(o, indent.level = 0) {

    class(o) <- 'list'
    toYAML(o, indent.level)

}
