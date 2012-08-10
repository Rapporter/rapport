#' Outlier test
#'
#' A simple test for outliers. This functions returns all extreme values (if any) found in the specified vector.
#'
#' @param x a numeric vector of values
#' @return vector of outlier values
#' @examples \dontrun{
#' rp.outlier(mtcars$hp)
#' rp.outlier(c(rep(1,100), 200))
#' rp.outlier(c(rep(1,100), 200,201))
#' }
#' @references {
#' Credit goes to PaulHurleyuk: \url{http://stackoverflow.com/a/1444548/564164}
#'
#' \itemize{
#'  \item Lund, R. E. 1975, "Tables for An Approximate Test for Outliers in Linear Models", Technometrics, vol. 17, no. 4, pp. 473-476.
#'  \item Prescott, P. 1975, "An Approximate Test for Outliers in Linear Models", Technometrics, vol. 17, no. 1, pp. 129-132.
#' }
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
#' @return computed lambda value(s) for row/col of given table
#' @examples \dontrun{
#' lambda.test(table(mtcars$am, mtcars$gear))
#' lambda.test(table(mtcars$am, mtcars$gear), 1)
#' lambda.test(table(mtcars$am, mtcars$gear), 2)
#' x <- data.frame(x = c(5, 4, 3), y = c(9, 8, 7), z = c(7, 11, 22), zz = c(1, 15, 8))
#' lambda.test(x)   # 0.1 and 0.18333
#' }
#' @export
lambda.test <- function(table, direction = 0) {

    if (direction != 0)
        as.numeric(sum(apply(table, direction, max)) - ifelse(direction == 1, max(colSums(table)), max(rowSums(table)))) / (sum(table) - max(rowSums(table)))
    else
        list(row=lambda.test(table, 1), col=lambda.test(table, 2))

}


#' Skewness
#'
#' Calculates skewness coefficient for given variable (see \code{\link{is.variable}}), \code{matrix} or a \code{data.frame}.
#' @param x a \code{variable}, \code{matrix} or a \code{data.frame}
#' @param na.rm should \code{NA}s be removed before computation?
#' @references Tenjović, L. (2000). Statistika u psihologiji - priručnik. Centar za primenjenu psihologiju.
#' @examples
#' set.seed(0)
#' x <- rnorm(100)
#' skewness(x)
#' skewness(matrix(x, 10))
#' skewness(mtcars)
#' rm(x)
#' @export
skewness <- function(x, na.rm = FALSE){

    if (is.variable(x)){

        if (na.rm)
            x <- na.omit(x)

        m <- mean(x)
        s <- sd(x)
        n <- length(x)
        (sum((x - m) ^ 3) / n) / s ^ 3

    } else {

        if (is.matrix(x))
            apply(x, 2, skewness, na.rm = na.rm)
        else if (is.data.frame(x))
            sapply(x, skewness, na.rm = na.rm)
        else
            stop('unsupported type')
    }
}


#' Kurtosis
#'
#' Calculates kurtosis coefficient for given variable (see \code{\link{is.variable}}), \code{matrix} or a \code{data.frame}.
#' @param x a \code{variable}, \code{matrix} or a \code{data.frame}
#' @param na.rm should \code{NA}s be removed before computation?
#' @references Tenjović, L. (2000). Statistika u psihologiji - priručnik. Centar za primenjenu psihologiju.
#' @examples
#' set.seed(0)
#' x <- rnorm(100)
#' kurtosis(x)
#' kurtosis(matrix(x, 10))
#' kurtosis(mtcars)
#' rm(x)
#' @export
kurtosis <- function(x, na.rm = FALSE){

    if (is.variable(x)){

        if (na.rm)
            x <- na.omit(x)

        m <- mean(x)
        s <- sd(x)
        n <- length(x)
        (((sum((x - m) ^ 4) / n) / s ^ 4) - 3)
    } else {

        if (is.matrix(x))
            apply(x, 2, kurtosis, na.rm = na.rm)
        else if (is.data.frame(x))
            sapply(x, kurtosis, na.rm = na.rm)
        else
            stop('unsupported type')
    }
}


#' Hypothesis Tests
#'
#' This function uses \code{\link{htest.short}}, to extract statistic and p-value from \code{htest}-classed object. Main advantage of using \code{htest} is that it's vectorised, and can accept multiple methods.
#'
#' Default parameters are read from \code{options}:
#'
#' \itemize{
#'     \item 'rp.use.labels'.
#' }
#' @param x arguments to be passed to function specified in \code{test}
#' @param ... additional arguments for function specified in \code{test}
#' @param use.labels a logical value indicating whether variable labels should be placed in row names. If set to \code{FALSE}, output of \code{deparse(substitute(x))} will be used.
#' @param use.method.names use the string provided in \code{method} attribute of \code{htest} object
#' @param colnames a character string containing column names
#' @return a \code{data.frame} with applied tests in rows, and their results (statistic and p-value) in columns
#' @examples \dontrun{
#' library(nortest)
#' htest(rnorm(100), shapiro.test)
#' htest(rnorm(100), lillie.test, ad.test, shapiro.test)
#' htest(mtcars, lillie.test)
#' htest(mtcars, lillie.test, ad.test, shapiro.test)
#' }
#' @export
htest <- function(x, ..., use.labels = getOption('rp.use.labels'), use.method.names = TRUE, colnames = c('Method', 'Statistic', 'p-value')){

    test <- list(...)
    test.len <- length(test)
    test.name <- sapply(substitute(list(...)), deparse)[-1]

    if (is.atomic(x) || is.formula(x)){
        if (test.len == 1){
            res <- htest.short(each(test[[1]])(x))
            method.name <- attr(res, 'method')
        } else {
            res <- data.frame(lapply(each(test)(x), htest.short))
            method.name <- sapply(res, attr, which = 'method')
        }
        res <- data.frame(t(res))
        if (is.formula(x))
            x.nms <- deparse(substitute(x))
        else
            x.nms <- if (use.labels) rp.label(x) else rp.name(x)
        x.len <- 1
    } else {
        if (test.len == 1){
            res <- data.frame(lapply(lapply(x, test[[1]]), htest.short))
            method.name <- sapply(res, attr, which = 'method')
        } else {
            res <- lapply(x, function(y) lapply(each(test)(y), htest.short))
            method.name <- sapply(res[[1]], attr, which = "method")
        }
        res <- t(data.frame(res))
        x.nms <- if (use.labels) rp.label(x) else rp.name(x)
        x.len <- length(x)
    }

    if (use.method.names)
        test.name <- method.name

    if (nrow(res) == length(test.name))
        rn <- test.name
    else
        rn <- sprintf("%s (%s)", rep(test.name, x.len), rep(x.nms, each = test.len))

    names(rn) <- NULL
    rownames(res) <- NULL
    res <- cbind(rn, res)
    colnames(res) <- colnames

    return(res)
}


#' Extract Values from \code{htest} Objects
#'
#' Extract value of statistic and its p-value from \code{htest} object.
#' @param x \code{htest}-class object
#' @return named numeric vector with the value of statistic and its p-value
#' @examples \dontrun{
#' htest.short(shapiro.test(rnorm(100)))
#' }
#' @export
htest.short <- function(x){
    stopifnot(inherits(x, 'htest'))
    structure(c(x$statistic, p = x$p.value), method = x$method)
}
