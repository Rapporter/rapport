#' Read Template
#'
#' Reads file either from template name in system folder, file path or remote URL, and splits it into lines for easier handling by \emph{rapport} internal parser. "find" in \code{tpl.find} is borrowed from Emacs parlance - this function actually reads the template.
#' @param fp a character string containing a template path, a template name (for package-bundled templates only), template contents separated by newline (\code{\\n}), or a character vector with template contents.
#' @return a character vector with template contents
tpl.find <- function(fp){

    if (missing(fp))
        stop('file pointer not provided')

    stopifnot(is.character(fp))

    l <- length(fp)

    ## maybe it's file path?
    if (l == 1){
        ## is it URL?
        if (grepl('^(ftp|http(s)?)://.+$', fp)) {
            if (download.file(fp, tmp.fp <- tempfile(), method = 'wget') != 0)
                stop('remote file not found')
            file <- tmp.fp
        } else {
            ## is it local file found in working, package or custom \code{getOption('tpl.paths')} directory?
            if (!grepl('.+\\.tpl$', fp, ignore.case = TRUE))
                fp <- c(fp, sprintf('%s.tpl', fp))
            fp <- c(fp, unlist(lapply(fp, function(file) file.path(getOption('tpl.paths'), file))), system.file('templates', fp, package = 'rapport'))
            fp <- fp[file.exists(fp)]
            if (length(fp) == 0)
                stop('File not found!')
            if (length(fp) > 1) {
                fp <- fp[1]
                warning(sprintf('Multiple templates found with given name, using: %s', fp))
            }
        }
        txt <- readLines(fp, warn = FALSE) # load template from file path
    } else if (l > 1){
        ## then it's a character vector
        con <- textConnection(fp)
        txt <- readLines(con, warn = FALSE)
        close(con)
    } else {
        stop('file pointer error')      # you never know...
    }

    return(txt)
}


#' Template Header
#'
#' Returns \code{rapport} template header from provided path or a character vector.
#'
#' Default parameters are read from \code{options}:
#'
#' \itemize{
#'     \item 'header.open',
#'     \item 'header.close'.
#' }
#' @param fp a template file pointer (see \code{\link{tpl.find}} for details)
#' @param open.tag a string with opening tag (defaults to value of user-defined \code{"header.open"} tag)
#' @param close.tag a string with closing tag (defaults to value of user-defined \code{"header.close"} tag)
#' @param ... additional arguments to be passed to \code{\link{grep}} function
#' @return a character vector with template header contents
tpl.header <- function(fp, open.tag = get.tags('header.open'), close.tag = get.tags('header.close'), ...){

    txt <- tpl.find(fp)                 # split by newlines

    ## get header tag indices
    hopen.ind  <- grep(open.tag, txt, ...)  # opening tag
    hclose.ind <- grep(close.tag, txt, ...) # closing tag

    ## check header indices
    if (hopen.ind != 1)
        stop('opening header tag not found in first line')

    ## only ONE header tag pairs required
    if (!(length(hopen.ind) == 1 & length(hclose.ind) == 1))
        stop('header tag error')

    hsection <- txt[(hopen.ind + 1):(hclose.ind - 1)] # get header

    if (
        length(hsection) < 1            # blank header
        |
        all(grepl('^[[:space:]]+$', hsection)) # only whitespace
        |
        all(nchar(hsection) == 0)       # only newlines
        )
        stop('template header empty')

    return(hsection)
}


#' Template Body
#'
#' Returns contents of template body.
#'
#' Default parameters are read from \code{options}:
#'
#' \itemize{
#'     \item 'header.close'.
#' }
#' @param fp a template file pointer (see \code{\link{tpl.find}} for details)
#' @param htag a string with closing body tag
#' @param ... additional arguments to be passed to \code{\link{grep}} function
#' @return a character vector with template body contents
#' @export
tpl.body <- function(fp, htag = get.tags('header.close'), ...){

    txt   <- tpl.find(fp)
    h.end <- grep(htag, txt, ...)
    structure(txt[(h.end + 1):length(txt)], class = 'rp.body')
}


