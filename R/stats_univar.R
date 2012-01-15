#' Descriptive Statistics
#'
#' This function operates only on vectors or their subsets, by calculating a descriptive statistic specified in \code{fn} argument. Yielded result is rounded to 3 decimal places by default (which can be changed by passing an integer to \code{decimals} argument).
#' @param x a numeric variable to be summarised
#' @param subset an expression that evaluates to logical vector (defaults to \code{NULL}, in which case the function specified in \code{fun} is applied on a vector)
#' @param fn a function or a function name to be applied on a variable or it's subset
#' @param na.rm a logical value indicating whether NA's should be removed (defaults to \code{TRUE})
#' @param ... additional arguments for function specified in \code{fn}
#' @return a numeric
#' @export
rp.univar <- function(x, subset = NULL, fn, na.rm = TRUE, ...){

    if (missing(x))
        stop('variable not specified')

    if (!(is.variable(x) & is.numeric(x)))
        stop('descriptives can be calculated only for numeric variables')

    ## subset the data
    if (!is.null(subset)){
        x.subset <- subset.default(x, subset)
        ## check if split was successful
        if (is.null(x.subset))
            warning('data subset error, using whole sample')
        else
            x <- x.subset
    }

    res <- do.call(fn, list(x, na.rm = na.rm, ...))

    if (length(res) > 1)
        warning("resulting statistic has more than one value (this shouldn't have happened!)")

    return(res)
}


#' Sample Size
#'
#' Returns sample size with \code{NA}s included. This is a wrapper around \code{\link{rp.univar}} function with \code{\link{length}} function passed in \code{fn} argument. However, it will not account for missing values regardless of the value of \code{na.rm} argument. In order to get a number of valid responses, use \code{\link{rp.valid}}.
#' @param ... arguments to be passed to \code{rp.univar} function
#' @return a numeric value specifying vector length
#' @export
rp.n <- function(...)
    rp.univar(..., fn = function(...) length(..1))


#' Valid Cases
#'
#' Returns a number of valid (non-\code{NA}) values in a variable. This is a wrapper around \code{\link{rp.univar}} function with \code{\link{length}} function passed in \code{fn} argument, but with missing values previously removed. However, it's not possible to cancel \code{NA} omission with this function(doing so will yield error) - use \code{\link{rp.n}} for those purposes.
#' @param ... parameters to be passed to \code{rp.univar} function
#' @return a numeric value with number of valid (non-NA) vector elements
#' @export
rp.valid <- function(...)
    rp.univar(..., fn = function(...) length(na.omit(..1)))


#' Missing Cases
#'
#' Returns a number of missing (\code{NA}) values in a variable. This is a wrapper around \code{\link{rp.univar}} function with anonymous function passed to count number of \code{NA} elements in a variable.
#' @param ... parameters to be passed to \code{rp.univar} function
#' @return a numeric value with number of missing vector elements
#' @export
rp.missing <- function(...)
    rp.univar(..., fn = function(...) sum(is.na(..1)))


#' Minimum
#'
#' Returns the minimum of all values in a vector by passing \{code{\link{min}} as \code{fn} argument to \code{\link{rp.univar}} function.
#' @param ... parameters to be passed to \code{rp.univar} function
#' @return a numeric value with minimum value
#' @export
rp.min <- function(...)
    rp.univar(..., fn = min)


#' Maximum
#'
#' Returns the maximum of all values in a vector by passing \{code{\link{max}} as \code{fn} argument to \code{\link{rp.univar}} function.
#' @param ... parameters to be passed to \code{rp.univar} function
#' @return a numeric value with maximum value
#' @export
rp.max <- function(...)
    rp.univar(..., fn = max)


#' Range
#'
#' Calculates difference between the largest and the smallest value in a vector. See \code{\link{rp.univar}} for details.
#' @param ... parameters to be passed to \code{rp.univar} function
#' @return a numeric value with calculated range
#' @export
rp.range <- function(...)
    rp.univar(..., fn = function(...) diff(range(..1, ...)))


#' Sum
#'
#' Returns the sum of variable's elements, by passing \code{\link{sum}} as \code{fn} argument to \code{\link{rp.univar}} function.
#' @param ... parameters to be passed to \code{rp.univar} function
#' @return a numeric value with sum of vector elements
#' @export
rp.sum <- function(...)
    rp.univar(..., fn = sum)


#' Mean
#'
#' Calculates mean of given variable by passing \code{\link{sum}} as \code{fn} argument to \code{\link{rp.univar}} function.
#' @param ... parameters to be passed to \code{rp.univar} function
#' @return a numeric value with variable's mean
#' @export
rp.mean <- function(...)
    rp.univar(..., fn = mean.default)


#' Standard Error of Mean
#'
#' Calculates standard error of mean for given variable. See \code{\link{rp.univar}} for details.
#' @param ... parameters to be passed to \code{rp.univar} function
#' @return a numeric value with standard error of mean
#' @export
rp.se.mean<- function(...)
    sqrt(rp.var(..., na.rm = TRUE) / rp.valid(...))


#' Standard Deviation
#'
#' Calculates standard deviation of given variable. See \code{\link{rp.univar}} for details.
#' @param ... parameters to be passed to \code{rp.univar} function
#' @return a numeric value with variable's standard deviation
#' @export
rp.sd <- function(...)
    rp.univar(..., fn = sd)


#' Variance
#'
#' Calculates variance of given variable. See \code{\link{rp.univar}} for details.
#' @param ... parameters to be passed to \code{rp.univar} function
#' @return a numeric value with variable's variance
#' @export
rp.var <- function(...)
    rp.univar(..., fn = var)


#' Median
#'
#' Calculates median of given variable. See \code{\link{rp.univar}} for details.
#' @param ... parameters to be passed to \code{rp.univar} function
#' @return a numeric value with variable's median
#' @export
rp.median <- function(...)
    rp.univar(..., fn = median.default)


#' Interquartile Range
#'
#' Calculates interquartile range of given variable. See \code{\link{rp.univar}} for details.
#' @param ... parameters to be passed to \code{rp.univar} function
#' @return a numeric value with variable's interquartile range
#' @export
rp.iqr <- function(...)
    rp.univar(..., fn = IQR)


#' Skewness
#'
#' Calculates skewness of given variable. See \code{\link{rp.univar}} for details.
#' @param ... parameters to be passed to \code{rp.univar} function
#' @return a numeric value with variable's skewness
#' @export
rp.skewness <- function(...)
    rp.univar(..., fn = skewness)


#' Kurtosis
#'
#' Calculates kurtosis of given variable. See \code{\link{rp.univar}} for details.
#' @param ... parameters to be passed to \code{rp.univar} function
#' @return a numeric value with variable's kurtosis
#' @export
rp.kurtosis <- function(...)
    rp.univar(..., fn = kurtosis)

