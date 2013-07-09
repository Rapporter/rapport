#' Input Name Validation
#'
#' From v.\code{0.51} one or more characters that are not newline should do the trick. Note that white spaces will be trimmed from both ends in resulting string.
#' @param name a character value with input name
guess.input.name <- function(name){
    stopifnot(is.string(name))
    name <- trim.space(name)
    re.name <- '^.+$'
    if (!grepl(re.name, name))
        stopf('invalid input name: "%s"', name)
    name
}


#' Input Label
#'
#' Checks and returns input label.
#' @param label a character string containing input label
guess.input.label <- function(label) {
    if (!is.empty(label)) {
        stopifnot(is.string(label))
        re.label <- "^.*$"
        if (!grepl(re.label, label))
            stopf('invalid input label: "%s"', label)
        return (label)
    }
}


#' Input Description
#'
#' Checks and returns input description.
#' @param description a character string containing input description
guess.input.description <- function(description) {
    if (!is.empty(description)) {
        stopifnot(is.string(description))
        re.desc <- "^.*$"
        if (!grepl(re.desc, description))
            stopf('invalid input description: "%s"', description)
        return (description)
    }
}


##' Guess length-like fields
##'
##' Since length, nchar, nlevels and limit have (almost) same format,
##' @param len length field value, either a number or a named list
##' @param type type of length-like field
##' @param input.name input name
##' @param limit.class input class to perform limit-specific checks
guess.l <- function(len, type = c('length', 'nchar', 'nlevels', 'limit'), input.name = NULL, limit.class = c('numeric', 'integer')) {
    type <- match.arg(type)

    ## only length is mandatory, the others can be NULL
    if (is.null(len)) {
        if (type == 'length')
            return (list(min = 1L, max = 1L))
        else
            return ()
    }

    ## now perform format checks
    nms <- names(len)
    ## input.name <- if (is.null(input.name)) "" else paste0(" ", input.name)

    ## length-like attribute can either be:
    ## - a length-one integer/numeric
    ## - a list with length-one numeric values (either min or max)
    if (!((is.number(len) && type != "limit") || (is.list(len) && all(sapply(len, length) == 1) && (length(nms) && all(nms %in% c("min", "max"))))))
        stopf('"%s" attribute has invalid format', type)

    ## limit can be float
    if (type != 'limit' || (type == 'limit' && limit.class == 'integer')) {
        if (!all(sapply(len, alike.integer)))
            warningf('"%s" value(s) contain float values.\nI will floor them down, but you better change them...', type)
        len <- sapply(len, floor, simplify = !is.list(len))
    }

    ## we may get a number or a list with either min, max or both
    ## all of which contain floored floats (it's okay, they're enough integer-like)

    ## and now check min/max values and other stuff
    switch(type,
           length = {
               l.min <- 1
               l.max <- Inf
           },
           nlevels = {
               l.min <- 1
               l.max <- Inf
           },
           nchar = {
               l.min <- 0
               l.max <- Inf
           },
           limit = {
               ## note that in the previous version I've put
               ## -.Machine$integer.max instead of -Inf
               ## was that for the sake of going native or what?
               ## -Inf will be just fine for integer-likes
               l.min <- -Inf
               l.max <- Inf
           })

    ## result placeholder
    if (is.number(len))
        res <- list(min = len, max = len)
    else {
        res <- list(min = len$min, max = len$max)
        if (is.null(res$min))
            res$min <- l.min
        if (is.null(res$max))
            res$max <- l.max
    }

    if (res$min > res$max)
        stopf('"%s" attribute\'s "min" value cannot be larger than "max"', type)

    if (res$min < l.min || res$max > l.max)
        stopf('"%s" attribute has to fall between %s and %s', type, res$min, res$max)

    return (res)
}


##' Convert YAML booleans to R ones
##'
##' We need this because of the silly R/YAML bug. Chillax, it's for internal use only, and since we're about to call it on bunch of places, we needed a function.
##' @param x a character vector with YAML booleans
as.yaml.bool <- function(x) {
    yesses <- grepl('^(y|yes|true|on)$', x, ignore.case = TRUE)
    noes <- grepl('^(n|no|false|off)$', x, ignore.case = TRUE)
    x[yesses] <- TRUE
    x[noes] <- FALSE
    as.logical(x)
}


