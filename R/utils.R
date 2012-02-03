#' Strings
#'
#' Checks if provided object is a string i.e. a length-one character vector.
#' @param x an object to check
#' @return a logical value indicating whether provided object is a string
#' @examples
#'     is.string("foobar")          # [1] TRUE
#'     is.string(1)                 # [1] FALSE
#'     is.string(c("foo", "bar"))   # [1] FALSE
#' @export
is.string <- function(x){

    is.character(x) && length(x) == 1
}


#' Numbers
#'
#' Checks if provided object is a number, i.e. a length-one numeric vector.
#' @param x an object to check
#' @return a logical value indicating whether provided object is a string
#' @examples
#' is.number(3)              # [1] TRUE
#' is.number(3:4)            # [1] FALSE
#' is.number("3")            # [1] FALSE
#' is.number(NaN)            # [1] TRUE
#' is.number(NA_integer_)    # [1] TRUE
#' @export
is.number <- function(x){
    is.numeric(x) && length(x) == 1
}


#' Check integers
#'
#' This function tests if given variable "appears" to be an integer. To qualify as such, two conditions need to be satisfied: it should be stored as \code{\link{numeric}} object, and it should pass regular expression test if it consists only of digits.
#' @param x a numeric variable that is to be tested
#' @return a logical value that indicates that tested variable "looks like" integer
#' @export
alike.integer <- function(x){

    if (missing(x))
        stop('no object to test integer')

    is.numeric(x) & all(grepl('^-?[[:digit:]]+$', x))
}


#' Check plot creation
#'
#' This function checks if given expression generates a plot.
#' @param cmd an expression that is to be tested
#' @return a logical value
#' @references See original thread for more details (\url{http://stackoverflow.com/a/2744434/457898}). Special thanks to Hadley Wickham for this one!
#' @author Hadley Wickham <h.wickham@@gmail.com>
#' @examples \dontrun{
#'     makes.plot(plot(rnorm(100))) # returns TRUE
#'     makes.plot(sample(10))       # returns FALSE
#' }
#' @export
makes.plot <- function(cmd){

    before <- .Internal(getSnapshot())
    force(cmd)
    after <- .Internal(getSnapshot())
    dev.off()
    !identical(before, after)
}


#' Trim Spaces
#'
#' Removes leading and/or trailing space(s) from a character vector value. By default, it removes only trailing spaces. In order to trim both leading and trailing spaces, pass \code{TRUE} to both \code{leading} and \code{trailing} arguments.
#' @param x a character vector which needs whitespace trimming
#' @param leading a logical value indicating if leading spaces should be removed (defaults to \code{FALSE})
#' @param trailing a logical value indicating if trailing spaces should be removed (defaults to \code{TRUE})
#' @param re a character value containing a regex that defines a space character
#' @param ... additional arguments for \code{\link{gsub}} function
#' @return a character vector with removed spaces
#' @export
trim.space <- function(x, leading = FALSE, trailing = TRUE, re = '[:space:]', ...){

    if (missing(x))
        stop('no string to trim spaces')

    if (leading == FALSE & trailing == FALSE)
        stop("it looks like you don't want to trim those spaces, don't you?")

    if (leading == TRUE & trailing == FALSE)
        re <- sprintf('^+[%s]', re)

    if (leading == FALSE & trailing == TRUE)
        re <- sprintf('[%s]+$', re)

    if (leading == TRUE & trailing == TRUE)
        re <- sprintf('^[%s]+|[%s]+$', re, re)

    gsub(re, '', x, ...)
}


#' Adjacent Values Run Length Encoding
#'
#' Similar to \code{\link{rle}} function, this function detects "runs" of adjacent integers, and displays vector of run lengths and list of corresponding integer sequences.
#' @param x a numeric vector with
#' @return a list with two elements: vector of run lengths, and another list of values corresponding to generated sequences' lengths.
#' @author Gabor Grothendieck <ggrothendieck@@gmail.com>
#' @references See original thread for more details \url{http://stackoverflow.com/a/8467446/457898}. Special thanks to Gabor Grothendieck for this one!
#' @export
adj.rle <- function(x){

    s <- split(x, cumsum(c(0, diff(x) != 1)))
    run.info <- list(lengths = unname(sapply(s, length)), values = unname(s))
    return (run.info)
}


#' Concatenate with newline
#'
#' A simple wrapper for \code{\link{cat}} function that appends newline to output.
#' @param ... arguments to be passed to \code{cat} function
#' @return None (invisible ‘NULL’).
#' @export
catn <- function(...){
    cat(..., "\n")
}


#' Vectorised String Replacement
#'
#' A simple wrapper for \code{\link{gsub}} that replaces all patterns from \code{pattern} argument with ones in \code{replacement} over vector provided in argument \code{x}.
#' @param pattern see eponymous argument for \code{\link{gsub}} function
#' @param replacement see eponymous argument for \code{\link{gsub}} function
#' @param x see eponymous argument for \code{\link{gsub}} function
#' @param ... additional arguments for \code{\link{gsub}} function
#' @references See original thread for more details \url{http://stackoverflow.com/a/6954308/457898}. Special thanks to user Jean-Robert for this one!
#' @return a character vector with string replacements
#' @export
vgsub <- function(pattern, replacement, x, ...){
    for(i in 1:length(pattern))
        x <- gsub(pattern[i], replacement[i], x, ...)
    x
}


