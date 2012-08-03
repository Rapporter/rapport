## functions for easy and themed plotting of data

#' Input cheks (internal)
#'
#' Internal function used by eg. \code{rp.histogram}.
#' @param x a variable
#' @param facet if facet set
#' @param subset if subset set
#' @param ... other parameters
#' @export
#' @keywords internal
rp.graph.check <- function(x, facet = NULL, subset = NULL, ...) {

        if (missing(x))
            stop('Variable was not specified.')

        if (!missing(facet) & !is.factor(facet))
            stop('Wrong variable type (!factor) given as facet.')

        if (!is.variable(x))
            stop('Wrong type of varible (!atomic) provided.')

}


## plot functions


#' Histogram
#'
#' This function is a wrapper around \code{\link{histogram}} which operates only on numeric vectors with optional facet.
#' @param x a numeric variable
#' @param facet an optional categorical variable to make facets by
#' @param data an optional data frame from which the variables should be taken
#' @param kernel.smooth add kernel density plot?
#' @param ... additional parameters to \code{\link{histogram}}
#' @export
#' @examples \dontrun{
#' rp.hist(ius2008$edu)
#' rp.hist(ius2008$edu, facet=ius2008$gender)
#' rp.hist(ius2008$edu, ius2008$dwell)
#' rp.hist(ius2008$edu, kernel.smooth=TRUE)
#' with(ius2008, rp.hist(edu, facet = gender))
#' rp.hist(edu, data = ius2008)
#' rp.hist(edu, gender, ius2008)
#' }
rp.hist <- function(x, facet = NULL, data = NULL, kernel.smooth = FALSE, ...) {

    mc <- match.call()

    if (!missing(data)) {

        if (missing(facet))
            rp.hist(x = eval(mc$x, data), ...)
        else
            rp.hist(x = eval(mc$x, data), facet = eval(mc$facet, data), ...)

    } else {

        rp.graph.check(x, ...)

        ##  getting xlab
        xlab <- rp.label(x)
        if (xlab=='x')
            xlab <- tail(as.character(substitute(x)), 1)

        ##  if facet set
        if (is.null(facet))
            text <- 'x'
        else
            text = '~x|facet'

        ## panel
        if (!kernel.smooth) {

            panel <- function(x, ...)
                panel.histogram(x, ...)

        } else {

            panel <- function(x, ...) {
                panel.histogram(x, ...)
                panel.densityplot(x, darg=list(na.rm=TRUE), ...)
            }

        }

        ##  plot
        histogram(x = eval(parse(text = text)), type = "density", panel = panel, ylab='', xlab=xlab, ...)

    }
}


#' Density plot
#'
#' This function is a wrapper around \code{\link{densityplot}} which operates only on numeric vectors with optional facet.
#' @param x a numeric variable
#' @param facet an optional categorical variable to make facets by
#' @param data an optional data frame from which the variables should be taken
#' @param ... additional parameters to \code{\link{densityplot}}
#' @export
#' @examples \dontrun{
#' rp.densityplot(ius2008$edu)
#' rp.densityplot(ius2008$edu, facet = ius2008$gender)
#' rp.densityplot(ius2008$edu, ius2008$dwell)
#' with(ius2008, rp.densityplot(edu, facet = gender))
#' rp.densityplot(edu, data = ius2008)
#' rp.densityplot(edu, gender, ius2008)
#' }
rp.densityplot <- function(x, facet=NULL, data=NULL, ...) {

    mc <- match.call()

    if (!missing(data)) {

        if (missing(facet))
            rp.densityplot(x = eval(mc$x, data), ...)
        else
            rp.densityplot(x = eval(mc$x, data), facet = eval(mc$facet, data), ...)

    } else {

        rp.graph.check(x, ...)

        ## getting xlab
        xlab <- rp.label(x)
        if (xlab == 'x')
            xlab <- tail(as.character(substitute(x)), 1)

        ## if facet set
        if (is.null(facet))
            text <- 'x'
        else
            text = '~x|facet'

        ## plot
        densityplot(x = eval(parse(text = text)), ylab = NULL, xlab = xlab, ...)

    }
}


