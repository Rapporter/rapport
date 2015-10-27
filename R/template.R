#' Read Template
#'
#' Reads file either from template name in system folder, file path (see \code{rapport.path}) or remote URL, and splits it into lines for easier handling by \emph{rapport} internal parser.
#' @param fp a character string containing a template path, a template name (for package-bundled templates only), template contents separated by newline (\code{\\n}), or a character vector with template contents.
#' @param ... additional params for header tag matching (see \code{\link{grep}})
#' @return a character vector with template contents
#' @aliases rapport.read tpl.find
rapport.read <- function(fp, ...) {

    if (missing(fp))
        stop('Template file pointer not provided!')
    stopifnot(is.character(fp))

    l <- length(fp)

    ## maybe it's file path?
    if (l == 1) {

        ## is it URL?
        if (grepl('^(ftp|http(s)?)://.+$', fp)) {
            if (download.file(fp, tmp.fp <- tempfile(), method = 'wget') != 0)
                stop('Remote template file not found!')
            file <- tmp.fp
        } else {

            ## is it local file found in working, package or custom \code{getOption('rapport.paths')} directory?
            if (!grepl('.+\\.rapport$', fp, ignore.case = TRUE))
                fp <- c(fp, sprintf('%s.rapport', fp))
            fp <- c(fp, unlist(lapply(fp, function(file) file.path(getOption('rapport.paths'), file))), system.file('templates', fp, package = 'rapport'))
            fp <- fp[file.exists(fp)]
            if (length(fp) == 0)
                stop('Template file not found!')
            if (length(fp) > 1) {
                fp <- fp[1]
                warning(sprintf('Multiple templates found with given name, using: %s', fp))
            }
        }
        txt <- readLines(fp, warn = FALSE, encoding = 'UTF-8') # load template from file path
    } else if (l > 1) {
        ## then it's a character vector
        txt <- fp
    } else {
        stop('Template file pointer error :O')      # you never know...
    }

    check.tpl(txt, ...)
    return(txt)

}
tpl.find <- rapport.read


##' Extract template chunk contents
##'
##' \code{rapport}'s alternative to \code{\link{Stangle}} - extracts contents of template chunks. If \code{file} argument
##' @param fp template file pointer (see \code{rapport:::rapport.read} for details)
##' @param file see \code{file} argument in \code{\link{cat}} function documentation
##' @param show.inline.chunks extract contents of inline chunks as well? (defaults to \code{FALSE})
##' @return (invisibly) a list with either inline or block chunk contents
##' @export
##' @aliases rapport.tangle tpl.tangle
rapport.tangle <- function(fp, file = "", show.inline.chunks = FALSE) {

    b <- rapport.body(rapport.read(fp))

    re.block.open    <- "^<%=?$"
    re.block.close   <- "^%>$"
    re.inline.open   <- "<%=?"
    re.inline.close  <- "%>"

    ind.block.open   <- grep(re.block.open, b)
    ind.block.close  <- grep(re.block.close, b)
    ind.inline.open  <- grep(re.inline.open, b)
    ind.inline.close <- grep(re.inline.close, b)

    ## check for unmatched tags
    if (show.inline.chunks) {
        if (length(ind.inline.open) != length(ind.inline.close))
            stop("unmatched chunk tag(s)")
    } else {
        if (length(ind.block.open) != length(ind.block.close))
            stop("unmatched block chunk tag(s)")
    }

    block.ind <- mapply(seq, from = ind.block.open, to = ind.block.close)
    if (show.inline.chunks)
        chunk.ind <- mapply(seq, from = ind.inline.open, to = ind.inline.close)
    else
        chunk.ind <- block.ind

    chunk.ind <- lapply(chunk.ind, function(x) {
        attr(x, "chunk.type") <- "block"
        x
    })

    if (show.inline.chunks) {
        chunk.ind[!chunk.ind %in% block.ind] <- lapply(chunk.ind[!chunk.ind %in% block.ind], function(x) {
            attr(x, "chunk.type") <- "inline"
            x
        })
    }

    out <- c()
    res <- lapply(chunk.ind, function(x) {
        cc <- b[x]
        ct <- attr(x, "chunk.type")
        if (ct == "block") {
            cc <- trim.space(paste0(cc[2:(length(cc) - 1)], collapse = "\n"))
            out <<- c(out, "#################")
            out <<- c(out, "## block chunk ##")
            out <<- c(out, "#################")
            out <<- c(out, "", cc, "")
        } else {
            cc <- trim.space(vgsub("(<%=?|%>)", "", str_extract_all(cc, "<%=?[^%>]+%>")[[1]]))
            sapply(cc, function(x) {
                out <<- c(out, "##################")
                out <<- c(out, "## inline chunk ##")
                out <<- c(out, "##################")
                out <<- c(out, "", x, "")
            })
        }
        attr(cc, "chunk.type") <- ct
        cc
    })

    out <- paste0(out, collapse = "\n")
    cat(out, file = file)

    invisible(res)
}
#' @export
tpl.tangle <- rapport.tangle


