#' Add trailing and leading blank line
#'
#' Adds a line break before *and* after the character string(s).
#' @param x character vector
#' @export
add.blank.lines <- function(x)
    sprintf('\n%s\n', x)


#' Trim leading and trailing spaces
#' @param x character vector
#' @return character vector
#' @export
#' @seealso \code{\link{trim.space}}
trim.spaces <- function(x)
    gsub(sprintf('^[%s]+|[%s]+$', x, x), '', x)

#' Repeating chars
#'
#' Repeating a string \code{n} times and returning a concatenated character vector.
#' @param x string to repeat
#' @param n integer
#' @param sep separator between repeatitions
#' @return character vector
#' @export
rep.char <- function(x, n, sep = '')
    paste(rep.int(x, n), collapse = sep)

#' Add strong emphasis
#'
#' Pandoc style strong emphasis format (e.g. \code{**FOO**}) is added to character string.
#' @param x character vector
#' @return character vector
#' @export
#' @seealso \code{\link{pandoc.emphasis}} \code{\link{pandoc.strikeout}} \code{\link{pandoc.verbatim}}
#' @references John MacFarlane (2012): _Pandoc User's Guide_. \url{http://johnmacfarlane.net/pandoc/README.html}
pandoc.strong <- function(x)
    paste0('**', trim.spaces(x), '**')


#' Add emphasis
#'
#' Pandoc style emphasis format (e.g. \code{*FOO*}) is added to character string.
#' @param x character vector
#' @return character vector
#' @export
#' @seealso \code{\link{pandoc.strong}} \code{\link{pandoc.strikeout}} \code{\link{pandoc.verbatim}}
#' @references John MacFarlane (2012): _Pandoc User's Guide_. \url{http://johnmacfarlane.net/pandoc/README.html}
pandoc.emphasis <- function(x)
    paste0('*', trim.spaces(x), '*')


#' Add strikeout
#'
#' Pandoc style strikeout format (e.g. \code{~~FOO~~}) is added to character string.
#' @param x character vector
#' @return character vector
#' @export
#' @seealso \code{\link{pandoc.emphasis}} \code{\link{pandoc.strong}} \code{\link{pandoc.verbatim}}
#' @references John MacFarlane (2012): _Pandoc User's Guide_. \url{http://johnmacfarlane.net/pandoc/README.html}
pandoc.strikeout <- function(x)
    paste0('~~', trim.spaces(x), '~~')


#' Add verbatim
#'
#' Pandoc style verbatim format (e.g. \code{`FOO`}) is added to character string.
#' @param x character vector
#' @return character vector
#' @export
#' @seealso \code{\link{pandoc.emphasis}} \code{\link{pandoc.strikeout}} \code{\link{pandoc.strong}}
#' @references John MacFarlane (2012): _Pandoc User's Guide_. \url{http://johnmacfarlane.net/pandoc/README.html}
pandoc.verbatim <- function(x)
    paste0('`', trim.spaces(x), '`')


#' Create pandoc link
#' @param url hyperlink
#' @param text link text
#' @return character vector
#' @export
#' @examples
#' pandoc.link('http://r-project.org')
#' pandoc.link('http://r-project.org', 'R')
#' @references John MacFarlane (2012): _Pandoc User's Guide_. \url{http://johnmacfarlane.net/pandoc/README.html}
pandoc.link <- function(url, text = url)
    sprintf('[%s](%s)', text, url)


#' Create pandoc image tags
#'
#' Creates a pandoc style image hyperlink.
#' @param img image path
#' @param caption text
#' @return character vector
#' @export
#' @examples
#' pandoc.image('foo.png')
#' pandoc.image('foo.png', 'Nice image, huh?')
#' @references John MacFarlane (2012): _Pandoc User's Guide_. \url{http://johnmacfarlane.net/pandoc/README.html}
pandoc.image <- function(img, caption = '')
    sprintf('![%s](%s)', caption, img)


#' Create horizontal rule
#'
#' Creates a pandoc style horizontal line with trailing and leading newlines.
#' @return character vector
#' @export
#' @references John MacFarlane (2012): _Pandoc User's Guide_. \url{http://johnmacfarlane.net/pandoc/README.html}
pandoc.horizontal.rule <- function()
    add.blank.lines('---')


