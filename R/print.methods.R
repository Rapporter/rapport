#' Print Template Metadata
#'
#' Prints out the contents of template metadata in human-readable format.
#' @param x object of class \code{rp.meta}. See \code{\link{tpl.meta}} for details.
#' @param ... ignored
#' @method print rp.meta
#' @S3method print rp.meta
print.rp.meta <- function(x, ...){

    .x <- x                             # backup object
    mc <- match.call()
    ind <- c('title', 'author', 'email', 'desc', 'example')
    email <- if (is.null(x$email)) '' else sprintf(' (%s)', x$email) # show email if any
    exmpl <- if (is.null(x$example)) 'no examples found in template' else x$example # examples
    other.meta <- x[!names(x) %in% ind]

    fn <- function(x){
        titles <- names(x)
        content <- sapply(x, function(y) sprintf('%s', if (is.null(y) || length(y) == 0) 'NULL' else y))
        res <- c('\n', sprintf('%s:\t%s\n', titles, content))
    }

    catn(
         sprintf('\n`%s`\n\n', x$title),
         sprintf('by %s%s\n\n', x$author, email),
         sprintf('%s\n', x$desc),
         fn(other.meta),
         sprintf('\n %s', c('Examples:', exmpl))
         )

    catn()

    invisible(.x)
}


#' Print Template Inputs
#'
#' Prints out the contents of template inputs in human-readable format.
#' @param x object of class \code{rp.inputs}. See \code{\link{tpl.inputs}} for details.
#' @param ... ignored
#' @method print rp.inputs
#' @S3method print rp.inputs
print.rp.inputs <- function(x, ...){

    catn('\nInput parameters')

    if (length(x) == 0){
        catn('No inputs defined!')
    } else {
        sapply(x, function(x){

            ## is field mandatory?
            mand <- if (is.null(x$mandatory))
                ''
            else
                ifelse(x$mandatory, '  >>REQUIRED<<', '')

            cat(
                '\n',
                sprintf('`%s` (%s)%s\n', x$name, x$label, mand),
                sprintf(' %s\n', x$desc),
                sprintf('    - type:\t%s\n', x$type),
                sprintf('    - limits:\t%s\n',
                        if (diff(unlist(x$limit)) == 0){
                            sprintf('exactly %s variable%s', x$limit$min, ifelse(x$limit$min > 1, 's', ''))
                        } else {
                            sprintf('from %s, up to %s variables', x$limit$min, x$limit$max)
                        }),
                if (!is.null(x$default)){
                    def <- x$default
                    if (is.character(def))
                        def <- p(def, '"', copula = 'or')
                    sprintf('    - default value:\t%s\n', def)
                })
        })
        catn()
    }

    invisible(x)
}


#' Print Template Header
#'
#' Prints out the contents of template header (both metadata and inputs) in human-readable format, so you can get insight about the template requirements.
#' @param x object of class \code{rp.header}. See \code{\link{tpl.header}} for details.
#' @param ... ignored
#' @method print rp.info
#' @S3method print rp.info
print.rp.info <- function(x, ...){
    sapply(x, print)
}


#' Prints rapport
#'
#' Default print method for \code{rapport} class objects that shows evaluated report contents.
#' @param x any "rapport" class object
#' @param ... ignored
#' @examples \dontrun{
#' rapport('example', data = mtcars, var='hp')
#' }
#' @method print rapport
#' @S3method print rapport
print.rapport <- function(x, ...) {

    if (!is.rapport(x))
        stop('Wrong type of argument (!rapport) supplied!')

    images <- NULL

    ## print report body
    for (part in x$report){

        switch(part$type,
               'block' = {
                   if ('image' %in% part$robject$type)
                       images <- c(images, as.character(part$robject$result))
                   cat(part$robject$output, sep = '\n')
                   },
               'heading' = pandoc.header(part$text$eval, part$level),
               cat(part$text$eval)
               )

    }

    if (getOption('graph.replay')) {
        wd <- getwd(); setwd(getOption('rp.file.path'))
        cat('\n', rep('=', getOption('width')), sep='')
        cat('\n  Attached images:\n\n    Note: you may optionally resize images on the fly which new dimensions will be saved to disk.\n          Do not close graphics device before this happens (pressing ENTER) if you want to update your image files!\n')

        for (image in images) {

            img.ext <- tail(strsplit(image, "\\.")[[1]], 1)
            recorded.plot <- sub(sprintf('%s$', img.ext), 'recordplot', image)

            if (file.exists(recorded.plot)) {

                cat(sprintf('\n    * %s', image))
                redraw.recordedplot(recorded.plot)
                `/dev/null` <- readline('\n    Press ENTER to continue! ')

                if (length(dev.list()) > 0) {
                    device <- img.ext # this should be done outside of this check...

                    if (device == 'jpg')
                        device <- 'jpeg'
                    res <- ifelse(device %in% c('svg', 'pdf'), 1, evalsOptions('res'))
                    size <- dev.size()

                    dev.copy(get(device), width = size[1] * res, height = size[2] * res, image)
                    dev.off(); dev.off()
                }

            } else
                cat(sprintf('\n\t* %s: was not run with `graph.record` option set to `TRUE`', image))
        }
        setwd(wd)
    }
}
