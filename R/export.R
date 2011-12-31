##' Return pretty ascii form
##'
##' Some standard formatting is applied to the value which is returned as ascii object.
##' @param x R object
##' @return ascii
##' @examples \dontrun{
##' rp.prettyascii('Hallo, World?')
##' rp.prettyascii(22/7)
##' rp.prettyascii(matrix(runif(25), 5, 5))
##'	rp.prettyascii(lm(hp~wt, mtcars))
##'
##' }
##' @export
rp.prettyascii <- function(x) {
    if (is.numeric(x)) {
        class <- class(x); x <- rp.round(x);
        if (length(x) != 1)
            class(x) <- class
    }
    if (is.vector(x))
        return(paste(x, collapse=', '))
    else
        return(paste(capture.output(ascii(x)), collapse='\n'))
}

##' tpl.export.outputs
##'
##' List of all available output formats (from ascii package).
tpl.export.outputs <- function() setdiff(sort(unique(unlist(ascii:::asciiOpts(".outputs")))), "")
##' tpl.export.backends
##'
##' List of all available backend formats (from ascii package).
tpl.export.backends <- function() ascii:::asciiOpts(".backends")

##' Export rapport class
##'
##' This function exports rapport class objects to various formats based on ascii package.
##' Note that no error/warning messages will be shown!
##' By default this function tries to export the report to HTML with pandoc. Some default styles are applied. If you do not need those default settings, use your own \code{options}.
##' @param a an rapport class object
##' @param file filename (NULL returns a tempfile)
##' @param append FALSE (new report created) or an R object (class of "Report") to which the new report will be added
##' @param create should export really happen? It might be handy if you want to append several reports.
##' @param format format of the wanted report, see: \code{ascii:::asciiOpts(".outputs")}
##' @param backend backend for the format conversions, see: \code{scii:::asciiOpts(".backends")}
##' @param options command line options passed to backend
##' @examples \dontrun{
##'
##' ## eval some template
##' x <- rapport('univar-descriptive', data=mtcars, var="hp")
##'
##' ## try basic parameters
##' tpl.export(x)
##' tpl.export(x, file='demo')
##' tpl.export(x, file='demo', format='odt')
##'
##' ### append reports
##' # 1) Create a report object with the first report and do not export (optional)
##' report <- tpl.export(x, create=F)
##' # 2) Append some other reports without exporting (optional)
##' report <- tpl.export(x, create=F, append=report)
##' # 3) Export it!
##' tpl.export(append=report)
##' # 4) Export it to other formats too! (optional)
##' tpl.export(append=report, format='rst')
##'
##' ### Never do this as being dumb:
##' tpl.export()
##'
##' ### Adding own custom CSS to exported HTML
##' tpl.export(x, options=sprintf('-c %s', system.file('templates/css/default.css', package='rapport')))
##' ## For other formats check out backend specific documentation!
##' ## Eg. pandoc uses "--reference-odt" as styles reference for odt exports.
##'}
##' @export
tpl.export <- function(a=NULL, file=NULL, append=FALSE, create=TRUE, format='html', backend='pandoc', options=NULL) {

    ## dummy checks and config parameters set
    if (!(format %in% tpl.export.outputs()))
        stop('Invalid format specified. See: rapport.report.outputs()')
    if (!(backend %in% tpl.export.backends()))
        stop(paste("Wrong backend. Please choose: ", paste(tpl.export.backends(), collapse = ", "), ".", sep = ""))
    if (!(format %in% ascii:::asciiOpts(".outputs")[[backend]])) {
        backends <- lapply(ascii:::asciiOpts(".outputs"), function(x) format %in% x)
        backends <- names(backends[as.numeric(which(backends==TRUE))])
        warning(paste('Wrong backend provided, using instead:', backends[1], '\nAll compatible backends:', paste(backends, collapse=', ')))
        backend <- backends[1]
    }
    if (!is.logical(append)) {
        if (!(deparse(substitute(append)) %in% ls(envir = .GlobalEnv))) stop('Not existing object given as append parameter!')
        if (class(Report$new()) != 'Report') stop('Wrong class (!="Report") found in append parameter!')
        r <- append
    } else {
        if (append != 'FALSE') stop('Wrong append parameter!')
        if (is.null(a)) stop('There is no sense in exporting a blank report :)')
        r <- Report$new()
        r$title <- as.character(a$metadata['title'])
        r$author <- as.character(getOption('rp.user'))
        r$email <- as.character(getOption('rp.email'))
    }
    if (!is.logical(create)) stop('Wrong create (!=TRUE|FALSE) parameter!')
    r$backend <- backend
    r$format <- format

    ## a == NULL
    if (is.null(a)) return(r$create(file=file))

    ## header stuff
    r$addSection('Description', 2)
    r$add(paragraph(as.character(a$metadata['desc'])))

    ## body
    lapply(a$report, function(x) {
        if (x$type=='heading') r$addSection(x$text$eval, 2+x$level)
        if (x$type=='block')
            r$add(paragraph(ifelse(is.null(unlist(x$chunks$raw)),
                                   unlist(x$text$raw),
                                   unlist(x$text$eval))
                            )
                  )
        if (x$type=='chunk' & !is.null(x$robjects[[1]]$type)) {
            if (x$robjects[[1]]$type == 'error')
                r$add(paragraph(as.character(x$robjects[[1]]$msg$errors)))
            if (x$robjects[[1]]$type == 'image') r$addFig(file=x$robjects[[1]]$output)
            if (all(x$robjects[[1]]$type != c('image', 'error')))
                r$add(ascii(x$robjects[[1]]$output, digits = getOption('rp.decimal'), decimal.mark = getOption('rp.decimal.mark')))
            if (!is.null(x$robjects[[1]]$msg$warnings))
                r$add(paragraph(sprintf('**Warning** in "%s": "%s"', x$robjects[[1]]$src, as.character(x$robjects[[1]]$msg$warnings))
            ))
        }
    })

    ## create report or return the Report class
    if (create) {
        ## if pandoc is converting to HTML then apply default styles
        if (is.null(options) & format == 'html' & backend == 'pandoc') {
            if (!file.exists(sprintf('%s%s', tempdir(), '/rapport-header.html')))
                cat(gsub('"templates/', sprintf('"%s/templates/', system.file(package='rapport')), readLines(system.file('templates/html/header.html', package='rapport'))), sep='\n', file=sprintf('%s%s', tempdir(), '/rapport-header.html'))
            options <- sprintf('-H %s -A %s', sprintf('%s%s', tempdir(), '/rapport-header.html'), system.file('templates/html/footer.html', package='rapport'))
        }
        r$create(file=file, options=options)
    } else
        return(r)
}


##' Export rapport class (deprecated)
##'
##' This function points to \code{\link{tpl.export}}. Use that insted \code{rp.export}, as this function remained here only for backward compatibily of the package.
##' @param ... parameters passed to \code{\link{tpl.export}}
rp.export <- function(...) tpl.export(...)
