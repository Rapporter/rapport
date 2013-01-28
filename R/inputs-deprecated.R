######################################
## Deprecated input stuff goes here ##
######################################


#' Deprecated input limits
#'
#' Guess deprecated input limits.
#' @param x 
#' @param input.type
#' @examples \dontrun{
#' rapport:::guess.deprecated.input.limits("[1,20]")
#' rapport:::guess.deprecated.input.limits("[1]")
#' rapport:::guess.deprecated.input.limits("[1, 0]")  # will throw error (min limit larger than max limit)
#' rapport:::guess.deprecated.input.limits("")        # returns list(min = 1, max = 1)
#' }

guess.deprecated.input.limits <- function(x, input.type) {
    stopifnot(is.string(x))
    if (missing(input.type))
        stop('input type not provided')

    ## skip checks for boolean inputs
    if (input.type == 'boolean')
        return (list(min = 1L, max = 1L))
    
    ## make a bitchy regex that will cover all allowed formats
    if (!grepl("^(\\[-?\\d+(\\.\\d+)?(,\\s*-?\\d+(\\.\\d+)?)?\\]|\\[\\]|)$", x))
        stop('invalid limit string')

    lim <- suppressWarnings(as.numeric(strsplit(gsub('^\\[(.*)\\]$', '\\1', x), ',')[[1]])) # get limits

    ## if (any(is.na(lim)) || !len %in% 0:2)
    ##     stop('invalid limit definition')
    
    ## if (all(lim == 0) && len)
    ##     stop('limits cannot be zero')
    
    ## if (len > 1 && diff(lim) < 0)
    ##     stop('minimum limit cannot be greater than maximum limit')

    ## variable  = {
    ##     if (!all(floor(lim) == lim) || any(lim < 1))
    ##         stop('decimal and/or less than 1 limit values are not allowed for variable inputs')
    ##     if (len == 0)
    ##         lim <- c(1L, 1L)
    ##     if (len == 1)
    ##         lim <- rep(lim, 2)
    ## },
    ## ## standalone inputs
    ## ## string can now accept mutliple attribute
    ## string = {
    ##     if (!all(floor(lim) == lim) || any(lim < 0))
    ##         stop('decimal and/or negative limit values are not allowed for string inputs')
    ##     if (len == 0)
    ##         lim <- c(1L, 256L)
    ##     ## if (len == 1)
    ##     ##     stop('only one string limit provided')
    ## },
    ## integer = {
    ##     if (!is.yaml.input)
    ##         stop('integer input type is only available via YAML input specification')
    ##     if (len == 0)
    ##         lim <- c(-.Machine$integer.max, .Machine$integer.max)
    ##     if (len == 1)
    ##         stop('only one integer limit provided')
    ##     if (!all(floor(lim) == lim)) {
    ##         warning('decimal limit values are not allowed for integer inputs, limits are rounded')
    ##         lim <- round(lim)
    ##     }
    ## },
    ## number = {
    ##     if (len == 0)
    ##         lim <- c(-Inf, Inf)
    ##     if (len == 1)
    ##         stop('only one number limit provided')
    ## },
    ## option = {
    ##     ## coerce to 1,1 for non-yaml (multiple not available)
    ##     if (!is.yaml.input)
    ##         lim <- c(1L, 1L)
    ##     ## non-negativity
    ##     if (any(lim < 0))
    ##         stop('option inputs cannot contain negative limits')
    ## },

    switch(input.type,
           character = ,
           complex   = ,
           factor    = ,
           logical   = ,
           numeric   = ,
           variable  = {
               ## class: NULL
           },
           string = {
               
           },
           number = {
               
           },
           option = {
               
           },
           stopf('Unknown input type "%s"', input.type))
}


#' Check Type
#'
#' Checks type of template input, based on provided sting. If input definition is syntactically correct, a list is returned, containing input type, size limits, and default value (for CSV options and boolean types only).
#' @param x a character string containing input definition
#' @examples \dontrun{
#' rapport:::guess.deprecated.input.type("factor")
#' rapport:::guess.deprecated.input.type("character[1,20]")
#' rapport:::guess.deprecated.input.type("fee, fi, foo, fam")
#' rapport:::guess.deprecated.input.type("FALSE")
#' rapport:::guess.deprecated.input.type("number[3]=123.456")
#' }
guess.deprecated.input.type <- function(x){

    x <- trim.space(x)

    if (is.empty(x))
        stop('input type definition not specified')

    ## regexes
    type.regex    <- "(character|complex|factor|logical|numeric|variable|TRUE|FALSE|number|string)"
    limit.regex   <- paste("^\\*?", type.regex, "(\\[.*\\]|).*$", sep = "")
    csv.regex     <- "^(([[:alnum:]\\._]+)(, ?[[:alnum:]\\._]+){1,})$"
    default.regex <- "^.+=(.*)$"

    mandatory <- grepl("^\\*", x)
    input.type <- gsub(limit.regex, "\\1", x)
    ## this may be option input
    if (input.type == x)
        limit.text <- ''
    else
        limit.text <- gsub(limit.regex, "\\2", x)
    default <- if (grepl(default.regex, x)) gsub(default.regex, "\\1", x) else NULL

    switch(input.type,
           character =,
           complex   =,
           factor    =,
           logical   =,
           numeric   =,
           variable  = list(
               type = input.type,
               limit = guess.input.limits(limit.text, input.type),
               default = NULL,
               mandatory = mandatory
               ),
           "TRUE" =,
           "FALSE" = list(
               type = 'boolean',
               limit = list(
                   min = 1,
                   max = 1
                   ),
               default = as.logical(input.type),
               mandatory = FALSE
               ),
           number =,
           string = {
               limit <- guess.input.limits(limit.text, input.type)

               if (input.type == 'number') {
                   if (!is.null(default)) {
                       default <- as.numeric(default)
                       if (is.na(default))
                           default <- NULL
                       if (length(default) == 1 && (default < limit$min || default > limit$max))
                           stopf('default number value %s not in specified limit interval [%s, %s]', default, limit$min, limit$max)
                   }
               }
               
               if (input.type == 'string') {
                   if (!is.null(default) && (nchar(default) < limit$min || nchar(default) > limit$max))
                       stopf('default string value "%s" must have at least %d and at most %d characters', default, limit$min, limit$max)
               }

               list(
                   type = input.type,
                   limit = limit,
                   default = default,
                   mandatory = mandatory
                   )
           },
           ## this may be option input
           (function(){
               if (grepl(csv.regex, x))
                   list(
                       type = 'option',
                       limit = list(
                           min = 1,
                           max = 1
                           ),
                       default = strsplit(x, ' *, *')[[1]],
                       mandatory = FALSE
                       )
               else
                   stop('invalid input type')
           })()
           )
}
