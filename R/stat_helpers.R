##' Outlier test
##'
##' A simple test for outliers. This functions returns all extreme values (if any) found in the specified vector.
##'
##' @param x a numeric vector of values
##' @return vecotor of outlier values
##' @examples \dontrun{
##' rp.outlier(mtcars$hp)
##' rp.outlier(c(rep(1,100), 200))
##' rp.outlier(c(rep(1,100), 200,201))
##' }
##' @references {
##' Credit goes to PaulHurleyuk: \url{http://stackoverflow.com/a/1444548/564164}
##' Lund, R. E. 1975, "Tables for An Approximate Test for Outliers in Linear Models", Technometrics, vol. 17, no. 4, pp. 473-476.
##' Prescott, P. 1975, "An Approximate Test for Outliers in Linear Models", Technometrics, vol. 17, no. 1, pp. 129-132.
##' }
##' @export
rp.outlier <- function(x) {
    if (!is.numeric(x)) stop('Wrong variable type (!numeric) provided.')

    lundcrit<-function(a, n, q) {
        ## Calculates a Critical value for Outlier Test according to Lund
        ## See Lund, R. E. 1975, "Tables for An Approximate Test for Outliers in Linear Models", Technometrics, vol. 17, no. 4, pp. 473-476.
        ## and Prescott, P. 1975, "An Approximate Test for Outliers in Linear Models", Technometrics, vol. 17, no. 1, pp. 129-132.
        ## a = alpha
        ## n = Number of data elements
        ## q = Number of independent Variables (including intercept)
        ## --------------------------------------------------------------
        ## Credit goes to PaulHurleyuk: \url{http://stackoverflow.com/a/1444548/564164}
        F<-qf(c(1-(a/n)),df1=1,df2=n-q-1,lower.tail=TRUE)
        crit<-((n-q)*F/(n-q-1+F))^0.5
        crit
    }

    model <- lm(x ~ 1)
    crit <- suppressWarnings(lundcrit(0.1, length(x), model$coefficients))
    if (!is.na(crit))
        return(x[which(abs(rstandard(model)) > crit)])
    else
        return()
}


##' Goodman and Kruskal's lambda
##'
##' Computes Goodman and Kruskal's lambda for given table.
##' @param table a \code{table} of two variables
##' @param direction numeric value of \code{c(0,1,2)} where 1 means the lambda value computed for row, 2 for columns and 0 for both
##' @return numeric
##' @export
lambda.test <- function(table, direction=0) {
    if (direction != 0) {
        return(as.numeric(sum(apply(table, direction, max)) - max(rowSums(table))) / (sum(table)-max(rowSums(table))))
    } else {
        return(list(row=lambda.test(table, 1), col=lambda.test(table, 2)))
    }
}


##' Hypothesis Tests
##'
##' This function extracts only the most important information from \code{htest} class objects - statistic and its p-value.
##' @param x arguments to be passed to function specified in \code{test}
##' @param test a function to be applied
##' @param ... additional arguments for function specified in \code{test}
##' @export
htest <- function(x, ...){

    e <- function(y){
        c(y$statistic, p = y$p.value)
    }

    test <- list(...)
    test.len <- length(test)

    if (is.atomic(x)){
        res <- each(test)(x)
        if (test.len == 1)
            e(res)
        else
            sapply(res, e)
    }

    if (is.recursive(x)){
        if (test.len == 1){
            sapply(x, test)
        } else {
            t(data.frame(lapply(x, function(y) sapply(each(test)(y), e))))
        }
    }
}


##' @export
e <- function(y){
    c(y$statistic, p = y$p.value)
}
