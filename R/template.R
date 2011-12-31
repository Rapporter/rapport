##' Read Template
##'
##' Reads file either form a template name, file path or URL, and splits it into lines for easier handling.
##' @param fp a character vector containing template name (".tpl" extension is optional), file path or a text to be split by lines
##' @return a character vector with template contents
##' @export
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
            ## is it local file?
            if (!file.exists(fp))
                fp <- system.file('templates', ifelse(grepl('.+\\.tpl$', fp, ignore.case = TRUE), fp, sprintf('%s.tpl', fp)), package = 'rapport')
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


##' Template Header
##'
##' Returns template header contents from provided path or a character vector.
##' @param fp a string containing a path to template, or a character vector with template lines
##' @param open.tag a string with opening tag
##' @param close.tag a string with closing tag
##' @param ... additional arguments to be passed to \code{\link{grep}} function
##' @return a character vector with template header contents
##' @export
tpl.header <- function(fp, open.tag = get.tags('header.open'), close.tag = get.tags('header.close'), pretty = TRUE, ...){

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

    if (isTRUE(pretty)){
        m <- tpl.meta(hsection, use.header = TRUE)
        i <- tpl.inputs(hsection, use.header = TRUE)
        hsection <- structure(list(meta = m, inputs = i), class = 'rp.header')
    }

    return(hsection)
}


##' Template Body
##'
##' Returns template body contents from provided path or a character vector.
##' @param fp a string containing a path to template, or a character vector with template lines
##' @param htag a string with closing body tag
##' @param ... additional arguments to be passed to \code{\link{grep}} function
##' @return a character vector with template body contents
##' @export
tpl.body <- function(fp, htag = get.tags('header.close'), ...){

    txt   <- tpl.find(fp)
    h.end <- grep(htag, txt, ...)
    structure(txt[(h.end + 1):length(txt)], class = 'rp.body')
}


##' Header Metadata
##'
##' Returns metadata stored in template's header section, usually template title, nickname of an author, template description and list of required packages.
##' @param fp a character vector containing template name (".tpl" extension is optional), file path or character vector with template/header contents (depending on value of \code{use.header} argument)
##' @param fields a list of named lists containing key-value pairs that are to be passed to \code{\link{extract.meta}} function via \code{\link{do.call}}
##' @param use.header a logical value indicating if the character vector provided in \code{fp} argument contains header data
##' @param trim.white a logical value indicating if the extra spaces should removed from header fields before extraction
##' @return a list with template metadata
##' @export
tpl.meta <- function(fp, fields = NULL, use.header = FALSE, trim.white = TRUE){

    header <- tpl.find(fp)

    if (!isTRUE(use.header))
        header <- tpl.header(header, pretty = FALSE)

    if (isTRUE(trim.white))
        header <- trim.space(header, TRUE)

    if (is.null(fields))
        ## list of required tags
        fields <- list(
                       list(title = 'Title'         , regex = '[[:print:]]+'),
                       list(title = 'Author'        , regex = '[^[:digit:][:space:][:punct:]]+( [^[:digit:][:space:][:punct:]]+)*'),
                       list(title = 'Email'         , regex = '[[:alnum:]\\._%\\+-]+@[[:alnum:]\\.-]+\\.[[:alpha:]]{2,4}', mandatory = FALSE, short = 'email'),
                       list(title = 'Description'   , regex = '[[:print:]]+', short = 'desc'),
                       list(title = 'Packages'      , regex = '[[:alnum:]\\.]+((, ?[[:alnum:]+\\.]+)+)?', mandatory = FALSE),
                       list(title = 'Data required' , regex = 'TRUE|FALSE', mandatory = FALSE),
                       list(title = 'Example'       , regex = '.+', mandatory = FALSE)
                       )

    l <- sapply(fields, function(x){
        m <- grep(sprintf('^%s:[\t ]+(%s)$', x$title, x$regex), header)
        if (length(m) > 1)
            stop('duplicate metadata entries: ', paste(sprintf('"%s"', header[m]), collapse = ', '))
        x$x <- header[m]
        do.call(extract.meta, x)
    })

    structure(l, class = 'rp.meta')
}


