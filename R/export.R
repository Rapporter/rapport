#' Export rapport object
#'
#' This function exports rapport class objects to various formats based on ascii package.
#'
#' By default this function tries to export the report to HTML with pandoc. Some default styles are applied. If you do not like those default settings, use your own \code{options}.
#'
#' Default parameters are read from \code{options}:
#'
#' \itemize{
#'     \item 'rp.portable.html',
#'     \item 'rp.date.format',
#'     \item 'tpl.user',
#'     \item 'tpl.email'.
#' }
#'
#' Please be sure to set \code{'tpl.user'} and \code{'tpl.email'} options with \code{options()} to get your name in the head of your generated reports!
#' @param rp a rapport class object or list of rapport class objects
#' @param file filename of the generated document. Inherited from rapport class if not set.
#' @param append FALSE (new report created) or an R object (class of "Report") to which the new report will be added
#' @param create should export really happen? It might be handy if you want to append several reports.
#' @param open open the exported document? Default set to TRUE.
#' @param date character string as the date field of the report. If not set, current time will be set.
#' @param desc add \code{Description} of the rapport class (template)? Default set to TRUE.
#' @param format format of the wanted report. See Pandoc's user manual for details. In short, choose something like: \code{html}, \code{pdf}, \code{odt} or \code{docx}.
#' @param options options passed to \code{Pandoc.convert}.
#' @param logo add rapport logo
#' @return filepath on \code{create = TRUE}, \code{Report} class otherwise
#' @references John MacFarlane (2012): _Pandoc User's Guide_. \url{http://johnmacfarlane.net/pandoc/README.html}
#' @examples \dontrun{
#'
#' ## eval some template
#' x <- rapport('descriptives-univar', data = mtcars, var="hp")
#'
#' ## try basic parameters
#' tpl.export(x)
#' tpl.export(x, file='demo')
#' tpl.export(x, file='demo', format='odt')
#'
#' ### append reports
#' # 1) Create a report object with the first report and do not export (optional)
#' report <- tpl.export(x, create=F)
#' # 2) Append some other reports without exporting (optional)
#' report <- tpl.export(x, create=F, append=report)
#' # 3) Export it!
#' tpl.export(append=report)
#' # 4) Export it to other formats too! (optional)
#' tpl.export(append=report, format='rst')
#'
#' ### exporting multiple reports at once
#' tpl.export(tpl.example('example', 'all'))
#' tpl.export(tpl.example('example', 'all'), format='odt')
#' tpl.export(list(rapport('univar-descriptive', data = mtcars, var="hp"),
#'     rapport('univar-descriptive', data = mtcars, var="mpg")))
#'
#' ### Never do this as being dumb:
#' tpl.export()
#'
#' ### Using other backends
#' ## asciidoc
#' tpl.export(tpl.example('example', 'all'), backend='asciidoc')
#' ## txt2tags
#' tpl.export(tpl.example('example', 'all'), backend='t2t')
#'
#' ### Adding own custom CSS to exported HTML
#' tpl.export(x, options=sprintf('-c %s', system.file('templates/css/default.css', package='rapport')))
#' ## For other formats check out backend specific documentation!
#' ## E.g. pandoc uses "--reference-odt" as styles reference for odt exports.
#'}
#' @export
#' @seealso \code{\link{rapport.html}} \code{\link{rapport.pdf}} \code{\link{rapport.odf}} \code{\link{rapport.docx}}
tpl.export <- function(rp = NULL, file, append = FALSE, create = TRUE, open = TRUE, date = format(Sys.time(), getOption('rp.date.format')), desc = TRUE, format = 'html', backend = 'pandoc', options = NULL, logo = TRUE, portable.html = TRUE) {

    if (missing(file))
        if (is.null(rp$file.name))
            file <- rp[[1]]$file.name
        else
            file <- rp$file.name
    if (length(file) != 1 & !is.character(file))
        stop('Wrong file name provided.')

    if (!is.logical(append)) {

        if (class(append) != 'Pandoc')
            stop('Wrong class (!="Report") found in append parameter.')

        r <- append

    } else {

        if (append != 'FALSE')
            stop('Wrong append parameter!')

        if (is.null(rp))
            stop('There is no sense in exporting a blank report :)')

        r <- Pandoc$new(author = as.character(getOption('tpl.user')), title = as.character(rp$meta['title']), date = date)

    }

    r$format <- format

    if (!is.logical(create))
        stop('Wrong create (!=TRUE|FALSE) parameter!')

    if (!is.logical(logo))
        stop('Wrong logo (!=TRUE|FALSE) parameter!')

    ## exporting multiple rapport classes at once
    if (class(rp) == 'list') {
        if (all(lapply(rp, class) == 'rapport')) {

            ## using the first rapport's filename
            file <- rp[[1]]$file.name
            r$title <- as.character(rp[[1]]$meta['title'])

            for (i in 1:length(rp)) {
                r <- tpl.export(rp[[i]], file = file, append = r, create = FALSE, open = FALSE, format = format)
            }

        } else

            stop('Wrong rp parameter!')

    }

    if (!is.null(rp))

        if(class(rp) == 'rapport') {

            r$proc.time <- r$proc.time + rp$time

            if (desc) {
                ## header
                r$add.paragraph(pandoc.header.return('Description', 2))
                r$add.paragraph(as.character(rp$meta['desc']))
            }

            ## body
            lapply(rp$report, function(x) {

                x.type <- x$type
                if (x.type=='heading')
                    r$add.paragraph(pandoc.header.return(x$text$eval, x$level + 1))
                if (x.type=='text')
                    r$add.paragraph(ifelse(is.null(unlist(x$chunks$raw)),
                        unlist(x$text$raw),
                        unlist(x$text$eval)))
                if (x.type=='block')
                    r$add.paragraph(pander.return(x$robject))

            })

        }

    ## create report or return the Report class
    if (create) {

        ## if Pandoc is converting to HTML then apply default `rapport` styles
        if (is.null(options) & format == 'html') {

            portable.dirs <- c('fonts', 'images', 'javascripts', 'stylesheets')
            for (portable.dir in portable.dirs)
                file.copy(system.file(sprintf('includes/%s', portable.dir), package='rapport'), dirname(file), recursive  = TRUE)
            options <- sprintf('-H "%s" -A "%s"', system.file('includes/html/header.html', package='rapport'), system.file('includes/html/footer.html', package='rapport'))

        }

        if (logo) {

            r$add.paragraph(sprintf('-------\nThis report was generated with [R](http://www.r-project.org/) (%s) and [rapport](http://rapport-package.info/) (%s) in %s sec on %s platform.', sprintf('%s.%s', R.version$major, R.version$minor), packageDescription("rapport")$Version, rp.round(r$proc.time), R.version$platform))
            r$add.paragraph(pandoc.image.return(system.file('includes/images/logo.png', package='rapport')))

        }

        file <- gsub('%d', '0', file, fixed = TRUE)
        if (grepl('%t', file)) {

            if (length(strsplit(sprintf('placeholder%splaceholder', file), '%t')[[1]]) > 2)
                stop('File name contains more then 1 "%t"!')
            file.dir <- sub("(.+)(\\/.+$)", "\\1", file)
            file <- sub('\\\\|/', '', sub(file.dir, '', file))
            rep <- strsplit(file, '%t')[[1]]
            file <- tempfile(pattern = rep[1], tmpdir = file.dir, fileext = ifelse(is.na(rep[2]), '', rep[2]))

        }
        if (.Platform$OS.type == 'windows') # short-name tweak on Windows
            file <- shortPathName(file)

        r$export(f = file, open = open, options = options, footer = FALSE)
        return(sprintf('%s.%s', file, format))

    } else
        return(r)
}