#' Template Info
#'
#' Provides information about template metadata and/or inputs.
#' @param fp a template file pointer (see \code{\link{tpl.find}} for details)
#' @param meta return template metadata? (defaults to \code{TRUE})
#' @param inputs return template inputs? (defaults to \code{TRUE})
#' @examples \dontrun{
#' tpl.info('example')  # return both metadata and inputs
#' tpl.info('crosstable', inputs = FALSE)  # return only template metadata
#' tpl.info('correlations', meta = FALSE)  # return only template inputs
#' }
#' @export
tpl.info <- function(fp, meta = TRUE, inputs = TRUE){

    h <- tpl.header(fp)                 # get header

    if (!meta & !inputs)
        stop('Either "meta" or "inputs" should be set to TRUE')

    res <- list()

    if (meta)
        res$meta <- tpl.meta(h, use.header = TRUE)

    if (inputs)
        res$inputs <- tpl.inputs(h, use.header = TRUE)

    class(res) <- 'rp.info'
    return(res)
}


#' Header Metadata
#'
#' Displays summary of template metadata stored in a header section. This part of template header consists of several \emph{key: value} pairs, which define some basic template info, such as \emph{Title}, \emph{Example}  etc. If you're familiar with package development in R, you'll probably find this approach very similar to \code{DESCRIPTION} file.
#'
#' \strong{Mandatory Fields}
#'
#' The following fields must be specified in the template header and their size limits must be taken into account:
#'
#' \itemize{
#'     \item \emph{Title} - a template title (at most 500 characters)
#'     \item \emph{Author} - author's (nick)name (at most 100 characters)
#'     \item \emph{Description} - template description (at most 5000 characters)
#' }
#'
#' \strong{Optional Fields}
#'
#' Some fields are not required by the template. However, you should reconsider including them in the template, so that the other users could get a better impression of what your template does. These are currently supported fields:
#'
#' \itemize{
#'     \item \emph{Email} - author's email address (defaults to \code{NULL})
#'     \item \emph{Packages} - a comma-separated list of packages required by the template (defaults to \code{NA})
#'     \item \emph{Data required} - is dataset required by a template? Field accepts \code{TRUE} or \code{FALSE}, and defaults to \code{FALSE}.
#'     \item \emph{Example} - newline-separated example calls to \code{rapport} function, including template data and inputs (defaults to \code{NULL})
#' }
#'
#' Upon successful execution, \code{rp.meta}-class object is returned invisibly.
#' @param fp a template file pointer (see \code{\link{tpl.find}} for details)
#' @param fields a list of named lists containing key-value pairs of field titles and corresponding regexes
#' @param use.header a logical value indicating if the character vector provided in \code{fp} argument contains header data
#' @param trim.white a logical value indicating if the extra spaces should removed from header fields before extraction
#' @return a list with template metadata
#' @export
tpl.meta <- function(fp, fields = NULL, use.header = FALSE, trim.white = TRUE){

    header <- tpl.find(fp)

    if (!isTRUE(use.header))
        header <- tpl.header(header)

    if (isTRUE(trim.white))
        header <- trim.space(header)

    ## required fields
    fld <- list(
                list(title = 'Title'         , regex = '.+', field.length = 500),
                list(title = 'Author'        , regex = '.+', field.length = 100),
                list(title = 'Description'   , regex = '.+', short = 'desc'),
                list(title = 'Email'         , regex = '[[:alnum:]\\._%\\+-]+@[[:alnum:]\\.-]+\\.[[:alpha:]]{2,4}', mandatory = FALSE, short = 'email'),
                list(title = 'Packages'      , regex = '[[:alnum:]\\.]+((, ?[[:alnum:]+\\.]+)+)?', mandatory = FALSE),
                list(title = 'Data required' , regex = 'TRUE|FALSE', mandatory = FALSE, default.value = FALSE),
                list(title = 'Example'       , regex = '.+', mandatory = FALSE)
                )

    ## no fields specified, load default fields
    if (!is.null(fields)){
        fld.title <- sapply(fld, function(x) x$title)
        fields.title  <- sapply(fields, function(x) x$title)
        fld <- c(fld, fields) # merge required fields with default/specified ones
        if (any(fld %in% fields.title)){
            stopf("Duplicate metadata fields: %s", p(intersect(fld.title, fields.title), "\""))
        }
    }

    inputs.ind <- grep("^(.+\\|){3}.+$", header) # get input definition indices
    spaces.ind <- grep("^([:space:]+|)$", header)
    rm.ind     <- c(inputs.ind, spaces.ind)

    if (length(rm.ind) > 0)
        h <- header[-rm.ind]
    else
        h <- header

    l <- sapply(fld, function(x){
        m <- grep(sprintf("^%s:", x$title), h)
        x$x <- h[m]
        do.call(extract_meta, x)
    })

    ## store only packages that aren't listed in dependencies
    if (!is.null(l$packages)){
        pkg.dep    <- strsplit(packageDescription("rapport")$Depends, "[,[:space:]]+")[[1]]
        l$packages <- lapply(strsplit(l$packages, ','), trim.space)[[1]]
        l$packages <- setdiff(l$packages, pkg.dep)
    }

    ## examples
    if (!is.null(l$example)){
        ## select all "untagged" lines after Example: that contain rapport(<smth>) string
        ## but it will not check if they're syntactically correct
        ind.start <- grep('^Example:', header)
        ind       <- adj.rle(grep("^[\t ]*rapport\\(.+\\)([\t ]*#*[[:print:]]*)?$", header))$values[[1]]
            ind       <- ind[!ind %in% ind.start]
        l$example <- c(l$example, header[ind])
    }

    structure(l, class = 'rp.meta')
}


