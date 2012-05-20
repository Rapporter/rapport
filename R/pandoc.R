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
    sprintf('^[%s]+|[%s]+$', x, x)


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
#' @note No nested lists are supported ATM!
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
