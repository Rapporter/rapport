#' Export rapport object
#'
#' This function exports rapport class objects to various formats based on the \code{pander} package.
#'
#' By default this function tries to export the report to HTML with pandoc. Some default styles are applied. If you do not like those default settings, use your own \code{options} argument.
#'
#' Default parameters are read from global \code{options}:
#'
#' \itemize{
#'     \item 'rapport.user'
#' }
#'
#' Please be sure to set \code{'rapport.user'} option with \code{options()} to get your name in the head of your generated reports!
#' @param rp a rapport class object or list of rapport class objects
#' @param file filename of the generated document. Inherited from rapport class if not set. If \code{file} is set with path (not equal to \code{getwd()}), please set an absolute path for images (see: \code{evalsOptions()}).
#' @param append FALSE (new report created) or an R object (class of "Report") to which the new report will be added
#' @param create should export really happen? It might be handy if you want to append several reports.
#' @param open open the exported document? Default set to TRUE.
#' @param date character string as the date field of the report. If not set, current time will be set.
#' @param description add \code{Description} of the rapport class (template)? Default set to TRUE.
#' @param format format of the wanted report. See Pandoc's user manual for details. In short, choose something like: \code{html}, \code{pdf}, \code{odt} or \code{docx}.
#' @param options options passed to \code{Pandoc.convert}.
#' @param logo add rapport logo
#' @return filepath on \code{create = TRUE}, \code{Report} class otherwise
#' @references John MacFarlane (2012): _Pandoc User's Guide_. \url{http://johnmacfarlane.net/pandoc/README.html}
#' @examples \dontrun{
#'
#' ## eval some template
#' x <- rapport('Example', data = mtcars, var="hp")
#'
#' ## try basic parameters
#' rapport.export(x)
#' rapport.export(x, file = 'demo')
#' rapport.export(x, file = 'demo', format = 'odt')
#'
#' ### append reports
#' # 1) Create a report object with the first report and do not export (optional)
#' report <- rapport.export(x, create = F)
#' # 2) Append some other reports without exporting (optional)
#' report <- rapport.export(x, create = F, append = report)
#' # 3) Export it!
#' rapport.export(append=report)
#' # 4) Export it to other formats too! (optional)
#' rapport.export(append=report, format='rst')
#'
#' ### exporting multiple reports at once
#' rapport.export(rapport.example('Example', 'all'))
#' rapport.export(rapport.example('Example', 'all'), format = 'odt')
#' rapport.export(list(rapport('univar-descriptive', data = mtcars, var = "hp"),
#'     rapport('Descriptives', data = mtcars, var = "mpg")))
#'
#' ### Never do this as being dumb:
#' rapport.export()
#'
#' ### Adding own custom CSS to exported HTML
#' rapport.export(x, options =
#'     sprintf('-c %s', system.file('templates/css/default.css', package='rapport')))
#'}
#' @export
#' @aliases tpl.export rapport.export
#' @seealso \code{\link{rapport.html}} \code{\link{rapport.pdf}} \code{\link{rapport.odt}} \code{\link{rapport.docx}}
rapport.export <- function(rp = NULL, file, append = FALSE, create = TRUE, open = TRUE, date = pander_return(Sys.time()), description = TRUE, format = 'html', options = '', logo = TRUE) {

    if (missing(file)) {
        if (is.null(rp$file.name))
            file <- rp[[1]]$file.name
        else
            file <- rp$file.name
    }
    if (length(file) != 1 & !is.character(file)) {
        warning('Wrong file name provided, using a temporary file instead')
        file <- tempfile(tmpdir = dirname(evalsOptions('graph.dir')))
    }
    file <- gsub('%n', 0, file, fixed = TRUE)

    if (!is.logical(append)) {

        if (class(append) != 'Pandoc')
            stop('Wrong class (!="Report") found in append parameter.')

        r <- append

    } else {

        if (append != 'FALSE')
            stop('Wrong append parameter!')

        if (is.null(rp))
            stop('There is no sense in exporting a blank report :)')

        r <- Pandoc$new(author = as.character(getOption('rapport.user')), title = as.character(rp$meta['title']), date = date)

    }

    r$format <- format

    if (!is.logical(create))
        stop('Wrong create (!=TRUE|FALSE) parameter!')

    if (!is.logical(logo))
        stop('Wrong logo (!=TRUE|FALSE) parameter!')

    ## exporting multiple rapport classes at once
    if (class(rp) == 'list') {
        if (all(lapply(rp, class) == 'rapport')) {

            ## using the first rapport's title as global
            r$title <- as.character(rp[[1]]$meta['title'])

            for (i in 1:length(rp)) {
                r <- rapport.export(rp[[i]], file = file, append = r, create = FALSE, open = FALSE, format = format, description = description)
            }

        } else

            stop('Wrong rp parameter!')

    }

    if (!is.null(rp))

        if(class(rp) == 'rapport') {

            r$proc.time <- r$proc.time + rp$time

            if (description) {
                ## header
                r$add.paragraph(pandoc.header.return('Description', 2))
                r$add.paragraph(as.character(rp$meta['description']))
            }

            ## body
            lapply(rp$report, function(x) {

                x.type <- x$type
                if (x.type=='heading')
                    r$add.paragraph(pandoc.header.return(x$text$eval, x$level + 1 + description))
                if (x.type=='text')
                    r$add.paragraph(x$text$eval)
                if (x.type=='block')
                    r$add.paragraph(pander_return(x$robject))

            })

        }

    ## create report or return the Report class
    if (create) {

        ## if Pandoc is converting to HTML then apply default `rapport` styles
        if (options == '' & format == 'html') {

            portable.dirs <- c('fonts', 'images', 'javascripts', 'stylesheets')
            for (portable.dir in portable.dirs)
                file.copy(system.file(sprintf('includes/%s', portable.dir), package='rapport'), dirname(file), recursive  = TRUE)
            options <- sprintf('-H "%s" -A "%s"', system.file('includes/html/header.html', package='rapport'), system.file('includes/html/footer.html', package='rapport'))

        }

        if (logo) {

            ## removing logo and footer if added before
            logo.prior <- sapply(r$body, function(x) grepl('rapport/includes/images/logo.png', x))
            footer.prior <- sapply(r$body, function(x) grepl('-------\\nThis report was generated with \\[R\\]\\(http://www.r-project.org/\\) \\([0-9\\.]*\\) and \\[rapport\\]\\(http://rapport-package.info/\\) \\([0-9\\.]*\\) in [0-9\\.,\\*]* sec', x))
            prior <- which(logo.prior | footer.prior)
            if (length(prior) > 0)
                r$body[prior] <- NULL
            r$add.paragraph(sprintf('-------\nThis report was generated with [R](http://www.r-project.org/) (%s) and [rapport](http://rapport-package.info/) (%s) in %s sec on %s platform.', sprintf('%s.%s', R.version$major, R.version$minor), packageDescription("rapport")$Version, pander_return(r$proc.time), R.version$platform))
            if (!(.Platform$OS.type == 'windows' && format == 'pdf'))
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
            file <- utils::shortPathName(file)

        r$export(f = file, open = open, options = options, footer = FALSE)
        return(sprintf('%s.%s', file, format))

    } else
        return(r)
}


#' Rapport to HTML
#'
#' This is a simple wrapper around \code{\link{rapport}} and \code{\link{rapport.export}}. Basically it works like \code{\link{rapport}} but the returned class is exported at one go.
#' @param ... parameters passed directly to \code{\link{rapport}}
#' @seealso \code{\link{rapport.export}} \code{\link{rapport.pdf}} \code{\link{rapport.odt}} \code{\link{rapport.docx}}
#' @export
rapport.html <- function(...)
    rapport.export(rapport(...))


#' Rapport to ODT
#'
#' This is a simple wrapper around \code{\link{rapport}} and \code{\link{rapport.export}}. Basically it works like \code{\link{rapport}} but the returned class is exported at one go.
#' @param ... parameters passed directly to \code{\link{rapport}}
#' @seealso \code{\link{rapport.export}} \code{\link{rapport.html}} \code{\link{rapport.pdf}} \code{\link{rapport.docx}}
#' @export
rapport.odt <- function(...)
    rapport.export(rapport(...), format = 'odt')


#' Rapport to PDF
#'
#' This is a simple wrapper around \code{\link{rapport}} and \code{\link{rapport.export}}. Basically it works like \code{\link{rapport}} but the returned class is exported at one go.
#' @param ... parameters passed directly to \code{\link{rapport}}
#' @seealso \code{\link{rapport.export}} \code{\link{rapport.html}} \code{\link{rapport.odt}} \code{\link{rapport.docx}}
#' @export
rapport.pdf <- function(...)
    rapport.export(rapport(...), format = 'pdf')


#' Rapport to DOCX
#'
#' This is a simple wrapper around \code{\link{rapport}} and \code{\link{rapport.export}}. Basically it works like \code{\link{rapport}} but the returned class is exported at one go.
#' @param ... parameters passed directly to \code{\link{rapport}}
#' @seealso \code{\link{rapport.export}} \code{\link{rapport.html}} \code{\link{rapport.pdf}} \code{\link{rapport.odt}}
#' @export
rapport.docx <- function(...)
    rapport.export(rapport(...), format = 'docx')


############################
## Deprecated function names

#' @export
tpl.export <- rapport.export