#' Template Inputs
#'
#' Displays summary of template inputs from header section. \code{rp.inputs}-class object is returned invisibly.
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
#' Now we'll make a little digression and talk about \strong{input limits}. You may have noticed some additional stuff in type specification, e.g. \code{numeric[1,6]}. All dataset inputs, as well as *string* and *numeric standalone inputs* can contain \emph{limit specifications}. If you want to bundle several variables from dataset or provide a vector with several string/numeric values, you can apply some rules within square brackets in \code{[a,b]} format, where \code{[a,b]} stands for "from \code{a} to \code{b} inputs", e.g. \code{[1,6]} means "from 1 to 6 inputs". Limit specifications can be left out, but even in that case implicit limit rules are applied, with \code{a} and \code{b} being set to 1.
#'
#' \strong{Dataset inputs} will match one or more variables from a dataset, and check its mode and/or class. \code{variable} type is a bit different, since it matches any kind of variable (not to confuse with \code{Any} type), but it still refers to variable(s) from a provided dataset. Dataset inputs cannot have default value, but can be optional (just leave out \code{*} sign in front of input name). Note that if you provide more than one variable name in \code{rapport} function call, that input will be stored as a \code{data.frame}, otherwise, it will be stored as a \emph{variable} (atomic vector).
#'
#' \strong{Standalone inputs} are a bit different since they do not refer to any variables from a dataset. However, they are more complex than *dataset inputs*, especially because they can contain default values.
#' \itemize{
#'     \item \strong{number} and \strong{string} inputs are defined with \code{number} and \code{string} declaration, respectively. They can also contain limit specifications, e.g. \code{number[1,6]} accepts numeric vector with at least 1 and at most 6 elements. Of course, you can pass the same specification to string inputs: \code{string[1,6]}. In this case, you're setting length limits to a character vector. \emph{number} and \emph{string} inputs can have \emph{default value}, which can be defined by placing \code{=} after type/limit specification followed by default value. For instance, \code{number[1,6]=3.14} sets value \code{3.14} as default. Same stands for string inputs: default value can be defined in the same manner: \code{string=foo} sets "foo" as default string value (note that you don't have to specify quotes unless they are the part of the default string).
#'     \item \strong{boolean} inputs can contain either \code{TRUE} or \code{FALSE} values. The specified value is the default one. They cannot contain limit specification.
#'     \item \strong{option} inputs are nothing more than a comma-separated list of strings. Even if you specify numbers in a list, they will be coerced to strings once the list is parsed. Values in \emph{option} list will be placed in a character vector, and matched with \code{match.arg} function. That means that you could only choose one value from a list. Partial matches are allowed, and the first value in \emph{option} list is the default one.
#' }
#'
#' \strong{Input Label and Description}
#'
#' Third block in input definition is an input label. While \emph{variable} can have its own label (see \code{rp.label}), you may want to use the one defined in input specifications. At last, fourth block contains input description, which should be a lengthy description of current input. Note that all the fields in input specification are mandatory. You can cheat, though, by providing a non-space character (e.g. a dot) as an input label and/or description, but please don't do that unless you're testing the template. Labels and descriptions are meant to be informative.
#' @param fp a template file pointer (see \code{\link{tpl.find}} for details)
#' @param use.header a logical value indicating whether the header section is provided in \code{h} argument
#' @return a list with variable info
#' @export
tpl.inputs <- function(fp, use.header = TRUE){

    header <- tpl.find(fp)

    if (!isTRUE(use.header))
        header <- tpl.header(header)

    inputs.ind <- grep("^(.+\\|){3}.+$", header) # get input definition indices

    if (length(inputs.ind) == 0)
        return (structure(NULL, class = 'rp.inputs'))

    inputs.raw <- lapply(strsplit(header[inputs.ind], '|', fixed = TRUE), function(x) trim.space(x)) # "raw" as in "unchecked", split by | and trimmed for whitespace

    if (!all(sapply(inputs.raw, length) == 4))
        stop('input definition error: missing fields')

    chk.fn <- function(x, nms){

        i.name  <- x[1]
        i.type  <- x[2]
        i.label <- x[3]
        i.desc  <- x[4]

        re.lbl <- "^[^\\|\n\r]*$" # to be used for variable label and description (allows 0 or more chars that aren't "|", carriage return or newline)

        ## 1st: check variable name
        ## must begin with a letter, and can continue either with a letter or a digit, separated either by underscore or dot, e.g. 'var.90', or 'v90_alpha'.
        if (!check.name(i.name))
            stopf('invalid input name: "%s"', i.name)

        ## 2nd: check/get type
        var.type <- check.type(i.type)

        ## 3rd: check label
        if (nchar(i.label) < 1)
            warningf('label string for input "%s" was not provided', i.name)
        if (!grepl(re.lbl, i.label))
            stopf('invalid input label: "%s"', i.type)

        ## 4th: check description
        if (nchar(i.desc) < 1)
            warningf('description string for input "%s" was not provided', i.desc)
        if (!grepl(re.lbl, i.desc))
            stopf('invalid input description: "%s"', i.desc)

        c(name = i.name, label = i.label, var.type, desc = i.desc)
    }

    inputs <- lapply(inputs.raw, chk.fn)
    structure(inputs, class = 'rp.inputs')
}


