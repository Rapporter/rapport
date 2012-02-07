#' Rapport Object
#'
#' Checks if provided R object is of \code{rapport} class.
#' @param x any R object to check
#' @return a logical value indicating whether provided object is a \code{rapport} object
#' @export
is.rapport <- function(x)  inherits(x, 'rapport')


#' Rapport Block Element
#'
#' Checks if provided R object is a \code{rapport} block element.
#' @param x any R object to check
#' @return a logical value indicating whether provided object is a \code{rp.block} object
is.rp.block <- function(x)  (inherits(x, 'rp.block'))


#' Rapport Inline Element
#'
#' Checks if provided R object is a \code{rapport} inline element.
#' @param x any R object to check
#' @return a logical value indicating whether provided object is a \code{rp.inline} object
is.rp.inline <- function(x)  (inherits(x, 'rp.inline'))


#' Rapport Heading Element
#'
#' Checks if provided R object is a \code{rapport} inline element.
#' @param x any R object to check
#' @return a logical value indicating whether provided object is a \code{rp.heading} object
is.rp.heading <- function(x)  (inherits(x, 'rp.heading'))


#' Variables
#'
#' From \emph{rapport}'s point of view, a \code{variable} is a non-\code{NULL} atomic vector that has no dimension attribute (see \code{dim} for details). This approach bypasses \code{factor} issues with \code{\link{is.vector}}, and also eliminates multidimensional vectors, such as matrices and arrays.
#' @param x an object to be checked for "variable" format
#' @return a logical value indicating that provided object is a "variable"
#' @examples
#' is.variable(rnorm(100))  # [1] TRUE
#' is.variable(LETTERS)     # [1] TRUE
#' is.variable(NULL)        # [1] FALSE
#' is.variable(mtcars)      # [1] FALSE
#' is.variable(HairEyeColor[, , 1])  # [1] FALSE
#' is.variable(list())      # [1] FALSE
#' @export
is.variable <- function(x){

    if (missing(x))
        stop('test object not provided')

    is.atomic(x) & !is.null(x) & is.null(dim(x))
}


#' Tabular Structure
#'
#' Checks if object has "tabular" structure (not to confuse with \code{\link{table}}) - in this particular case, that means \code{\link{matrix}} and \code{\link{data.frame}} objects only.
#' @param x an object to be checked for "tabular" format
#' @return a logical value indicating that provided object has tabular structure
#' @examples
#' is.tabular(HairEyeColor[, , 1])  # [1] TRUE
#' is.tabular(mtcars)               # [1] TRUE
#' is.tabular(table(mtcars$cyl))    # [1] FALSE
#' is.tabular(rnorm(100))           # [1] FALSE
#' is.tabular(LETTERS)              # [1] FALSE
#' is.tabular(pi)                   # [1] FALSE
#' @export
is.tabular <- function(x){

    if (missing(x))
        stop('no object to test table')

    inherits(x, c('matrix', 'data.frame')) && length(dim(x)) == 2
}


#' Pandoc Heading
#'
#' Checks if provided string is a valid ATX-style pandoc heading.
#' @param x a string to test for pandoc heading format
#' @return a logical value indicating the string is (not) a pandoc heading
#' @export
is.heading <- function(x){

    if (missing(x))
        stop('no character value to test pandoc heading')

    re.head <- '^#{1,6}([ \t]+)?[[:print:]]+$'
    grepl(re.head, x)
}


#' Variable Name
#'
#' This function returns character value previously stored in variable's \code{name} attribute. If none found, the function defaults to object's name.
#' @param x an R (atomic or data.frame/list) object to extract names from
#' @return a character value with variable's label
#' @examples \dontrun{
#' rp.name(mtcars$am)
#' x <- 1:10; rp.name(x)
#' }
#' @export
rp.name <- function(x){

    if (missing(x))
        stop('variable not provided')

    if (is.atomic(x)){
        n <- attr(x, which = 'name', exact = TRUE)
        if (is.null(n)) {
            return (tail(as.character(substitute(x)), 1)) # return variable name if no label
        } else {
            if (length(n) > 1)
                warning('variable name is not a length-one vector, only the first element is displayed')
            return(attr(x, 'name'))                       # return variable label
        }
    }

    if (is.recursive(x)){
        n <- sapply(x, attr, which = 'name', exact = TRUE)
        n.nil <- sapply(n, is.null)

        ## no labels found
        if (all(n.nil)){
            n <- names(n)
        } else
        n[n.nil] <- names(n)[n.nil]

        return(n)
    }

    stop('Wrong R object type provided!')
}