#' Template Header
#'
#' Returns \code{rapport} template header from provided path or a character vector.
#' @param fp a template file pointer (see \code{rapport:::rapport.read} for details)
#' @param open.tag a string with opening tag (defaults to value of user-defined \code{"header.open"} tag)
#' @param close.tag a string with closing tag (defaults to value of user-defined \code{"header.close"} tag)
#' @param ... additional arguments to be passed to \code{\link{grep}} function
#' @return a character vector with template header contents
#' @aliases rapport.header tpl.header
rapport.header <- function(fp, open.tag = get.tags('header.open'), close.tag = get.tags('header.close'), ...) {

    txt <- rapport.read(fp)                 # split by newlines

    ## get header tag indices
    hopen.ind  <- grep(open.tag, txt, ...)[1]  # opening tag
    hclose.ind <- grep(close.tag, txt, ...)[1] # closing tag
    hsection <- txt[(hopen.ind + 1):(hclose.ind - 1)] # get header

    return(hsection)
}
#' @export
tpl.header <- rapport.header


#' Template Body
#'
#' Returns contents of the template body.
#' @param fp a template file pointer (see \code{rapport:::rapport.read} for details)
#' @param htag a string with closing body tag
#' @param ... additional arguments to be passed to \code{\link{grep}} function
#' @return a character vector with template body contents
#' @export
#' @aliases rapport.body tpl.body
rapport.body <- function(fp, htag = get.tags('header.close'), ...) {
    txt   <- rapport.read(fp, ...)
    h.end <- grep(htag, txt, ...)
    b <- txt[(h.end + 1):length(txt)]
    structure(b, class = 'rapport.body')
}
#' @export
tpl.body <- rapport.body


#' Template Info
#'
#' Provides information about template metadata and/or inputs. See \code{\link{rapport.meta}} and \code{\link{rapport.inputs}} for details.
#' @param fp a template file pointer (see \code{rapport:::rapport.read} for details)
#' @param meta return template metadata? (defaults to \code{TRUE})
#' @param inputs return template inputs? (defaults to \code{TRUE})
#' @examples \dontrun{
#' rapport.info('Example')                    # return both metadata and inputs
#' rapport.info('Crosstable', inputs = FALSE) # return only template metadata
#' rapport.info('Correlation', meta = FALSE)  # return only template inputs
#' }
#' @seealso {
#' \code{\link{rapport.meta}}
#' \code{\link{rapport.inputs}}
#' }
#' @export
#' @aliases rapport.info tpl.info
rapport.info <- function(fp, meta = TRUE, inputs = TRUE) {

    txt <- rapport.read(fp)

    if (!meta & !inputs)
        stop('Either "meta" or "inputs" should be set to TRUE')

    res <- list()
    if (meta)
        res$meta <- rapport.meta(txt)
    if (inputs)
        res$inputs <- rapport.inputs(txt)
    class(res) <- 'rapport.info'

    return(res)
}
#' @export
tpl.info <- rapport.info


