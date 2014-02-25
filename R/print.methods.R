#' Print Template Metadata
#'
#' Prints out the contents of template metadata in human-readable format.
#' @param x object of class \code{rapport.meta}. See \code{\link{rapport.meta}} for details.
#' @param ... ignored
#' @method print rapport.meta
#' @S3method print rapport.meta
print.rapport.meta <- function(x, ...){
    .x <- x                             # backup object
    ind <- c('title', 'author', 'email', 'description', 'example')
    email <- if (is.null(x$email)) '' else sprintf(' (%s)', x$email) # show email if any
    other.meta <- x[!names(x) %in% ind]

    fn <- function(x){
        titles <- names(x)
        content <- sapply(x, function(y) sprintf('%s', if (is.null(y) || length(y) == 0) 'NULL' else paste0(y, collapse = ", ")))
        res <- c('\n', sprintf('%s:\t%s\n', titles, content))
    }

    catn(
        sprintf('\n "%s"\n\n', x$title),
        sprintf('by %s%s\n\n', x$author, email),
        sprintf('%s\n', x$description),
        fn(other.meta),
        if (!is.null(x$example)) sprintf('\n %s', c('Examples:', x$example))
        )

    invisible(.x)
}


#' Print Template Inputs
#'
#' Prints out the contents of template inputs in human-readable format.
#' @param x object of class \code{rapport.inputs}. See \code{\link{rapport.inputs}} for details.
#' @param ... ignored
#' @method print rapport.inputs
#' @S3method print rapport.inputs
print.rapport.inputs <- function(x, ...){
    catn('\n Inputs\n')

    if (length(x) == 0) {
        catn(" Template contains no inputs. :-(\n")
    } else {
        sapply(x, function(x) {
            ## length
            input.item.txt <- ifelse(isTRUE(x$class == 'option'), 'option', ifelse(x$standalone, 'value', 'vector'))
            len <- x$length
            ## min == max
            if (len$min == len$max)
                len.txt <- sprintf('exactly %d %s%s', len$min, input.item.txt, ifelse(len$min > 1, 's', ''))
            else
                len.txt <- sprintf('from %s to %s %ss', len$min, len$max, input.item.txt)

            ## prepare response vector
            res <- c(
                sprintf(' "%s" (%s)%s\n', x$name, x$label, ifelse(x$required, '  *required', '')),
                sprintf('%s\n', x$description),
                sprintf('  - class:\t\t%s\n', x$class),
                sprintf('  - standalone:\t%s\n', ifelse(x$standalone, 'yes', 'no')),
                sprintf('  - length:\t\t%s\n', len.txt))
            if (isTRUE(x$matchable)) {
                res <- c(res,
                         paste0('  - matchable:\t\tTRUE', ifelse(x$allow_multiple, ' (multiple matches allowed)', ''), '\n'),
                         paste0('  - options:\t\t', p(x$options, wrap = '"'), '\n')
                         )
            }
            ## value
            if (x$standalone && !is.null(x$value)) {
                val.wrap <- ifelse(x$class %in% c('character', 'option'), '"', '')
                res <- c(res, sprintf('  - value%s:\t\t%s\n', ifelse(length(x$value) > 1, 's', ''), p(as.character(x$value), wrap = val.wrap)))
            }
            ## class specific options
            ## (only if class is specified)
            if (!is.null(x$class))
                switch(x$class,
                       character = {
                           ## nchar
                           if (!is.null(x$nchar)) {
                               chars <- x$nchar
                               if (len$min == len$max)
                                   nchar.txt <- sprintf('exactly %d character%s', chars$min, if (length(chars$min) > 1) 's' else '')
                               else
                                   nchar.txt <- sprintf('from %d to %d characters', chars$min, chars$max)
                               res <- c(res, sprintf('  - nchar:\t\t%s\n', nchar.txt))
                           }
                           ## regexp
                           if (!is.null(x$regexp))
                               res <- c(res, sprintf('  - regexp:\t\t"%s"\n', x$regexp))
                           ## ## matchable
                           ## res <- c(res, sprintf('  - matchable:\t\t%s\n', x$matchable))
                       },
                       ## nlevels
                       factor = {
                           if (!is.null(x$nlevels)) {
                               if (x$nlevels$min == x$nlevels$max)
                                   s <- sprintf('exactly %d level%s', x$nlevels$min, if (x$nlevels$min > 1) 's' else '')
                               else
                                   s <- sprintf('from %d to %d levels', x$nlevels$min, x$nlevels$max)
                               res <- c(res, sprintf('  - nlevels:\t\t%s\n', s))
                           }
                           ## ## matchable
                           ## res <- c(res, sprintf('  - matchable:\t\t%s\n', x$matchable))
                       },
                       ## limits
                       numeric = ,
                       integer = {
                           if (!is.null(x$limit))
                               res <- c(res, sprintf('  - limits:\t\t%s <= x <= %s\n', x$limit$min, x$limit$max))
                       })
            catn(res)
        })                              # end sapply
    }                                   # end if (length(x) == 0)
    invisible(x)
}


#' Print Template Header
#'
#' Prints out the contents of template header (both metadata and inputs) in human-readable format, so you can get insight about the template requirements.
#' @param x object of class \code{rp.header}. See \code{\link{rapport.header}} for details.
#' @param ... ignored
#' @method print rapport.info
#' @S3method print rapport.info
print.rapport.info <- function(x, ...){
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
                   if (length(part$robject$output) > 0)
                       cat(part$robject$output, sep = '\n')
               },
               'heading' = pandoc.header(part$text$eval, part$level),
               if (!grepl('^[\n]*$', part$text$eval)) cat( part$text$eval)
               )

    }

    if (getOption('rapport.graph.replay')) {
        wd <- getwd(); setwd(getOption('rapport.file.path'))
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
