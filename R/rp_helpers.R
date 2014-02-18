#' Rapport Object
#'
#' Checks if provided R object is of \code{rapport} class.
#' @param x any R object to check
#' @return a logical value indicating whether provided object is a \code{rapport} object
#' @export
is.rapport <- function(x)  inherits(x, 'rapport')


#' Convert Metadata to Character
#'
#' Converts template metadata to character vector with YAML strings.
#' @param x template metadata object
#' @param ... ignored
#' @method as.character rapport.meta
#' @S3method as.character rapport.meta
as.character.rapport.meta <- function(x, ...){
    if (!inherits(x, 'rapport.meta'))
        stop("Template metadata not provided.")
    as.yaml(x)
}


#' Convert Inputs to Character
#'
#' Converts template inputs to character vector with YAML strings.
#' @param x template inputs object
#' @param ... ignored
#' @method as.character rapport.inputs
#' @S3method as.character rapport.inputs
as.character.rapport.inputs <- function(x, ...){
    if (!inherits(x, 'rapport.inputs'))
        stop("Template inputs not provided.")
    as.yaml(x)
}


#' Tag Values
#'
#' Returns report tag vales (usually regexes): either user-defined, or the default ones.
#'
#' Default parameters are read from \code{options}:
#'
#' \itemize{
#'     \item 'header.open',
#'     \item 'header.close',
#'     \item 'comment.open',
#'     \item 'comment.close'.
#' }
#' @param tag.type a character value with tag value name
#' @param preset a character value specifying which preset to return
#' @return either a list (default) or a character value with tag regexes
#' @examples \dontrun{
#' get.tags()        # same as 'get.tags("all")'
#' get.tags("header.open")
#' }
#' @export
get.tags <- function(tag.type = c('all', 'header.open', 'header.close', 'comment.open', 'comment.close'), preset = c('user', 'default')){

    t.type <- match.arg(tag.type)       # tag type
    t.preset <- match.arg(preset)       # preset (default/user)

    ## default tag list
    tag.default <- c(
        header.open   = '^<!--head$',
        header.close  = '^head-->$',
        comment.open  = '^<!--',
        comment.close = '-->'
        )
    tag.default.names <- names(tag.default) # names of default tags
    tag.current <- getOption('rapport.tags')     # currently set tags
    tag.current.names <- names(tag.current) # names of currently set tags

    ## check if tag list exists
    if (is.null(tag.current))
        stop('Tag list does not exist.')

    ## check tag list length
    if (length(tag.default) != length(tag.current))
        stop('Tag list incomplete.')

    if (!all(sort(tag.default.names) == sort(tag.current.names))){
        tgs <- paste(setdiff(tag.current.names, tag.default.names), collapse = ", ")
        stopf('Tag list malformed!\nproblematic tags: %s', tgs)
    }

    res <- switch(t.preset,
                  user = {
                      if (t.type == 'all')
                          tag.current
                      else
                          tag.current[t.type]
                  },
                  default = {
                      ## check if something is changed, and say what has changed!
                      tags.diff <- tag.current != tag.default
                      if (any(tags.diff)){
                          w <- paste(sprintf('`%s` set by user to:\t"%s"\t(default: "%s")\n', tag.current.names[tags.diff], tag.current[tags.diff], tag.default[tags.diff]), collapse = '')
                          warning(sprintf('Default tag values were changed!\n%s', w))
                      }
                      do.call(switch, c(EXPR = t.type, all = tag.default, tag.default))
                  },
                  stopf('Unknown preset option "%s"', t.preset)
                  )

    return (res)
}