#' Header Metadata
#'
#' Displays summary of template metadata stored in a header section. This part of template header consists of several YAML \code{key: value} pairs, which contain some basic information about the template, just much like the \code{DESCRIPTION} file in \code{R} packages does.
#'
#' Current implementation supports following fields:
#'
#' \itemize{
#'     \item \code{title} - a template title (required)
#'     \item \code{author} - author's (nick)name (required)
#'     \item \code{description} - template description (required)
#'     \item \code{email} - author's email address
#'     \item \code{packages} - YAML list of packages required by the template (if any)
#'     \item \code{example} - example calls to \code{rapport} function, including template data and inputs
#' }
#'
#' As of version \code{0.5}, \code{dataRequired} field is deprecated. \code{rapport} function will automatically detect if the template requires a dataset based on the presence of \emph{standalone} inputs.
#' @param fp a template file pointer (see \code{rapport:::rapport.read} for details)
#' @param fields a list of named lists containing key-value pairs of field titles and corresponding regexes
#' @param use.header a logical value indicating if the character vector provided in \code{fp} argument contains only the header data (not the whole template)
#' @param trim.white a logical value indicating if the extra spaces should removed from header fields before extraction
#' @return a named list with template metadata
#' @seealso {
#' \code{\link{rapport.inputs}}
#' \code{\link{rapport.info}}
#' }
#' @export
#' @aliases rapport.meta tpl.meta
rapport.meta <- function(fp, fields = NULL, use.header = FALSE, trim.white = TRUE) {

    header <- rapport.read(fp)
    if (!use.header)
        header <- rapport.header(header)

    ## check if header is defined in YAML
    h <- tryCatch({
        y <- yaml.load(
            string = paste0(header, collapse = "\n"),
            handlers = list(
                'bool#yes' = function(x) {
                    if (grepl('^(y|yes|true|on)$', x, ignore.case = TRUE))
                        x
                    else
                        TRUE
                },
                'bool#no' = function(x) {
                    if (grepl('^(n|no|false|off)$', x, ignore.case = TRUE))
                        x
                    else
                        FALSE
                })
            )
        y$meta
    }, error = function(e) {
        ## either something went bad or it's the old header (hopefully)

        if (isTRUE(trim.white))
            header <- trim.space(header)

        ## required fields
        fld <- list(
            list(title = 'Title'         , regex = '.+', field.length = 500),
            list(title = 'Author'        , regex = '.+', field.length = 100),
            list(title = 'Description'   , regex = '.+', short = 'desc'),
            list(title = 'Email'         , regex = '[[:alnum:]\\._%\\+-]+@[[:alnum:]\\.-]+\\.[[:alpha:]]{2,4}', mandatory = FALSE, short = 'email'),
            list(title = 'Packages'      , regex = '[[:alnum:]\\.]+((, ?[[:alnum:]+\\.]+)+)?', mandatory = FALSE),
            list(title = 'Example'       , regex = '.+', mandatory = FALSE)
            )

        ## no fields specified, load default fields
        if (!is.null(fields)) {
            fld.title <- sapply(fld, function(x) x$title)
            fields.title  <- sapply(fields, function(x) x$title)
            fld <- c(fld, fields) # merge required fields with default/specified ones
            if (any(fld %in% fields.title)) {
                stopf("Duplicate metadata fields: %s", p(intersect(fld.title, fields.title), "\""))
            }
        }

        inputs.ind <- grep("^(.+\\|){3}.+$", header) # get input definition indices
        spaces.ind <- grep("^([:space:]+|)$", header)
        rm.ind     <- c(inputs.ind, spaces.ind)

        if (length(rm.ind) > 0)
            header <- header[-rm.ind]

        h <- sapply(fld, function(x) {
            m <- grep(sprintf("^%s:", x$title), header)
            x$x <- header[m]
            do.call(extract.meta, x)
        })

        ## packages
        if (!is.null(h$packages))
            if (is.string(h$packages))
                h$packages <- strsplit(h$packages, " *, *")[[1]]

        ## examples
        ## TODO: change to "examples" at some point (easy does it)
        if (!is.null(h$example)) {
            ## select all "untagged" lines after Example: that contain rapport(<smth>) string
            ## but it will not check if they're syntactically correct
            ind.start <- grep('^Example:', header)
            ind       <- adj.rle(grep("^[\t ]*rapport\\(.+\\)([\t ]*#*[[:print:]]*)?$", header))$values[[1]]
                ind       <- ind[!ind %in% ind.start]
            h$example <- c(h$example, header[ind])
        }

        ## backwards-compat: change "desc" to "description"
        h <- append(h, list(description = h$desc), after = 2)
        h$desc <- NULL

        h
    })

    ## deprecated fields
    ## dataRequired
    if (!is.null(h$dataRequired)) {
        h$dataRequired <- NULL
        warning('"dataRequired" field is deprecated. You should remove it from the template.')
    }

    ## check metadata validity
    meta.fields <- c('title', 'description', 'author', 'email', 'packages', 'example')
    meta.required <- c('title', 'description', 'author')
    meta.names <- names(h)
    ## check required fields
    if (!all(meta.required %in% meta.names))
        stopf('Required metadata fields missing: %s', p(meta.required, wrap = "\""))
    ## check unsupported fields
    unsupported.meta <- meta.names[!meta.names %in% meta.fields]
    if (length(unsupported.meta))
        warningf('Unsupported metadata field(s) found: %s', p(unsupported.meta, wrap = "\""))

    structure(h, class = 'rapport.meta')
}
#' @export
tpl.meta <- rapport.meta