#' Guess Input
#'
#' Checks and returns valid input from YAML input definition.
#' @param input a named list containing input definition
guess.input <- function(input) {
    ## class check
    cls <- input$class
    if (!is.null(cls)) {
        allowed.classes <- c('character', 'complex', 'factor', 'integer', 'logical', 'numeric', 'raw')
        if (!cls %in% allowed.classes)
            stopf('unsupported class "%s"', cls)
    }

    ## common fields
    name        <- input$name        <- guess.input.name(input$name)
    label       <- input$label       <- trim.space(guess.input.label(input$label))
    if (is.empty(label))
        warningf('missing label for input "%s"', name)
    description <- input$description <- trim.space(guess.input.description(input$desc))
    if (is.empty(description))
        warningf('missing description for input "%s"', name)
    required    <- input$required    <- isTRUE(as.yaml.bool(input$required))
    len         <- input$length      <- guess.l(input$length, input.name = name)
    value       <- input$value
    lim         <- input$limit
    ## inputs are standalone by default!!!
    if (is.null(input$standalone))
        standalone  <- TRUE
    else
        standalone  <- isTRUE(as.yaml.bool(input$standalone))
    input$standalone <- standalone
    fields <- c('name', 'label', 'description', 'class', 'required', 'standalone', 'length', 'value')
    matchable          <- isTRUE(as.yaml.bool(input$matchable))
    if (matchable && is.null(cls))
        stop('you have to provide the class for matchable inputs')

    ## check value class/length
    if (!is.null(value)) {
        if (matchable && !standalone)
            stopf('matchable inputs (like "%s") can only be standalone', name)
        if (!standalone)
            stopf('"value" attribute assigned to dataset input "%s"', name)
        ## coerce values if needed
        value <- input$value <- switch(cls,
                                       factor = {
                                           as.factor(value)
                                       },
                                       complex = {
                                           as.complex(value)
                                       },
                                       logical = {
                                           as.yaml.bool(value)
                                       },
                                       raw = {
                                           as.raw(value)
                                       },
                                       {
                                           check.input.value(input, attribute.name = 'length')
                                           value
                                       })
        ## class check
        check.input.value.class(value, cls, name)
    }

    ## matchable inputs
    if (matchable) {
        input$matchable    <- matchable
        matchable.opts     <- input$options <- as.character(unname(unlist(input$options)))
        matchable.multiple <- input$allow_multiple <- isTRUE(as.yaml.bool(input$allow_multiple))
        fields             <- c(fields, 'matchable', 'options', 'allow_multiple')

        ## only avaialable for "character" and "factor" class inputs
        if (!cls %in% c('character', 'factor'))
            stop('"matchable" attribute only available for "character" and "factor" inputs')
        ## check for "options" attribute
        if (is.null(matchable.opts))
            stopf('matchable input "%s" must contain "options" attribute with at east one option', name)
        ## option item contained multiple times - issue a warning and unique()-ify it
        opts.unique <- unique(matchable.opts)
        if (!identical(opts.unique, matchable.opts)) {
            warningf('matchable input "%s" contains option items that occur multiple times', name)
            matchable.opts <- input$options <- opts.unique
        }

        ## value is the "default" value
        if (!is.null(value)) {
            ## check if value is specified in options
            matches <- value %in% matchable.opts
            if (!all(matches))
                stopf('matchable input "%s" contains values that are not in the options list: %s', name, p(value[!matches], wrap = '"'))
            if (!matchable.multiple) {
                if (!all(as.numeric(table(value)) == 1))
                    stopf('all provided values in matchable input "%s" should be contained only once in option list (or set `multiple: TRUE` in input definition)', name)
            }
        }
    } else {
        input$matchable <- NULL
        if (!is.null(input$options))
            stopf('"options" attribute provided for non-matchable input "%s"', name)
    }

    if (!is.null(cls))
        switch(cls,
               character = {
                   fields <- c(fields, 'regexp', 'nchar')
                   ## regexp
                   if (!is.empty(input$regexp)) {
                       if (!is.string(input$regexp)) {
                           input$regexp <- NULL
                           warningf('regexp field for "%s" input is not a character string - coerced to NULL', name)
                       }
                   }
                   ## nchar (same format as length, BUT accepts 0 as min)
                   if (!is.null(input$nchar)) {
                       chars <- input$nchar <- guess.l(input$nchar, 'nchar', name)
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
                   fields <- c(fields, 'nlevels')
                   ## nlevels
                   if (!is.null(input$nlevels)) {
                       nlevels <- input$nlevels <- guess.l(input$nlevels, 'nlevels', name, cls)
                       ## check values
                   }
               },
               integer   = ,
               numeric   = {
                   fields <- c(fields, 'limit')
                   ## limits
                   input$limit <- guess.l(input$limit, 'limit', name, cls)
                   ## check limits
                   if (!is.null(input$limit)) {
                       if (is.variable(value))
                           stopifnot(all(value >= input$limit$min) && all(value <= input$limit$max))
                       else
                           stopifnot(all(sapply(value, function(i) i > input$limit$min)) && all(sapply(value, function(i) i < input$limit$max)))
                   }
               },
               logical   = {},
               raw       = {}
               )
    ## check for unsupported fields
    nms <- names(input)
    unsupported.fields <- nms[!nms %in% fields]
    if (length(unsupported.fields))
        warningf('Unsupported fields found in input "%s": %s', input$name, p(unsupported.fields, wrap = "\""))
    input
}


#' Check input value
#'
#' A bit misleading title/function name - it validates input values, according to rules set in general input attributes (\code{length}) or class-specific ones (\code{nchar}, \code{nlevels} or \code{limit}).
#' @param input input item
#' @param value input value, either template-defined, or set by the user
#' @param attribute.name input attributes containing validation rules (defaults to \code{length})
check.input.value <- function(input, value = NULL, attribute.name = c('length', 'nchar', 'nlevels', 'limit')) {
    if (missing(input))
        stop('input definition not provided')
    val <- if (is.null(value)) input$value else value
    a   <- match.arg(attribute.name)
    len <- input[[a]]

    ## perform checks only when both value and limits are provided
    if (!(is.null(val) || is.null(len))) {
        switch(a,
               length = {
                   ## length shouldn't be NULL as this function should be called after guess.l
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
               },
               limit = {
                   a <- 'value'
                   val.len <- val
               })

        ## matchables should be checked to see if they contain less options then provided in limits
        if (isTRUE(input$matchable)) {
            len.ok  <- all(val.len >= len$min)
            err.len <- len$min
            err.msg <- sprintf('matchable %s input "%s" should have at least %d inputs (and it has %d)', input$class, input$name, err.len, val.len)
            ## non-matchables
        } else {
            ## check if value is within length interval
            len.ok <- all(val.len >= len$min && val.len <= len$max)
            len.range.msg <- ifelse(len$min == len$max, paste0('be ', len$min), sprintf('fall between %s and %s', len$min, len$max))
            err.msg <- sprintf('%s input "%s" %s attribute should %s (and it\'s %s)', input$class, input$name, a, len.range.msg, val.len)
        }
        if (!len.ok)
            stop(err.msg)
    }
}


#' Check Input Value Class
#'
#' Checks the class of an input value.
#' @param value input value
#' @param class input class (defaults to \code{NULL})
#' @param input.name input name (used in messages)
check.input.value.class <- function(value, class = c('character', 'complex', 'factor', 'integer', 'logical', 'numeric', 'raw'), input.name = NULL) {
    if (is.null(value))
        return(NULL)
    else {
        if (is.null(class)) {
            cls <- NULL
            cls.name <- 'vector'
            check.fn <- is.variable
        } else {
            cls <- cls.name <- match.arg(class)
            if (class == "integer")
                check.fn <- alike.integer
            else
                check.fn <- sprintf('is.%s', cls)
        }

        input.name.txt <- if (is.string(input.name)) sprintf('"%s" ', input.name) else ''

        if (is.variable(value)) {
            if (!do.call(check.fn, list(x = value)))
                stopf('%sinput class should be %s', input.name.txt, cls.name)
        } else {
            if (!all(sapply(value, function(i) do.call(check.fn, list(x = i)))))
                stopf('provided object should contain only %s vectors', cls.name)
        }
    }
}
