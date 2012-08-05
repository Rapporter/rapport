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


#' Percent
#'
#' Appends a percent sign to provided numerical value. Rounding is carried out according to value passed in \code{decimals} formal argument (defaults to value specified in \code{panderOptions('digits')}).
#' @param x a numeric value that is to be rendered to percent
#' @param digits an integer value indicating number of decimal places
#' @param type a character value indicating whether percent or proportion value was provided (partial match is allowed)
#' @param check.value perform a sanity check to see if provided numeric value is correct
#' @return a character value with formatted percent
#' @export
pct <- function(x, digits = panderOptions('digits'), type = c('percent', '%', 'proportion'), check.value = TRUE){

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
#'     rapport:::extract_meta("Name: John Smith", "Name", "[[:alpha:]]+( [[:alpha:]]+)?")
#'     ## $name
#'     ## [1] "John Smith"
#'
#'     rapport:::extract_meta("Name: John", "Name", "[[:alpha:]]+( [[:alpha:]]+)?")
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


#' Naming Conventions
#'
#' Checks package-specific naming conventions: variables should start by a letter, followed either by a letter or a digit, while the words should be separated with dots or underscores.
#' @param x a character vector to test names
#' @param min.size an integer value that indicates minimum name length
#' @param max.size an integer value that indicates maximum name length
#' @param ... additional arguments to be passed to \code{\link{grepl}} function
#' @return a logical vector indicating which values satisfy the naming conventions
#' @examples
#' rapport:::check.name("foo")               # [1] TRUE
#' rapport:::check.name("foo.bar")           # [1] TRUE
#' rapport:::check.name("foo_bar")           # [1] TRUE
#' rapport:::check.name("foo.bar.234")       # [1] TRUE
#' rapport:::check.name("foo.bar.234_asdf")  # [1] TRUE
#' rapport:::check.name("234.asdf")          # [1] FALSE
#' rapport:::check.name("_asdf")             # [1] FALSE
#' rapport:::check.name(".foo")              # [1] FALSE
check.name <- function(x, min.size = 1L, max.size = 30L, ...){

    re.name <- '^[[:alpha:]]+(([[:digit:]]+)?((\\.|_)?[[:alnum:]]+)+)?$'
    len <- nchar(x)
    if (len < min.size || len > max.size)
        warningf('input name has %d, and should have at least %d and at most %d characters', len, min.size, max.size)

    grepl(re.name, x)
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

    x <- trim.space(x)

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