#' Barplot
#'
#' This function is a wrapper around \code{\link{barchart}} which operates only on factors with optional facet.
#' @param x a numeric variable
#' @param facet an optional categorical variable to make facets by
#' @param data an optional data frame from which the variables should be taken
#' @param groups see \code{\link{xyplot}}
#' @param percent an option to show percentages (100% for a category) instead of number of cases. Handy with \code{groups=TRUE}. Default value: \code{FALSE} without groups, \code{TRUE} with groups.
#' @param horizontal see \code{\link{xyplot}}
#' @param ... additional parameters to \code{\link{barchart}}
#' @export
#' @examples \dontrun{
#' rp.barplot(ius2008$game)
#' rp.barplot(ius2008$game, horizontal = FALSE)
#' rp.barplot(ius2008$game, facet = ius2008$gender)
#' rp.barplot(ius2008$game, facet = ius2008$dwell, horizontal = FALSE, layout = c(1,3))
#' rp.barplot(ius2008$game, facet = ius2008$gender, groups = TRUE)
#' with(ius2008, rp.barplot(game, facet = gender))
#' rp.barplot(gender, data = ius2008)
#' rp.barplot(dwell, gender, ius2008)
#' }
rp.barplot <- function(x, facet=NULL, data=NULL, groups=FALSE, percent = FALSE, horizontal = TRUE, ...) {

    mc <- match.call()

    if (!missing(data)) {

        if (missing(facet))
            rp.barplot(x=eval(mc$x, data), groups = groups, percent = percent, ...)
        else
            rp.barplot(x=eval(mc$x, data), facet = eval(mc$facet, data), groups = groups, horizontal = horizontal, percent = percent, ...)

    } else {

        rp.graph.check(x, ...)

        ## grouping
        if (missing(percent) & (groups == TRUE))
            percent <- TRUE

        ## labs
        ylab <- rp.label(x)
        if (ylab == 'x')
            ylab <- tail(as.character(substitute(x)), 1)
        if (horizontal == FALSE) {
            xlab <- ylab
            ylab <- 'N'
        } else {
            xlab <- 'N'
        }

        ## facet
        if (!is.null(facet)) {
            x <- table(x, facet)
            if (percent == TRUE) {

                x <- x/rowSums(x)*100
                if (ylab == 'N') {
                    ylab <- '%'
                } else {
                    xlab <- '%'
                }

            }
        }

        ## plot
        if (horizontal)
            barchart(x, xlab = xlab, ylab = ylab, groups = groups, horizontal = horizontal, auto.key = groups, ...)
        else
            barchart(x, xlab = xlab, ylab = ylab, groups = groups, horizontal = horizontal, auto.key = groups, ...)
    }
}


#' Dotplot
#'
#' This function is a wrapper around \code{\link{dotplot}} which operates only on factors
#' with optional facet.
#' @param x a factor variable
#' @param facet an optional categorical variable to make facets by
#' @param data an optional data frame from which the variables should be taken
#' @param groups see \code{\link{xyplot}}
#' @param horizontal see \code{\link{xyplot}}
#' @param ... additional parameters to \code{\link{dotplot}}
#' @export
#' @examples \dontrun{
#' rp.dotplot(ius2008$game)
#' rp.dotplot(ius2008$game, horizontal = FALSE)
#' rp.dotplot(ius2008$game, facet = ius2008$dwell)
#' rp.dotplot(ius2008$dwell, facet = ius2008$gender, horizontal = FALSE)
#' rp.dotplot(ius2008$game, facet = ius2008$dwell, groups = TRUE)
#' with(ius2008, rp.dotplot(gender, facet = dwell))
#' rp.dotplot(game, data = ius2008)
#' rp.dotplot(dwell, gender, ius2008)
#' }
rp.dotplot <- function(x, facet = NULL, data = NULL, groups = FALSE, horizontal = TRUE, ...) {

    mc <- match.call()

    if (!missing(data)) {
        if (missing(facet))
            rp.dotplot(x = eval(mc$x, data), groups = groups, horizontal = horizontal, ...)
        else
            rp.dotplot(x = eval(mc$x, data), facet = eval(mc$facet, data), groups = groups, horizontal = horizontal, ...)

    } else {

        rp.graph.check(x, ...)

        ## labs
        xlab <- rp.label(x)
        if (xlab == 'x')
            xlab <- tail(as.character(substitute(x)), 1)
        if (horizontal == FALSE) {
            ylab <- xlab
            xlab <- 'N'
        } else {
            ylab <- 'N'
        }

        ## facet
        if (!is.null(facet))
            x <- table(x, facet)

        ## plot
        if (horizontal)
            dotplot(x, ylab = xlab, xlab = 'N', groups = groups, horizontal = horizontal, auto.key = groups, ...)
        else
            dotplot(x, ylab = xlab, xlab = 'N', groups = groups, horizontal = horizontal, auto.key = groups, ...)
    }
}


