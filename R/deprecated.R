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


#' Deprecated input limits
#'
#' Guess deprecated input length.
#' @param x a character string containing input length definition
#' @param input.type a character string containing input type
guess.old.input.length <- function(x, input.type) {
    stopifnot(is.string(x))
    if (missing(input.type))
        stop('input type not provided')

    ## skip checks for boolean inputs
    if (input.type == 'boolean')
        return (list(min = 1, max = 1))

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
                   lim <- list(min = 1, max = 1)
               else if (len == 1) {
                   lim <- floor(lim)
                   lim <- list(min = lim, max = lim)
               } else
                   if (length(unique(lim)) == 1) {
                       lim <- floor(lim[1])
                       lim <- list(min = lim, max = lim)
                   } else
                       lim <- list(min = floor(lim[1]), max = floor(lim[2]))
           },
           ## standalone inputs
           string = {
               ## not a limit check, but "nchar" attribute, hence "min"/"max"
               if (!all(floor(lim) == lim) || any(lim < 0))
                   stop('decimal and/or negative limit values are not allowed for string inputs')
               ## length checks
               if (len == 0)
                   lim <- list(min = 1, max = 256)
               ## only one limit
               else if (len == 1) {
                   lim <- floor(lim)
                   lim <- list(min = lim, max = lim)
               } else
                   lim <- list(min = floor(lim[1]), max = floor(lim[2]))
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
    if (is.empty(x <- trim.space(x)))
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
               ## class      = NULL,
               length     = guess.old.input.length(limit.text, input.type),
               value      = NULL,
               required   = mandatory,
               standalone = FALSE
               ),
           "TRUE"  = ,
           "FALSE" = list(
               class      = 'logical',
               length     = list(min = 1, max = 1),
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
                   length     = list(min = 1, max = 1),
                   value      = default,
                   limit      = limit,
                   required   = mandatory,
                   standalone = TRUE
                   )
           },
           string = {
               chars <- guess.old.input.length(limit.text, input.type)

               if (!is.null(default) && (nchar(default) < chars$min || nchar(default) > chars$max))
                   stopf('default string value "%s" must have at least %d and at most %d characters', default, limit$min, limit$max)

               list(
                   class      = 'character',
                   length     = list(min = 1, max = 1),
                   value      = default,
                   nchar      = chars,
                   required   = mandatory,
                   standalone = TRUE
                   )
           },
           ## this may be matchable input
           (function(){
               if (grepl(csv.regex, x)) {
                   opts <- strsplit(x, ' *, *')[[1]]
                   list(
                       class          = 'character',
                       length         = list(min = 1, max = 1),
                       options        = opts,
                       value          = opts[1],
                       matchable      = TRUE,
                       allow_multiple = FALSE,
                       required       = FALSE,
                       standalone     = TRUE
                       )
               } else
                   stop('invalid input type')
           })()
           )
}


#' Renew deprecated template
#'
#' Convert old-style template to new-style one (what we really do is just replacing old header syntax with YAML one).
#' @param fp pointer to an old template (see \code{rapport:::rapport.read} for details)
#' @param file a path to output file. If \code{NULL}, result will be flushed to stdout.
#' @export
#' @aliases rapport.renew tpl.renew
rapport.renew <- function(fp, file = NULL) {
    h <- suppressWarnings(rapport.info(fp)) #header
    b <- rapport.body(fp)                   #body
    new <- as.yaml(h)
    tpl <- paste0("<!--head\n", as.yaml(h), "head-->\n", paste0(b, collapse = "\n"), collapse = "")
    if (missing(file))
        return(tpl)
    else {
        cat(tpl, file = file)
        invisible(tpl)
    }
}
#' @export
tpl.renew <- rapport.renew