#' Template Inputs
#'
#' Displays summary for template inputs (if any). Note that as of version \code{0.5}, \code{rapport} template inputs should be defined using YAML syntax. See \code{deprecated-inputs} for details on old input syntax. The following sections describe new YAML input definition style.
#'
#' \strong{Introduction}
#'
#' The full power of \code{rapport} comes into play with \emph{template inputs}. One can match inputs against dataset variables or custom \code{R} objects. The inputs provide means of assigning \code{R} objects to \code{symbol}s in the template evaluation environment. Inputs themselves do not handle only the template names, but also provide an extensive set of rules that each dataset variable/user-provided \code{R} object has to satisfy. The new YAML input specification takes advantage of \code{R} class system. The input attributes should resemble common \code{R} object attributes and methods.
#'
#' Inputs can be divided into two categories:
#'
#' \itemize{
#'     \item \emph{dataset inputs}, i.e. the inputs that refer to named element of an |code{R} object provided in \code{data} argument in \code{rapport} call. Currently, \code{rapport} supports only \code{data.frame} objects, but that may change in the (near) future.
#'     \item \emph{standalone inputs} - the inputs that do not depend on the dataset. The user can just provide an \code{R} object of an appropriate class (and other input attributes) to match a \emph{standalone} input.
#' }
#'
#' \strong{General input attributes}
#'
#' Following attributes are available for all inputs:
#'
#' \itemize{
#'     \item \code{name} (character string, required) - input name. It acts as an identifier for a given input, and is required as such. Template cannot contain duplicate names. \code{rapport} inputs currently have custom naming conventions - see \code{\link{guess.input.name}} for details.
#'     \item \code{label} (character string) - input label. It can be blank, but it's useful to provide input label as \code{rapport} helpers use that information in plot labels and/or exported HTML tables. Defaults to empty string.
#'     \item \code{description} (character string) - similar to \code{label}, but should contain long description of given input.
#'     \item \code{class} (character string) - defines an input class. Currently supported input classes are: \code{character}, \code{complex}, \code{factor}, \code{integer}, \code{logical}, \code{numeric} and \code{raw} (all atomic vector classes are supported). Class attribute should usually be provided, but it can also be \code{NULL} (default) - in that case the input class will be guessed based on matched \code{R} object's value.
#'     \item \code{required} (logical value) - does the input require a value? Defaults to \code{FALSE}.
#'     \item \code{standalone} (logical value) - indicates that the input depends on a dataset. Defaults to \code{FALSE}.
#'     \item \code{length} (either an integer value or a named list with integer values) - provides a set of rules for input value's length. \code{length} attribute can be defined via:
#'     \itemize{
#'         \item an integer value, e.g. \code{length: 10}, which sets restriction to exactly 10 vectors or values.
#'         \item named list with \code{min} and/or \code{max} attributes nested under \code{length} attribute. This will define a range of values in which input length must must fall. Note that range limits are inclusive. Either \code{min} or \code{max} attribute can be omitted, and they will default to \code{1} and \code{Inf}, respectively.
#'     }
#'     \strong{IMPORTANT!} Note that \code{rapport} treats input length in a bit different manner. If you match a subset of 10 character vectors from the dataset, input length will be \code{10}, as you might expect. But if you select only one variable, length will be equal to \code{1}, and not to the number of vector elements. This stands both for standalone and dataset inputs. However, if you match a character vector against a standalone input, length will be stored correctly - as the number of vector elements.
#'     \item \code{value} (a vector of an appropriate class). This attribute only exists for standalone inputs. Provided value must satisfy rules defined in \code{class} and \code{length} attributes, as well as any other class-specific rules (see below).
#' }
#'
#' \strong{Class-specific attributes}
#'
#' \emph{character}
#'
#' \itemize{
#'     \item \code{nchar} - restricts the number of characters of the input value. It accepts the same attribute format as \code{length}. If \code{NULL} (default), no checks will be performed.
#'     \item \code{regexp} (character string) - contains a string with regular expression. If non-\code{NULL}, all strings in a character vector must match the given regular expression. Defaults to \code{NULL} - no checks are applied.
#'     \item \code{matchable} (logical value) - if \code{TRUE}, \code{options} attribute must be provided, while \code{value} is optional, though recommended. \code{options} should contain values to be chosen from, just like \code{<option>} tag does when nested in \code{<select>} HTML tag, while \code{value} must contain a value from \code{options} or it can be omitted (\code{NULL}). \code{allow_multiple} will allow values from \code{options} list to be matched multiple times. Note that unlike previous versions of \code{rapport}, partial matching is not performed.
#' }
#'
#' \emph{numeric}, \emph{integer}
#'
#' \itemize{
#'     \item \code{limit} - similar to \code{length} attribute, but allows only \code{min} and \code{max} nested attributes. Unlike \code{length} attribute, \code{limit} checks input values rather than input length. \code{limit} attribute is \code{NULL} by default and the checks are performed only when \code{limit} is defined (non-\code{NULL}).
#' }
#'
#' \emph{factor}
#'
#' \itemize{
#'     \item \code{nlevels} - accepts the same format as \code{length} attribute, but the check is performed rather on the number of factor levels.
#'     \item \code{matchable} - \emph{ibid} as in character inputs (note that in previous versions of \code{rapport} matching was performed against factor levels - well, not any more, now we match against values to make it consistent with \code{character} inputs).
#' }
#' @param fp a template file pointer (see \code{rapport:::rapport.read} for details)
#' @param use.header a logical value indicating whether the header section is provided in \code{h} argument
#' @seealso {
#' \code{\link{rapport.meta}}
#' \code{\link{rapport.info}}
#' }
#' @export
#' @aliases rapport.inputs tpl.inputs
rapport.inputs <- function(fp, use.header = FALSE) {

    header <- rapport.read(fp)

    if (!use.header)
        header <- rapport.header(header)

    ## Try with YAML first ("inputs" is actually decoded header)
    inputs <- tryCatch(
        yaml.load(
            string = paste0(header, collapse = "\n"),
            handlers = list(
                'bool#yes' = function(x) {
                    if (grepl('^(y|yes|true|on)$', x, ignore.case = TRUE))
                        x
                    else
                        TRUE
                },
                'bool#no' = function(x) {
                    if (grepl('^(n|no|false|off)$', x, ignore.case = TRUE))
                        x
                    else
                        FALSE
                })
            ),
        error = function(e) e)

    ## Old-style syntax
    if (inherits(inputs, 'error')) {
        inputs.ind <- grep("^(.+\\|){3}.+$", header) # get input definition indices

        if (length(inputs.ind) == 0)
            return (structure(NULL, class = 'rapport.inputs'))

        inputs.raw <- lapply(strsplit(header[inputs.ind], '|', fixed = TRUE), function(x) trim.space(x)) # "raw" as in "unchecked", split by | and trimmed for whitespace

        if (!all(sapply(inputs.raw, length) == 4))
            stop('input definition error: missing fields')

        inputs <- lapply(inputs.raw, function(x) {
            i.name  <- guess.input.name(x[1])
            i.label <- guess.input.label(x[3])
            i.desc  <- guess.input.description(x[4])
            i.type  <- guess.old.input.type(x[2])

            if (is.empty(i.label))
                warningf('missing label for input "%s"', i.name)
            if (is.empty(i.desc))
                warningf('missing description for input "%s"', i.name)

            c(
                name = i.name,
                label = i.label,
                description = i.desc,
                i.type
                )
        })
        warning("Oh, no! This template has outdated input definition! You can update it by running `rapport.renew`.")
    } else {
        inputs <- lapply(inputs$inputs, guess.input)
    }

    ## check for duplicate names
    nms <- sapply(inputs, function(x) x$name)
    dupes <- duplicated(nms)
    if (any(dupes))
        stopf('template contains duplicate input names: %s', p(nms[dupes], wrap = "\""))

    structure(inputs, class = 'rapport.inputs')
}
#' @export
tpl.inputs <- rapport.inputs


