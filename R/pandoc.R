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
#' @return character vector
#' @export
#' @references John MacFarlane (2012): _Pandoc User's Guide_. \url{http://johnmacfarlane.net/pandoc/README.html}
pandoc.horizontal.rule <- function()
    add.blank.lines('---')


#' Create a list
#' @param elements character vector of strings
#' @param style the required style of the list
#' @param loose boolean: if adding a newline between elements
#' @return character vector
#' @export
#' @references John MacFarlane (2012): _Pandoc User's Guide_. \url{http://johnmacfarlane.net/pandoc/README.html}
#' @examples
#' pandoc.list(letters[1:5])
#' cat(pandoc.list(letters[1:5]))
#' cat(pandoc.list(letters[1:5], 'ordered'))
#' cat(pandoc.list(letters[1:5], 'roman'))
#' cat(pandoc.list(letters[1:5], loose = TRUE))
#' @note No nested lists are supported ATM!
#' @importFrom utils as.roman
pandoc.list <- function(elements, style = c('bullet', 'ordered', 'roman'), loose = FALSE) {

    if (!is.logical(loose))
        stop('Wrong argument provided: loose')

    elements.l <- length(elements)
    style      <- match.arg(style)
    marker     <- switch(style,
                         'bullet'  = rep('* ', elements.l),
                         'ordered' = paste0(1:elements.l, '. '),
                         'roman' = paste0(as.roman(1:elements.l), '. '))

    res <- '\n\n'
    res <- paste(sapply(1:elements.l, function(i) paste0(marker[i], elements[i])), collapse = '\n', ifelse(loose, '\n', ''))

    ## TODO: add nested lists!

    res <- c(res, '<!-- end of list -->\n')
    add.blank.lines(res)

}