#' Get Variable Label
#'
#' This function returns character value previously stored in variable's \code{label} attribute. If none found, the function defaults to object's name (retrieved by \code{deparse(substitute(x))}).
#' @param x an R object to extract labels from
#' @param fallback a logical value indicating if labels should fallback to object name(s)
#' @return a character vector with variable's label(s)
#' @examples \dontrun{
#' x <- rnorm(100)
#' rp.label(x)         # returns "x"
#' rp.label(x, FALSE)  # fails with error message
#'
#' rp.label(mtcars$hp) <- "Horsepower"
#' rp.label(mtcars)         # returns "Horsepower" instead of "hp"
#' rp.label(mtcars, FALSE)  # returns NA where no labels are found
#' }
#' @export
rp.label <- function(x, fallback = TRUE){

    if (missing(x))
        stop('variable not provided')

    if (is.null(x))
        return (NULL)

    if (is.atomic(x)){
        lbl <- attr(x, which = 'label', exact = TRUE)
        if (is.null(lbl)){
            if (fallback)
                lbl <- tail(as.character(substitute(x)), 1)
            else
                stop('atomic vector has no label')
        } else {
            if (length(lbl) > 1){
                warning('variable label is not a length-one vector, only first element is returned')
                lbl <- lbl[1]
            }
        }
    } else {
        lbl <- sapply(x, attr, which = 'label', exact = TRUE)
        lbl.nil <- sapply(lbl, is.null)

        ## no labels found
        if (all(lbl.nil)){
            if (fallback)
                lbl <- names(lbl)
            else
                stop('no labels found in recursive object')
        } else {
            if (fallback)
                lbl[lbl.nil] <- names(lbl)[lbl.nil]
            else
                lbl[lbl.nil] <- NA
            lbl <- unlist(lbl)
        }
    }

    return(lbl)
}


#' Set Variable Label
#'
#' This function sets a label to a variable, by storing a character string to its \code{label} attribute.
#' @param var a variable (see \code{\link{is.variable}} for details)
#' @param value a character value that is to be set as variable label
#' @usage rp.label(var) <- value
#' @seealso \code{\link{rp.label}}
#' @examples \dontrun{
#' rp.label(mtcars$mpg) <- "fuel consumption"
#' x <- rnorm(100); ( rp.label(x) <- "pseudo-random normal variable" )
#' }
#' @export
`rp.label<-` <- function(var, value){

    if (missing(var) | missing(value))
        stop('both variable name and label should be provided')

    if (!is.variable(var))
        stop('label can only be assigned to a variable')

    if (!is.string(value))
        stop('only a character string can be assigned to a variable label')

    attr(var, 'label') <- value

    return (var)
}


#' Tag Existence
#'
#' Checks if a character vector elements contain specified tags. Note that this helper does not parse R code within tags, but just checks for tag existence in provided string!
#' @param x a character value to check for tag strings
#' @param ... an argument list with tags to check
#' @return a logical value indicating if the string has passed the check
#' @examples
#' has.tags("<% pi %>", "<%")
#' has.tags("<% pi %>", "<%", "%>", "<!--", "-->")
#' has.tags(c("<% pi %>", "<!-- foobar -->"), "<%", "%>", "<!--", "-->")
#' @export
has.tags <- function(x, ...){

    if (missing(x))
        stop('no character vector to test for tag existence')

    tags <- list(...)

    if (!all(sapply(tags, function(x) (is.character(x) & length(x) == 1))))
        stop('tags should be strings')

    res <- sapply(tags, grepl, x)

    if (length(dim(res))){
        rownames(res) <- x
        colnames(res) <- unlist(tags)
    } else {
        names(res) <- unlist(tags)
    }

    return(res)
}


#' Inline Chunk Contents
#'
#' Returns inline code chunks with or without tags that wrap them.
#'
#' Default parameters are read from \code{options}:
#'
#' \itemize{
#'     \item 'inline.open',
#'     \item 'inline.close'.
#' }
#' @param x a character vector
#' @param tag.open a character value with opening tag regular expression
#' @param tag.close a character value with closing tag regular expression
#' @param include a logical value indicating whether chunks should be returned (defaults to \code{FALSE})
#' @param ... additional arguments for \code{\link{gregexpr}} function
#' @return a character vector with code chunks
#' @examples \dontrun{
#' s <- c("As you know, pi equals <%pi%>",  "2 raised to the power of 3 is <%2^3%>")
#' grab.chunks(s, "<%", "%>", FALSE)
#' ## [1] "pi"  "2^3"
#' grab.chunks(s, "<%", "%>", FALSE)
#' ## [1] "<%pi%>"  "<%2^3%>"
#' }
#' @export
grab.chunks <- function(x, tag.open = get.tags('inline.open'), tag.close = get.tags('inline.close'), include = FALSE, ...){

    co <- gregexpr(tag.open, x, ...)
    cc <- gregexpr(tag.close, x, ...)

    if (include == FALSE){
        s <- unlist(lapply(co, function(x) x + attr(x, 'match.length')))
        e <- unlist(lapply(cc, function(x) x - (attr(x, 'match.length') - (attr(x, 'match.length') - 1))))
    } else {
        s <- unlist(co)
        e <- unlist(lapply(cc, function(x) x + (attr(x, 'match.length') - 1)))
    }

    substring(x, s, e)
}