#' CamelCase
#'
#' Convert character vector to camelcase - capitalise first letter of each word.
#' @param x a character vector to be converted to camelcase
#' @param sep a string containing regular expression word delimiter
#' @param upper a logical value indicating if the first letter of the first word should be capitalised (defaults to \code{FALSE})
#' @param ... additional arguments to be passed to \code{strsplit}
#' @return a character vector with strings put in camelcase
#' @examples
#'     tocamel("foo.bar")
#'     ## [1] "fooBar"
#'
#'     tocamel("foo.bar", upper = TRUE)
#'     ## [1] "FooBar"
#'
#'     tocamel(c("foobar", "foo.bar", "camel_case", "a.b.c.d"))
#'     ## [1] "foobar"    "fooBar"    "camelCase" "aBCD"
#' @export
tocamel <- function(x, sep = '[^[:alnum:]]', upper = FALSE, ...){

    stopifnot(is.character(x))
    stopifnot(is.string(sep))

    s <- strsplit(x, sep, ...)

    ## TODO: first.case = FALSE by default
    sapply(s, function(y){
        first <- substring(y, 1, 1)
        if (isTRUE(upper))
            first <- toupper(first)
        else
            first[-1] <- toupper(first[-1])
        paste(first, substring(y, 2), sep = '', collapse = '')
    })
}


#' Capitalise String
#'
#' Capitalises strings in provided character vector
#' @param x a character vector to capitalise
#' @return character vector with capitalised string elements
#' @examples
#' capitalise(c("foo", "bar")) # [1] "Foo" "Bar"
#' @export
capitalise <- function(x){

    stopifnot(is.character(x))

    s <- strsplit(x, '', '')

    sapply(s, function(x){
        paste(toupper(x[1]), paste(x[2:length(x)], collapse = ''), collapse = '', sep = '')
    })
}


#' Guess Mode
#'
#' "Guesses" a mode of provided character vector and converts it to appropriate mode.
#' @param x an atomic vector to guess its mode
#' @param trim.white a logical value indicating whether white spaces should be removed before guessing
#' @return an atomic vector with (hopefully) successfully guessed mode
#' @examples \dontrun{
#' guess.convert("234")
#' guess.convert("234.23")
#' guess.convert("234.23.234")
#' guess.convert("TRUE")
#' guess.convert("TRUE         ")
#' guess.convert("     TRUE         ", TRUE)
#' }
#' @export
guess.convert <- function(x, trim.white = FALSE){
    ## you can't polish a turd, write a new one!!!

    stopifnot(is.vector(x, 'character'))

    if (isTRUE(trim.white))
        x <- trim.space(x, TRUE)

    if (all(grepl('^(TRUE|FALSE)$', x)))
        as.logical(x)
    else if (all(grepl('^-?[[:digit:]]+$', x)))
        as.integer(x)
    else if (all(grepl('^-?[[:digit:]]+\\.[[:digit:]]+$', x)))
        as.numeric(x)
    else if (all(grepl('^NULL$', x)))
        NULL
    else
        x
}


#' Wrap Vector Elements
#'
#' Wraps vector elements with string provided in \code{wrap} argument.
#' @param x a vector to wrap
#' @param wrap a string to wrap around vector elements
#' @return a string with wrapped elements
#' @examples \dontrun{
#' wrap("foobar")
#' wrap(c("fee", "fi", "foo", "fam"), "_")
#' }
#' @export
wrap <- function(x, wrap = '"'){
    stopifnot(is.variable(x))
    sprintf('%s%s%s', wrap, x, wrap)
}


#' Stop Execution with String Interpolated Messages
#'
#' This helper combines \code{stop} function with \code{sprintf} thus allowing string interpolated messages when execution is halted.
#' @param s a character vector of format strings
#' @param ... values to be interpolated
#' @return a string containing message that follows execution termination
#' @examples \dontrun{
#' stopf("%.3f is not larger than %d and/or smaller than %d", pi, 10, 40)
#' }
#' @export
stopf <- function(s, ...){
    stop(sprintf(s, ...))
}


#' Empty Value
#'
#' Rails-inspired helper that checks if value is "empty", i.e. if it's of \code{NULL}, \code{NA}, \code{NaN}, \code{FALSE}, empty string or 0.
#' @param x an object to check
#' @param trim trim whitespace? (by default removes only trailing spaces)
#' @param ... additional arguments for \code{\link{trim.space}}
#' @examples
#' is.empty(NULL)     # returns [1] TRUE
#' is.empty(NA)       # returns [1] TRUE
#' is.empty(NaN)      # returns [1] TRUE
#' is.empty("")       # returns [1] TRUE
#' is.empty(0)        # returns [1] TRUE
#' is.empty(0.00)     # returns [1] TRUE
#' is.empty("foobar") # returns [1] FALSE
#' is.empty("    ")   # returns [1] FALSE
#' @export
is.empty <- function(x, trim = FALSE, ...){

    if (is.null(x))
        return (TRUE)
    else if (is.na(x) || is.nan(x))
        return (TRUE)
    else if (is.character(x) && nchar(ifelse(trim, trim.space(x, ...), x)) == 0)
        return (TRUE)
    else if (is.logical(x) && !isTRUE(x))
        return (TRUE)
    else if (is.numeric(x) && x == 0)
        return (TRUE)
    else
        return (FALSE)
}
