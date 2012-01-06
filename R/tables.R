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


##' Frequency Table
##'
##' Diplay frequency table
##' @param f.vars a character vector with variable names
##' @param data a \code{data.frame}
##' @param na.rm should missing values be removed?
##' @param include.na should missing values be included in frequency table?
##' @param drop.levels should unused levels be removed
##' @param count show frequencies?
##' @param pct show percentage?
##' @param cum.n show cumulative frequencies?
##' @param cum.pct
##' @return a \code{data.frame} with frequencies
##' @examples \dontrun{
##' rp.freq(c("am", "cyl", "vs"), mtcars)
##' }
##' @export
rp.freq <- function(f.vars, data, na.rm = TRUE, include.na = FALSE, drop.unused.levels = FALSE, count = TRUE, pct = TRUE, cum.n = TRUE, cum.pct = TRUE){

    ## TODO: subset

    exclude <- if (isTRUE(na.rm)) NA else NULL
    tbl <- melt(xtabs(fml('', f.vars), data = data, exclude = exclude, na.action = na.pass))
    names(tbl)[ncol(tbl)] <- 'N'        # rename frequency column
    nfac <- length(f.vars)              # number of factors

    if (drop.unused.levels)  tbl <- tbl[tbl$N != 0, ] # remove 0-count levels

    ## calculate freqs
    tbl <- transform(tbl, pct = N / sum(N) * 100) # add percentage
    tbl <- transform(tbl, cum.n = cumsum(N), cum.pct = cumsum(pct)) # add cumulatives

    ## NAs not removed
    if (na.rm == FALSE){
        if (include.na == FALSE){
            cc <- complete.cases(tbl)
            tbl <- tbl[cc, ]
        }
        ## TODO: add Valid/Missing
    }

    ## calculate total
    freqs <- colSums(tbl[c("N", "pct")])            # frequency totals
    cumuls <- tail(as.numeric(tbl[nrow(tbl), ]), 2) # cumulative totals
    total <- c(rep(NA, nfac), freqs, cumuls)        # grand total

    rownames(tbl) <- NULL               # reset row names
    tbl <- rbind(tbl, Total = total)    # update table contents

    ## summary stats
    keep <- sapply(list(count, pct, cum.n, cum.pct), isTRUE)
    if (all(keep == FALSE))  stop('no summary to show') # no summary selected
    keep <- c(rep(TRUE, length(f.vars)), keep)
    tbl <- tbl[keep]                    # choose desired stats

    class(tbl) <- c('data.frame', 'rp.table')
    return(tbl)
}
