######################################
## Deprecated input stuff goes here ##
######################################


#' Deprecated input limits
#'
#' Guess deprecated input length.
#' @param x 
#' @param input.type
guess.old.input.length <- function(x, input.type) {
    stopifnot(is.string(x))
    if (missing(input.type))
        stop('input type not provided')

    ## skip checks for boolean inputs
    if (input.type == 'boolean')
        return (list(exactly = 1L))
    
    ## make a bitchy regex that will cover all allowed formats
    ## if (!grepl("^(\\[-?\\d+(\\.\\d+)?(,\\s*-?\\d+(\\.\\d+)?)?\\]|\\[\\]|)$", x))
    ##     stop('invalid limit string')

    lim <- suppressWarnings(as.numeric(strsplit(gsub('^\\[(.*)\\]$', '\\1', x), ',')[[1]])) # get limits
    len <- length(lim)

    if (any(is.na(lim)) || !len %in% 0:2)
        stop('invalid limit definition')
    
    if (all(lim == 0) && len)
        stop('limits cannot be zero')
    
    if (len > 1 && diff(lim) < 0)
        stop('minimum limit cannot be greater than maximum limit')

    switch(input.type,
           character = ,
           complex   = ,
           factor    = ,
           logical   = ,
           numeric   = ,
           variable  = {
               if (!all(floor(lim) == lim) || any(lim < 1))
                   stop('decimal and/or less than 1 limit values are not allowed for variable inputs')
               ## length checks
               if (len == 0)
                   lim <- list(exactly = 1L)
               else if (len == 1)
                   lim <- list(exactly = 1L)
               else
                   if (length(unique(lim)) == 1)
                       lim <- list(exactly = lim[1])
                   else
                       lim <- list(min = as.integer(lim[1]), max = as.integer(lim[2]))
           },
           ## standalone inputs
           string = {
               ## not a limit check, but "nchar" attribute, hence "min"/"max"
               if (!all(floor(lim) == lim) || any(lim < 0))
                   stop('decimal and/or negative limit values are not allowed for string inputs')
               ## length checks
               if (len == 0)
                   lim <- list(min = 1L, max = 256L)
               ## only one limit = exactly
               else if (len == 1)
                   lim <- list(exactly = as.integer(len))
               else
                   lim <- list(min = as.integer(lim[1]), max = as.integer(lim[2]))
           },
           number = {
               ## not a length check, but limit, so it's min/max
               if (len == 0)
                   lim <- list(min = -Inf, max = Inf)
               else if (len == 1)
                   stop('only one number limit provided')
               else
                   lim <- list(min = lim[1], max = lim[2])
           },
           stopf('Unknown input type "%s"', input.type)
           )
    return (lim)
}


#' Check Type
#'
#' Checks type of template input, based on provided sting. If input definition is syntactically correct, a list is returned, containing input type, size limits, and default value (for CSV options and boolean types only).
#' @param x a character string containing input definition
guess.old.input.type <- function(x){

    x <- trim.space(x)

    if (is.empty(x))
        stop('input type definition not specified')

    ## regexes
    type.regex    <- "(character|complex|factor|logical|numeric|variable|TRUE|FALSE|number|string)"
    limit.regex   <- paste("^\\*?", type.regex, "(\\[.*\\]|).*$", sep = "")
    csv.regex     <- "^(([[:alnum:]\\._]+)(, ?[[:alnum:]\\._]+){1,})$"
    default.regex <- "^.+=(.*)$"

    mandatory  <- isTRUE(grepl("^\\*", x))
    input.type <- gsub(limit.regex, "\\1", x)
    ## this may be matchable input
    if (input.type == x)
        limit.text <- ''
    else
        limit.text <- gsub(limit.regex, "\\2", x)
    default <- if (grepl(default.regex, x)) gsub(default.regex, "\\1", x) else NULL

    switch(input.type,
           character = ,
           complex   = ,
           factor    = ,
           logical   = ,
           numeric   = list(
               class      = input.type,
               length     = guess.old.input.length(limit.text, input.type),
               value      = NULL,
               required   = mandatory,
               standalone = FALSE
               ),
           variable  = list(
               class      = 'any',
               length     = guess.old.input.length(limit.text, input.type),
               value      = NULL,
               required   = mandatory,
               standalone = FALSE
               ),
           "TRUE"  = ,
           "FALSE" = list(
               class      = 'logical',
               length     = list(exactly = 1L),
               value      = as.logical(input.type),
               required   = FALSE,
               standalone = TRUE
               ),
           number = {
               ## these are limits, not length(s)
               limit <- guess.old.input.length(limit.text, input.type)
               ## default value
               if (!is.null(default)) {
                   default <- as.numeric(default)
                   if (is.na(default))
                       default <- NULL
                   if (length(default) == 1 && (default < limit$min || default > limit$max))
                       stopf('default number value %s not in specified limit interval [%s, %s]', default, limit$min, limit$max)
               }
               ## response
               list(
                   class      = 'numeric',
                   length     = list(exactly = 1L),
                   value      = default,
                   limit      = limit,
                   required   = mandatory,
                   standalone = TRUE
                   )
           },
           string = {
               ## this is range of nchar, which we don't implement at the moment
               chars <- guess.old.input.length(limit.text, input.type)
               
               if (!is.null(default) && (nchar(default) < chars$min || nchar(default) > chars$max))
                   stopf('default string value "%s" must have at least %d and at most %d characters', default, limit$min, limit$max)

               list(
                   class      = 'character',
                   length     = list(exactly = 1),
                   value      = default,
                   nchar      = chars,
                   required   = mandatory,
                   standalone = TRUE
                   )
           },
           ## this may be matchable input
           (function(){
               if (grepl(csv.regex, x))
                   list(
                       class      = 'character',
                       length     = list(exactly = 1L),
                       value      = strsplit(x, ' *, *')[[1]],
                       matchable  = TRUE,
                       required   = FALSE,
                       standalone = TRUE
                       )
               else
                   stop('invalid input type')
           })()
           )
}


#' Renew deprecated template
#'
#' Convert old-style template to new-style one (what we really do is just replacing old header syntax with YAML one).
#' @param fp 
#' @export 
tpl.renew <- function(fp, output = NULL) {
    h <- tpl.info(fp)                   #header
    b <- tpl.body(fp)                   #body
    new <- strsplit(as.yaml(h), '\n')[[1]]
    tpl <- c('<!--head', new, 'head-->', b)
    if (missing(output))
        return(tpl)
    else {
        cat(tpl, sep = '\n', file = output)
        invisible(tpl)
    }
}