#' Scatterplot
#'
#' This function is a wrapper around \code{\link{xyplot}} which operates only on numeric variables  with optional facet.
#' @param x a numeric variable
#' @param y a numeric variable
#' @param facet an optional categorical variable to make facets by
#' @param data an optional data frame from which the variables should be taken
#' @param ... additional parameters to \code{\link{xyplot}}
#' @export
#' @examples \dontrun{
#' rp.scatterplot(ius2008$edu, ius2008$age)
#' rp.scatterplot(ius2008$edu, ius2008$age, facet=ius2008$gender)
#' with(ius2008, rp.scatterplot(edu, age, facet = gender))
#' rp.scatterplot(edu, age, data=ius2008)
#' rp.scatterplot(edu, age, gender, ius2008)
#' }
rp.scatterplot <- function(x, y, facet = NULL, data = NULL, ...) {

    mc <- match.call()

    if (!missing(data)) {
        if (missing(facet))
            rp.scatterplot(x = eval(mc$x, data), y = eval(mc$y, data), ...)
        else
            rp.scatterplot(x = eval(mc$x, data), y = eval(mc$y, data), facet=eval(mc$facet, data), ...)

    } else {

        rp.graph.check(x, ...)
        if (missing(y))
            stop('Variable was not specified.')
        if (!is.variable(y))
            stop('Wrong type of varible (!atomic) provided.')

        ## labs
        xlab <- rp.label(x)
        if (xlab == 'x')
            xlab <- tail(as.character(substitute(x)), 1)
        ylab <- rp.label(y)
        if (ylab == 'y')
            ylab <- tail(as.character(substitute(y)), 1)

        ## facet
        if (is.null(facet))
            text <- 'y~x'
        else
            text = 'y~x|facet'

        ## plot
        xyplot(eval(parse(text = text)), xlab = xlab, ylab = ylab, ...)

    }
}


#' Lineplot
#'
#' This function is a wrapper around \code{\link{xyplot}} with custom panel. Only numeric variables are accepted with optional facet.
#' @param x a numeric variable
#' @param y a numeric variable
#' @param facet an optional categorical variable to make facets by
#' @param groups an optional categorical grouping variable
#' @param data an optional data frame from which the variables should be taken
#' @param ... additional parameters to \code{\link{xyplot}}
#' @export
#' @examples \dontrun{
#' a <- aggregate(wt~gear, mtcars, mean)
#' rp.lineplot(a$gear, a$wt)
#' rp.lineplot(gear, wt, data=a)
#'
#' ## lame demo:
#' rp.lineplot(1:length(mtcars$hp), mtcars$hp, facet=mtcars$cyl)
#'
#' ## advanced usage
#' rp.lineplot(partner, age, data = rp.desc('age', 'partner', fn = 'mean', data=ius2008)) ## TODO: fix....
#' rp.lineplot(partner, age, gender, data = rp.desc('age', c('gender', 'partner'), fn = 'mean', data=ius2008))
#' rp.lineplot(partner, age, groups = gender, data=rp.desc('age', c('gender', 'partner'), fn = 'mean', data = ius2008))
#'
#' ## Did you noticed the nasty axis titles? Why not correct those? :)
#' df <- rp.desc('age', 'partner', fn = 'mean', data = ius2008)
#' lapply(names(df), function(x) rp.label(df[, x]) <<- x)   # nasty solution!
#' rp.lineplot(partner, age, data = df)
#' df <- rp.desc('age', c('gender', 'partner'), fn = 'mean', data = ius2008)
#' lapply(names(df), function(x) rp.label(df[, x]) <<- x)  # nasty solution!
#' rp.lineplot(partner, age, gender, data = df)
#' df <- rp.desc('age', c('gender', 'partner'), fn = 'mean', data = ius2008)
#' lapply(names(df), function(x) rp.label(df[, x]) <<- x)  # nasty solution!
#' rp.lineplot(partner, age, groups = gender, data = df)
#' }
rp.lineplot <- function(x, y, facet = NULL, data = NULL, groups = NULL, ...) {

    mc <- match.call()

    if (!missing(data)) {
        if (missing(facet)) {

            if (missing(groups))
                rp.lineplot(x = eval(mc$x, data), y = eval(mc$y, data), ...)
            else
                rp.lineplot(x = eval(mc$x, data), y = eval(mc$y, data), groups = eval(mc$groups, data), ...)

        } else {

            if (missing(groups))
                rp.lineplot(x = eval(mc$x, data), y = eval(mc$y, data), facet = eval(mc$facet, data), ...)
            else
                rp.lineplot(x = eval(mc$x, data), y = eval(mc$y, data), facet = eval(mc$facet, data), groups = eval(mc$groups, data), ...)

        }

    } else {

        rp.graph.check(x, ...)
        if (missing(y))
            stop('Variable was not specified.')
        if (!is.variable(y))
            stop('Wrong type of varible (!atomic) provided.')
        if (!missing(groups))
            if (!is.variable(groups))
                stop('Wrong type of varible (!atomic) provided.')

        ## labs
        xlab <- rp.label(x)
        if (xlab == 'x')
            xlab <- tail(as.character(substitute(x)), 1)
        ylab <- rp.label(y)
        if (ylab == 'y')
            ylab <- tail(as.character(substitute(y)), 1)

        ## facet
        if (is.null(facet))
            text <- 'y~x'
        else
            text = 'y~x|facet'

        ## plot
        if (missing(groups))
            xyplot(eval(parse(text = text)), type = "l", xlab = xlab, ylab = ylab, ...)
        else {
            xyplot(eval(parse(text = text)), groups = groups, type = "l", xlab = xlab, ylab = ylab, auto.key = groups, ...)
        }

    }
}