##' Template Inputs
##'
##' Grabs variable definitions from template header.
##' @param fp a character vector containing template name (".tpl" extension is optional), file path or a text to be split by lines
##' @param use.header a logical value indicating wether the header section is provided in \code{h} argument
##' @return a list with variable info
##' @export
tpl.inputs <- function(fp, use.header = TRUE){

    header <- tpl.find(fp)

    if (!isTRUE(use.header))
        header <- tpl.header(header, pretty = FALSE)

    inputs.ind <- grep("^(.+\\|){3}.+$", header) # get input definition indices

    if (length(inputs.ind) == 0)
        return (structure(NULL, class = 'rp.inputs'))
    ## don't do issue the warning here
    ## warning('no input definitions found in header file')

    inputs.raw <- lapply(strsplit(header[inputs.ind], '|', fixed = TRUE), function(x) trim.space(x, TRUE)) # "raw" as in "unchecked", splitted by | and trimmed for whitespace

    if (!all(sapply(inputs.raw, length) == 4))
        stop('input definition error: missing fields')

    chk.fn <- function(x, nms){

        re.lbl <- '^[[:print:]][^\\|]+$' # variable text (for label & description)

        ## 1st: check variable name
        ## must begin with a letter, and can continue either with a letter or a digit, separated either by underscore or dot, e.g. 'var.90', or 'v90_alpha'.
        if (!check.name(x[1]))
            stop(sprintf('invalid input name: "%s"', x[1]))

        ## 2nd: check/get type
        var.type <- check.type(x[2])

        ## 3rd: check label
        if (!grepl(re.lbl, x[3]))
            stop(sprintf('invalid input label: "%s"', x[2]))

        ## 4th: check description
        if (!grepl(re.lbl, x[4]))
            stop(sprintf('invalid input description: "%s"', x[4]))

        c(name = x[1], label = x[3], var.type, desc = x[4])
    }

    inputs <- lapply(inputs.raw, chk.fn)
    structure(inputs, class = 'rp.inputs')
}


##' @export
elem.eval <- function(x, ...)  UseMethod('elem.eval')


##' @export
elem.eval.rp.chunk <- function(x, ...){

    list(
         type = 'chunk',
         robjects = evals(x, ...)
         )
}


##' @export
elem.eval.default <- function(x, tag.open = get.tags('inline.open'), tag.close = get.tags('inline.close'), remove.comments = TRUE, ...){

    stopifnot(is.string(x))

    if (!inherits(x, c('rp.heading', 'rp.block')))
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
            if (length(x$output) > 1)
                stop('output exceeds allowed length for an inline chunk (', x$src, ')')
            ## return info on errors, don't just bleed to death! (bug spotted & fixed by Gergely)
            err <- x$msg$errors
            if (!is.null(err))
                stop(err)
            if (!is.null(x$output))
                rp.prettyascii(x$output)    # get output
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
        res <- c(type = 'block', lst)   # this is block

    return (res)
}


##' Template Elements
##'
##' Returns a \code{data.frame} containing summary of relevant template elements: \code{ind} - indice of current element in template's body, \code{type} - a string indicating the type of the content ("heading", "block" or "chunk"), and \code{chunk} - a string containing R expression found in a code chunk.
##' @param fp a string containing a path to template, or a character vector with template lines
##' @param extract a string indicating which elements should be extracted from the template: headings, blocks, or code chunks (by default it returns all of the above)
##' @param use.body a logical value indicating whether the whole template should be used, or just its body
##' @param skip.blank.lines remove blank lines within R chunks
##' @param skip.r.comments remove comments withing R chunks
##' @param ... additional arguments to be passed to \code{\link{grep}} and \code{\link{get.tags}} functions
##' @return a \code{data.frame} with 3 columns:
##' @examples \dontrun{
##'     fp <- system.file("templates", "example.tpl", package = "rapport")
##'     tpl.elem(fp) # returns all elements (headings, blocks and chunks)
##'
##'     ## returns only code chunks
##'     tpl.elem(fp, extract = "chunk")
##' }
##' @export
tpl.elem <- function(fp, extract = c('all', 'heading', 'block', 'chunk'), use.body = FALSE, skip.blank.lines = TRUE, skip.r.comments = FALSE, ...){

    txt <- tpl.find(fp)
    ext <- match.arg(extract)

    ## "isTRUE" will evaluate some crazy inputs such as "letters" or even "mtcars" to FALSE
    ## is it smart? I guess not, but hey... it works! and it skips my notorious sanity checks!
    if (isTRUE(use.body))
        b <- txt
    else
        b <- tpl.body(txt)

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
                      block = lapply(block, structure, type = "block"),
                      chunk = lapply(chunk.lst, structure, type = "chunk")
                      ),
                  heading = lapply(h, structure, type = "heading"),
                  block = lapply(block, structure, type = "block"),
                  chunk = lapply(chunk.lst, structure, type = "chunk"),
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
               block = structure(paste(bx, collapse = '\n'), class = 'rp.block'),
               chunk = structure(list(bx), class = 'rp.chunk'),
               stop('unknown element class')
               )
    })
}


