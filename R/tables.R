##' @export
rp.desc <- function(ndep = NULL, dep, fun, data, na.rm = TRUE, margins = NULL, subset = TRUE, fill = NA, add.missing = TRUE, total.name = 'Total', ...) {

    m   <- melt.data.frame(data, id.vars = ndep, measure.vars = dep, na.rm = na.rm) # melt data
    fml <- sprintf('%s ~ variable', paste(ndep, collapse = ' + ')) # generate cast formula

    fun.subs <- sapply(substitute(fun), deparse)[-1]

    ## some names missing - a bitchy one
    ind <- names(fun.subs) == ""
    if (any(ind))
        names(fun.subs)[ind] <- fun.subs[ind]

    names(fun) <- names(fun.subs)

    res <- cast(m, fml, fun.aggregate = each(fun), margins = margins, subset = subset, fill = fill, add.missing = add.missing, value = guess.value(data))

    ## fix names with underscores
    nms.res <- names(res)
    if (length(res.ind <- grep('_', nms.res)))
        names(res)[res.ind] <- sapply(strsplit(nms.res[res.ind], '_'), function(x) sprintf('%s(%s)', x[2], x[1]))

    return(res)
}


##' @export
rp.freq <- function(f.vars, data, count = TRUE, pct = TRUE, cum.n = TRUE, cum.pct = TRUE, na.rm = TRUE, subset = TRUE, fill = NULL, add.missing = FALSE){

    m <- melt.data.frame(data, id.vars = f.vars, na.rm = na.rm)
    fml <- sprintf('%s ~ .', paste(f.vars, collapse = ' + '))
    suppressWarnings(cc <- cast(m, fml, length, subset = subset, fill = fill, add.missing = add.missing))
    colnames(cc) <- gsub('^\\(all\\)$', 'N', colnames(cc)) # fix colnames
    cc <- transform(cc, pct = N / sum(N) * 100)
    cc <- transform(cc, cum.n = cumsum(N), cum.pct = cumsum(pct))
    keep <- sapply(list(count = count, pct = pct, cum.n = cum.n, cum.pct = cum.pct), isTRUE)
    if (all(keep == FALSE))
        stop('no summary to show')
    keep <- c(rep(TRUE, length(f.vars)), keep)
    cc[keep]
}