#' Boxplot
#'
#' This function is a wrapper around \code{\link{bwplot}} which operates only on numeric variables with optional facet.
#' @param x a factor variable
#' @param y a numeric variable
#' @param facet an optional categorical variable to make facets by
#' @param data an optional data frame from which the variables should be taken
#' @param ... additional parameters to \code{\link{bwplot}}
#' @export
#' @examples \dontrun{
#' rp.boxplot(ius2008$age)
#' rp.boxplot(ius2008$age, ius2008$gender)
#' rp.boxplot(ius2008$age, ius2008$dwell, facet = ius2008$gender)
#' with(ius2008, rp.scatterplot(age, dwell, facet = gender))
#' rp.boxplot(age, dwell, data = ius2008)
#' rp.boxplot(age, dwell, gender, ius2008)
#' }
rp.boxplot <- function(x, y = NULL, facet = NULL, data = NULL, ...) {

    mc <- match.call()

    if (!missing(data)) {

        if (missing(facet))
            rp.boxplot(x = eval(mc$x, data), y = eval(mc$y, data),  ...)
        else
            rp.boxplot(x = eval(mc$x, data), y = eval(mc$y, data), facet = eval(mc$facet, data), ...)

    } else {

        rp.graph.check(x, ...)

        ## getting labs
        xlab <- rp.label(x)
        if (xlab == 'x')
            xlab <- tail(as.character(substitute(x)), 1)
        if (!is.null(y))
            ylab <- rp.label(y)

        ## facet
        if (is.null(facet))
            text <- 'y~x'
        else
            text = 'y~x|facet'

        ## labs
        if (is.null(y)) {
            text <- 'x'
            ylab <- ''
        }
        if (ylab == 'y')
            ylab <- tail(as.character(substitute(y)), 1)

        ## plot
        bwplot(eval(parse(text=text)), xlab=xlab, ylab=ylab, ...)
    }
}


#' Q-Q plot with Theoretical Distribution
#'
#' This function is a wrapper around \code{\link{qqmath}} which operates only on a numeric variable with optional facet.
#' @param x a numeric variable
#' @param dist a theoretical distribution
#' @param facet an optional categorical variable to make facets by
#' @param data an optional data frame from which the variables should be taken
#' @param ... additional parameters to \code{\link{qqmath}}
#' @export
#' @examples \dontrun{
#' rp.qqplot(ius2008$age)
#' rp.qqplot(ius2008$age, qunif)
#' rp.qqplot(ius2008$age, qunif, facet = ius2008$gender)
#'
#' with(ius2008, rp.qqplot(age))
#' rp.qqplot(age, data = ius2008)
#' rp.qqplot(age, facet = gender, data = ius2008)
#' rp.qqplot(age, qunif, gender, ius2008)
#' rp.qqplot(ius2008$age, panel = function(x) {panel.qqmath(x); panel.qqmathline(x, distribution = qnorm)} )
#' }
rp.qqplot <- function(x, dist = qnorm, facet = NULL, data = NULL, ...) {

    mc <- match.call()

    if (!missing(data)) {
        ## FIX: dist returns "Distance Matrix Computation"
        if (missing(facet))
            rp.qqplot(x = eval(mc$x, data), dist = dist, ...)
        else
            rp.qqplot(x = eval(mc$x, data), dist = dist, facet = eval(mc$facet, data), ...)

    } else {

        rp.graph.check(x, ...)
        if (!existsFunction(deparse(substitute(dist))))
            stop('Invalid distribution function provided.')

        ## labs
        ylab <- rp.label(x)
        if (ylab=='x')
            ylab <- tail(as.character(substitute(x)), 1)

        ## ylab is defined by used function's title (like: "The Normal Distribution", "The Uniform Distribution")
        target <- gsub("^.+/library/(.+)/help.+$", "\\1", utils:::index.search(deparse(substitute(dist)), find.package()))
        doc.txt <- pkg_topic(target, deparse(substitute(dist)))
        dist.name <- doc.txt[[1]][[1]][1]

        ## facet
        if (is.null(facet))
            text <- 'x'
        else
            text = '~x|facet'

        ## plot
        qqmath(eval(parse(text = text)), distribution = dist, xlab = dist.name, ylab = ylab, ...)

    }
}