##' Evaluate Template
##'
##' Evaluates template file and returns a list with \code{rapport} class.
##' @param fp a string containing a template path or a character vector with template contents
##' @param data a \code{data.frame} that is to be used with given template
##' @param ... matches template variables in format 'key = "value"'
##' @return a list with \code{rapport} class.
##' @examples \dontrun{
##'     ## only a template name can be passed
##'     tpl.eval(name = "example")
##'
##'     ## or a path to the template
##'     tpl.eval(system.file("templates", "example.tpl", package = "rapport"))
##' }
##' @export
rapport <- function(fp, data = NULL, ...){

    txt    <- tpl.find(fp)                      # split file to text
    h      <- suppressMessages(tpl.header(txt)) # template header
    meta   <- h$meta                            # header metadata
    inputs <- h$inputs                          # header inputs
    b      <- tpl.body(txt)                     # template body
    elem   <- tpl.elem(b, use.body = TRUE)      # template elements
    e      <- new.env()                         # create evaluation environment
    i      <- list(...)                         # user inputs
    data.required <- isTRUE(as.logical(meta$dataRequired)) # is data required
    pkgs   <- meta$packages                                # required packages

    ## load required packages (if any)
    if (!is.null(pkgs)){
        packs <- lapply(strsplit(pkgs, ','), trim.space, leading = TRUE, trailing = TRUE)[[1]]
        suppressMessages(lapply(packs, require, character.only = TRUE))
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
        ## check if template input names match the provided input names
        input.names <- sapply(inputs, function(x) x$name) # inputs required by template
        input.nodef <- sapply(inputs, function(x) structure(is.null(x$default), .Names = x$name)) # TRUE stands for: has no default value (input required by the user)
        input.ok    <- input.names[input.nodef] %in% names(i)
        ## take default inputs in an account
        if (!all(input.ok))
            stop("you haven't provided all inputs required by the template!\n", 'missing inputs: ', paste(input.names[input.nodef], collapse = ', '))

        ## what if I only want to pass some vars? no data, just vars
        if(is.null(data))
            stop('"data" not provided, but is required')

        if (!inherits(data, c('data.frame', 'rp.data')))
            stop('"data" should be a data.frame object')

        data.names <- names(data)          # variable names
        assign('rp.data', data, envir = e) # load data to eval environment

        lapply(inputs, function(x){

            name          <- x$name                # input name
            var.names     <- i[[name]]             # variable names, d'uh! O_o
            var.len       <- length(var.names)     # number of variables
            limit         <- x$limit               # input limits
            input.type    <- x$type                # input type
            input.default <- x$default             # default value (if any)

            ## check limits
            if (var.len < limit$min & var.len > limit$max)
                stop('input length exceeds provided limits') # exceeds is not the most appropriate term for such functionality

            ## check type
            type.fn <- switch(input.type,
                              option    = , # CSV list of strings
                              character = is.character,
                              complex   = is.complex,
                              factor    = is.factor,
                              boolean   = , # a length-one logical
                              logical   = is.logical,
                              numeric   = is.numeric,
                              variable  = is.variable,
                              stop(sprintf('unknown type: "%s"', input.type))
                              )

            ## no default value (this is the common scenario)
            if (is.null(input.default)){
                ## see if ALL variable names exist in data
                if (!all(var.names %in% data.names))
                    stop(sprintf('provided data.frame does not contain column named "%s"', var.names))

                var.value <- e$rp.data[, var.names] # variable value

                ## check if types match
                if (!all(sapply(var.value, type.fn) == TRUE))
                    stop(sprintf('error in "%s": variable "%s" should be %s, but %s is provided', name, var.names, input.type, mode(var.value)))

                ## check labels and assign stuff to envir
                if (is.data.frame(var.value)) { # multiple variables (data.frame)
                    for (t in names(var.value)) {
                        if (rp.label(var.value[, t]) == 't')
                            var.value[, t] <- structure(var.value[, t], label = t, name = t)
                        else
                            var.value[, t] <- structure(var.value[, t], name = t)
                    }

                } else {                # one variable
                    if (rp.label(var.value) == 'var.value')
                        var.value <- structure(var.value, label = var.names, name = var.names)
                    else
                        var.value <- structure(var.value, name = var.names)
                }

            } else {
                ## default value present (either a logical or an option)
                ## the ones specified in the template should take precedance
                input.default <- ifelse(is.null(var.names), input.default, var.names)

                if (!do.call(type.fn, list(input.default)))
                    stop(sprintf('%s is not of %s type', var.names, input.type))

                ## character value (allow multi match?)
                if (is.character(input.default)){
                    var.value <- x$default[pmatch(input.default, x$default)]
                    if (is.na(var.value))
                        stop(sprintf('"%s" cannot be matched with "%s"', var.names, paste(input.default, collapse = ', ')))
                }

                ## logical value
                if (is.logical(input.default))
                    var.value <- input.default
            }

            assign(name, var.value, env = e)
        })
    }

    report <- lapply(elem, elem.eval, env = e)      # get report
    report <- report[sapply(report, function(x) {   # remove NULL/blank parts
        if (x$type=='chunk')
            ifelse(is.null(x$robjects[[1]]$output), FALSE, TRUE)
        else ifelse(x$text$eval == 'NULL', FALSE, TRUE)
    })]

    res <- list(
                metadata = meta,
                inputs = inputs,
                report = report
                )
    class(res) <- 'rapport'

    return (res)
}
