#' Outlier test
#'
#' A simple test for outliers. This functions returns all extreme values (if any) found in the specified vector.
#'
#' @param x a numeric vector of values
#' @return vecotor of outlier values
#' @examples \dontrun{
#' rp.outlier(mtcars$hp)
#' rp.outlier(c(rep(1,100), 200))
#' rp.outlier(c(rep(1,100), 200,201))
#' }
#' @references {
#' Credit goes to PaulHurleyuk: \url{http://stackoverflow.com/a/1444548/564164}
#' Lund, R. E. 1975, "Tables for An Approximate Test for Outliers in Linear Models", Technometrics, vol. 17, no. 4, pp. 473-476.
#' Prescott, P. 1975, "An Approximate Test for Outliers in Linear Models", Technometrics, vol. 17, no. 1, pp. 129-132.
#' }
#' @export
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


#' Goodman and Kruskal's lambda
#'
#' Computes Goodman and Kruskal's lambda for given table.
#' @param table a \code{table} of two variables
#' @param direction numeric value of \code{c(0,1,2)} where 1 means the lambda value computed for row, 2 for columns and 0 for both
#' @return numeric
#' @export
lambda.test <- function(table, direction=0) {
    if (direction != 0) {
        return(as.numeric(sum(apply(table, direction, max)) - max(rowSums(table))) / (sum(table)-max(rowSums(table))))
    } else {
        return(list(row=lambda.test(table, 1), col=lambda.test(table, 2)))
    }
}


#' Hypothesis Tests
#'
#' This function uses \code{\link{htest.short}}, to extract statistic and p-value from \code{htest}-classed object. Main advantage of using \code{htest} is that it's vectorised, and can accept multiple methods.
#' @param x arguments to be passed to function specified in \code{test}
#' @param ... additional arguments for function specified in \code{test}
#' @param use.labels a logical value indicating whether variable labels should be placed in row names. If set to \code{FALSE}, output of \code{deparse(substitute(x))} will be used.
#' @param colnames a character string containing column names
#' @param rownames a character string containing row names
#' @return a \code{data.frame} with applied tests in rows, and their results (statistic and p-value) in columns
#' @examples \dontrun{
#' library(nortest)
#' htest(rnorm(100), shapiro.test)
#' htest(rnorm(100), lillie.test, ad.test, shapiro.test)
#' htest(mtcars, lillie.test)
#' htest(mtcars, lillie.test, ad.test, shapiro.test)
#' }
#' @export
htest <- function(x, ..., use.labels = TRUE, colnames = NULL, rownames = NULL){

    test <- list(...)
    test.len <- length(test)
    test.name <- sapply(substitute(list(...)), deparse)[-1]

    if (is.atomic(x) || is.formula(x)){
        if (test.len == 1){
            res <- htest.short(each(test[[1]])(x))
        } else {
            res <- sapply(each(test)(x), htest.short)
        }
        res <- data.frame(t(res))
        x.nms <- if (is.formula(x)) deparse(substitute(x)) else rp.label(x, use.labels)
        x.len <- 1
    } else {
        if (test.len == 1){
            res <- lapply(lapply(x, test[[1]]), htest.short)
        } else {
            res <- lapply(x, function(y) sapply(each(test)(y), htest.short))
        }
        res <- t(data.frame(res))
        x.nms <- rp.label(x, use.labels)
        x.len <- length(x)
    }

    if (is.null(colnames))
        colnames(res) <- c("H", "p")

    if (is.null(rownames)){
        if (nrow(res) == length(test.name))
            rn <- test.name
        else
            rn <- sprintf("%s(%s)", rep(test.name, x.len), rep(x.nms, each = test.len))
        rownames(res) <- rn
    }

    return(res)
}


#' Extract Values from \code{htest} Objects
#'
#' Extract value of statistic and its p-value from \code{htest} object.
#' @param x \code{htest}-class object
#' @return named numeric vector with the value of statistic and its p-value
#' @examples \dontrun{
#' e(shapiro.test(rnorm(100))
#' }
#' @export
htest.short <- function(x){
    stopifnot(inherits(x, 'htest'))
    c(x$statistic, p = x$p.value)
}