#' Tag Values
#'
#' Returns report tag vales (usually regexes): either user-defined, or the default ones.
#'
#' Default parameters are read from \code{options}:
#'
#' \itemize{
#'     \item 'chunk.open',
#'     \item 'chunk.close',
#'     \item 'inline.open',
#'     \item 'inline.close',
#'     \item 'header.open',
#'     \item 'header.close',
#'     \item 'comment.open',
#'     \item 'comment.close'.
#' }
#' @param tag.type a character value with tag value name
#' @param preset a character value specifying which preset to return
#' @return either a list (default) or a character value with tag regexes
#' @examples
#' get.tags()        # same as 'get.tags("all")'
#' get.tags("chunk.open")
#' @export
get.tags <- function(tag.type = c('all', 'chunk.open', 'chunk.close', 'inline.open', 'inline.close', 'header.open', 'header.close', 'comment.open', 'comment.close'), preset = c('user', 'default')){

    t.type <- match.arg(tag.type)       # tag type
    t.preset <- match.arg(preset)       # preset (default/user)

    ## default tag list
    tag.default <- c(
                     chunk.open    = '^<%$',
                     chunk.close   = '^%>$',
                     inline.open   = '<%=',
                     inline.close  = '%>',
                     header.open   = '^<!--head$',
                     header.close  = '^head-->$',
                     comment.open  = '^<!--',
                     comment.close = '-->'
                     )
    tag.default.names <- names(tag.default) # names of default tags
    tag.current <- getOption('rp.tags')     # currently set tags
    tag.current.names <- names(tag.current) # names of currently set tags

    ## check if tag list exists
    if (is.null(tag.current))
        stop('tag list does not exist')

    ## check tag list length
    if (length(tag.default) != length(tag.current))
        stop('tag list incomplete')

    if (!all(sort(tag.default.names) == sort(tag.current.names))){
        tgs <- paste(setdiff(tag.current.names, tag.default.names), collapse = ", ")
        stopf('tag list malformed!\nproblematic tags: %s', tgs)
    }

    res <- switch(t.preset,
                  user = {
                      if (t.type == 'all')
                          tag.current
                      else
                          tag.current[t.type]
                  },
                  default = {
                      ## check if something is changed, and say what has changed!
                      tags.diff <- tag.current != tag.default
                      if (any(tags.diff)){
                          w <- paste(sprintf('`%s` set by user to:\t"%s"\t(default: "%s")\n', tag.current.names[tags.diff], tag.current[tags.diff], tag.default[tags.diff]), collapse = '')
                          warning(sprintf('Default tag values were changed!\n%s', w))
                      }
                      do.call(switch, c(EXPR = t.type, all = tag.default, tag.default))
                  },
                  stopf('unknown preset option "%s"', t.preset)
                  )

    return (res)
}


#' Misplaced Tags
#'
#' Searches for misplaced tags.
#'
#' Default parameters are read from \code{options}:
#'
#' \itemize{
#'     \item 'inline.open,
#'     \item 'inline.close'.
#' }
#' @param x a string to check for misplaced tags
#' @param tag.open a string containing opening tag
#' @param tag.close a string containing closing tag
#' @return if no tags, or no mismatches are found, original string is returned, otherwise the function will return appropriate error
tags.misplaced <- function(x, tag.open = get.tags('inline.open'), tag.close = get.tags('inline.close')){

    stopifnot(is.string(x))             # strings only!
    ht <- has.tags(x, tag.open, tag.close) # has tags?
    ntags <- sum(ht)                       # sum of found tags

    ## no tags found, return provided string
    if (ntags == 0)
        return (x)

    ## missing tags, fall and
    if (ntags == 1)
        stop(c('opening', 'closing')[which(ht == FALSE)] , ' tag(s) missing')

    if (ntags == 2){
        chunks <- grab.chunks(x, tag.open, tag.close)
        m <- grep(sprintf('%s|%s', tag.open, tag.close), chunks)
        if (length(m) > 0)
            stop('misplaced tag in ', chunks[m], ' chunk')
        else
            return (x)
    }
}


