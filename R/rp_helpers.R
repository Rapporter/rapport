#' Rapport Object
#'
#' Checks if provided R object is of \code{rapport} class.
#' @param x any R object to check
#' @return a logical value indicating whether provided object is a \code{rapport} object
#' @export
is.rapport <- function(x)  inherits(x, 'rapport')


#' Rapport Heading Element
#'
#' Checks if provided R object is a \code{rapport} heading element.
#' @param x any R object to check
#' @return a logical value indicating whether provided object is a \code{rp.heading} object
is.rp.heading <- function(x)  inherits(x, 'rp.heading')


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


#' Convert Metadata to Character
#'
#' Converts template metadata to character vector.
#' @param x template metadata object
#' @param ... accepts \code{include.examples} which indicates that examples should be included in output (if any)
#' @method as.character rp.meta
#' @S3method as.character rp.meta
#' @export
as.character.rp.meta <- function(x, ...){

    if (!inherits(x, 'rp.meta'))
        stop("template metadata not provided")

    mc <- match.call()

    meta.example <- x$example
    other <- x[!names(x) %in% c('example')]
    res <- sapply(other, function(x){
        if (!is.null(x))
            paste(x, collapse = ',')
    })
    res <- paste(tocamel(names(other), upper = TRUE), res, sep = ": ")
    datareq.regex <- '^datarequired(\\:.+)$'
    ind <- grepl(datareq.regex, res, ignore.case = TRUE)
    res[ind]<- gsub(datareq.regex, "Data required\\1", res[ind], ignore.case = TRUE)
    if (!is.null(meta.example) && isTRUE(mc$include.examples)) {
        exmpl <- c(sprintf("Example: %s", meta.example[1]), meta.example[-1])
        res <- c(res, exmpl)
    }
    res
}