#' Rapport to HTML
#'
#' This is a simple wrapper around \code{\link{rapport}} and \code{\link{tpl.export}}. Basically it works like \code{\link{rapport}} but the returned class is exported at one go.
#' @param ... parameters passed directly to \code{\link{rapport}}
#' @export
rapport.html <- function(...)
    tpl.export(rapport(...))


#' Rapport to ODT
#'
#' This is a simple wrapper around \code{\link{rapport}} and \code{\link{tpl.export}}. Basically it works like \code{\link{rapport}} but the returned class is exported at one go.
#' @param ... parameters passed directly to \code{\link{rapport}}
#' @export
rapport.odt <- function(...)
    tpl.export(rapport(...), format='odt')


#' Rapport to PDF
#'
#' This is a simple wrapper around \code{\link{rapport}} and \code{\link{tpl.export}}. Basically it works like \code{\link{rapport}} but the returned class is exported at one go.
#' @param ... parameters passed directly to \code{\link{rapport}}
#' @export
rapport.pdf <- function(...)
    tpl.export(rapport(...), format='pdf')


#' Rapport to DOCX
#'
#' This is a simple wrapper around \code{\link{rapport}} and \code{\link{tpl.export}}. Basically it works like \code{\link{rapport}} but the returned class is exported at one go.
#' @param ... parameters passed directly to \code{\link{rapport}}
#' @export
rapport.docx <- function(...)
    tpl.export(rapport(...), format='docx')
