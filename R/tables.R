##' Descriptive Statistics
##'
##' Aggregate table of descriptives according to functions provided in \code{fn} argument. This function follows melt/cast approach used in \code{reshape} package. Variable names specified in \code{measure.vars} argument are treated as \code{measure.vars}, while the ones in \code{id.vars} are treated as \code{id.vars} (see \code{\link[reshape]{melt.data.frame}} for details). Other its formal arguments match with corresponding arguments for \code{\link[reshape]{cast}} function. Some post-processing is done after reshaping, in order to get pretty row and column labels.
##' @param id.vars a character vector with \code{id.vars}
##' @param measure.vars a character vector with \code{measure.vars}
##' @param fn a list with functions or a character vector with function names
##' @param data a \code{data.frame} holding variables specified in \code{id.vars} and \code{measure.vars}
##' @param na.rm a logical value indicating whether \code{NA} values should be removed
##' @param margins should margins be included? (see documentation for eponymous argument in \code{\link[reshape]{melt.data.frame}})
##' @param subset a logical vector to subset the data before aggregating
##' @param fill value to replace missing level combinations (see documentation for eponymous argument in \code{\link[reshape]{melt.data.frame}})
##' @param add.missing show missing level combinations
##' @param total.name a character string with name for "grand" margin (defaults to "Total")
##' @return a \code{data.frame} with aggregated data
##' @examples
##' rp.
##' rp.desc("cyl", "am", c(mean, sd), mtcars, margins = TRUE)
##' @export
rp.desc <- function(id.vars, measure.vars, fn, data, na.rm = TRUE, margins = NULL, subset = TRUE, fill = NA, add.missing = FALSE, total.name = 'Total') {

    m   <- melt.data.frame(data, id.vars = id.vars, measure.vars = measure.vars, na.rm = na.rm) # melt data
    if (is.null(id.vars))
        id.vars <- '.'
    fml <- sprintf('%s ~ variable', paste(id.vars, collapse = ' + ')) # generate cast formula

    if (!is.character(fn)){

        fn.subs <- sapply(substitute(fn), deparse)[-1] # get function names
        fn.nms <- names(fn)             # get names of function list
        fn.ind <- names(fn.subs) == ''  # get indices of non-named elems

        ## fun list has no named elements, use deparsed/substituted ones
        if (!length(fn.nms)){
            names(fn) <- fn.subs
        } else {
            ## some function names found...
            if (any(fn.ind)){
                ## ...some missing, replace them with deparsed/substituted ones
                names(fn.subs)[fn.ind] <- fn.subs[fn.ind]
                names(fn) <- names(fn.subs)
            } else {
                names(fn) <- fn.nms     # ...no missing elems, use names
            }
        }
    }

    res <- cast(m, fml, fun.aggregate = each(fn), margins = margins, subset = subset, fill = fill, add.missing = add.missing)

    nms.res <- names(res)               # column names

    ## if only one measure.var is specified, ommit its name from colnames
    if (length(measure.vars == 1)){
        names(res) <- gsub(sprintf('%s_', measure.vars), '', names(res))
    } else {
        ## fix names with underscores
        if (length(res.ind <- grep('_', nms.res)))
            names(res)[res.ind] <- sapply(strsplit(nms.res[res.ind], '_'), function(x) sprintf('%s(%s)', x[2], x[1]))

        ## remove (all) arrrgh...
        names(res) <- gsub('(all)', total.name, names(res), fixed = TRUE) # ...from colnames
        facs <- 1:length(id.vars)           # ...from factor levels
        res[facs] <- lapply(res[facs], function(y){
            levels(y) <- gsub('(all)', total.name, levels(y), fixed = TRUE)
            y
        })

        ## remove "value" as colname
        if (length(id.vars) == 1 && id.vars == '.')
            names(res)[1] <- gsub('value', '', names(res)[1])
    }

    class(res) <- c('rp.table', 'data.frame')

    return(res)
}


##' @export
rp.freq <- function(f.vars, data, count = TRUE, pct = TRUE, cum.n = TRUE, cum.pct = TRUE, na.rm = TRUE, subset = TRUE, fill = NA, add.missing = FALSE){

    m <- melt.data.frame(data, id.vars = f.vars, na.rm = na.rm)
    fml <- sprintf('%s ~ .', paste(f.vars, collapse = ' + '))
    suppressWarnings(cc <- cast(m, fml, length, subset = subset, fill = fill, add.missing = add.missing))
    colnames(cc) <- gsub('(all)', 'N', colnames(cc), fixed = TRUE) # remove nasty (all)
    cc <- transform(cc, pct = N / sum(N) * 100)
    cc <- transform(cc, cum.n = cumsum(N), cum.pct = cumsum(pct))
    keep <- sapply(list(count, pct, cum.n, cum.pct), isTRUE)
    if (all(keep == FALSE))
        stop('no summary to show')
    keep <- c(rep(TRUE, length(f.vars)), keep)
    res <- cc[keep]
    class(res) <- c('data.frame', 'rp.table')
    return(res)
}