#' Purge Comments
#'
#' Remove comments from provided character vector.
#'
#' Default parameters are read from \code{options}:
#'
#' \itemize{
#'     \item 'comment.open',
#'     \item 'comment.close'.
#' }
#' @param x a character string to remove comments from
#' @param comment.open a string containing opening tag
#' @param comment.close a string containing closing tag
#' @return a string with removed pandoc comments
#' @export
purge.comments <- function(x, comment.open = get.tags('comment.open'), comment.close = get.tags('comment.close')){

    stopifnot(is.string(x))
    ## long live greedy quantifier modifier!!!
    sub(sprintf('%s.*?%s', comment.open, comment.close), '', x)
}


#' Convert table-like structures to JSON object
#'
#' This function takes either a \code{\link{matrix}} or a \code{\link{data.frame}} object to extract column names, row names and the "body" of the table-like object, hence exports them to JSON.
#' @param d either a \code{matrix} or a \code{data.frame} object
#' @param name.rows a string naming object that contains row names
#' @param name.cols a string naming object that contains columns names
#' @param name.body a string naming object that contains table body
#' @return string with JSON object containing \code{rows}, \code{cols} and \code{body} attributes.
#' @examples \dontrun{
#'     table.json(mtcars)
#'
#'     set.seed(1)
#'     m <- matrix(sample(10, 100, TRUE), 10)
#'     table.json(m)
#' }
#' @export
table.json <- function(d, name.rows = 'rows', name.cols = 'cols', name.body = 'body'){

    if (missing(d))
        stop('no object to export to table')

    ## check object class
    if (!inherits(d, c('matrix', 'data.frame')))
        stopf('object "%s" is not of "matrix" or a "data.frame" class', deparse(substitute(d)))

    if (is.matrix(d))
        d <- as.data.frame(d)

    res <- structure(list(
                          rownames(d),
                          colnames(d),
                          structure(d, row.names = c(NA, -nrow(d)), .Names = NULL)
                          ),
                     .Names = c(name.rows, name.cols, name.body))

    ## add a class?
    return (toJSON(res))
}


#' Percent
#'
#' Appends a percent sign to provided numerical value. Rounding is carried out according to value passed in \code{decimals} formal argument (defaults to value specified in \code{rp.decimal.short} option).
#'
#' Default parameters are read from \code{options}:
#'
#' \itemize{
#'     \item 'rp.decimal.short'
#' }
#' @param x a numeric value that is to be rendered to percent
#' @param digits an integer value indicating number of decimal places
#' @param type a character value indicating whether percent or proportion value was provided (partial match is allowed)
#' @param check.value perform a sanity check to see if provided numeric value is correct
#' @return a character value with formatted percent
#' @export
pct <- function(x, digits = getOption('rp.decimal.short'), type = c('percent', '%', 'proportion'), check.value = TRUE){

    if (!is.numeric(x))
        stop('only numeric values should be provided')

    val <- switch(match.arg(type),
                  proportion = {
                      if (check.value)
                          stopifnot(all(x >= 0 & x <= 1))
                      x * 100
                  },
                  '%'=,
                  percent = {
                      if (check.value)
                          stopifnot(all(x >= 0 & x <= 100))
                      x
                  },
                  stop('unsupported number format')
                  )

    dec <- ifelse(is.null(digits), 0, digits)
    fmt <- paste('%.', dec, 'f%%', sep = '')

    sprintf(fmt, val)
}


#' Extract Template Metadata
#'
#' Check if template metadata field matches provided format, and return matched value in a list.
#' @param x a string containing template metadata
#' @param title a string containing metadata field title (can be regex-powered)
#' @param regex a string with regular expression to match field value
#' @param short a string with a short name for given metadata field
#' @param trim.white a logical value indicating whether trailing and leading spaces of the given string should be removed before extraction
#' @param mandatory a logical value indicating required field
#' @param default.value fallback to this value if non-mandatory field is not found/malformed
#' @param field.length maximum number of field characters (defaults to 1000)
#' @param ... additional parameters for \code{grepl} function
#' @return a list with matched content, or \code{NULL} if the field is not required
#' @examples \dontrun{
#'     extract_meta("Name: John Smith", "Name", "[[:alpha:]]+( [[:alpha:]]+)?")
#'     ## $name
#'     ## [1] "John Smith"
#'
#'     extract_meta("Name: John", "Name", "[[:alpha:]]+( [[:alpha:]]+)?")
#'     ## $name
#'     ## [1] "John"
#' }
extract_meta <- function(x, title, regex, short = NULL, trim.white = TRUE, mandatory = TRUE, default.value = NULL, field.length = 1e3, ...){

    if (!any(sapply(list(x, title, regex), is.string)))
        stop('"x", "title" and "regex" need to be strings')

    if (!is.null(short))
        if (!is.string(short))
            stop('"short" argument should be a string')

    if (isTRUE(trim.white))
        x <- trim.space(x, leading = TRUE, trailing = TRUE)


    fl <- if (length(x) == 0) 0 else nchar(x)
    if (fl > field.length)
        stopf('"%s" field exceeds maximal length (%d, while %d is allowed)', title, fl, field.length)

    re <- sprintf('^%s:([\t ]+|)(%s)$', title, regex)
    val <- gsub(re, '\\2', x, ...) # return matched value

    if (isTRUE(grepl(re, x, ...))){
        res <- val
    } else {
        if (isTRUE(mandatory)){
            stopf('"%s" metadata field %s', title, ifelse(fl == 0, 'not found', 'has errors'))
        } else {
            ## throw error only if meta is specified/non-empty, and has incorrect value
            if (fl == 0)
                res <- default.value
            else
                stopf('non-mandatory field "%s" contains errors', title)
        }
    }

    structure(list(res), .Names = ifelse(length(short) > 0, short, tocamel(tolower(title))))
}


