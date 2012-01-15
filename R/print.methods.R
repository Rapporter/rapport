#' Print Template Metadata
#'
#' Prints out the contents of template metadata in human-readable format.
#' @param x object of class \code{rp.meta}. See \code{\link{tpl.meta}} for details.
#' @param type a string with output format. Defaults to plain text output.
#' @method print rp.meta
#' @S3method print rp.meta
print.rp.meta <- function(x, type = c('text', 'pandoc')){

    ind <- c('title', 'author', 'email', 'desc', 'example')
    email <- if (is.null(x$email)) '' else sprintf(' (%s)', x$email) # show email if any
    exmpl <- if (is.null(x$example)) 'no examples found in template' else x$example # examples
    other.meta <- x[!names(x) %in% ind]

    fn <- function(x){
        titles <- names(x)
        content <- sapply(x, function(y) sprintf('%s', if (is.null(y)) 'NA' else y))
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
                    sprintf('by `@%s`\n\n', x$author, email),
                    sprintf('_%s_\n', x$desc),
                    fn(other.meta),
                    sprintf('\n %s', c('Examples:', exmpl))
                    )
           },
           stop('unknown metadata print type')
           )
    catn()

    invisible(x)
}


#' Print Template Inputs
#'
#' Prints out the contents of template inputs in human-readable format.
#' @param x object of class \code{rp.inputs}. See \code{\link{tpl.inputs}} for details.
#' @param type a string with output format. Defaults to plain text output.
#' @method print rp.inputs
#' @S3method print rp.inputs
print.rp.inputs <- function(x, type = c('text', 'pandoc')){

    switch(match.arg(type),
           text = {
               catn('\nInput parameters')

               if (length(x) == 0){
                   catn('no inputs required')
               } else {
                   sapply(x, function(x){

                       mand <- if (is.null(x$mandatory))
                           ''
                       else
                           ifelse(x$mandatory, ' - required!', '')

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
           },
           pandoc = {
               catn('\n# Input parameters\n')

               if (length(x) == 0){
                   catn('`no inputs required`')
               } else {
                   sapply(x, function(x){

                       mand <- if (is.null(x$mandatory))
                           ''
                       else
                           ifelse(x$mandatory, ' - **required!**', '')

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
                                def <- x$default
                                if (is.character(def))
                                    def <- p(def, '"', copula = 'or')
                                sprintf('    - _default value:_\t%s\n', def)
                            })
                   })
                   catn()
               }
           },
           stop('unknown input print type')
           )

    invisible(x)
}


#' Print Template Header
#'
#' Prints out the contents of template header (metadata and inputs) in human-readable format, so you can get insight about template requirements.
#' @param x object of class \code{rp.header}. See \code{\link{tpl.header}} for details.
#' @param type a string with output format. Defaults to plain text output.
#' @method print rp.info
#' @S3method print rp.info
print.rp.info <- function(x, type = c('text', 'pandoc')){

    tp <- match.arg(type)

    sapply(x, function(x){
        print(x, type = tp)
    })
}


#' Prints rapport
#'
#' Default print method for "rapport" class objects which show the report body.
#'
#' @param x any "rapport" class object
#' @param ... ignored
#' @examples \dontrun{
#' rapport('univar-descriptive', data=mtcars, var='hp')
#' print(rapport('univar-descriptive', data=mtcars, var='hp'))
#' }
#' @method print rapport
#' @S3method print rapport
print.rapport <- function(x, ...) {

    if (!is.rapport(x)) stop('Wrong type of argument (!rapport) supplied!')
    
    ## print report body
    for (part in x$report){
        robj  <- part$robjects[[1]]
        rout  <- robj$output
        rwarn <- robj$msg$warnings

        catn()
        switch(part$type,
               'block' = {
                   if (!is.null(rout)){
                       if (any(robj$type == 'image'))
                           cat(as.character(rout))
                       else
                           cat(rp.prettyascii(rout))
                   }

                   if (!is.null(rwarn))
                       cat('\n', rwarn)
               },
               'heading' = cat(capture.output(section(part$text$eval, part$level))),
               cat(rp.prettyascii(as.character(part$text$eval)))
               )
        catn()
    }
}