#' Convert Inputs to Character
#'
#' Converts template inputs to character vector.
#' @param x template inputs object
#' @param ... ignored
#' @method as.character rp.inputs
#' @S3method as.character rp.inputs
#' @export
as.character.rp.inputs <- function(x, ...){

    if (!inherits(x, 'rp.inputs'))
        stop("template inputs not provided")

    unlist(sapply(x, function(x){
        mandatory <- if (x$mandatory) "*" else ""
        limits <- sprintf("[%s]", paste(x$limit, collapse = ","))
        opts <- switch(x$type,
                       boolean = x$default,
                       number =,
                       string = paste(mandatory, x$type, limits, if (is.null(x$default) || is.na(x$default)) "" else sprintf("=%s", x$default), sep = ""),
                       option = paste(x$default, collapse = ","),
                       character =,
                       complex =,
                       numeric =,
                       logical =,
                       factor =,
                       variable = paste(mandatory, x$type, limits, sep = ""),
                       stopf('Incorrect input type (%s)!', x$type)
                       )
        paste(x$name, opts, x$label, x$desc, sep = " | ")
    }))
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
#' This function returns character value previously stored in variable's \code{label} attribute. If none found, and \code{fallback} argument is set to \code{TRUE} (default), the function returns object's name (retrieved by \code{deparse(substitute(x))}), otherwise \code{NA} is returned with a warning notice.
#' @param x an R object to extract labels from
#' @param fallback a logical value indicating if labels should fallback to object name(s)
#' @param simplify coerce results to a vector (\code{TRUE} by default), otherwise, a \code{list} is returned
#' @return a character vector with variable's label(s)
#' @examples \dontrun{
#' x <- rnorm(100)
#' rp.label(x)         # returns "x"
#' rp.label(x, FALSE)  # returns NA and issues a warning
#'
#' rp.label(mtcars$hp) <- "Horsepower"
#' rp.label(mtcars)         # returns "Horsepower" instead of "hp"
#' rp.label(mtcars, FALSE)  # returns NA where no labels are found
#' rp.label(sleep, FALSE)   # returns NA for each variable and issues a warning
#' }
#' @export
rp.label <- function(x, fallback = TRUE, simplify = TRUE){

    if (missing(x))
        stop('variable not provided')

    if (is.null(x))
        return (NULL)

    if (is.atomic(x)){
        lbl <- attr(x, which = 'label', exact = TRUE)
        if (is.null(lbl)){
            if (fallback){
                lbl <- tail(as.character(substitute(x)), 1)
            } else {
                warning('atomic object has no labels')
                lbl <- NA
            }
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
            if (fallback){
                lbl <- structure(names(lbl), .Names = names(lbl))
            } else {
                warning('no labels found in recursive object')
                lbl[lbl.nil] <- NA
            }
        } else {
            if (fallback)
                lbl[lbl.nil] <- names(lbl)[lbl.nil]
            else
                lbl[lbl.nil] <- NA
        }
    }

    if (simplify)
        lbl <- unlist(lbl)

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


#' Tag Values
#'
#' Returns report tag vales (usually regexes): either user-defined, or the default ones.
#'
#' Default parameters are read from \code{options}:
#'
#' \itemize{
#'     \item 'header.open',
#'     \item 'header.close',
#'     \item 'comment.open',
#'     \item 'comment.close'.
#' }
#' @param tag.type a character value with tag value name
#' @param preset a character value specifying which preset to return
#' @return either a list (default) or a character value with tag regexes
#' @examples \dontrun{
#' get.tags()        # same as 'get.tags("all")'
#' get.tags("header.open")
#' }
#' @export
get.tags <- function(tag.type = c('all', 'header.open', 'header.close', 'comment.open', 'comment.close'), preset = c('user', 'default')){

    t.type <- match.arg(tag.type)       # tag type
    t.preset <- match.arg(preset)       # preset (default/user)

    ## default tag list
    tag.default <- c(
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
purge.comments <- function(x, comment.open = get.tags('comment.open'), comment.close = get.tags('comment.close')){
    stopifnot(is.string(x))
    sub(sprintf('%s.*?%s', comment.open, comment.close), '', x)
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
#'     rapport:::extract.meta("Name: John Smith", "Name", "[[:alpha:]]+( [[:alpha:]]+)?")
#'     ## $name
#'     ## [1] "John Smith"
#'
#'     rapport:::extract.meta("Name: John", "Name", "[[:alpha:]]+( [[:alpha:]]+)?")
#'     ## $name
#'     ## [1] "John"
#' }
extract.meta <- function(x, title, regex, short = NULL, trim.white = TRUE, mandatory = TRUE, default.value = NULL, field.length = 1e3, ...){

    if (!any(sapply(list(x, title, regex), is.string)))
        stop('"x", "title" and "regex" need to be strings')

    if (!is.null(short))
        if (!is.string(short))
            stop('"short" argument should be a string')

    if (isTRUE(trim.white))
        x <- trim.space(x)


    fl <- if (length(x) == 0) 0 else nchar(x)
    if (fl > field.length)
        stopf('"%s" field exceeds maximal length (%d, while %d is allowed)', title, fl, field.length)

    re <- sprintf('^%s:([\t ]+|)(%s)$', title, regex)
    val <- gsub(re, '\\2', x, ...) # return matched value

    if (isTRUE(grepl(re, x, ...))){
        res <- val
    } else {
        if (isTRUE(mandatory)){
            stopf('"%s" metadata field %s', title, if(fl == 0) 'not found' else 'has errors')
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


#' Package Templates
#'
#' Lists all templates bundled with current package build. By default, it will search for all \code{.tpl} files in current directory, path specified in \code{tpl.paths} option and package library path.
#' @param ... additional parameters for \code{\link{dir}} function
#' @return a character vector with template files
#' @export
tpl.list <- function(...){
    mc <- match.call()
    if (is.null(mc$path))
        mc$path <- c('./', getOption('tpl.paths'), system.file('templates', package = 'rapport'))
    if (is.null(mc$pattern))
        mc$pattern <- '^.+\\.tpl$'
    mc[[1]] <- as.symbol('dir')
    eval(mc)
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