#' Naming Conventions
#'
#' Checks package-specific naming conventions: variables should start by a letter, followed either by a letter or a digit, while the words should be separated with dots or underscores.
#' @param x a character vector to test names
#' @param size an integer value that indicates maximum name length
#' @param ... additional arguments to be passed to \code{\link{grepl}} function
#' @return a logical vector indicating which values satisfy the naming conventions
#' @examples
#' check.name("foo")               # [1] TRUE
#' check.name("foo.bar")           # [1] TRUE
#' check.name("foo_bar")           # [1] TRUE
#' check.name("foo.bar.234")       # [1] TRUE
#' check.name("foo.bar.234_asdf")  # [1] TRUE
#' check.name("234.asdf")          # [1] FALSE
#' check.name("_asdf")             # [1] FALSE
#' check.name(".foo")              # [1] FALSE
#' @export
check.name <- function(x, size = 30L, ...){

    re.name <- '^[[:alpha:]]+(([[:digit:]]+)?((\\.|_)?[[:alnum:]])+)?$'
    len <- nchar(x) < size

    if (any(!len))
        warning('following variable names exceed maximum length: ', paste(x[!len], collapse = ','))

    grepl(re.name, x) & len
}


#' Package Templates
#'
#' Lists all templates bundled with current package build.
#' @param ... additional parameters for \code{\link{dir}} function
#' @return a character vector with template files
#' @export
tpl.list <- function(...){

    dir(c('./', getOption('tpl.paths'), system.file('templates', package = 'rapport')), pattern = '^.+\\.tpl$', ...)
}


#' Template Paths
#'
#' List all custom paths where rapport will look for templates.
#' @return a character vector with paths
#' @examples \dontrun{
#' tpl.paths()
#' }
#' @export
tpl.paths <- function()
    getOption('tpl.paths')


#' Reset Template Paths
#'
#' Resets to default (NULL) all custom paths where rapport will look for templates.
#' @examples \dontrun{
#' tpl.paths.reset()
#' }
#' @export
tpl.paths.reset <- function()
    options('tpl.paths' = NULL)


#' Add Template Path
#'
#' Adds a new element to custom paths' list where rapport will look for templates.
#' @param ... character vector of paths
#' @return TRUE on success (invisibly)
#' @examples \dontrun{
#' tpl.paths.add('/tmp')
#' tpl.list()
#'
#' ## might trigger an error:
#' tpl.paths.add('/home', '/rapport')
#' }
#' @export
tpl.paths.add <- function(...) {
    paths <- as.character(substitute(list(...)))[-1L]
    if (!all(sapply(paths, is.character)))
        stop('Wrong arguments (not characters) supplied!')
    if (!all(file.exists(paths)))
        stop('Specified paths do not exists on filesystem!')
    options('tpl.paths' = union(tpl.paths(), paths))
    invisible(TRUE)
}


#' Remove Template Path
#'
#' Removes an element from custom paths' list where rapport will look for templates.
#' @param ... character vector of paths
#' @return TRUE on success (invisibly)
#' @examples \dontrun{
#' tpl.paths()
#' tpl.paths.add('/tmp')
#' tpl.paths()
#' tpl.paths.remove('/tmp')
#' tpl.paths()
#'
#' ## might trigger an error:
#' tpl.paths.remove('/root')
#' }
#' @export
tpl.paths.remove <- function(...) {
    paths <- as.character(substitute(list(...)))[-1L]
    if (!all(sapply(paths, is.character)))
        stop('Wrong arguments (not characters) supplied!')
    if (!all(paths %in% tpl.paths()))
        warning('Specified paths were not added to custom paths list before!')
    options('tpl.paths' = setdiff(tpl.paths(), paths))
    invisible(TRUE)
}