##' Check template validity
##'
##' Throw error
##' @param txt character vector with template contents
##' @param open.tag opening tag regexp
##' @param close.tag closing tag regexp
##' @param ... additional params for tag matching (see \code{\link{grep}})
check.tpl <- function(txt, open.tag = get.tags('header.open'), close.tag = get.tags('header.close'), ...) {
    ## get header tag indices
    hopen.ind  <- grep(open.tag, txt, ...)[1]  # opening tag
    hclose.ind <- grep(close.tag, txt, ...)[1] # closing tag
    ## check header indices
    if (!isTRUE(hopen.ind == 1L))
        stop('Opening header tag not found in first line.')
    if (is.na(hclose.ind))
        stop('Closing header tag not found.')
    if (hclose.ind - hopen.ind <= 1)
        stop('Template header not found.')
    h <- txt[(hopen.ind + 1):(hclose.ind - 1)] # get header
    if (all(trim.space(h) == ''))
        stop('Template header is empty.')
    b <- txt[(hclose.ind + 1):length(txt)]
    if (hclose.ind == length(txt) || all(sapply(trim.space(b), function(x) x == '')))
        stop('What good is a template if it has no body? http://bit.ly/11E5BQM')
}


#' Package Templates
#'
#' Lists all templates bundled with current package build. By default, it will search for all \code{.rapport} files in current directory, path specified in \code{rapport.paths} option and package library path.
#' @param ... additional parameters for \code{\link{dir}} function
#' @return a character vector with template files
#' @export
#' @aliases rapport.ls tpl.list
rapport.ls <- function(...){
    mc <- match.call()
    if (is.null(mc$path))
        mc$path <- c('./', getOption('rapport.paths'), system.file('templates', package = 'rapport'))
    if (is.null(mc$pattern))
        mc$pattern <- '^.+\\.rapport$'
    mc[[1]] <- as.symbol('dir')
    eval(mc)
}
#' @export
tpl.list <- rapport.ls


#' Template Paths
#'
#' List all custom paths where rapport will look for templates.
#' @return a character vector with paths
#' @examples \dontrun{
#' rapport.path()
#' }
#' @export
#' @aliases rapport.path tpl.paths
rapport.path <- function()
    getOption('rapport.path')
#' @export
tpl.paths <- rapport.path


#' Reset Template Paths
#'
#' Resets to default (NULL) all custom paths where rapport will look for templates.
#' @examples \dontrun{
#' rapport.path.reset()
#' }
#' @export
#' @aliases rapport.path.reset tpl.paths.reset
rapport.path.reset <- function()
    options('rapport.path' = NULL)
#' @export
tpl.paths.reset <- rapport.path.reset


#' Add Template Path
#'
#' Adds a new element to custom paths' list where rapport will look for templates.
#' @param ... character vector of paths
#' @return TRUE on success (invisibly)
#' @examples \dontrun{
#' rapport.path.add('/tmp')
#' rapport.ls()
#' }
#' @export
#' @aliases rapport.path.add tpl.paths.add
rapport.path.add <- function(...) {
    paths <- as.character(substitute(list(...)))[-1L]
    if (!all(sapply(paths, is.character)))
        stop('Wrong arguments (not characters) supplied!')
    if (!all(file.exists(paths)))
        stop('Specified paths do not exists on filesystem!')
    options('rapport.path' = union(rapport.path(), paths))
    invisible(TRUE)
}
#' @export
tpl.paths.add <- rapport.path.add


#' Remove Template Path
#'
#' Removes an element from custom paths' list where rapport will look for templates.
#' @param ... character vector of paths
#' @return TRUE on success (invisibly)
#' @examples \dontrun{
#' rapport.path()
#' rapport.path.add('/tmp')
#' rapport.path()
#' rapport.path.remove('/tmp')
#' rapport.path()
#' }
#' @export
#' @aliases rapport.path.remove tpl.paths.remove
rapport.path.remove <- function(...) {
    paths <- as.character(substitute(list(...)))[-1L]
    if (!all(sapply(paths, is.character)))
        stop('Wrong arguments (not characters) supplied!')
    if (!all(paths %in% rapport.path()))
        warning('Specified paths were not added to custom paths list before!')
    options('rapport.path' = setdiff(rapport.path(), paths))
    invisible(TRUE)
}
#' @export
tpl.paths.remove <- rapport.path.remove