#' Template Examples
#'
#' Displays template examples defined in \code{Example} section. Handy to check out what template does and how does it look like once it's rendered. If multiple examples are available, and \code{index} argument is \code{NULL}, you will be prompted for input. If only one example is available in the header, user is not prompted for input action, and given template is evaluated automatically. At any time you can provide an integer vector with example indices to \code{index} argument, and specified examples will be evaluated without prompting, thus returning a list of \code{rapport} objects. Example output can be easily exported to various formats (HTML, ODT, etc.) - check out documentation for \code{rapport.export} for more info.
#' @param fp a template file pointer (see \code{rapport:::rapport.read} for details)
#' @param index a numeric vector indicating the example index - meaningful only for templates with multiple examples. Accepts vector of integers to match IDs of template example. Using 'all' (character string) as index will return all examples.
#' @param env an environment where example will be evaluated (defaults to \code{.GlobalEnv})
#' @examples \dontrun{
#' rapport.example('Example')
#' rapport.example('Example', 1:2)
#' rapport.example('Example', 'all')
#' rapport.example('Crosstable')
#' rapport.export(rapport.example('Crosstable'))
#' }
#' @export
#' @aliases rapport.example tpl.example
rapport.example <- function(fp, index = NULL, env = .GlobalEnv) {

    examples   <- rapport.meta(fp)$example
    n.examples <- 1:length(examples)
    examples.len <- length(examples)

    ## return NULL invisibly if no templates are found in the template
    if (is.null(examples)) {
        message('Provided template does not have any examples.')
        invisible(NULL)
    }

    if (examples.len > 1) {
        if (is.null(index)) {
            opts  <- c(n.examples)
            catn('Enter example ID from the list below:')
            catn(sprintf('\n(%s)\t%s', opts, c(examples)))
            catn('(a)\tRun all examples')
            catn()
            i     <- readline('Template ID> ')
            index <- unique(strsplit(gsub(' +', '', i), ',')[[1]])
        }
    } else {
        index <- 1
    }

    if (length(index) == 0 || tolower(index) == 'q')
        return(invisible(NULL))

    if (length(index) == 1 && tolower(index) %in% c('a', 'all'))
        index <- n.examples

    old.index <- index
    if (!any(index %in% n.examples))
        stopf('Invalid template ID found in: ', paste(setdiff(index, n.examples), collapse = ', '))
    suppressWarnings(index <- as.integer(index))

    if (any(is.na(index)))
        stopf('Invalid template ID found in: "%s"', paste(old.index, collapse = ', '))

    if (length(index) > 1)
        return(lapply(examples[index], function(x) eval(parse(text = x), envir = env)))
    else
        eval(parse(text = examples[index]), envir = env)
}
#' @export
tpl.example <- rapport.example


#' Reproduce Template
#'
#' Runs template with data and arguments included in \code{rapport} object. In order to get reproducible example, you have to make sure that \code{reproducible} argument is set to \code{TRUE} in \code{rapport} function.
#' @param tpl a \code{rapport} object
#' @examples \dontrun{
#' tmp <- rapport("Example", mtcars, v = "hp", reproducible = TRUE)
#' rapport.rerun(tmp)
#' }
#' @export
#' @aliases rapport.rerun tpl.rerun
rapport.rerun <- function(tpl) {

    if (!inherits(tpl, 'rapport'))
        stop("You haven't provided a rapport template")

    cl <- tpl$call
    dt <- tpl$data

    if (is.null(cl) || is.null(dt))
        stop("Provided rapport object doesn't have included call and/or data, therefore not reproducible")

    cl <- as.list(cl)
    cl$data <- dt
    do.call(rapport, cl)
}
#' @export
tpl.rerun <- rapport.rerun


