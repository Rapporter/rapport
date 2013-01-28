######################################################
## New... err, non-deprecated input stuff goes here ##
######################################################


#' Input Name Validation
#'
#' Checks package-specific naming conventions: variables should start by a letter, followed either by a letter or a digit, while the words should be separated with dots or underscores.
#' @param x a character vector to test names
#' @param min.size an integer value that indicates minimum name length
#' @param max.size an integer value that indicates maximum name length
#' @param ... additional arguments to be passed to \code{\link{grepl}} function
#' @return a logical vector indicating which values satisfy the naming conventions
#' @examples
#' rapport:::check.input.name("foo")               # [1] TRUE
#' rapport:::check.input.name("foo.bar")           # [1] TRUE
#' rapport:::check.input.name("foo_bar")           # [1] TRUE
#' rapport:::check.input.name("foo.bar.234")       # [1] TRUE
#' rapport:::check.input.name("foo.bar.234_asdf")  # [1] TRUE
#' rapport:::check.input.name("234.asdf")          # [1] FALSE
#' rapport:::check.input.name("_asdf")             # [1] FALSE
#' rapport:::check.input.name(".foo")              # [1] FALSE
guess.input.name <- function(x, min.size = 1L, max.size = 30L, ...){
    ## must begin with a letter, and can continue either with a letter or a digit, separated either by underscore or dot, e.g. 'var.90', or 'v90_alpha'.
    re.name <- '^[[:alpha:]]+(([[:digit:]]+)?((\\.|_)?[[:alnum:]]+)+)?$'
    len <- nchar(x)
    if (len < min.size || len > max.size)
        stopf('input name has %d, and should have at least %d and at most %d characters', len, min.size, max.size)
    if (!grepl(re.name, x))
        stopf('invalid input name: "%s"', x)
    x
}


#' Input Label
#'
#' Check input label.
#' @param label
#' @param ...
guess.input.label <- function(label, name, ...) {
    re.label <- "^[^\\|\n\r]*$" # to be used for variable label and description (allows 0 or more chars that aren't "|", carriage return or newline)
    if (is.empty(label))
        warningf('label string for input "%s" was not provided', name)
    if (!grepl(re.label, label, ...))
        stopf('invalid input label: "%s"', label)
    label
}


#' Input Description
#'
#' Check input description.
#' @param description
#' @param ...
guess.input.description <- function(description, name, ...) {
    re.desc <- "^.*$"
    if (is.empty(description))
        warningf('description string for input "%s" was not provided', name)
    if (!grepl(re.desc, description, ...))
        stopf('invalid input description: "%s"', description)
    description
}


## #' Input Length
## #'
## #' Input length
## #' @param input a character string containing limit substring or a named list with input specifications containing limit
## #' @param ...
## #' @return a named list with \code{min}imal and \code{max}imal input limit
## guess.input.length <- function(input, ...){

##     ## it can be a string (deprecated input specification)
##     if (is.string(input))
##         return (guess.deprecated.input.limits(input, ...))
##     ## or it can be a list holding new input specification #fuckyeah
##     else if (is.list(x))
##         len <- input$length
##     else
##         stop('invalid limit')

##     ## it's not limits any more, it's LENGTH now
##     len <- length(lim)

##     switch(input$class,
##            character = {
##            },
##            complex   = {

##            },
##            factor    = {

##            },
##            logical   = {

##            },
##            numeric   = {

##            },
##            raw = {

##            },
##            option = {
##                ## coerce to 1,1 for non-yaml (multiple not available)
##                if (!is.yaml.input)
##                    lim <- c(1L, 1L)
##                ## non-negativity
##                if (any(lim < 0))
##                    stop('option inputs cannot contain negative limits')
##            },
##            ## replace this with mary =)
##            stopf('Unsupported input class "%s"', input.type))

##     structure(as.list(lim), .Names = c('min', 'max'))
## }