#' Input Limits
#'
#' Checks input limits based on provided string. If provided string is syntactically correct, a list with integers containing limit boundaries (minimum and maximum value) is returned. If provided input limit exceeds value specified in \code{max.lim} argument, it will be coerced to \code{max.lim} and warning will be returned. Default upper input limit is 50 (variables).
#' @param x a character string containing limit substring
#' @param max.lim an integer containing upper input limit
#' @return a named list with \code{min}imal and \code{max}imal input limit
#' @examples \dontrun{
#' rapport:::check.limit("[1,20]")
#' rapport:::check.limit("[1]")
#' rapport:::check.limit("[1, 0]")  # will throw error
#' }
check.limit <- function(x, max.lim = 50L){

    re <- "^(\\[[[:digit:]]+(,[[:digit:]]+)?\\]|)$"
    if (!isTRUE(grepl(re, x)))
        stop('invalid limit definition')

    stopifnot(is.integer(max.lim))

    re.lim <- '^\\[(.*)\\]$'
    lims.sb <- gsub(re.lim, '\\1', x) # grab content within brackets
    lims.split <- strsplit(lims.sb, ',')[[1]] # split by comma
    nc <- length(lims.split)

    if (nc == 0)
        res <- rep(1, 2)
    else if (nc == 1)
        res <- rep(lims.sb, 2)
    else
        res <- lims.split

    res <- as.integer(res)

    if (diff(res) < 0)
        stop('maximum limit cannot be greater than minimum limit')

    if (any(res < 1))
        stop('only positive integers should be provided as a limit')

    if (any(res > max.lim)){
        res[res > max.lim] <- max.lim
        warning('input limit exceeds maximal value, coerced to ', max.lim)
    }

    structure(as.list(res), .Names = c('min', 'max'))
}


#' Check Type
#'
#' Checks type of template input, based on provided sting. If input definition is syntactically correct, a list is returned, containing input type, size limits, and default value (for CSV options and boolean types only).
#' @param x a character string containing input definition
#' @examples \dontrun{
#' rapport:::check.type("factor")
#' rapport:::check.type("character[1,20]")
#' rapport:::check.type("fee, fi, foo, fam")
#' rapport:::check.type("FALSE")
#' rapport:::check.type("number[3]=123.456")
#' }
check.type <- function(x){

    x <- trim.space(x, TRUE)

    if (x == '')
        stop('empty input type definition')

    ## regexes
    re.lim <- '(\\[([[:digit:]]+)(,([[:digit:]]+))?\\]|)' # limits
    fmt <- '^(\\*)?%s%s%s$'
    re1 <- sprintf(fmt, '(character|complex|factor|logical|numeric|variable|number|string)', re.lim, '') # variable regex
    re2 <- '^(TRUE|FALSE)$'             # boolean regex
    re3 <- '^([[:alnum:]\\._]+(, ?[[:alnum:]\\._]+){1,})$' # CSV regex
    re4 <- sprintf(fmt, '(string)', re.lim, '( ?= ?(.+|))?') # string regex
    re5 <- sprintf(fmt, '(number)', re.lim, '( ?= ?(([[:digit:]]+(\\.[[:digit:]]+)?)|))?') # number regex

    ## 1st option: TRUE|FALSE
    if (grepl(re2, x))
        res <- list(
                    type = 'boolean',
                    limit = list(min = 1, max = 1),
                    default = gsub(re2, '\\1', x) == TRUE,
                    mandatory = FALSE
                    )
    ## 2nd option: string
    else if (grepl(re4, x))
        res <- list(
                    type = 'string',
                    limit = check.limit(gsub(re4, '\\3', x)),
                    default = {
                        if (grepl('^=', gsub(re4, '\\7', x)))
                            gsub(re4, '\\8', x)
                        else
                            NA_character_
                    },
                    mandatory = grepl('^\\*', x)
                    )
    ## 3rd option: number
    else if (grepl(re5, x))
        res <- list(
                    type = 'number',
                    limit = check.limit(gsub(re5, '\\3', x)),
                    default = {
                        if (grepl('^=', gsub(re5, '\\7', x)))
                            as.numeric(gsub(re5, '\\8', x))
                        else
                            NA_real_
                    },
                    mandatory = grepl('^\\*.+', x)
                    )
    ## 4th option: variable[min(, max)]
    else if (grepl(re1, x))
        res <- list(
                    type = gsub(re1, '\\2', x),
                    limit = check.limit(gsub(re1, '\\3', x)),
                    default = NULL,
                    mandatory = grepl('^\\*', x)
                    )
    ## 5th option: list, of, comma, separated, values (first one is default)
    else if (grepl(re3, x))
        res <- list(
                    type = 'option',
                    limit = list(min = 1, max = 1),
                    default = strsplit(gsub(re3, '\\1', x), ', ?')[[1]],
                    mandatory = FALSE
                    )
    ## 6th option: something went wrong
    else
        stopf('input type definition error in: "%s"', x)

    return(res)
}


