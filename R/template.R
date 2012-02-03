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
#' Displays summary of template metadata stored in a header section. This part of template header consists of several \emph{key: value} pairs, which define some basic template info, such as \emph{Title}, \emph{Example}, \emph{Strict}, etc. If you're familiar with package development in R, you'll probably find this approach very similar to \code{DESCRIPTION} file.
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
#'     \item \emph{Strict} - "strict mode" returns only the last warning from a chunk. Field accepts \code{TRUE} or \code{FALSE}, and defaults to \code{FALSE}.
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
        header <- trim.space(header, TRUE)

    ## required fields
    fld <- list(
                list(title = 'Title'         , regex = '[[:print:]]+', field.length = 500),
                list(title = 'Author'        , regex = '.+', field.length = 100),
                list(title = 'Description'   , regex = '[[:print:]]+', short = 'desc'),
                list(title = 'Email'         , regex = '[[:alnum:]\\._%\\+-]+@[[:alnum:]\\.-]+\\.[[:alpha:]]{2,4}', mandatory = FALSE, short = 'email'),
                list(title = 'Packages'      , regex = '[[:alnum:]\\.]+((, ?[[:alnum:]+\\.]+)+)?', mandatory = FALSE),
                list(title = 'Data required' , regex = 'TRUE|FALSE', mandatory = FALSE, default.value = FALSE),
                list(title = 'Example'       , regex = '.+', mandatory = FALSE),
                list(title = 'Strict'        , regex = 'TRUE|FALSE', mandatory = FALSE, default.value = FALSE)
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
    h <- header[-c(inputs.ind, spaces.ind)]

    l <- sapply(fld, function(x){
        m <- grep(sprintf("^%s:", x$title), h)
        x$x <- h[m]
        do.call(extract_meta, x)
    })

    ## store only packages that aren't listed in dependencies
    if (!is.null(l$packages)){
        pkg.dep    <- strsplit(packageDescription("rapport")$Depends, "[,[:space:]]+")[[1]]
        l$packages <- lapply(strsplit(l$packages, ','), trim.space, leading = TRUE, trailing = TRUE)[[1]]
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
#' Apart from _template metadata_, header also requires specification for template \emph{inputs}. In most cases, \emph{inputs} refer to variable names in provided dataset, but some inputs have special meaning inside \code{rapport}, and some of them don't have anything to do with provided dataset whatsoever. Most inputs can contain limit specification, and some inputs can also have a default value. At first we'll explain input specifications on the fly, and in following sections we'll discuss each part in thorough details. Let's start with a single dummy input specification:
#'
#' \code{*foo.bar | numeric[1,6] | Numeric variable | A set of up to 6 numeric variables}
#'
#' \strong{Required Inputs}
#'
#' Asterisk sign (`*`) in front of an input name indicates a mandatory input. So it is possible to omit input (unless it's required, of course), but you may want to use this feature carefully, as you may end up with ugly output. If an input isn't mandatory, NULL is assigned to provided input name, and the object is stored in transient evaluation environment.
#'
#' \strong{Input Name}
#'
#' \emph{rapport} has its own naming conventions which are compatible, but different from traditional \strong{R} naming conventions. Input name ("foo.bar" in previous example) must start with an alphabet letter, followed either by other alphabet letters or numbers, separated with `_` or `.`. For example, valid names are: `foo.bar`, `f00_bar`, or `Fo0_bar.input`. Input name length is limited on 30 characters by default. At any time you can check your desired input name with `check.name` function. Note that input names are case-sensitive, just like \code{symbol}s in \strong{R}.
#'
#' \strong{Input Type}
#'
#' _Input type_ is specified in the second input block. It is the most (read: "only") complex field in an input specification. It consists of _type specification_, _limit specification_ and sometimes a _default value specification_. Most input types are compatible with eponymous \strong{R} modes: \emph{character}, \emph{complex}, \emph{logical}, \emph{numeric}, or \strong{R} classes like \emph{factor}. Some are used as "wildcards", like \emph{variable}, and some do not refer to dataset variables at all: \emph{boolean}, \emph{number}, \emph{string} and \emph{option}. Here we'll discuss each input type thoroughly. We will use term \emph{variable} to denote a vector taken from a dataset (for more details see documentation for `is.variable`). All inputs can be divided into two groups, depending on whether they require a dataset or not:
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
#'         \item \emph{option} - accepts a comma-separated list of values, that are to be matched with \code{\link{match.arg}}. The first value in a list is a default one.
#'     }
#' }
#'
#' Now we'll make a little digression and talk about \strong{input limits}. You may have noticed some additional stuff in type specification, e.g. `numeric[1,6]`. All dataset inputs, as well as *string* and *numeric standalone inputs* can contain _limit specifications_. If you want to bundle several variables from dataset or provide a vector with several string/numeric values, you can apply some rules within square brackets in `[a,b]` format, where `[a,b]` stands for "from \code{a} to \code{b} inputs", e.g. `[1,6]` means "from 1 to 6 inputs". Limit specifications can be left out, but even in that case implicit limit rules are applied, with \code{a} and \code{b} being set to 1.
#' \strong{Dataset inputs} will match one or more variables from a dataset, and check its mode and/or class. \code{variable} type is a bit different, since it matches any kind of variable (not to confuse with \code{Any} type), but it still refers to variable(s) from a provided dataset. Dataset inputs cannot have default value, but can be optional (just leave out `*` sign in front of input name). Note that if you provide more than one variable name in \code{rapport} function call, that input will be stored as a `data.frame`, otherwise, it will be stored as a \emph{variable} (atomic vector).
#' \strong{Standalone inputs} are a bit different since they do not refer to any variables from a dataset. However, they are more complex than *dataset inputs*, especially because they can contain default values.
#' - \strong{number} and \strong{string} inputs are defined with \code{number} and \code{string} declaration, respectively. They can also contain limit specifications, e.g. `number[1,6]` accepts numeric vector with at least 1 and at most 6 elements. Of course, you can pass the same specification to string inputs: `string[1,6]`. In this case, you're setting length limits to a character vector. \emph{number} and \emph{string} inputs can have \emph{default value}, which can be defined by placing `=` after type/limit specification followed by default value. For instance, `number[1,6]=3.14` sets value `3.14` as default. Same stands for string inputs: default value can be defined in the same manner: `string=foo` sets "foo" as default string value (note that you don't have to specify quotes unless they are the part of the default string).
#' - \strong{boolean} inputs can contain either \code{TRUE} or \code{FALSE} values. The specified value is the default one. They cannot contain limit specification.
#' - \strong{option} inputs are nothing more than a comma-separated list of strings. Even if you specify numbers in a list, they will be coerced to strings once the list is parsed. Values in \emph{option} list will be placed in a character vector, and matched with `match.arg` function. That means that you could only choose one value from a list. Partial matches are allowed, and the first value in \emph{option} list is the default one.
#'
#' \strong{Input Label and Description}
#'
#' Third block in input definition is an input label. While \emph{variable} can have its own label (see `rp.label`), you may want to use the one defined in input specifications. At last, fourth block contains input description, which should be a lengthy description of current input. Just to remind you - all fields in input specification are mandatory. You can cheat, though, by providing `.` or something like that as input label and/or description, but please don't do that unless you're testing the template. Labels and descriptions are meant to be informative.
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
    ## don't do issue the warning here
    ## warning('no input definitions found in header file')

    inputs.raw <- lapply(strsplit(header[inputs.ind], '|', fixed = TRUE), function(x) trim.space(x, TRUE)) # "raw" as in "unchecked", split by | and trimmed for whitespace

    if (!all(sapply(inputs.raw, length) == 4))
        stop('input definition error: missing fields')

    chk.fn <- function(x, nms){

        re.lbl <- '^[[:print:]][^\\|]+$' # variable text (for label & description)

        ## 1st: check variable name
        ## must begin with a letter, and can continue either with a letter or a digit, separated either by underscore or dot, e.g. 'var.90', or 'v90_alpha'.
        if (!check.name(x[1]))
            stopf('invalid input name: "%s"', x[1])

        ## 2nd: check/get type
        var.type <- check.type(x[2])

        ## 3rd: check label
        if (!grepl(re.lbl, x[3]))
            stopf('invalid input label: "%s"', x[2])

        ## 4th: check description
        if (!grepl(re.lbl, x[4]))
            stopf('invalid input description: "%s"', x[4])

        c(name = x[1], label = x[3], var.type, desc = x[4])
    }

    inputs <- lapply(inputs.raw, chk.fn)
    structure(inputs, class = 'rp.inputs')
}


#' Template Examples
#'
#' Displays template examples defined in \code{Example} section. Handy to check out what template does and how does it look like once it's rendered. If multiple examples are available, and \code{index} argument is \code{NULL}, you will be prompted for input. In case when only one example is available in the header, user is not prompted for input action, and given template is evaluated automatically. At any time you can provide an integer vector with example indices to \code{index} argument, and specified examples will be evaluated without prompting the user, thus returning a list of \code{rapport} objects. Example output can be easily exported to various formats (HTML, ODT, etc.) - check out documentation for \code{tpl.export} for more info.
#' @param fp a template file pointer (see \code{\link{tpl.find}} for details)
#' @param index a numeric vector indicating the example index - meaningful only for templates with multiple examples. Accepts vector of integers to match IDs of template example. Using 'all' (character string) as index will return all examples.
#' @param env an environment where example will be evaluated (defaults to \code{.GlobalEnv})
#' @examples \dontrun{
#' tpl.example('example')
#' tpl.example('crosstable')
#' tpl.export(tpl.example('crosstable'))
#' tpl.example('example', 1:2)
#' tpl.example('example', 'all')
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
            cat('\nTemplate ID> ')
            con   <- file('stdin')
            index <- unique(strsplit(readLines(con, 1), ' ?, ?')[[1]])
            close(con)
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


#' Template Elements
#'
#' Returns a \code{data.frame} containing summary of relevant template elements: \code{ind} - indice of current element in template's body, \code{type} - a string indicating the type of the content ("heading", "inline" or "block"), and \code{chunk} - a string containing R expression found in a code chunk.
#' @param fp a template file pointer (see \code{\link{tpl.find}} for details)
#' @param extract a string indicating which elements should be extracted from the template: headings, blocks, or code chunks (by default it returns all of the above)
#' @param use.body a logical value indicating whether the whole template should be used, or just its body
#' @param skip.blank.lines remove blank lines within R chunks
#' @param skip.r.comments remove comments withing R chunks
#' @param ... additional arguments to be passed to \code{\link{grep}} and \code{\link{get.tags}} functions
#' @return a \code{data.frame} with 3 columns:
#' @examples \dontrun{
#'     fp <- system.file("templates", "example.tpl", package = "rapport")
#'     tpl.elem(fp) # returns all elements (headings, inlines and blocks)
#'
#'     ## returns only code blocks
#'     tpl.elem(fp, extract = "block")
#' }
tpl.elem <- function(fp, extract = c('all', 'heading', 'inline', 'block'), use.body = FALSE, skip.blank.lines = TRUE, skip.r.comments = FALSE, ...){

    if (isTRUE(use.body))
        b <- fp
    else
        b <- tpl.body(tpl.find(fp))

    ## check for empty body
    if (all(grepl('^[:space:]*$', b)))
        stop('template body is empty')

    ext <- match.arg(extract)           # what should be extracted?

    ## bunch of regexes
    re.blank     <- '^([[:blank:]]+|)$'              # blank line
    re.head      <- '^#{1,6}([ |\t]+)?[[:print:]]+$' # heading
    re.co        <- get.tags('chunk.open', ...)      # chunk open
    re.cc        <- get.tags('chunk.close', ...)     # chunk closed
    re.cmt.open  <- get.tags('comment.open', ...)    # comment open
    re.cmt.close <- get.tags('comment.close', ...)   # comment close

    ## get blank line indices
    blank.ind <- grep(re.blank, b, ...) # get blank line indices

    ## get pandoc (HTML) comment indices
    cmt.o.ind <- grep(re.cmt.open, b, ...)
    cmt.c.ind <- grep(re.cmt.close, b, ...)

    ## chunks
    co.ind    <- grep(re.co, b, ...) # get indices of opening chunk tags
    cc.ind    <- grep(re.cc, b, ...) # get indices of closing chunk tags
    chunk.lst <- mapply(seq, co.ind + 1, cc.ind - 1, SIMPLIFY = FALSE) # get indices of lines within the chunk tags and store them in a list
    chunk.all <- c(co.ind, unlist(chunk.lst), cc.ind) # get all chunk indices
    ## skip blank lines
    if (isTRUE(skip.blank.lines))
        chunk.lst <- lapply(chunk.lst, function(x) x[!x %in% blank.ind])
    ## skip R comments
    if (isTRUE(skip.blank.lines))
        chunk.lst <- lapply(chunk.lst, function(x) x[!grepl('^#', x)])
    ## exclude empty list elements
    chunk.lst <- chunk.lst[sapply(chunk.lst, length) > 0]

    ## heading
    h.ind    <- grep(re.head, b, ...) # get heading-like indices (this matches R in chunks)
    h.ind    <- h.ind[!h.ind %in% chunk.all] # exclude chunks (bye-bye R comments)
    h.is.1st <- 1 %in% h.ind                 # check 1st line heading
    h.adj    <- (h.ind %in% (h.ind - 1)) | (h.ind %in% (h.ind + 1)) # get adjacent headers
    h.white  <- ((h.ind - 1) %in% blank.ind) & ((h.ind + 1) %in% blank.ind) # get whitespace before/after the heading
    h        <- h.ind[h.adj | h.white]
    if (h.is.1st == TRUE)
        h <- c(1, h)

    ## blocks
    len   <- 1:length(b)
    block <- adj.rle(len[!len %in% c(blank.ind, h.ind, chunk.all)])$values
    ## TODO: check tag mismatch
    ## TODO: check comment mismatch, but yield only warnings

    ## prepare response list
    ind <- switch(ext,
                  all = list(
                      heading = lapply(h, structure, type = "heading"),
                      inline  = lapply(block, structure, type = "inline"),
                      block   = lapply(chunk.lst, structure, type = "block")
                      ),
                  heading = lapply(h, structure, type = "heading"),
                  inline  = lapply(block, structure, type = "inline"),
                  block   = lapply(chunk.lst, structure, type = "block"),
                  stop('unknown indices type')
                  )

    ## preserve original element order
    u <- unlist(ind, recursive = FALSE, use.names = FALSE)
    u.ind <- order(sapply(u, function(x) x[1]))
    u <- u[u.ind]
    lapply(u, function(x){
        tx <- attr(x, 'type')
        bx <- b[x]
        switch(tx,
               heading = structure(bx, class = 'rp.heading'),
               inline  = structure(paste(bx, collapse = '\n'), class = 'rp.inline'),
               block   = structure(list(bx), class = 'rp.block'),
               stop('unknown element class')
               )
    })
}


#' Evaluate Template Elements
#'
#' This function grabs template elements from \code{\link{tpl.elem}} and evaluates them. For \code{rp.block}-classed elements just a vanilla \code{\link{evals}} call is carried out, while \code{rp.inline} and \code{rp.heading} classes have some additional post-evaluation processing (heading level is stored, as well as "raw" and evaluated chunk contents).
#'
#' Default parameters are read from \code{options}:
#'
#' \itemize{
#'     \item 'inline.open',
#'     \item 'inline.close'.
#' }
#' @param x a template file pointer (see \code{\link{tpl.find}} for details)
#' @param tag.open a string containing opening tag
#' @param tag.close a string containing closing tag
#' @param remove.comments should comments be omitted on evaluation?
#' @param rapport.mode see: \code{?rapport}
#' @param ... additional params for \code{grep}-like functions
#' @keywords internal
elem.eval <- function(x, tag.open = get.tags('inline.open'), tag.close = get.tags('inline.close'), remove.comments = TRUE, rapport.mode = 'normal', ...){

    if (inherits(x, 'rp.block')){

        ## template blocks
        res <- list(
                    type = 'block',
                    robjects = evals(x, ...)
                    )

    } else if (inherits(x, c('rp.inline', 'rp.heading'))) {

        ## inline/heading elements

        stopifnot(is.string(x))

        if (!inherits(x, c('rp.heading', 'rp.inline')))
            stop('invalid element class, either a heading or a block should be provided')

        if (isTRUE(remove.comments))
            x <- purge.comments(x)          # purge comments

        head  <- is.heading(x)               # is it a heading
        x     <- tags.misplaced(x, tag.open, tag.close) # check for misplaced tags
        ntags <- sum(has.tags(x, tag.open, tag.close)) # number of tags
        ## only for heading
        if (isTRUE(head)){
            lvl   <- nchar(gsub('^(#{1,6}).+$', '\\1', x)) # get heading level
            x     <- gsub('^#{1,6}[[:space:]]', '', x) # remove heading markup
        }

        ## both tags found
        if (ntags == 2){
            c.yes <- grab.chunks(x, tag.open, tag.close, TRUE) # chunks with tags
            c.no  <- grab.chunks(x, tag.open, tag.close, FALSE) # chunks sans tags
            resp  <- evals(c.no, ...)
            out   <- sapply(resp, function(x){
                ## OK, this is lame, we should allow users to define tables in blocks,
                ## but not in headings, assuming that we find an easy way to add
                ## something like anchor to the generated graph
                if (x$type == 'image')
                    stop("it's not allowed to create graphs within inline chunks")
                if (is.tabular(x$output))
                    stop('tabular structures are not allowed within inline chunks')
                ## return info on errors, don't just bleed to death! (bug spotted & fixed by Gergely)
                err <- x$msg$errors
                if (!is.null(err)) {                ## error handling in blocks:
                    if (rapport.mode == 'debug') {  ##   * in debug mode: halt
                        cat(sprintf('Malformed command: %s', x$src), '\n')
                        stop(err, call. = FALSE)
                    }                               ##   * otherwise:
                    warning(err, call.=F)           ##       * shoot warning()
                    return('<ERROR>')               ##       * returning '<ERROR>' inline
                }
                if (!is.null(x$output))
                    return(rp.prettyascii(x$output))    # get output
            })
            ## check chunk for tables an graphs!

            rpl   <- vgsub(c.yes, out, x, fixed = TRUE) # replace evaled chunk
        }

        ## no tags found, carry on
        if (ntags == 0) {
            rpl   <- x
            c.yes <- NULL
            out   <- NULL
        }

        lst <- list(
                    text = list(
                        raw  = x,
                        eval = rpl
                        ),
                    chunks = list(
                        raw  = c.yes,
                        eval = out
                        )
                    )

        if (isTRUE(head))
            res <- c(type = 'heading', level = lvl, lst)        # this is heading
        else
            res <- c(type = 'inline', lst)   # this is block

    } else {
        stop ('invalid "rapport" template element type')
    }

    return (res)
}


#' Evaluate Template
#'
#' This is the central function in the \code{rapport} package, and hence eponymous. In following lines we'll use \code{rapport} to denote the function, not the package. \code{rapport} requires a template file, while dataset (\code{data} argument) can be optional, depending on the value of \code{Data required} field in template header. Template inputs are matched with \code{...} argument, and should be provided in \code{x = value} format, where \code{x} matches input name and \code{value}, wait for it... input value! See \code{\link{tpl.inputs}} for more details on template inputs.
#'
#' Default parameters are read from \code{options}:
#'
#' \itemize{
#'     \item 'rapport.mode',
#'     \item 'graph.format',
#'     \item 'graph.width',
#'     \item 'graph.height',
#'     \item 'graph.res',
#'     \item 'graph.hi.res'.
#' }
#' @param fp a template file pointer (see \code{\link{tpl.find}} for details)
#' @param data a \code{data.frame} to be used in template
#' @param ... matches template inputs in format 'key = "value"'
#' @param reproducible a logical value indicating if the call and data should be stored in template object, thus making it reproducible (see \code{\link{tpl.rerun}} for details)
#' @param header.levels.offset number added to header levels (handy when using nested templates)
#' @param rapport.mode forces \code{rapport} to run in \emph{performance} or \emph{debug} mode instead of normal behaviour. Change this only if you really know what are you doing! In \code{performance} mode \code{rapport} will evaluate all templates in \code{strict} mode (see: \code{evals(..., check.output = FALSE)}), while in \code{debug} mode \code{rapport} will halt on first error.
#' @param graph.output the required file format of saved plots (optional)
#' @param graph.width the required width of saved plots (optional)
#' @param graph.height the required height of saved plots (optional)
#' @param graph.res the required nominal resolution in ppi of saved plots (optional)
#' @param graph.hi.res logical value indicating if high resolution (1280x~1280) images would be also generated
#' @return a list with \code{rapport} class.
#' @examples \dontrun{
#' rapport("example", ius2008, var = "leisure")
#' rapport("example", ius2008, var = "leisure", desc = FALSE, hist = TRUE, theme = "Set1")
#' rapport("example", ius2008, var = "leisure", rapport.mode = 'debug')
#' rapport("example", ius2008, var = "leisure", rapport.mode = 'performance')
#' ## Or set \code{'rapport.mode'} option to \code{debug}, \code{performance} or back to \code{normal}.
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
rapport <- function(fp, data = NULL, ..., reproducible = FALSE, header.levels.offset = 0, rapport.mode = getOption('rapport.mode'), graph.output = getOption('graph.format'), graph.width = getOption('graph.width'), graph.height = getOption('graph.height'), graph.res = getOption('graph.res'), graph.hi.res = getOption('graph.hi.res')) {

    ## start timer
    timer <- proc.time()

    txt    <- tpl.find(fp)                      # split file to text
    h      <- tpl.info(txt)                     # template header
    meta   <- h$meta                            # header metadata
    inputs <- h$inputs                          # header inputs
    b      <- tpl.body(txt)                     # template body
    elem   <- tpl.elem(b, use.body = TRUE)      # template elements
    e      <- new.env()                         # create evaluation environment
    i      <- list(...)                         # user inputs
    data.required <- isTRUE(as.logical(meta$dataRequired)) # is data required
    pkgs   <- meta$packages                                # required packages

    ## load required packages (if any)
    if (!is.null(pkgs))
        suppressMessages(lapply(pkgs, require, character.only = TRUE))

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
                              string    = , # string input
                              character = is.character,
                              complex   = is.complex,
                              factor    = is.factor,
                              boolean   = , # a length-one logical
                              logical   = is.logical,
                              number    = , # number input
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

    opts.bak <- options()                      # backup options
    report <- lapply(elem, elem.eval, env = e, check.output = !(as.logical(meta$strict) | (rapport.mode == 'performance')), rapport.mode = rapport.mode, graph.output = graph.output, width = graph.width, height = graph.height, res = graph.res, hi.res = graph.hi.res) # render template body
    options(opts.bak)                          # resetting options

    ## error handling in chunks
    report <- lapply(report, function(x){
        ## * shoot warning() and return '<ERROR>' inline
        if (x$type == 'block'){
            rerr <- x$robjects[[1]]$msg$errors
            if (!is.null(rerr)){
                if (rapport.mode == 'debug') {      ## halt in debug mode
                        cat(sprintf('Malformed command(s):\n%s', paste(x$robjects[[1]]$src, collapse='\n')), '\n')
                        stop(rerr, call. = FALSE)
                    }
                warning(rerr, call. = FALSE)
                x$robjects[[1]]$output <- '<ERROR>'
            }
        }
        return(x)
    })

    ## remove NULL/blank parts
    ind.nullblank <- sapply(report, function(x){
        if (x$type == 'block')
            ifelse(is.null(x$robjects[[1]]$output), FALSE, TRUE)
        else
            ifelse(x$text$eval == 'NULL', FALSE, TRUE)
    })
    report <- report[ind.nullblank]     # update template body contents

    ## tidy up (removing metadata, inputs from) nested templates
    report <- unlist(lapply(report, function(x){

        robj  <- x$robjects[[1]]
        rout  <- robj$output
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
                meta   = meta,
                inputs = inputs,
                report = report,
                call   = match.call(),
                time   = as.numeric(proc.time() - timer)[3]
                )

    if (isTRUE(reproducible)){
        res$data <- data
    }

    class(res) <- 'rapport'

    return (res)
}
