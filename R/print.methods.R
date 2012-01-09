##' Rapport
##'
##' Checks if provided R object is "rapport" class.
##' @param x any R object to check
##' @return logical
##' @export
is.rapport <- function(x)  inherits(x, 'rapport')


##' Print Template Metadata
##'
##' Prints out the contents of template metadata in human-readable format.
##' @param x object of class \code{rp.meta}. See \code{\link{tpl.meta}} for details.
##' @param type a string with output format. Defaults to plain text output.
##' @export
print.rp.meta <- function(x, type = c('text', 'pandoc')){

    ind <- c('title', 'author', 'email', 'desc', 'example')
    email <- ifelse(is.null(x$email), '', sprintf(' (%s)', x$email)) # show email if any
    exmpl <- ifelse(is.null(x$example), 'no examples found in template', x$example) # examples
    other.meta <- x[!names(x) %in% ind]
    fn <- function(x){
        titles <- names(x)
        content <- sapply(x, function(y) sprintf('%s', ifelse(is.null(y), 'NA', y)))
        res <- c('\n', sprintf('%s:\t%s\n', titles, content))
    }

    switch(match.arg(type),
           text = {
               catn(
                    sprintf('\n`%s`\n\n', x$title),
                    sprintf('by %s%s\n\n', x$author, email),
                    sprintf('%s\n', x$desc),
                    fn(other.meta),
                    sprintf('\n %s', c('Examples:', exmpl))
                    )
           },
           pandoc = {
               catn(
                    sprintf('\n# %s\n\n', x$title),
                    sprintf('by `@%s`\n\n', x$author, ifelse(is.null(x$email), '', sprintf(' (%s)', x$email))),
                    sprintf('_%s_\n', x$desc),
                    fn(other.meta),
                    sprintf('\n%s', c('Examples:', x$example))
                    )
           },
           stop('unknown metadata print type')
           )
}


##' Print Template Inputs
##'
##' Prints out the contents of template inputs in human-readable format.
##' @param x object of class \code{rp.inputs}. See \code{\link{tpl.inputs}} for details.
##' @param type a string with output format. Defaults to plain text output.
##' @export
print.rp.inputs <- function(x, type = c('text', 'pandoc')){

    switch(match.arg(type),
           text = {
               catn('\nInput parameters\n')

               if (length(x) == 0){
                   catn('no inputs required')
               } else {
                   lapply(x, function(x){

                       catn(
                            sprintf('`%s` (%s)\n', x$name, x$label),
                            sprintf('  %s\n', x$desc),
                            sprintf('    - type:\t%s\n', x$type),
                            sprintf('    - limits:\t%s\n',
                                    if (diff(unlist(x$limit)) == 0){
                                        sprintf('exactly %s variable%s', x$limit$min, ifelse(x$limit$min > 1, 's', ''))
                                    } else {
                                        sprintf('from %s, up to %s variables', x$limit$min, x$limit$max)
                                    }),
                            if (!is.null(x$default)){
                                sprintf('    - default value:\t%s', paste(x$default, collapse = ', '))
                            },
                            '\n'
                            )
                   })
               }
           },
           pandoc = {
               catn('\n# Input parameters\n')

               if (length(x) == 0){
                   catn('`no inputs required`')
               } else {
                   lapply(x, function(x){

                       catn(
                            sprintf('* **%s** (%s)\n', x$name, x$label),
                            sprintf('    _%s_\n', x$desc),
                            sprintf('    - _type:_\t%s\n', x$type),
                            sprintf('    - _limits:_\t%s\n',
                                    if (diff(unlist(x$limit)) == 0){
                                        sprintf('exactly %s variable%s', x$limit$min, ifelse(x$limit$min > 1, 's', ''))
                                    } else {
                                        sprintf('from %s, up to %s variables', x$limit$min, x$limit$max)
                                    }),
                            if (!is.null(x$default)){
                                sprintf('    - _default value:_\t%s', paste(x$default, collapse = ', '))
                            },
                            '\n'
                            )
                   })
               }
           },
           stop('unknown input print type')
           )
}


##' Print Template Header
##'
##' Prints out the contents of template header (metadata and inputs) in human-readable format, so you can get insight about template requirements.
##' @param x object of class \code{rp.header}. See \code{\link{tpl.header}} for details.
##' @param type a string with output format. Defaults to plain text output.
##' @export
print.rp.info <- function(x, type = c('text', 'pandoc')){

    tp <- match.arg(type)

    sapply(x, function(x){
        print(x, type = tp)
        invisible(x)
    })
}


##' Prints rapport
##'
##' Default print method for "rapport" class objects.
##'
##' @param x any "rapport" class object
##' @param metadata logical: print metadata?
##' @param inputs logical: print input parameters?
##' @param body logical: print body?
##' @examples \dontrun{
##' rapport('univar-descriptive', data=mtcars, var='hp')
##' print(rapport('univar-descriptive', data=mtcars, var='hp'), metadata=T)
##' print(rapport('univar-descriptive', data=mtcars, var='hp'), metadata=T, inputs=T)
##' print(rapport('example', data=mtcars, x='hp', y='mpg'), metadata=T, inputs=T)
##' print(rapport('example', data=mtcars, x='hp', y='mpg'), metadata=T, inputs=T, body=F)
##' }
##' @export
print.rapport <- function(x, metadata=FALSE, inputs=FALSE, body=TRUE) {

    if (!is.rapport(x)) stop('Wrong type of argument (!rapport) supplied!')
    ## (is this really necessary?)

    ## print metadata
    if (metadata) {
        header <- paste('\n    ', x$metadata$title, ' (by ', x$metadata$author, ')\n', sep='')
        cat(header)
        cat('    ', rep('=', nchar(header)-6), '\n', sep='')
        cat('   ', x$metadata$desc, '\n')
    }

    ## print vars and inputs (specified)
    if (inputs) {
        cat('\n    Supplied inputs\n    ', rep('=', 15), '\n', sep='')
        llply(x$inputs, function(x) {
            cat('     * `', x$name, '` is at least ',x$limit$min, ' but no more than ', x$limit$max, ' ', x$type, ' variable(s): ', x$desc, '\n', sep='')
        })
        cat('\n')
    }

    ## print report body
    if (body) {
        for (part in x$report) {
            cat('\n')
            switch(part$type,
                   'block' = {
                       ## if (part$robjects[[1]]$type == 'error')   ## error handling done in \code{rapport}
                       ##    cat(part$robjects[[1]]$msg$errors)     ##
                       if (!is.null(part$robjects[[1]]$output)) {
                           if (any(part$robjects[[1]]$type == 'image'))
                               cat(as.character(part$robjects[[1]]$output))
                           else
                               cat(rp.prettyascii(part$robjects[[1]]$output))
                       }
                       if (!is.null(part$robjects[[1]]$msg$warnings))  # warnings
                           cat('\n'); cat(part$robjects[[1]]$msg$warnings)
                   },
                   'heading' = cat(capture.output(section(part$text$eval, part$level))),
                   cat(rp.prettyascii(as.character(part$text$eval)))
                   )
            cat('\n')
        }
    }
}