#' Deprecated Input Definition
#'
#' As of version \code{0.5}, \code{rapport} relies on YAML syntax to define inputs. The following sections describe deprecated input definition syntax.
#'
#' \strong{Input Specifications}
#'
#' Apart from \emph{template metadata}, header also requires specification for template \emph{inputs}. In most cases, \emph{inputs} refer to variable names in provided dataset, but some inputs have special meaning inside \code{rapport}, and some of them don't have anything to do with provided dataset whatsoever. Most inputs can contain limit specification, and some inputs can also have a default value. At first we'll explain input specifications on the fly, and in following sections we'll discuss each part in thorough details. Let's start with a single dummy input specification:
#'
#' \code{*foo.bar | numeric[1,6] | Numeric variable | A set of up to 6 numeric variables}
#'
#' \strong{Required Inputs}
#'
#' Asterisk sign (\code{*}) in front of an input name indicates a mandatory input. So it is possible to omit input (unless it's required, of course), but you may want to use this feature carefully, as you may end up with ugly output. If an input isn't mandatory,\code{NULL}is assigned to provided input name, and the object is stored in transient evaluation environment.
#'
#' \strong{Input Name}
#'
#' \emph{rapport} has its own naming conventions which are compatible, but different from traditional \strong{R} naming conventions. Input name ("foo.bar" in previous example) must start with an alphabet letter, followed either by other alphabet letters or numbers, separated with \code{_} or \code{.}. For example, valid names are: \code{foo.bar}, \code{f00_bar}, or \code{Fo0_bar.input}. Input name length is limited on 30 characters by default. At any time you can check your desired input name with \code{check.name} function. Note that input names are case-sensitive, just like \code{symbol}s in \strong{R}.
#'
#' \strong{Input Type}
#'
#' \emph{Input type} is specified in the second input block. It is the most (read: "only") complex field in an input specification. It consists of \emph{type specification}, \emph{limit specification} and sometimes a \emph{default value specification}. Most input types are compatible with eponymous \strong{R} modes: \emph{character}, \emph{complex}, \emph{logical}, \emph{numeric}, or \strong{R} classes like \emph{factor}. Some are used as "wildcards", like \emph{variable}, and some do not refer to dataset variables at all: \emph{boolean}, \emph{number}, \emph{string} and \emph{option}. Here we'll discuss each input type thoroughly. We will use term \emph{variable} to denote a vector taken from a dataset (for more details see documentation for \code{is.variable}). All inputs can be divided into two groups, depending on whether they require a dataset or not:
#'
#' \itemize{
#'     \item \strong{dataset inputs}: \itemize{
#'         \item \emph{character} - matches a character variable
#'         \item \emph{complex} - matches a character variable
#'         \item \emph{numeric} - matches a numeric variable
#'         \item \emph{factor} - matches a factor variable (i.e. R object of \code{factor} class)
#'         \item \emph{variable} - matches any variable of previously defined types
#'     }
#'     \item \strong{standalone inputs}: \itemize{
#'         \item \emph{string} - accepts an atomic character vector
#'         \item \emph{number} - accepts an atomic numeric vector
#'         \item \emph{boolean} - accepts a logical value
#'         \item \emph{option} - accepts a comma-separated list of values, that are to be matched with \code{\link{match.arg}}. The first value in a list is the default one.
#'     }
#' }
#'
#' Now we'll make a little digression and talk about \strong{input limits}. You may have noticed some additional stuff in type specification, e.g. \code{numeric[1,6]}. All dataset inputs, as well as *string* and *numeric standalone inputs* can contain \emph{limit specifications}. If you want to bundle several variables from dataset or provide a vector with several string/numeric values, you can apply some rules within square brackets in \code{[a,b]} format, where \code{[a,b]} stands for "from \code{a} to \code{b} inputs", e.g. \code{[1,6]} means "from 1 to 6 inputs". Limit specifications can be left out, but even in that case implicit limit rules are applied - for variables, as well as boolean and option inputs it's \code{[1,1]}, for strings \code{[1,256]} and for number inputs \code{[-Inf,Inf]}.
#'
#' \strong{Dataset inputs} will match one or more variables from a dataset, and check its mode and/or class. \code{variable} type is a bit different, since it matches any kind of variable (not to confuse with \code{Any} type), but it still refers to variable(s) from a provided dataset. Dataset inputs cannot have default value, but can be optional (just leave out \code{*} sign in front of input name). Note that if you provide more than one variable name in \code{rapport} function call, that input will be stored as a \code{data.frame}, otherwise, it will be stored as a \emph{variable} (atomic vector).
#'
#' \strong{Standalone inputs} are a bit different since they do not refer to any variables from a dataset. However, they are more complex than *dataset inputs*, especially because they can contain default values.
#' \itemize{
#'     \item \strong{number} and \strong{string} inputs are defined with \code{number} and \code{string} respectively. They can also contain limit specifications, but the limits are treated in a slightly different manner. \code{number[-2.58,3]} will match any number within an interval from -2.58 to 3. If the limit specification is ommited, an implicit ones are assigned (\code{[-Inf,Inf]}. Limit specifications for string inputs define the range of characters that provided string can have, e.g. \code{string[1,6]} matches the string with at least 1 and at most 6 characters. If ommited, limit specifications for strings are implicitly set to \code{[1,256]}. \emph{number} and \emph{string} inputs can have \emph{default value}, which can be defined by placing \code{=} after type/limit specification followed by default value. For instance, \code{number[1,6]=3.14} sets value \code{3.14} as default. Note that for number inputs an additional check will be applied to ensure that provided default number belongs to an interval defined in the limit specification (\code{[1,6]=7} will throw an error). For string inputs, the default value \code{string=foo} sets "foo" as default string value (note that you don't have to specify quotes unless they are the part of the default string). Default value will be checked to ensure that its length falls within the interval provided in the limit specification.
#'     \item \strong{boolean} inputs can contain either \code{TRUE} or \code{FALSE} values. The specified value is the default one. They cannot contain limit specification, but implicitly the limits are set to \code{[1,1]}.
#'     \item \strong{option} inputs are nothing more than a comma-separated list of strings. Even if you specify numbers in a list, they will be coerced to strings once the list is parsed. Values in \emph{option} list will be placed in a character vector, and matched with \code{match.arg} function. That means that you could only choose one value from a list. Partial matches are allowed, and the first value in \emph{option} list is the default one. Just like in \code{boolean} inputs, limits are implicitly set to \code{[1,1]}.
#' }
#'
#' \strong{Input Label and Description}
#'
#' Third block in input definition is an input label. While \emph{variable} can have its own label (see \code{label}), you may want to use the one defined in input specifications. At last, fourth block contains input description, which should be a lengthy description of current input. Note that all the fields in input specification are mandatory. You can cheat, though, by providing a non-space character (e.g. a dot) as an input label and/or description, but please don't do that unless you're testing the template. Labels and descriptions are meant to be informative.
#' @name inputs-deprecated
NULL
