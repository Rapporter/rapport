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


#' Input length validation
#'
#' Perform (in)sanity checks on input \code{length} attribute.
#' @param len 
guess.input.length <- function(len) {
    
    ## only "min", "max" and "exactly"
    ## if NULL, set some defaults:
    ## - like... 1?
    ## if non-NULL, it can be:
    ## - an integer, which is equivalent to "exactly: x"
    ## - a named list with integer vectors:
    ##   - "min", "max" or "exactly" attribute
    ##     - "min", "max" and "exactly" should be length-one integers
    ##   - both "min" and "max" attributes supplied
    ##     - they should both be length-one integers

    if (is.null(len))
        return (list(exactly = 1L))
    else if (is.number(len))
        return (list(exactly = as.integer(len)))
    else if (is.list(len)) {
        l.names  <- names(len)
        l.length <- length(len)
        
        ## check names
        stopifnot(all(l.names %in% c('min', 'max', 'exactly')))
        ## coerce to numeric
        len <- lapply(len, function(x){
            x <- suppressWarnings(as.numeric(x))
            if (any(is.na(x)))
                stop('cannot coerce length to numeric')
            x
        })

        check.len.int <- function(x) {
            if (!is.recursive(x)){
                if (is.null(x))
                    return(1L)
                else
                    if (length(x) != 1)
                        stop('length attributes "min" and "max" must be length-one integers')
                    else {
                        if (floor(x) != x) {
                            warning('coercing number to integer')
                            floor(x)
                        } else if (x < 1)
                            stop('only positive integers can be provided')
                        else
                            x
                    }
            } else
                lapply(x, check.len.int)
        }
        
        switch(l.length,
               ## length-one list
               {
                   len <- check.len.int(len)
                   switch(l.names,
                          min = {
                              len <- list(min = len$min, max = Inf)
                          },
                          max = {
                              len <- list(min = 1L, max = len$max)
                          },
                          exactly = {
                              ## just don't fall through =P
                          },
                          stopf('invalid length attribute: "%s"', l.names)
                          )
               },
               ## length-two list ("min", "max")
               {
                   if (!setequal(l.names, c('min', 'max')))
                       stop('only "min" and "max" should be provided')
                   len <- check.len.int(len)
                   ## check if "min" == "max"
                   len.u <- unique(unlist(len))
                   if (length(len.u) == 1) {
                       lim <- list(exactly = len.u)
                       warningf('"min" and "max" are both equal to %d: coercing to "exactly"', len.u)
                   }
               },
               ## because it's lame to halt with "invalid length length" =P
               stop('invalid length specification')
               )
    } else
        stop('invalid length type')

    if (length(len) == 2 && len$min > len$max)
        stop('"min" value cannot be smaller than "max" value')

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
        limit <- lapply(limit, function(x) {
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
    ## class check
    cls <- input$class
    if (is.null(cls))
        cls <- input$class <- 'any'
    allowed.classes <- c('character', 'complex', 'factor', 'integer', 'logical', 'numeric', 'raw', 'any')
    if (!cls %in% allowed.classes)
        stopf('unsupported class "%s"', cls)

    ## common fields
    name        <- input$name        <- guess.input.name(input$name)
    label       <- input$label       <- guess.input.label(input$label)
    description <- input$description <- guess.input.description(input$desc)
    required    <- input$required    <- isTRUE(as.logical(input$required))
    len         <- input$length      <- guess.input.length(input$length)
    value       <- input$value
    lim         <- input$limit
    ## inputs are standalone by default
    if (is.null(input$standalone))
        standalone  <- TRUE
    else
        standalone  <- isTRUE(as.logical(input$standalone))
    input$standalone <- standalone

    ## check value class/length
    if (!is.null(value)) {
        if (!standalone)
            stopf('"value" attribute assigned to dataset input "%s"', name)

        ## coerce factor values
        if (cls == 'factor'){
            value <- input$value <- as.factor(value)
        } else {
            ## length (don't check for options, do that in rapport() call)
            check.input.value(input, attribute.name = 'length')
        }
        ## class check
        check.input.class(value, cls, name)
    }

    ## matchable
    matchable <- input$matchable <- isTRUE(as.logical(input$matchable))
    if (matchable && !cls %in% c('character', 'factor'))
        stop('"matchable" attribute only available for "character" and "factor" inputs')

    switch(cls,
           any       = {},
           character = {
               ## regexp
               if (!is.empty(input$regexp, trim = TRUE) && !is.string(input$regexp)) {
                   input$regexp <- NULL
                   warningf('regexp field for "%s" input is not a character string - coerced to NULL', name)
               }
               
               ## nchar (same format as length)
               if (!is.null(input$nchar)) {
                   chars <- input$nchar <- guess.input.length(input$nchar)
                   check.input.value(input, attribute.name = 'nchar')
               }

               ## check value (if any)
               if (!is.null(value)) {
                   ## regexp check (value can be a vector)
                   if (!is.null(input$regexp))
                       if (!all(grepl(input$regexp, value)))
                           stopf('%s input "%s" value is not matched with provided regular expression "%s"', name, value, input$regexp)
               }
           },
           ## what should we ever check for complex?!
           complex   = {},
           factor    = {
               ## nlevels
               if (!is.null(input$nlevels)) {
                   nlevels <- input$nlevels <- guess.input.length(input$nlevels)
                   ## check values
               }
           },
           integer   = ,
           numeric   = {
               ## limits
               input$limit <- guess.input.limit(input)
               ## check limits
               if (!is.null(input$limit)){
                   if (is.variable(value))
                       stopifnot(all(value >= input$limit$min) && all(value <= input$limit$max))
                   else
                       stopifnot(all(sapply(value, function(i) i > input$limit$min)) && all(sapply(value, function(i) i < input$limit$max)))
               }
           },
           logical   = {},
           raw       = {}
           )

    ## move class from named list element to object attribute (the proper "class")
    input
}


#' Check input value
#'
#' 
#' @param input 
#' @param value 
#' @param attribute.name 
check.input.value <- function(input, value = NULL, attribute.name = c('length', 'nchar', 'nlevels')) {
    if (missing(input))
        stop('input definition not provided')
    val <- if (is.null(value)) input$value else value
    a   <- match.arg(attribute.name)
    len <- input[[a]]

    ## perform checks only when both value and limits are provided
    if (!(is.null(val) || is.null(len))) {
        switch(a,
               length = {
                   ## length shouldn't be NULL as this function should be called after guess.input.length
                   ## BUT, you never know...
                   if (is.null(len))
                       stopf('length attribute for %s input "%s" is missing', input$class, input$name)
                   val.len <- length(val)
               },
               nchar = {
                   if (input$class != 'character')
                       stop('"nchar" check can only be performed on character inputs')
                   val.len <- nchar(val)
               },
               nlevels = {
                   if (input$class != 'factor')
                       stop('"nlevels" check can only be performed on factor inputs')
                   if (is.variable(val))
                       val.len <- nlevels(val)
                   else
                       val.len <- sapply(val, nlevels)
               })
        
        ## check if value is within length interval
        if (is.null(len$exactly))
            len.ok <- all(val.len >= len$min && val.len <= len$max)
        else
            len.ok <- all(val.len == len$exactly)
        if (!len.ok)
            stopf('incorrect %s for "%s" input', a, input$name)
    }
}


#' Check input value class
#'
#' Checks the class of value
#' @param input 
#' @param class 
check.input.class <- function(value, class = c('character', 'complex', 'factor', 'integer', 'logical', 'numeric', 'raw', 'option', 'any'), input.name = NULL) {
    if (is.null(value))
        return(NULL)
    else {
        if (missing(class))
            cls <- 'any'
        else
            cls <- match.arg(class)

        check.fn <- switch(cls,
                           any = is.variable,
                           option = is.character,
                           sprintf('is.%s', cls)
                           )
        
        input.name.txt <- if (is.string(input.name)) sprintf('"%s" ', input.name) else ''

        if (is.variable(value)) {
            if (!do.call(check.fn, list(x = value)))
                stopf('%sinput class should be %s', input.name.txt, cls)
        } else {
            if (!all(sapply(value, function(i) do.call(check.fn, list(x = i)))))
                stopf('provided object should contain only %s vectors', cls)
        }
    }
}