#' Round numeric values
#'
#' Round numeric values with default number of decimals (see: \code{getOption('rp.decimal'}) and decimal mark (see: \code{getOption('rp.decimal')}).
#'
#' Default parameters are read from \code{options}:
#'
#' \itemize{
#'     \item 'rp.decimal',
#'     \item 'rp.decimal.short',
#'     \item 'rp.decimal.mark'.
#' }
#' @param x numeric value(s)
#' @param short if \code{getOption('rp.decimal.short'} should be used instead of \code{getOption('rp.decimal'}. Can be overwritten by \code{digits} parameter, see below.
#' @param digits (optional) number of decimals
#' @return character vector of rounded value(s)
#' @note This function is a simple demo for \code{\link{evals}}'s hooks.
#' @examples {
#' rp.round(22/7)
#' rp.round(22/7, short = TRUE)
#' rp.round(22/7, TRUE)
#' rp.round(22/7, digits = 10)
#' rp.round(matrix(runif(9), 3, 3))
#' }
#' @examples \dontrun{
#' # alter options
#' options('rp.decimal'       = 2)
#' options('rp.decimal.mark'  = ',')
#' rp.round(22/7)
#' rp.round(matrix(runif(9), 3, 3))
#' }
#' @export
rp.round <- function(x, short = FALSE, digits = NULL) {
    if (!is.numeric(x)) stop('Wrong variable type (!numeric) provided.')
    decimal.mark <- getOption('rp.decimal.mark')
    if (missing(digits))
        digits <- ifelse(short, getOption('rp.decimal.short'), getOption('rp.decimal'))
    if (is.vector(x))
        return(as.vector(tocharac(x, digits = digits, decimal.mark = decimal.mark, format = 'nice')))
    return(format(round(x, digits), decimal.mark = decimal.mark))
}


#' Return pretty ascii form
#'
#' Some standard formatting is applied to the value which is returned as ascii object.
#'
#' Default parameters are read from \code{options}:
#'
#' \itemize{
#'     \item 'rp.decimal',
#'     \item 'rp.decimal.short',
#'     \item 'rp.decimal.mark'.
#' }
#' @param x R object
#' @param asciitype markdown language to use for returning tables (eg. pandox, t2t, asciidoc etc.)
#' @return ascii
#' @examples \dontrun{
#' rp.prettyascii('Hello, World?')
#' rp.prettyascii(22/7)
#' rp.prettyascii(matrix(runif(25), 5, 5))
#' rp.prettyascii(lm(hp~wt, mtcars))
#' rp.prettyascii(summary(mtcars$hp))
#' rp.prettyascii(htest(rnorm(100), shapiro.test))
#' rp.prettyascii(table(mtcars$am,mtcars$gear))
#' rp.prettyascii(data.frame(x=1:2, y=3:4))
#' rp.prettyascii(data.frame(x=1:2, y=3:4, z=c(22/7, pi)))
#' rp.prettyascii(mtcars)
#' rp.prettyascii(table(mtcars$am))
#'
#' ## it is better to \code{cat} the output
#' cat(rp.prettyascii(rp.freq("gender", data = ius2008)))
#' }
#' @export
rp.prettyascii <- function(x, asciitype = getOption('asciiType')) {

    if ((length(x) == 1) & (is.rapport(x) | is.character(x)))
        return(x)

    if (is.list(x))
        if (all(lapply(x, class) == 'rapport'))
            return(l_ply(x, print))

    if (is.numeric(x)) {
        classes <- class(x)
        ## dims <- dim(x)
        x <- rp.round(x)
        ## dim(x) <- dims
        if (length(x) != 1)
            class(x) <- classes
    }

    if (is.vector(x))
        return(p(x, limit = Inf))

    asciitype.original <- getOption('asciiType')
    options('asciiType' = asciitype)
    if (is.data.frame(x) | is.table(x)) {
        ## rounding till \code{ascii} bug fixed: https://github.com/eusebe/ascii/issues/12
        numerics <- which(sapply(x, is.numeric))
        for (numeric in as.numeric(numerics)) {
            x[, numeric] <- rp.round(x[, numeric])
        }
        rownms <- rownames(x)
        include.rownames <- !is.null(rownms)
        if (!include.rownames) {
            pre.txt <- ''
        } else {
            include.rownames <- !all(rownms == 1:nrow(x))
            ## not so neat hack to close all possible lists before exporting a table with missing first column header
            pre.txt <- ifelse(include.rownames, '<!-- endlist -->\n', '')
        }
        res <- paste(pre.txt, paste(capture.output(ascii(x, include.rownames = include.rownames)), collapse='\n'), sep='')
        options('asciiType' = asciitype.original)
        return(res)
    }

    x.class <- class(x)
    if (x.class == 'trellis' | x.class == 'ggplot')
        stop('ggplot2 and trellis objects must be printed in strict mode!')

    res <- paste(capture.output(ascii(x, format='nice', digits=getOption('rp.decimal'), decimal.mark = getOption('rp.decimal.mark'))), collapse='\n')
    options('asciiType' = asciitype.original)
    return(res)
}