#' Create a list
#'
#' Creates a pandoc style list from provided character vector/list.
#' @param elements character vector of strings
#' @param style the required style of the list
#' @param loose adding a newline between elements
#' @param add.line.breaks adding a leading and trailing newline before/after the list
#' @param add.end.of.list adding a separator comment after the list
#' @param indent.level the level of ident
#' @return character vector
#' @export
#' @references John MacFarlane (2012): _Pandoc User's Guide_. \url{http://johnmacfarlane.net/pandoc/README.html}
#' @examples
#' ## basic lists
#' pandoc.list(letters[1:5])
#' cat(pandoc.list(letters[1:5]))
#' cat(pandoc.list(letters[1:5], 'ordered'))
#' cat(pandoc.list(letters[1:5], 'roman'))
#' cat(pandoc.list(letters[1:5], loose = TRUE))
#'
#' ## nested lists
#' l <- list("First list element", paste0(1:5, '. subelement'), "Second element", list('F', 'B', 'I', c('phone', 'pad', 'talics')))
#' cat(pandoc.list(l))
#' cat(pandoc.list(l, loose = TRUE))
#' cat(pandoc.list(l, 'roman'))
#' @importFrom utils as.roman
pandoc.list <- function(elements, style = c('bullet', 'ordered', 'roman'), loose = FALSE, add.line.breaks = TRUE, add.end.of.list = TRUE, indent.level = 0) {

    if (!is.logical(loose))
        stop('Wrong argument provided: loose')

    elements.l <- length(elements)
    style      <- match.arg(style)
    marker     <- switch(style,
                         'bullet'  = rep('* ', elements.l),
                         'ordered' = paste0(1:elements.l, '. '),
                         'roman'   = paste0(as.roman(1:elements.l), '. '))

    i.lag <- 0
    res <- ifelse(add.line.breaks, '\n', '')
    res <- paste(sapply(1:elements.l, function(i) {
        if (length(elements[[i]]) == 1) {
            paste0(paste(rep(' ', indent.level * 4), collapse = ''), marker[i-i.lag], elements[i])
        } else {
            i.lag <<- i.lag + 1
            pandoc.list(elements[[i]], style, loose, FALSE, FALSE, indent.level + 1)
        }
    }), collapse = '\n', ifelse(loose, '\n', ''))

    if (add.end.of.list)
        res <- paste0(res, ifelse(loose, '', '\n\n'), '<!-- end of list -->\n')
    if (add.line.breaks)
        res <- add.blank.lines(res)

    return(res)

}

#' Create a table
#'
#' Creates a pandoc style "grid" table with optional caption.
#'
#' This function will try to make pretty the provided R object's content like: rounding numbers, auto-recognizing if row names should be included etc.
#' @param t data frame, matrix or table
#' @param caption string
#' @param digits see \code{prettyNum}
#' @param decimal.mark see \code{prettyNum}
#' @param justify see \code{prettyNum}
#' @return character vector
#' @note Pandoc does not support justify parameter for grid tables ATM. ## TODO: multiline?
#' @export
#' @references John MacFarlane (2012): _Pandoc User's Guide_. \url{http://johnmacfarlane.net/pandoc/README.html}
#' @examples
#' cat(pandoc.table(mtcars))
#'
#' ## caption
#' cat(pandoc.table(mtcars, 'Motor Trend Car Road Tests'))
#'
#' ## other input/output formats
#' cat(pandoc.table(mtcars, decimal.mark = ','))
#' cat(pandoc.table(mtcars, decimal.mark = ',', justify = 'right'))
#' cat(pandoc.table(matrix(sample(1:1000, 25), 5, 5)))
#' cat(pandoc.table(matrix(runif(25), 5, 5)))
#' cat(pandoc.table(matrix(runif(25), 5, 5), digits = 5))
#' cat(pandoc.table(table(mtcars$am, mtcars$gear)))
#' cat(pandoc.table(table(state.division, state.region)))
#' cat(pandoc.table(table(state.division, state.region), justify = 'centre'))
#'
#' m <- data.frame(a=c(1, -500, 10320, 23, 77), b=runif(5), c=c('a', 'bb', 'ccc', 'dddd', 'eeeee'))
#' cat(pandoc.table(m))
#' cat(pandoc.table(m, justify = c('right', 'left', 'centre')))
pandoc.table <- function(t, caption, digits = 2, decimal.mark = '.', justify = 'left') {

    ## helper functions
    table.sep  <- function(cols.width, sep = '+')
        paste0(sep, paste(sapply(cols.width+2, function(x) rep.char('-', x)), collapse = sep), sep)

    table.expand <- function(cells, cols.width, justify) {

        df  <- data.frame(txt = cells, width = cols.width, justify = justify)
        res <- apply(df, 1, function(x) format(x[1], justify = x[3], width = x[2]))
        paste0('| ', paste(res, collapse = ' | '), ' |')

    }

    ## intializing result
    res <- '\n'

    ## format numerics & convert to string
    t <- format(t, trim = TRUE, digits = digits, decimal.mark = decimal.mark)

    ## TODO: adding formatting (emphasis, strong etc.)

    ## helper variables
    t.colnames  <- colnames(t)
    t.width     <- as.numeric(apply(cbind(nchar(t.colnames), apply(t, 2, function(x) max(nchar(x)))), 1, max))
    t.rownames  <- rownames(t)

    ## remove obvoius row.names
    if (all(rownames(t) == 1:nrow(t)))
        t.rownames <- NULL

    if (length(t.rownames) != 0) {

        t.colnames <- c('', t.colnames)
        t.width <- c(max(nchar(t.rownames)), t.width)

    }

    if (length(justify) != 1) {
        if (length(t.rownames) != 0)
            if (length(justify) != length(t.width))
                stop('Wrong number of parameters passed: justify')
    } else {
        justify <- rep(justify, length(t.width))
    }

    t.sep <- table.sep(t.width)

    ## header
    if (length(t.colnames) != 0) {
        res <- paste(res, t.sep, table.expand(t.colnames, t.width, justify[1]), gsub('-', '=', t.sep), sep = '\n')
    } else {
        res <- paste(res, t.sep, sep = '\n')
    }

    ## body
    res <- paste0(res, '\n')
    b   <- t
    if (length(t.rownames) != 0)
        b <- cbind(t.rownames, b)
    res <- paste0(res, paste(apply(b, 1, function(x) paste(table.expand(x, t.width, justify), t.sep, sep = '\n')), collapse = '\n'))

    res <- paste0(res, '\n\n')

    ## (optional) caption
    if (!missing(caption))
        res <- sprintf('%s    Table: %s\n\n', res, caption)

    return(res)

}