#' Input length validation
#'
#' Perform (in)sanity checks on input \code{length} attribute.
#' @param len 
guess.input.length <- function(len) {
    
    ## only "min", "max", "exactly" and "in"
    ## if NULL, set some defaults:
    ## - like... 1?
    ## if non-NULL, it can be:
    ## - an integer, which is equivalent to "exactly: x"
    ## - a named list with integer vectors:
    ##   - "min", "max", "exactly" or "in" attribute
    ##     - "min", "max" and "exactly" should be length-one integers
    ##     - "in" should be integer range
    ##   - both "min" and "max" attributes supplied
    ##     - they should both be length-one integers

    if (is.null(len))
        return (list(exactly = 1L))
    else if (is.list(len)) {
        l.names  <- names(len)
        l.length <- length(len)
        ## TODO: check names

        check.len.int <- function(x) {
            if (!is.recursive(x)){
                if (is.null(x))
                    return(1L)
                else
                    if (length(x) != 1)
                        stop('length attributes "min" and "max" must be length-one integers')
                    else
                        if (grepl("^\\d+\\:\\d+$", x))
                            eval(parse(text = x))
                        else if (floor(x) != x) {
                            warning('coercing number to integer')
                            floor(x)
                        } else if (x < 1)
                            stop('only positive integers can be provided')
                        else
                            x
            } else
                lapply(x, check.len.int)
        }
        
        switch(l.length,
               ## length-one list
               {
                   len <- check.len.int(len)
                   switch(l.names,
                          min = {
                              len$max <- 1L
                          },
                          max = {
                              len$min <- 1L
                          },
                          exactly = {
                              ## just don't fall through =P
                          },
                          'in' = {
                              f <- trim.space(len['in'])
                              ## now, "in" will be a string in format ("from:to")
                              if (!grepl("^\\d+\\:\\d+$", f))
                                  stop('range attribute ("in") should be specified in format "from:to"')
                              else
                                  f <- eval(parse(text = f))
                              ## only non-zero positive integers
                              if (!(is.integer(f) && length(f) > 1 && !any(is.na(f)) && !any(f < 1)))
                                  stop('"in" length attribute can contain only a range of non-zero positive integers')
                              ## not likely to happen, but still...
                              if (any(is.na(f)))
                                  stop('NA found in length range')
                          },
                          stopf('invalid length attribute: "%s"', l.names)
                          )
               },
               ## length-two list ("min", "max")
               {
                   if (!setequal(l.names, c('min', 'max')))
                       stop('only "min" and "max" should be provided')
                   len <- check.len.int(len)
               },
               ## because it's lame to halt with "invalid length length" =P
               stop('invalid length specification')
               )
    } else
        stop('invalid length type')

    if (length(len) == 2 && len$min > len$max)
        stop('"min" length cannot be smaller than "max" length')

    return(len)
}


#' Guess input limits
#'
#' Guess input limits for \code{integer} and \code{numeric} inputs
#' @param input an input list
guess.input.limit <- function(input) {
    if (!input$class %in% c('integer', 'numeric'))
        stop('limits are available only for "numeric" and "integer" inputs')
    ## if NULL, leave as such (no checks will be performed)
    if (is.null(input$limit))
        return (NULL)
    else {
        cls         <- input$class
        limit       <- input$limit
        limit.names <- names(limit)
        limit.len   <- length(limit)
        ## if both "min" and "max" are NULL, return NULL
        if (all(sapply(limit, is.null)))
            return (NULL)
        
        stopifnot(limit.len %in% 1:2)
        stopifnot(all(limit.names %in% c('min', 'max')))
        ## length-one integers or numerics
        limit <- lapply(limit, function(x){
            if (!is.null(x)) {
                stopifnot(length(x) == 1)
                if (cls == 'integer') {
                    x <- suppressWarnings(as.integer(x))
                    if (is.na(x))
                        stop('integer coercion failed')
                }
                x
            }
        })
        
        ## check length ("min", "max" or both)
        if (is.null(limit$min))
            limit$min <- ifelse(cls == 'integer', -.Machine$integer.max, -Inf)
        if (is.null(limit$max))
            limit$max <- ifelse(cls == 'integer', .Machine$integer.max, Inf)

        if (limit$min > limit$max)
            stop('"min" limit cannot be larger than "max" limit')
        
        return (limit)
    }
}