#' Inline Printing
#'
#' \code{\link{p}} merges elements of a variable (see \code{\link{is.variable}}) in one string for the sake of pretty inline printing. Default parameters are read from appropriate \code{option} values (see argument description for details). This function allows you to put the results of an expression that yields a variable \emph{inline}, by wrapping the vector elements with the string provided in \code{wrap}, and separating elements by main and ending separator (\code{sep} and \code{copula}). In case of a two-length vector, value specified in \code{copula} will be used as a separator. You can also control the length of provided vector by altering an integer value specified in \code{limit} argument (defaults to \code{20}).
#' @param x an atomic vector to get merged for inline printing
#' @param wrap a string to wrap vector elements (uses value set in \code{p.wrap} option: \code{"_"} by default, which is a markdown-friendly wrapper and it puts the string in \emph{italic})
#' @param sep a string with the main separator, i.e. the one that separates all vector elements but the last two (uses the value set in \code{p.sep} option - \code{","} by default)
#' @param copula a string with ending separator - the one that separates the last two vector elements (uses the value set in \code{p.copula} option, \code{"and"} by default)
#' @param limit maximum character length (defaults to 20 elements)
#' @return a string with concatenated vector contents
#' @examples
#' p(c("fee", "fi", "foo", "fam"))
#' ## [1] "_fee_, _fi_, _foo_ and _fam_"
#' p(1:3, wrap = "")
#' ## [1] "1, 2 and 3"
#' p(LETTERS[1:5], copula = "and the letter")
#' ## [1] "_A_, _B_, _C_, _D_ and the letter _E_"
#' p(c("Thelma", "Louise"), wrap = "", copula = "&")
#' ## [1] "Thelma & Louise"
#' @export
p <- function(x, wrap = getOption('p.wrap'), sep = getOption('p.sep'), copula = getOption('p.copula'), limit = 20L){

    stopifnot(is.variable(x))         # check output (should be output)
    stopifnot(all(sapply(list(wrap, sep, copula), is.string))) # separators should be strings
    x.len <- length(x)                # vector length
    stopifnot(x.len > 0)              # no zero-length vectors allowed
    stopifnot(x.len <= limit)         # check limits

    if (x.len == 1)
        wrap(x, wrap)
    else if (x.len == 2)
        paste(wrap(x, wrap), collapse = sprintf(' %s ', copula))
    else
        paste(paste(wrap(head(x, -1), wrap), collapse = sep), copula, wrap(tail(x, 1), wrap))
}


#' Create Formula from Strings
#'
#' Takes multiple character arguments as left and right-hand side arguments of a formula, and concatenates them in a single string.
#' @param left a string with left-hand side formula argument
#' @param right a character vector with right-hand side formula arguments
#' @param join.left concatenation string for elements of character vector specified in \code{left}
#' @param join.right concatenation string for elements of character vector specified in \code{right}
#' @examples
#' fml("hp", c("am", "cyl"))    # "hp ~ am + cyl"
#' @export
fml <- function(left, right, join.left = ' + ', join.right = ' + '){
    sprintf('%s ~ %s', paste(left, collapse = join.left), paste(right, collapse = join.right))
}


########################################
## undocumented functions
##  ->  (not to export in final release)
########################################


## http://stackoverflow.com/questions/8379570/get-functions-title-from-documentation
pkg_topic <- function(package, topic, file = NULL) {
    # Find "file" name given topic name/alias
    if (is.null(file)) {
        topics <- pkg_topics_index(package)
        topic_page <- subset(topics, alias == topic, select = file)$file

        if(length(topic_page) < 1)
            topic_page <- subset(topics, file == topic, select = file)$file

        stopifnot(length(topic_page) >= 1)
        file <- topic_page[1]
    }

    rdb_path <- file.path(system.file("help", package = package), package)
    tools:::fetchRdDB(rdb_path, file)
}

## http://stackoverflow.com/questions/8379570/get-functions-title-from-documentation
pkg_topics_index <- function(package) {
    help_path <- system.file("help", package = package)

    file_path <- file.path(help_path, "AnIndex")
    if (length(readLines(file_path, n = 1)) < 1) {
        return(NULL)
    }

    topics <- read.table(file_path, sep = "\t",
                         stringsAsFactors = FALSE, comment.char = "", quote = "", header = FALSE)

    names(topics) <- c("alias", "file")
    topics[complete.cases(topics), ]
}