#' Evaluate Template
#'
#' This is the central function in the \code{rapport} package, and hence eponymous. In following lines we'll use \code{rapport} to denote the function, not the package. \code{rapport} requires a template file, while dataset (\code{data} argument) can be optional, depending on the value of \code{Data required} field in template header. Template inputs are matched with \code{...} argument, and should be provided in \code{x = value} format, where \code{x} matches input name and \code{value}, wait for it... input value! See \code{\link{rapport.inputs}} for more details on template inputs.
#'
#' Default parameters are read from \code{evalsOptions()} and the following \code{options}:
#'
#' \itemize{
#'     \item 'rapport.file.name',
#'     \item 'rapport.file.path',
#' }
#'
#' @param fp a template file pointer (see \code{rapport:::rapport.read} for details)
#' @param data a \code{data.frame} to be used in template
#' @param ... matches template inputs in format 'key = "value"'
#' @param env the parent environment to be forked, in which temporary \code{new.env} template commands be evaluated
#' @param reproducible a logical value indicating if the call and data should be stored in template object, thus making it reproducible (see \code{\link{rapport.rerun}} for details)
#' @param header.levels.offset number added to header levels (handy when using nested templates)
#' @param file.name set the file name of saved plots and exported documents. A simple character string might be provided where \code{\%N} would be replaced by an auto-increment integer based on similar exported document's file name , \code{\%n} an auto-increment integer based on similar (plot) file names (see: \code{?evalsOptions}), \code{\%T} by the name of the template in action and \code{\%t} by some uniqe random characters based on \code{\link{tempfile}}.
#' @param file.path path of a directory where to store generated images and exported reports
#' @param graph.output the required file format of saved plots (optional)
#' @param graph.width the required width of saved plots (optional)
#' @param graph.height the required height of saved plots (optional)
#' @param graph.res the required nominal resolution in ppi of saved plots (optional)
#' @param graph.hi.res logical value indicating if high resolution (1280x~1280) images would be also generated
#' @param graph.replay logical value indicating if plots need to be recorded for later replay (eg. while \code{print}ing \code{rapport} objects in R console)
#' @return a list with \code{rapport} class.
#' @seealso \code{\link{rapport-package}}
#' @examples \dontrun{
#' rapport('Example', ius2008, v = "leisure")
#' rapport('Descriptives', ius2008, var = "leisure")
#'
#' ## generating high resolution images also
#' rapport('Example', ius2008, v = "leisure", graph.hi.res = TRUE)
#' rapport.html('NormalityTest', ius2008, var = "leisure", graph.hi.res=T)
#' ## generating only high resolution image
#' rapport('Example', ius2008, v = "leisure", graph.width = 1280, graph.height = 1280)
#' ## nested templates cannot get custom setting, use custom rapport option:
#' options('graph.hi.res' = TRUE)
#' rapport('AnalyzeWizard', data=ius2008, variables=c('edu', 'game'))
#' }
#' @export
rapport <- function(fp, data = NULL, ..., env = .GlobalEnv, reproducible = FALSE, header.levels.offset = 0, graph.output = evalsOptions('graph.output'), file.name = getOption('rapport.file.name'), file.path = getOption('rapport.file.path'), graph.width = evalsOptions('width'), graph.height = evalsOptions('height'), graph.res = evalsOptions('res'), graph.hi.res = evalsOptions('hi.res'), graph.replay = evalsOptions('rapport.graph.recordplot')) {

    timer         <- proc.time()                        # start timer
    txt           <- rapport.read(fp)                   # split file to text
    h             <- rapport.info(txt)                  # template header
    meta          <- h$meta                             # header metadata
    inputs        <- h$inputs                           # header inputs
    inputs.names  <- sapply(inputs, function(x) x$name) # input names
    b             <- rapport.body(txt)                  # template body
    e             <- new.env(parent = env)              # load/create evaluation environment
    e$Pandoc.brew <- Pandoc.brew                        # inject brew function
    i             <- list(...)                          # user inputs
    i.names       <- names(i)                           # user input names
    data.required <- any(sapply(inputs, function(x) !x$standalone)) || (!is.null(data) && !identical(data, ''))

    ## dealing with packages
    oldpkgs       <- .packages()                        # currently loaded packages to revert later
    pkgs          <- meta$packages                      # required packages

    ## path issue on Windows
    file.path     <- gsub('\\', '/', file.path, fixed = TRUE)

    ## load required packages (if any)
    if (!is.null(pkgs)) {

        pk <- suppressWarnings(suppressMessages(sapply(pkgs, require, character.only = TRUE, quietly = TRUE)))

        ## unload packages that were loaded on demand
        on.exit(sapply(setdiff(.packages(), oldpkgs), function(pkg) try(
            detach(paste('package', pkg, sep = ':'),
                   character.only = TRUE), silent = TRUE)))

        ## checking for errors
        nopkg <- pk == FALSE
        if (any(nopkg))
            stop(sprintf('Following packages are required by the template, but were not loaded: %s', p(names(pk[nopkg]), wrap = '"')), call. = NULL)

    }

    ## assign template metadata and inputs to custom environment for easy access inside of the templates
    assign('rapport.inputs', inputs, envir = e)
    assign('rapport.template', meta, envir = e)

    ## template contains no inputs
    if (length(inputs) == 0) {
        ## check if data is required
        if (data.required) {
            if (is.null(data))
                stop('"data" argument is required by the template')
            else {
                assign('rp.data', data, envir = e)
                assign('rapport.data', data, envir = e)
            }
        }
        ## inputs required, carry on...
    } else {
        ## check required inputs (this will only check names)
        ## this is silly!!! what if you have input = NULL?!?
        input.required <- sapply(inputs, function(x) structure(x$required, .Names = x$name))
        input.names    <- names(input.required)
        ## take default inputs into account
        if (!all(input.names[input.required] %in% names(i)) && any(sapply(inputs, function(x) is.empty(x$value) & !identical(x$value, FALSE) & is.empty(i[[x$name]]) & x$required))) {
            stopf("you haven't provided a value for %s", p(input.names[input.required], '"'))
        }

        ## data required
        if (data.required) {
            if(is.null(data))
                stop('"data" not provided, but is required')
            if (!inherits(data, c('data.frame', 'rp.data')))
                stop('"data" should be a "data.frame" object')
            data.names <- names(data)          # variable names
            assign('rp.data', data, envir = e) # load data to eval environment
            assign('rapport.data', data, envir = e)
        }

        lapply(inputs, function(x) {
            ## template inputs
            input.name   <- x$name
            input.class  <- x$class
            input.length <- x$length
            input.value  <- x$value
            ## user inputs
            user.input   <- i[[input.name]]

            ## matchable inputs are kind-of special
            if (isTRUE(x$matchable)) {
                v <- if (is.null(user.input)) x$value else as.character(user.input)
                matchable.err.msg <- sprintf('provided value `%s` not found in option list for matchable input "%s"', p(v, wrap = '"'), input.name)
                ## multiple match
                if (x$allow_multiple) {
                    v.ind <- v %in% x$options
                    if (!any(v.ind))
                        stop(matchable.err.msg)
                    val <- v[v.ind]
                } else {
                    ## issue a warning if matched multiple times
                    if (!all(as.numeric(table(v)) == 1))
                        warning('multiple occurances found in provided value')
                    val <- x$options[x$options %in% v]
                    if (!length(val))
                        stop(matchable.err.msg)
                }
                if (input.class == 'factor')
                    val <- as.factor(val)
            } else {
                ## standalone input can now be atomic or recursive
                if (x$standalone) {
                    ## either a value provided in the rapport() call, or a template default, if any
                    val <- if (is.null(user.input)) input.value else user.input
                    val.length <- length(val)
                } else {
                    ## it's not standalone, so user must have provided a character string
                    ## with names matching the ones in the data.frame
                    if (!all(user.input %in% data.names))
                        stopf('provided data.frame does not contain column(s) named: %s', p(setdiff(user.input, data.names), '"'))

                    val <- e$rapport.data[user.input]
                    ## we use this as data.frame with 0 columns will not be NULL
                    ## therefore the length check will not pass
                    ## OR we can just change the check.input.value function
                    ## and things will work like a charm
                    if (!length(val))
                        val <- NULL
                    val.length <- length(val)
                }
            }

            ## class check
            check.input.value.class(val, input.class, input.name)

            ## check length (all inputs have length)
            check.input.value(x, val, 'length')

            if (!is.null(user.input)) {

                ## coerce val to vector if it's only one input
                if (!x$standalone && length(user.input) == 1)
                    val <- val[, 1]

                ## class-specific checks
                if (!is.null(input.class))
                    switch(input.class,
                           character = {
                               ## nchar check
                               check.input.value(x, val, 'nchar')
                               ## regexp check
                               if (!is.null(x$regexp)) {
                                   if (!all(grepl(x$regexp, val)))
                                       stopf('%s input "%s" value is not matched with provided regular expression "%s"', input.name, val, x$regexp)
                               }
                           },
                           factor = {
                               check.input.value(x, val, 'nlevels')
                           },
                           integer = ,
                           numeric = {
                               if (!is.null(x$limit)) {
                                   ## check limits
                                   if (is.variable(val))
                                       check.input.value(x, val, 'limit')
                                   else {
                                       if (!all(sapply(val, function(i) i > x$limit$min)) && all(sapply(val, function(i) i < x$limit$max)))
                                           stopf('all values in %s input "%s" should fall between %s and %s', x$class, x$name, x$limit$min, x$limit$max)
                                   }
                               }
                           })

                ## add labels
                if (is.recursive(val)) {
                    for (t in names(val)) {
                        if (label(val[, t]) == 't')
                            val[, t] <- structure(val[, t], label = t, name = t)
                        else
                            val[, t] <- structure(val[, t], name = t)
                    }
                } else {
                    if (label(val) == 'val')
                        val <- structure(val, label = user.input, name = user.input)
                    else
                        val <- structure(val, name = user.input)
                }
            }

            input.exists <- (!input.name %in% i.names && !x$required && x$standalone && length(val)) || input.name %in% i.names || !x$standalone || length(val)

            ## assign stuff
            if (input.exists) {
                ## assign input value and that silly input-related stuff
                assign(input.name, val, envir = e)                                    # value
                assign(sprintf('%s.iname', input.name), input.name, envir = e)        # input name
                assign(sprintf('%s.ilen', input.name), length(user.input), envir = e) # input length
                assign(sprintf('%s.ilabel', input.name), x$label, envir = e)          # input label
                assign(sprintf('%s.idesc', input.name), x$description, envir = e)     # input description
                assign(sprintf('%s.name', input.name), user.input, envir = e)         # variable name(s)
                assign(sprintf('%s.len', input.name), length(val), envir = e)         # variable length
            }

            ## currently we support only data.frame and atomic vectos
            if (is.data.frame(val))
                assign(sprintf('%s.label', input.name), sapply(val, label), envir = e) # variable labels
            else if (is.atomic(val))
                assign(sprintf('%s.label', input.name), label(val), envir = e) # variable label
            else
                stopf('"%s" is not a "data.frame" or an atomic vector', input.name) # you never know...
        })
    }

    ## pregenerate file name
    if (grepl('%T', file.name))
        file.name <- gsub('%T', gsub('\\\\|/|:|\\.', '-', fp), file.name, fixed = TRUE)
    file.name <- gsub('--', '-', file.name, fixed = TRUE)
    if (grepl('%N', file.name)) {
        if (length(strsplit(sprintf('placeholder%splaceholder', file.name), '%N')[[1]]) > 2)
            stop('File name contains more then 1 "%N"!')
        similar.files <-  list.files(file.path(file.path, 'plots'), pattern = sprintf('^%s\\.(jpeg|tiff|png|svg|bmp)$', gsub('%t', '[a-z0-9]*', gsub('%N|%n|%i', '[[:digit:]]*', file.name))))
        if (length(similar.files) > 0) {
            similar.files <- sub('\\.(jpeg|tiff|png|svg|bmp)$', '', similar.files)
            rep <- gsub('%t|%n|%i', '[a-z0-9]*', strsplit(basename(file.name), '%N')[[1]])
            `%N` <- max(as.numeric(gsub(paste(rep, collapse = '|'), '', similar.files))) + 1
        } else
            `%N` <- 1
        file.name <- gsub('%N', `%N`, file.name, fixed = TRUE)
    }

    ## evaluate (brew) template body
    opts.bak <- options()                      # backup options
    wd.bak   <- getwd()
    setwd(file.path)
    evalsOptions('graph.name', file.name)
    assign('.rapport.body', paste(b, collapse = '\n'), envir = e)
    assign('.graph.name', file.name, envir = e)
    assign('.graph.dir', evalsOptions('graph.dir'), envir = e)
    assign('.graph.hi.res', graph.hi.res, envir = e)
    if (grepl("w|W", .Platform$OS.type)) # we are on Windows
        assign('.tmpout', 'NUL', envir = e)
    else
        assign('.tmpout', '/dev/null', envir = e)
    report <- tryCatch(eval(parse(text = 'Pandoc.brew(text = .rapport.body, graph.name = .graph.name, graph.dir = .graph.dir, graph.hi.res = .graph.hi.res, output = .tmpout)'), envir = e), error = function(e) e)

    options(opts.bak)                          # resetting options
    setwd(wd.bak)

    ## error handling
    if (inherits(report, 'error'))
        stop(report$message)

    ## remove NULL/blank parts
    ## ind.nullblank <- sapply(report, function(x) {
    ##     if (x$type == 'block')
    ##         ifelse(is.null(x$robjects[[1]]$output), FALSE, TRUE)
    ##     else
    ##         ifelse(x$text$eval == 'NULL', FALSE, TRUE)
    ## })
    ## report <- report[ind.nullblank]     # update template body contents

    ## tidy up (removing metadata, inputs from) nested templates
    report <- unlist(lapply(report, function(x) {

        robj  <- x$robject
        rout  <- robj$result
        xtype <- x$type

        ## chunk holding a rapport class
        if (xtype == 'block') {

            if (any(robj$type == 'rapport'))
                return(rout$report)

            ## chunk holding a list of rapport class
            if (all(is.list(rout)))
                if (all(sapply(rout, class) == 'rapport'))
                    return(unlist(lapply(rout, function(x) x$report), recursive = FALSE))
        }

        return(list(x))

    }), recursive = FALSE)

    ## header levels offset
    report <- lapply(report, function(x) {
        if (x$type == "heading") {
            x$level <- x$level + header.levels.offset
            return(x)
        } else
            return(x)
    })

    res <- list(
        meta        = meta,
        inputs      = inputs,
        report      = report,
        call        = match.call(),
        time        = as.numeric(proc.time() - timer)[3],
        file.name   = file.path(file.path, file.name)
        )

    if (isTRUE(reproducible)) {
        res$data <- data
    }

    class(res) <- 'rapport'

    return(res)
}