#' Guess YAML inputs
#'
#' Check and return YAML input.
#' @param input
guess.input <- function(input) {
    ## check class
    cls             <- input$class
    allowed.classes <- c('character', 'complex', 'factor', 'integer', 'logical', 'numeric', 'raw', 'option')
    stopifnot(cls %in% allowed.classes)

    ## common fields
    name        <- input$name        <- guess.input.name(input$name)
    label       <- input$label       <- guess.input.label(input$label)
    description <- input$description <- guess.input.description(input$desc)
    required    <- input$required    <- isTRUE(as.logical(input$required))
    ## option inputs are always standalone
    ## until we figure out how to make them more native
    ## like, e.g. adding an additional argument to input
    standalone  <- input$standalone  <- isTRUE(as.logical(input$standalone)) || cls == 'option'
    len         <- input$length      <- guess.input.length(input$length)
    value       <- input$value
    lim         <- input$limit

    ## check value length
    if (standalone)
        check.input.value.length(input)
    else
        if (!is.null(value))
            stopf('"value" attribute assigned to non-standalone input "%s"', name)

    switch(cls,
           character = {
               ## regexp
               if (!is.empty(input$regexp, trim = TRUE) && !is.string(input$regexp)) {
                   input$regexp <- NULL
                   warningf('regexp field for "%s" input is not a character string - coerced to NULL', name)
               }
               
               ## nchar (only for standalone inputs)
               chars   <- as.integer(input$nchar)
               charlen <- length(chars)
               if (charlen) {
                   ## coercion to integer failed
                   if (is.na(chars))
                       stop('"nchar" should be an integer value')
                   ## only length-one inte
                   if (charlen != 1)
                       stop('"nchar" field should contain only one integer')
                   ## only for standalone inputs
                   if (!standalone){
                       warningf('"nchar" field specified in non-standalone input "%s"', name)
                       input$nchar <- NULL
                   }
                   input$nchar <- chars
               } else
                   chars <- input$nchar <- NULL
               
               ## check value (if any)
               if (!is.null(value)){
                   ## class check
                   stopifnot(is.character(value))
                   ## regexp check (value can be a vector)
                   if (!is.null(input$regexp))
                       if (!all(grepl(input$regexp, value)))
                           stopf('%s input "%s" value is not matched with provided regular expression "%s"', name, value, input$regexp)
                   ## nchar check
                   if (nchar(value) != chars)
                       stopf('%s input "%s" default value "%s" does not have %d characters', cls, name, )
               }
           },
           ## what should we ever check for complex?!
           complex   = {},
           factor    = {
               ## nlevels
               if (!is.null(input$nlevels))
                   if (!(is.integer(input$nlevels) && length(input$nlevels) == 1))
                       stopf('"nlevels" attribute in factor input "%s" should be an integer value', name)
           },
           integer   = ,
           numeric   = {
               ## limits
               input$limit <- guess.input.limit(input)
           },
           ## what about logical? number of TRUE/FALSE?
           logical   = {},
           ## option input can be multiple in YAML
           option    = {
               input$multiple <- isTRUE(as.logical(input$multiple))
           },
           raw       = {}
           )

    ## move class from named list element to object attribute (the proper "class")
    class(input) <- c("input", input$class)
    input
}


#' Input value length
#'
#' Checks input \code{value} (if any) against provided \code{length} rules. Must be called after \code{\link{guess.input.length}}, and for \code{standalone} inputs only (this check is performed in \code{\link{guess.input}}).
#' @param input 
check.input.value.length <- function(input) {
    if (missing(input))
        stop('input definition not provided')
    ## length shouldn't be NULL as this function should be called after guess.input.length
    ## BUT, you never know...
    if (is.null(input$length))
        stopf('length attribute for %s input "%s" is missing', input$class, input$name)
    ## value can be NULL, so perform checks only when the value is provided
    if (!is.null(input$val)) {
        val     <- input$val
        val.len <- length(val)
        if (!is.null(len$exactly)) {
            ## exactly N inputs
            if (val.len != len$exactly)
                stopf('%s input "%s" value length is not %d', input$class, input$name, len$exactly)
            ## in (range)
        } else if (!is.null(len['in'])) {
            if (!val.len %in% len['in'])
                stopf('%s input "%s" value length is not in the provided range [%d:%d]', input$class, input$name, len['in'][1], len['in'][length(len['in'])])
        } else {
            ## min/max
            if (len$min > val.len || len$max < val.len)
                stopf('%s input "%s" value length cannot be smaller than %d or larger than %d', input$class, input$name, len$min, len$max)
        }
    }
}