#' Template Examples
#'
#' Displays template examples defined in \code{Example} section. Handy to check out what template does and how does it look like once it's rendered. If multiple examples are available, and \code{index} argument is \code{NULL}, you will be prompted for input. If only one example is available in the header, user is not prompted for input action, and given template is evaluated automatically. At any time you can provide an integer vector with example indices to \code{index} argument, and specified examples will be evaluated without prompting, thus returning a list of \code{rapport} objects. Example output can be easily exported to various formats (HTML, ODT, etc.) - check out documentation for \code{tpl.export} for more info.
#' @param fp a template file pointer (see \code{\link{tpl.find}} for details)
#' @param index a numeric vector indicating the example index - meaningful only for templates with multiple examples. Accepts vector of integers to match IDs of template example. Using 'all' (character string) as index will return all examples.
#' @param env an environment where example will be evaluated (defaults to \code{.GlobalEnv})
#' @examples \dontrun{
#' tpl.example('example')
#' tpl.example('example', 1:2)
#' tpl.example('example', 'all')
#' tpl.example('crosstable')
#' tpl.export(tpl.example('crosstable'))
#' }
#' @export
tpl.example <- function(fp, index = NULL, env = .GlobalEnv) {

    examples   <- tpl.meta(fp)$example
    n.examples <- 1:length(examples)
    examples.len <- length(examples)

    ## return NULL invisibly if no templates are found in the template
    if (is.null(examples)){
        message('Provided template does not have any examples.')
        invisible(NULL)
    }

    if (examples.len > 1){
        if (is.null(index)){
            opts  <- c(n.examples, 'all')
            catn('Enter example ID from the list below:')
            catn(sprintf('\n(%s)\t%s', opts, c(examples, 'Run all examples')))
            i     <- readline('Template ID> ')
            index <- unique(strsplit(gsub(' +', '', i), ',')[[1]])
        }
    } else {
        index <- 1
    }

    if (length(index) == 0){
        message('No example selected')
        return(invisible(NULL))
    }

    if (length(index) == 1 && index == 'all')
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


#' Reproduce Template
#'
#' Runs template with data and arguments included in \code{rapport} object. In order to get reproducible example, you have to make sure that \code{reproducible} argument is set to \code{TRUE} in \code{rapport} function.
#' @param tpl a \code{rapport} object
#' @examples \dontrun{
#' tmp <- rapport("example", mtcars, x = "hp", y = "mpg", reproducible = TRUE)
#' tpl.rerun(tmp)
#' }
#' @export
tpl.rerun <- function(tpl){

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


#' Evaluate Template
#'
#' This is the central function in the \code{rapport} package, and hence eponymous. In following lines we'll use \code{rapport} to denote the function, not the package. \code{rapport} requires a template file, while dataset (\code{data} argument) can be optional, depending on the value of \code{Data required} field in template header. Template inputs are matched with \code{...} argument, and should be provided in \code{x = value} format, where \code{x} matches input name and \code{value}, wait for it... input value! See \code{\link{tpl.inputs}} for more details on template inputs.
#'
#' Default parameters are read from \code{evalsOptions()} and the following \code{options}:
#'
#' \itemize{
#'     \item 'rp.file.name',
#'     \item 'rp.file.path',
#' }
#'
#' @param fp a template file pointer (see \code{\link{tpl.find}} for details)
#' @param data a \code{data.frame} to be used in template
#' @param ... matches template inputs in format 'key = "value"'
#' @param env an environment where template commands be evaluated (defaults to \code{new.env()}
#' @param reproducible a logical value indicating if the call and data should be stored in template object, thus making it reproducible (see \code{\link{tpl.rerun}} for details)
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
#' rapport("example", ius2008, var = "leisure")
#' rapport("example", ius2008, var = "leisure", desc = FALSE, hist = TRUE, theme = "Set1")
#'
#' ## generating high resolution images also
#' rapport("example", ius2008, var="leisure", hist = TRUE, graph.hi.res = TRUE)
#' rapport.html("nortest", ius2008, var = "leisure", graph.hi.res=T)
#' ## generating only high resolution image
#' rapport("example", ius2008, var="leisure", hist = TRUE, graph.width = 1280, graph.height = 1280)
#' ## nested templates cannot get custom setting, use custom rapport option:
#' options('graph.hi.res' = TRUE)
#' rapport('descriptives-multivar', data=ius2008, vars=c("gender", 'age'))
#' }
#' @export
rapport <- function(fp, data = NULL, ..., env = new.env(), reproducible = FALSE, header.levels.offset = 0, graph.output = evalsOptions('graph.output'), file.name = getOption('rp.file.name'), file.path = getOption('rp.file.path'), graph.width = evalsOptions('width'), graph.height = evalsOptions('height'), graph.res = evalsOptions('res'), graph.hi.res = evalsOptions('hi.res'), graph.replay = evalsOptions('graph.recordplot')) {

    timer    <- proc.time()                       # start timer
    txt      <- tpl.find(fp)                      # split file to text
    h        <- tpl.info(txt)                     # template header
    meta     <- h$meta                            # header metadata
    inputs   <- h$inputs                          # header inputs
    b        <- tpl.body(txt)                     # template body
    e        <- new.env(parent = env)             # load/create evaluation environment
    i        <- list(...)                         # user inputs
    data.required <- isTRUE(as.logical(meta$dataRequired)) # is data required
    pkgs     <- meta$packages                                # required packages
    file.path <- gsub('\\', '/', file.path, fixed = TRUE)

    ## load required packages (if any)
    if (!is.null(pkgs)){
        pk <- suppressMessages(sapply(pkgs, require, character.only = TRUE, quietly = TRUE))
        nopkg <- pk == FALSE
        if (any(nopkg))
            stopf('Following packages are required by the template, but were not loaded: %s', p(names(pk[nopkg]), wrap = '"'))
    }

    ## no inputs provided
    if (length(inputs) == 0){
        ## check if data is required
        if (data.required){
            if (is.null(data))
                stop('"data" argument is required by the template')
            else
                assign('rp.data', data, envir = e)
        }
        ## inputs required, carry on...
    } else {
        ## check mandatory inputs
        input.mandatory <- sapply(inputs, function(x){
            mand <- if (is.null(x$mandatory)) FALSE else x$mandatory
            structure(mand, .Names = x$name) # mandatory inputs
        })
        input.names <- names(input.mandatory)
        input.ok    <- input.names[input.mandatory] %in% names(i)
        ## take default inputs into account
        if (!all(input.ok))
            stopf("you haven't provided a value for %s", p(input.names[input.mandatory], '"'))

        ## data required
        if (data.required){

            if(is.null(data))
                stop('"data" not provided, but is required')

            if (!inherits(data, c('data.frame', 'rp.data')))
                stop('"data" should be a "data.frame" object')

            data.names <- names(data)          # variable names
            assign('rp.data', data, envir = e) # load data to eval environment
        }

        lapply(inputs, function(x){

            name          <- x$name                # input name
            input.value   <- i[[name]]             # input value (supplied by user)
            input.len     <- length(input.value)   # input length (not to confuse with limit)
            limit         <- x$limit               # input limits
            input.type    <- x$type                # input type
            input.default <- x$default             # default value (if any)

            if (!is.null(input.value)){
                ## check limits
                if (input.len < limit$min || input.len > limit$max){
                    len.diff <- diff(c(limit$min, limit$max))
                    len.msg  <- if (len.diff == 0) 1 else sprintf('between %d and %d', limit$min, limit$max)
                    stopf('input "%s" has length of %d, and should be %s', name, input.len, len.msg)
                }
            }

            ## check type
            type.fn <- switch(input.type,
                              option    = , # CSV list of strings
                              string    = is.string,
                              character = is.character,
                              complex   = is.complex,
                              factor    = is.factor,
                              boolean   = is.boolean,
                              logical   = is.logical,
                              number    = is.number,
                              numeric   = is.numeric,
                              variable  = is.variable,
                              stopf('unknown type: "%s"', input.type)
                              )

            ## if any of our "custom" input types
            ## values are not extracted from data.frame in this case
            ## for custom types, default value is always assigned!!!
            if (input.type %in% c('number', 'string', 'option', 'boolean')){

                ## the ones specified in the template should take precedence
                val <- if (is.null(input.value)) input.default[1] else input.value

                ## check types
                if (!do.call(type.fn, list(val)))
                    stopf('"%s" is not of "%s" type', val, input.type)

                ## CSV input (allow multi match?)
                if (input.type == 'option')
                    val <- match.arg(input.value, input.default)

            } else {
                ## ain't a "custom" input type, so it should be extracted from data.frame

                ## check if ALL variable names exist in data
                if (!all(input.value %in% data.names))
                    stopf('provided data.frame does not contain column(s) named: %s', p(setdiff(input.value, data.names), '"'))

                if (is.null(input.value)){
                    val <- NULL
                } else {

                    val <- e$rp.data[, input.value] # variable value


                    ## multiple variables supplied
                    if (is.data.frame(val)){

                        ## check types
                        val.types <- sapply(val, type.fn)
                        val.modes <- sapply(val, mode)
                        if (!all(val.types == TRUE))
                            stopf('error in "%s": %s should be %s! (provided: %s)', name, p(input.value[!val.types], '"'), input.type, p(val.modes[!val.types], '"'))

                        ## check labels
                        for (t in names(val)){
                            if (rp.label(val[, t]) == 't')
                                val[, t] <- structure(val[, t], label = t, name = t)
                            else
                                val[, t] <- structure(val[, t], name = t)
                        }
                    } else if (is.atomic(val)){
                        ## only one variable extracted from data.frame

                        ## check type
                        val.types <- do.call(type.fn, list(val))
                        val.modes <- mode(val)
                        if (!val.types)
                            stopf('error in "%s": "%s" should be %s! (provided: %s)', name, input.value, input.type, val.modes)

                        ## check label
                        if (rp.label(val) == 'val')
                            val <- structure(val, label = input.value, name = input.value)
                        else
                            val <- structure(val, name = input.value)
                    } else {
                        stop('data extraction error') # you never know...
                    }
                }
            }

            ## assign stuff
            assign(name, val, envir = e)                             # value
            assign(sprintf('%s.iname', name), name, envir = e)       # input name (the stuff)
            assign(sprintf('%s.ilen', name), input.len, envir = e)   # input length
            assign(sprintf('%s.ilabel', name), x$label, envir = e)   # input label
            assign(sprintf('%s.idesc', name), x$desc, envir = e)     # input description
            assign(sprintf('%s.name', name), input.value, envir = e) # variable name(s)
            assign(sprintf('%s.len', name), length(val), envir = e)  # variable length
            if (is.data.frame(val))
                assign(sprintf('%s.label', name), sapply(val, rp.label), envir = e) # variable labels
            else if (is.atomic(val))
                assign(sprintf('%s.label', name), rp.label(val), envir = e) # variable label
            else
                stopf('"%s" is not a "data.frame" or an atomic vector', name) # you never know...
        })
    }

    ## pregenerate file name
    if (grepl('%T', file.name))
        file.name <- gsub('%T', gsub('\\\\|/', '-', fp), file.name, fixed = TRUE)
    if (grepl('%N', file.name)) {
        if (length(strsplit(sprintf('placeholder%splaceholder', file.name), '%N')[[1]]) > 2)
            stop('File name contains more then 1 "%N"!')
        similar.files <-  list.files(file.path(file.path, 'plots'), pattern = sprintf('^%s\\.(jpeg|tiff|png|svg|bmp)$', gsub('%t', '[a-z0-9]*', gsub('%N|%n', '[[:digit:]]*', file.name))))
        if (length(similar.files) > 0) {
            similar.files <- sub('\\.(jpeg|tiff|png|svg|bmp)$', '', similar.files)
            rep <- gsub('%t|%n', '[a-z0-9]*', strsplit(basename(file.name), '%N')[[1]])
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
    assign('rp.body', paste(b, collapse = '\n'), envir = e)
    assign('.graph.name', file.name, envir = e)
    assign('.graph.dir', evalsOptions('graph.dir'), envir = e)
    assign('.graph.hi.res', graph.hi.res, envir = e)
    assign('.tmpout', tempfile(), envir = e)
    report <- tryCatch(eval(parse(text = 'Pandoc.brew(text = rp.body, graph.name = .graph.name, graph.dir = .graph.dir, graph.hi.res = .graph.hi.res, output = .tmpout)'), envir = e), error = function(e) e)

    options(opts.bak)                          # resetting options
    setwd(wd.bak)
    unlink(e$.tmpout)

    ## error handling
    if (inherits(report, 'error'))
        stop(report$message)

    ## remove NULL/blank parts
    ## ind.nullblank <- sapply(report, function(x){
    ##     if (x$type == 'block')
    ##         ifelse(is.null(x$robjects[[1]]$output), FALSE, TRUE)
    ##     else
    ##         ifelse(x$text$eval == 'NULL', FALSE, TRUE)
    ## })
    ## report <- report[ind.nullblank]     # update template body contents

    ## tidy up (removing metadata, inputs from) nested templates
    report <- unlist(lapply(report, function(x){

        robj  <- x$robject
        rout  <- robj$result
        xtype <- x$type

        ## chunk holding a rapport class
        if (xtype == 'block'){

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

    if (isTRUE(reproducible)){
        res$data <- data
    }

    class(res) <- 'rapport'

    return(res)
}
