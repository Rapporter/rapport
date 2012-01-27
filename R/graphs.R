## functions for easy and themed plotting of data

## Further rp.graphs under consideration:
#########################################
## TODO: pie chart
## TODO: error bar
## TODO: pareto
## TODO: polygon/area plot

## theme

#' Color palettes
#'
#' This function returns a given number of color codes from given palette from \code{\link{RColorBrewer}}. Besides those falling back to \code{'default'}: a color-blind-friendly palette from \url{http://jfly.iam.u-tokyo.ac.jp/color/}.
#' Default parameters are read from \code{options}:
#' 
#' \itemize{
#'     \item 'style.color.palette',
#'     \item 'style.colorize'.
#' }
#' @param num number of colors to return
#' @param palette a palette name from \code{\link{RColorBrewer}} or 'default'
#' @param colorize if set colors are chosen from palette at random order
#' @export
#' @examples {
#' rp.palette()
#' rp.palette(1)
#' rp.palette(1, colorize = TRUE)
#' rp.palette(5, 'Greens')
#' rp.palette(5, 'Greens', colorize = TRUE)
#' }
rp.palette <- function(num, palette=getOption('style.color.palette'), colorize=getOption('style.colorize')) {
    if (!(palette %in% c(row.names(brewer.pal.info), 'default')))
        stop('Wrong palette provided.')
    if (missing(num))
        num <- ifelse(palette == 'default', 8, brewer.pal.info[palette,'maxcolors'])
    if (any(!is.numeric(num), (length(num)>1))) stop('Wrong number of colors provided.')
    if (palette=='default') {
        if (num > 8) stop('Maximum number of colors (8) with choosen palette is lower then provided.')
        cols <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
	} else {
		if (num > brewer.pal.info[palette,'maxcolors']) stop(paste('Maximum number of colors (', brewer.pal.info[palette, "maxcolors"], ') with choosen palette is lower then provided (', num, ').', sep=''))
		## ugly hack to be able to return colors from palettes with higher minimum 'n' requirement
        if (num < 3) n <- 3
		cols <- brewer.pal(brewer.pal.info[palette,'maxcolors'], palette)
	}
	if (colorize == TRUE) cols <- sample(cols)
	return(cols[1:num])
}


#' Rapport theme
#' 
#' Custom minimalistic but colorful lattice/trellis theme used by default in rapport.
#' 
#' Default parameters are read from \code{options}:
#' 
#' \itemize{
#'     \item 'style.color.palette',
#'     \item 'style.colorize',
#'     \item 'style.font'.
#' }
#' @param bw generating black and white output?
#' @param palette color palette to use. See: \code{rp.palette} for details. 
#' @param colorize adding some random noise instead of using first available color(s) from palette
#' @param font specified font family
#' @return list of lattice parameters 
#' @export
#' @references Forked from \code{latticeExtra::ggplot2like()} and \code{lattice::standard.theme()}.
#' @examples \dontrun{
#' theme.rapport()
#' theme.rapport(palette='Greens')
#' theme.rapport(palette='Greens', colorize = FALSE)
#' }
theme.rapport <- function(bw = FALSE, palette = getOption('style.color.palette'), colorize = getOption('style.colorize'), font = getOption('style.font')) {
    # TODO: append ... parameters
    # TODO: add font
    color <- rp.palette(1, palette = palette, colorize = colorize)
    colors <- rp.palette(palette = palette, colorize = colorize)
    theme <- standard.theme(color = !bw)
    theme <- modifyList(theme, list(
        add.text = list(cex = 0.8),
        axis.line = list(col = "transparent"), 
        axis.text = list(cex = 0.8, lineheight = 0.9, col = "grey50"), 
        background = list(col = "white"),
        box.dot = list(col = "grey20", pch = "|"),
        box.rectangle = list(fill = color, col = "transparent", alpha=0.9, lwd=2),
        box.umbrella = list(col = color, lty = 1),
        dot.line = list(col = "white"),
        dot.symbol = list(col = "black", pch = 19),
        panel.background = list(col = "white"),
        plot.line = list(col = color, lwd = 2),
        plot.polygon = list(col = color, alpha = 0.9, border = "white", lwd = 2),
        plot.symbol = list(fill = color, col="transparent", pch = 21, cex = 0.8),
        reference.line = list(col = "grey50", lty = "dashed"), 
        strip.background = list(col = c("grey80", "grey70", "grey60")), 
        strip.border = list(col = "transparent"),
        strip.shingle = list(col = c("grey60", "grey50", "grey40")), 
        superpose.polygon = list(col = colors, border = "white", alpha = 0.9, lwd = 2),
        superpose.symbol = list(col = colors, pch = 19, cex = 0.6)
            ))
    if (bw) {
        colors <- c("#000000", "#999999", "#4C4C4C", "#E6E6E6", 
            "#F2F2F2", "#B2B2B2", "#000000", "#030303", "#050505", 
            "#080808", "#0A0A0A", "#0D0D0D", "#0F0F0F", "#121212", 
            "#151515", "#AAAAAA", "transparent")
        theme$box.rectangle$col =  colors[1]    
        theme$box.rectangle$fill =  colors[5]
        theme$box.umbrella$col =  colors[1]
        theme$dot.line$col =  colors[4]
        theme$dot.symbol$col =  colors[1]
        theme$plot.line$col =  colors[1]
        theme$plot.polygon$col = colors[5]
        theme$plot.symbol$col =  colors[1]
        theme$plot.symbol$fill =  colors[5]
        theme$regions$col = grey(seq(0.3^2.2, 0.9^2.2, length.out = 100)^(1/2.2))
        theme$shade.colors$palette=function(irr, ref, height, w = 0.5) grey(w * irr + (1 - w) * (1 - (1 - ref)^0.4))
        theme$strip.background$col =  colors[rep(5, 7)]
        theme$strip.shingle$col =  colors[rep(6, 7)]
        theme$superpose.line$col =  colors[rep(1, 7)]
        theme$superpose.line$lty = 1:7
        theme$superpose.polygon$col =  grey((c(6, 12, 7, 11, 8, 10, 9)/15)^0.8)
        theme$superpose.symbol$cex = rep(0.7, 7)
        theme$superpose.symbol$col = colors[rep(1, 7)]
        theme$superpose.symbol$pch = c(1, 3, 6, 0, 5, 16, 17)
    }
    modifyList(theme, simpleTheme())
}


#' Decorating lattice plots
#' 
#' Apply required theme and grid options to called lattice/trellis plot.
#' 
#' Default parameters are read from \code{options}:
#' 
#' \itemize{
#'     \item 'style.theme',
#'     \item 'style.grid'.
#' }
#' @param expr call to lattice which will be evaluated with added theme options
#' @param theme name of theme to use. Besides \code{\link{'theme.rapport'}} there are several themes available in other packages too, eg. \code{standard.theme()} from lattice, \code{gplot2like()} and \code{theEconomist.theme()} from latticeExtra and \code{custom.theme.black()} from latticist package. Of course custom theme might be provided also, check out \code{?custom.theme} from latticeExtra package or head directly to: \code{?trellis.par.get()}
#' @param grid show grid in the background? It is possible to render a grid for \code{'both'}, only for \code{'x'} or solely to \code{'y'} axis. \code{'none'} results in a blank background.
#' @return lattice/trellis object
#' @export
#' @examples \dontrun{
#' decorate.lattice(histogram(mtcars$hp))
#' decorate.lattice(histogram(mtcars$hp), grid='y')
#' decorate.lattice(histogram(mtcars$hp), grid='both')
#' decorate.lattice(histogram(mtcars$hp), theme="theme.rapport(bw = TRUE)")
#' decorate.lattice(histogram(mtcars$hp, type = "density", panel = function(x, ...) {
#'   panel.histogram(x, ...)
#'   panel.densityplot(x, darg=list(na.rm=TRUE), ...)
#' }))
#' decorate.lattice(bwplot(decrease ~ treatment, OrchardSprays, groups = rowpos), grid='none')
#' decorate.lattice(bwplot(decrease ~ treatment, OrchardSprays, groups = rowpos), grid='y')
#' decorate.lattice(bwplot(voice.part ~ height, data = singer), grid='x')
#' decorate.lattice(bwplot(voice.part ~ height, data = singer), grid='x', theme="theme.rapport(bw = TRUE)")
#' decorate.lattice(barchart(VADeaths))
#' decorate.lattice(barchart(VADeaths), theme="theme.rapport(palette='Greens')", grid='x')
#' decorate.lattice(barchart(VADeaths), theme="theme.rapport(bw = TRUE)", grid='x')
#' }
decorate.lattice <- function(expr, theme = getOption('style.theme'), grid = getOption('style.grid')) {
    switch(grid,
            'x' = grid <- 'grid.x',
            'y' = grid <- 'grid.y',
            'both' = grid <- 'axis.grid',
            grid <- NULL)
    if (is.null(grid)) {
        extra.parameters <- sprintf(', par.settings = %s)', theme)
    } else {
        extra.parameters <- sprintf(', par.settings = %s, axis = %s)', theme, grid)
    }
    eval(parse(text=sub(')$', extra.parameters, deparse(substitute(expr)))))
}


#' Add grid to x axis
#' @param side 
#' @param ... 
#' @param ticks 
#' @param scales 
#' @param components 
#' @param line.col 
#' @references Forked from \code{latticeExtra::axis.grid()}.
#' @keywords internal
grid.x <- function (side = c("top", "bottom", "left", "right"), ..., ticks = c("default", "yes", "no"), scales, components, line.col) {
    side <- match.arg(side)
    ticks <- match.arg(ticks)
    scales.tck <- switch(side, left = , bottom = scales$tck[1], 
            right = , top = scales$tck[2])
    comps.major <- components
    mycomps <- components[[side]]
    if (is.list(mycomps)) {
        lab <- as.character(mycomps$labels$labels)
        if (any(lab != "")) {
            tck <- mycomps$ticks$tck
            if (any(tck * scales.tck != 0)) {
                tck <- rep(tck, length = length(lab))
                comps.major[[side]]$ticks$tck <- ifelse(lab == 
                                "", NA, tck)
            }
        }
    }
    else {
        ticks <- "no"
    }
    axis.text <- trellis.par.get("axis.text")
    axis.default(side, scales = scales, ticks = ticks, components = comps.major, 
            ..., line.col = axis.text$col)
    if (side %in% c("top", "left")) 
        return()
    if (scales$draw == FALSE) 
        return()
    ref.line <- trellis.par.get("reference.line")
    if (side == "bottom") {
        tck <- abs(mycomps$ticks$tck)
        panel.refline(v = mycomps$ticks$at, lwd = ref.line$lwd * 
                        tck, alpha = ref.line$alpha * tck/max(tck, na.rm = TRUE))
    }
}


#' Add grid to y axis
#' @param side 
#' @param ... 
#' @param ticks 
#' @param scales 
#' @param components 
#' @param line.col 
#' @references Forked from \code{latticeExtra::axis.grid()}.
#' @keywords internal
grid.y <- function (side = c("top", "bottom", "left", "right"), ..., ticks = c("default", "yes", "no"), scales, components, line.col) {
    side <- match.arg(side)
    ticks <- match.arg(ticks)
    scales.tck <- switch(side, left = , bottom = scales$tck[1], 
            right = , top = scales$tck[2])
    comps.major <- components
    mycomps <- components[[side]]
    if (is.list(mycomps)) {
        lab <- as.character(mycomps$labels$labels)
        if (any(lab != "")) {
            tck <- mycomps$ticks$tck
            if (any(tck * scales.tck != 0)) {
                tck <- rep(tck, length = length(lab))
                comps.major[[side]]$ticks$tck <- ifelse(lab == 
                                "", NA, tck)
            }
        }
    }
    else {
        ticks <- "no"
    }
    axis.text <- trellis.par.get("axis.text")
    axis.default(side, scales = scales, ticks = ticks, components = comps.major, 
            ..., line.col = axis.text$col)
    if (side %in% c("top", "left")) 
        return()
    if (scales$draw == FALSE) 
        return()
    ref.line <- trellis.par.get("reference.line")
    if (side == "right") {
        if (!is.list(mycomps)) 
            mycomps <- components[["left"]]
        tck <- abs(mycomps$ticks$tck)
        panel.refline(h = mycomps$ticks$at, lwd = ref.line$lwd * 
                        tck, alpha = ref.line$alpha * tck/max(tck, na.rm = TRUE))
    }
}


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
	if (missing(x)) stop('Variable was not specified.')
	if (!missing(facet) & !is.factor(facet)) stop('Wrong variable type (!factor) given as facet.')
	if (!is.variable(x)) stop('Wrong type of varible (!atomic) provided.')
}

#' Histogram
#'
#' This function is a wrapper around \code{\link{histogram}} which operates only on numeric vectors
#' with optional facet.
#'
#' @param x a numeric variable
#' @param facet an optional categorical variable to make facets by
#' @param data an optional data frame from which the variables should be taken
#' @param kernel.smooth add kernel density plot?
#' @param theme a color palette name from \code{\link{RColorBrewer}} or 'default'
#' @param colorize if set the color is chosen from palette at random
#' @param ... additional parameters to \code{\link{histogram}}
#' @export
#' @examples \dontrun{
#' rp.hist(ius2008$edu)
#' rp.hist(ius2008$edu, facet=ius2008$gender)
#' rp.hist(ius2008$edu, ius2008$dwell)
#' rp.hist(ius2008$edu, colorize=TRUE)
#' rp.hist(ius2008$edu, colorize=TRUE, kernel.smooth=TRUE)
#' with(ius2008, rp.hist(edu, facet = gender))
#' rp.hist(edu, data = ius2008)
#' rp.hist(edu, gender, ius2008)
#' }
rp.hist <- function(x, facet=NULL, data=NULL, kernel.smooth = FALSE, theme=getOption('stlye.color.palette'), colorize=getOption('stlye.colorize'), ...) {
    mc <- match.call()
    if (!missing(data)) {
        if (missing(facet)) {
            rp.hist(x=eval(mc$x, data), theme=theme, colorize=colorize, ...)
        } else {
            rp.hist(x=eval(mc$x, data), facet=eval(mc$facet, data),
                    theme=theme, colorize=colorize, ...)
        }
    } else {
        rp.graph.check(x, ...)
        ##  generating color from given palette
        col <- rp.palette(2, theme, colorize)
        ##  getting xlab
        xlab <- rp.label(x)
        if (xlab=='x') xlab <- tail(as.character(substitute(x)), 1)
        ##  if facet set
        if (is.null(facet)) {
            text <- 'x'
        } else {
            text='~x|facet'
        }
        ## panel
        if (!kernel.smooth) {
            panel <- function(x, ...) {
                panel.grid(h=-1, v=-1)
                panel.histogram(x, ...)
            }
        } else {
            panel <- function(x, ...) {
                panel.grid(h=-1, v=-1)
                panel.histogram(x, ...)
                panel.densityplot(x, darg=list(na.rm=TRUE), ...)
            }
        }
        ##  plot
        histogram(x=eval(parse(text=text)), type = "density", panel = panel, col = col[1], col.line=col[2], lwd=2, ylab='', xlab=xlab, ...)
    }
}

#' Density plot
#'
#' This function is a wrapper around \code{\link{densityplot}} which operates only on numeric vectors
#' with optional facet.
#'
#' @param x a numeric variable
#' @param facet an optional categorical variable to make facets by
#' @param data an optional data frame from which the variables should be taken
#' @param theme a color palette name from \code{\link{RColorBrewer}} or 'default'
#' @param colorize if set the color is chosen from palette at random
#' @param ... additional parameters to \code{\link{densityplot}}
#' @export
#' @examples \dontrun{
#' df <- transform(mtcars, cyl = factor(cyl, labels = c('4', '6', '8')),
#'   am = factor(am, labels = c('automatic', 'manual')), vs = factor(vs))
#' rp.densityplot(df$hp)
#' rp.densityplot(df$hp, facet=df$am)
#' rp.densityplot(df$hp, df$am)
#' rp.label(df$hp) <- 'horsepower'; rp.densityplot(df$hp)
#' rp.densityplot(df$hp, colorize=TRUE)
#' with(df, rp.densityplot(hp, facet = am))
#' rp.densityplot(hp, data = df)
#' rp.densityplot(hp, am, df)
#' }
rp.densityplot <- function(x, facet=NULL, data=NULL, theme=getOption('stlye.color.palette'), colorize=getOption('stlye.colorize'), ...) {
    mc <- match.call()
    if (!missing(data)) {
        if (missing(facet)) {
            rp.densityplot(x=eval(mc$x, data), theme=theme, colorize=colorize, ...)
        } else {
            rp.densityplot(x=eval(mc$x, data), facet=eval(mc$facet, data),
                    theme=theme, colorize=colorize, ...)
        }
    } else {
        rp.graph.check(x, ...)
        ##  generating color from given palette
        col <- rp.palette(1, theme, colorize)
        ## getting xlab
        xlab <- rp.label(x)
        if (xlab=='x') xlab <- tail(as.character(substitute(x)), 1)
        ## if facet set
        if (is.null(facet)) {
            text <- 'x'
        } else {
            text='~x|facet'
        }
        ## plot
        densityplot(x=eval(parse(text=text)), col=col, ylab=NULL, xlab=xlab, ...)
    }
}

#' Barplot
#'
#' This function is a wrapper around \code{\link{barchart}} which operates only on factors
#' with optional facet.
#'
#' @param x a numeric variable
#' @param facet an optional categorical variable to make facets by
#' @param data an optional data frame from which the variables should be taken
#' @param horizontal see \code{\link{xyplot}}
#' @param groups see \code{\link{xyplot}}
#' @param percent an option to show percentages (100% for a category) instead of number of cases. Handy with \code{groups=TRUE}. Default value: FALSE without groups, TRUE with groups.
#' @param auto.key see \code{\link{xyplot}}
#' @param theme a color palette name from \code{\link{RColorBrewer}} or 'default'
#' @param colorize if set the color is chosen from palette at random
#' @param ... additional parameters to \code{\link{barchart}}
#' @export
#' @examples \dontrun{
#' df <- transform(mtcars, cyl = factor(cyl, labels = c('4', '6', '8')), am = factor(am, labels = c('automatic', 'manual')), vs = factor(vs))
#' rp.barplot(df$cyl)
#' rp.barplot(df$cyl, horizontal = FALSE)
#' rp.barplot(df$cyl, facet=df$am)
#' rp.barplot(df$cyl, facet=df$am, horizontal=FALSE)
#' rp.barplot(df$cyl, facet=df$am, colorize=TRUE)
#' rp.barplot(df$cyl, facet=df$am, colorize=TRUE, groups=T)
#' rp.barplot(df$cyl, facet=df$am, colorize=TRUE, groups=T, horizontal=FALSE)
#' rp.label(df$cyl) <- 'Number of cylinders'; rp.barplot(df$cyl)
#' with(df, rp.barplot(cyl, facet = am))
#' rp.barplot(cyl, data=df)
#' rp.barplot(cyl, am, df)
#' }
rp.barplot <- function(x, facet=NULL, data=NULL, groups=FALSE, auto.key=FALSE, horizontal=TRUE,
                       percent = FALSE, theme=getOption('stlye.color.palette'), colorize=getOption('stlye.colorize'), ...) {
    mc <- match.call()
    if (!missing(data)) {
        if (missing(facet)) {
            rp.barplot(x=eval(mc$x, data), groups=groups, auto.key=auto.key,
                       horizontal=horizontal, percent=percent, theme=theme, colorize=colorize, ...)
        } else {
            rp.barplot(x=eval(mc$x, data), facet=eval(mc$facet, data),
                       groups=groups, auto.key=auto.key, horizontal=horizontal, percent=percent,
                       theme=theme, colorize=colorize, ...)
        }
    } else {
        rp.graph.check(x, ...)
        ## generating color from given palette
        if (colorize) {
            col <- rp.palette(length(levels(as.factor(x))), theme, colorize)
        } else {
            col <- rp.palette(1, theme, colorize)
        }
        ## auto.keys
        if (missing(auto.key) & (groups == TRUE)) auto.key <- TRUE
        if (auto.key == TRUE) {
            auto.key <- list(col=col, rectangles=F)
        }
        ## grouping
        if (missing(percent) & (groups == TRUE)) percent <- TRUE
        ## getting labs
        ylab <- rp.label(x)
        if (ylab=='x') ylab <- tail(as.character(substitute(x)), 1)
        if (horizontal == FALSE) {
            xlab <- ylab
            ylab <- 'N'
        } else {
            xlab <- 'N'
        }
        ## if facet set
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
        barchart(x, col=col, xlab=xlab, ylab=ylab, groups = groups, horizontal = horizontal, auto.key = auto.key, ...)
    }
}

#' Dotplot
#'
#' This function is a wrapper around \code{\link{dotplot}} which operates only on factors
#' with optional facet.
#'
#' @param x a factor variable
#' @param facet an optional categorical variable to make facets by
#' @param data an optional data frame from which the variables should be taken
#' @param horizontal see \code{\link{xyplot}}
#' @param groups see \code{\link{xyplot}}
#' @param auto.key see \code{\link{xyplot}}
#' @param theme a color palette name from \code{\link{RColorBrewer}} or 'default'
#' @param colorize if set the color is chosen from palette at random
#' @param ... additional parameters to \code{\link{dotplot}}
#' @export
#' @examples \dontrun{
#' df <- transform(mtcars, cyl = factor(cyl, labels = c('4', '6', '8')), am = factor(am, labels = c('automatic', 'manual')), vs = factor(vs))
#' rp.dotplot(df$cyl)
#' rp.dotplot(df$cyl, horizontal = FALSE)
#' rp.dotplot(df$cyl, facet=df$am)
#' rp.dotplot(df$cyl, facet=df$am, horizontal=FALSE)
#' rp.dotplot(df$cyl, facet=df$am, colorize=TRUE)
#' rp.dotplot(df$cyl, facet=df$am, colorize=TRUE, groups=T)
#' rp.label(df$cyl) <- 'Number of cylinders'; rp.dotplot(df$cyl)
#' with(df, rp.dotplot(cyl, facet = am))
#' rp.dotplot(cyl, data=df)
#' rp.dotplot(cyl, am, df)
#' }
rp.dotplot <- function(x, facet=NULL, data=NULL, groups=FALSE, auto.key=FALSE, horizontal=TRUE, theme=getOption('stlye.color.palette'), colorize=getOption('stlye.colorize'), ...) {
    mc <- match.call()
    if (!missing(data)) {
        if (missing(facet)) {
            rp.dotplot(x=eval(mc$x, data), groups=groups, auto.key=auto.key,
                       horizontal=horizontal, theme=theme, colorize=colorize, ...)
        } else {
            rp.dotplot(x=eval(mc$x, data), facet=eval(mc$facet, data),
                       groups=groups, auto.key=auto.key, horizontal=horizontal,
                       theme=theme, colorize=colorize, ...)
        }
    } else {
        rp.graph.check(x, ...)
        ## generating color from given palette
        if (colorize) {
            col <- rp.palette(length(levels(as.factor(x))), theme, colorize)
        } else {
            col <- rp.palette(1, theme, colorize)
        }
        ## auto.keys
        if (missing(auto.key) & (groups == TRUE)) auto.key <- TRUE
        if (auto.key == TRUE) {
            auto.key <- list(col=col, points=F)
        }
        ## getting labs
        xlab <- rp.label(x)
        if (xlab=='x') xlab <- tail(as.character(substitute(x)), 1)
        if (horizontal == FALSE) {
            ylab <- xlab
            xlab <- 'N'
        } else {
            ylab <- 'N'
        }
        ## if facet set
        if (!is.null(facet)) {
            x <- table(x, facet)
        }
        ## plot
        dotplot(x, col=col, ylab=xlab, xlab='N', groups = groups, horizontal = horizontal, auto.key = auto.key, ...)
    }
}

#' Scatterplot
#'
#' This function is a wrapper around \code{\link{xyplot}} which operates only on numeric variables
#' with optional facet.
#'
#' @param x a numeric variable
#' @param y a numeric variable
#' @param facet an optional categorical variable to make facets by
#' @param data an optional data frame from which the variables should be taken
#' @param theme a color palette name from \code{\link{RColorBrewer}} or 'default'
#' @param colorize if set the color is chosen from palette at random
#' @param ... additional parameters to \code{\link{xyplot}}
#' @export
#' @examples \dontrun{
#' df <- transform(mtcars, cyl = factor(cyl, labels = c('4', '6', '8')), am = factor(am, labels = c('automatic', 'manual')), vs = factor(vs))
#' rp.scatterplot(df$hp, df$wt)
#' rp.scatterplot(df$hp, df$wt, facet=df$cyl)
#' rp.label(df$hp) <- 'horsepower'; rp.label(df$wt) <- 'weight'; rp.scatterplot(df$hp, df$wt)
#' rp.scatterplot(df$hp, df$wt, colorize=TRUE)
#' with(df, rp.scatterplot(hp, wt, facet = am))
#' rp.scatterplot(hp, wt, data=df)
#' rp.scatterplot(hp, wt, am, df)
#' }
rp.scatterplot <- function(x, y, facet=NULL, data=NULL, theme=getOption('stlye.color.palette'), colorize=getOption('stlye.colorize'), ...) {
    mc <- match.call()
    if (!missing(data)) {
        if (missing(facet)) {
            rp.scatterplot(x=eval(mc$x, data), y=eval(mc$y, data),
                           theme=theme, colorize=colorize, ...)
        } else {
            rp.scatterplot(x=eval(mc$x, data), y=eval(mc$y, data),
                           facet=eval(mc$facet, data), theme=theme, colorize=colorize, ...)
        }
    } else {
        rp.graph.check(x, ...)
        if (missing(y)) stop('Variable was not specified.')
        if (!is.variable(y)) stop('Wrong type of varible (!atomic) provided.')
        ## generating color from given palette
        col <- rp.palette(1, theme, colorize)
        ## getting labs
        xlab <- rp.label(x)
        if (xlab=='x') xlab <- tail(as.character(substitute(x)), 1)
        ylab <- rp.label(y)
        if (ylab=='y') ylab <- tail(as.character(substitute(y)), 1)
        ## if facet set
        if (is.null(facet)) {
            text <- 'y~x'
        } else {
            text='y~x|facet'
        }
        ## plot
        xyplot(eval(parse(text=text)), col=col, xlab=xlab, ylab=ylab, ...)
    }
}

#' Lineplot
#'
#' This function is a wrapper around \code{\link{xyplot}} with custom panel. Only numeric variables are accepted
#' with optional facet.
#'
#' @param x a numeric variable
#' @param y a numeric variable
#' @param facet an optional categorical variable to make facets by
#' @param groups an optional categorical grouping variable
#' @param data an optional data frame from which the variables should be taken
#' @param theme a color palette name from \code{\link{RColorBrewer}} or 'default'
#' @param colorize if set the color is chosen from palette at random
#' @param ... additional parameters to \code{\link{xyplot}}
#' @export
#' @examples \dontrun{
#' df <- transform(mtcars, cyl = factor(cyl, labels = c('4', '6', '8')), am = factor(am, labels = c('automatic', 'manual')), vs = factor(vs))
#' a <- aggregate(wt~gear, df, mean)
#' rp.lineplot(a$gear, a$wt)
#' rp.lineplot(1:length(df$hp), df$hp, facet=df$cyl)
#' rp.label(a$wt) <- 'weight'; rp.lineplot(a$gear, a$wt)
#' rp.lineplot(a$gear, a$wt, colorize=TRUE)
#' rp.lineplot(gear, wt, data=a)
#'
#' ## advanced usage
#' rp.lineplot(partner, age, data=rp.desc('age', 'partner', fn='mean', data=ius2008))
#' rp.lineplot(partner, age, gender, data=rp.desc('age', c('gender', 'partner'), fn='mean', data=ius2008))
#' rp.lineplot(partner, age, groups=gender, data=rp.desc('age', c('gender', 'partner'), fn='mean', data=ius2008))
#'
#' ## Did you noticed the nasty axis titles? Why not correct those? :)
#' df <- rp.desc('age', 'partner', fn='mean', data=ius2008)
#' lapply(names(df), function(x) rp.label(df[, x]) <<- x)   # nasty solution!
#' rp.lineplot(partner, age, data=df)
#' df <- rp.desc('age', c('gender', 'partner'), fn='mean', data=ius2008)
#' lapply(names(df), function(x) rp.label(df[, x]) <<- x)  # nasty solution!
#' rp.lineplot(partner, age, gender, data=df)
#' df <- rp.desc('age', c('gender', 'partner'), fn='mean', data=ius2008)
#' lapply(names(df), function(x) rp.label(df[, x]) <<- x)  # nasty solution!
#' rp.lineplot(partner, age, groups=gender, data=df)
#' }

rp.lineplot <- function(x, y, facet=NULL, data=NULL, groups=NULL, theme=getOption('stlye.color.palette'), colorize=getOption('stlye.colorize'), ...) {
    mc <- match.call()
    if (!missing(data)) {
        if (missing(facet)) {
            if (missing(groups))
                rp.lineplot(x=eval(mc$x, data), y=eval(mc$y, data), theme=theme, colorize=colorize, ...)
            else
                rp.lineplot(x=eval(mc$x, data), y=eval(mc$y, data), groups=eval(mc$groups, data), theme=theme, colorize=colorize, ...)
        } else {
            if (missing(groups))
                rp.lineplot(x=eval(mc$x, data), y=eval(mc$y, data), facet=eval(mc$facet, data), theme=theme, colorize=colorize, ...)
            else
                rp.lineplot(x=eval(mc$x, data), y=eval(mc$y, data), facet=eval(mc$facet, data), groups=eval(mc$groups, data), theme=theme, colorize=colorize, ...)
        }
    } else {
        rp.graph.check(x, ...)
        if (missing(y)) stop('Variable was not specified.')
        if (!is.variable(y)) stop('Wrong type of varible (!atomic) provided.')
        if (!missing(groups))
            if (!is.variable(groups)) stop('Wrong type of varible (!atomic) provided.')
        ## generating color from given palette
        col <- rp.palette(ifelse(missing(groups), 1, length(levels(groups))), theme, colorize)
        ## getting labs
        xlab <- rp.label(x)
        if (xlab=='x') xlab <- tail(as.character(substitute(x)), 1)
        ylab <- rp.label(y)
        if (ylab=='y') ylab <- tail(as.character(substitute(y)), 1)
        ## if facet set
        if (is.null(facet)) {
            text <- 'y~x'
        } else {
            text='y~x|facet'
        }
        ## plot
        if (missing(groups))
            xyplot(eval(parse(text=text)), type="l", col.line=col, xlab=xlab, ylab=ylab, ...)
        else {
            ## auto.keys
            auto.key <- list(col=col, points=F)
            xyplot(eval(parse(text=text)), groups=groups, type="l", col.line=col, col=col, xlab=xlab, ylab=ylab, auto.key=auto.key, ...)
        }
    }
}

#' Boxplot
#'
#' This function is a wrapper around \code{\link{bwplot}} which operates only on numeric variables
#' with optional facet.
#'
#' @param x a factor variable
#' @param y a numeric variable
#' @param facet an optional categorical variable to make facets by
#' @param data an optional data frame from which the variables should be taken
#' @param theme a color palette name from \code{\link{RColorBrewer}} or 'default'
#' @param colorize if set the color is chosen from palette at random
#' @param ... additional parameters to \code{\link{bwplot}}
#' @export
#' @examples \dontrun{
#' df <- transform(mtcars, cyl = factor(cyl, labels = c('4', '6', '8')), am = factor(am, labels = c('automatic', 'manual')), vs = factor(vs))
#' rp.boxplot(df$cyl)
#' rp.boxplot(df$cyl, df$wt)
#' rp.boxplot(df$cyl, df$hp, facet=df$am)
#' rp.label(df$hp) <- 'horsepower'; rp.label(df$wt) <- 'weight'; rp.boxplot(df$cyl, df$wt)
#' rp.boxplot(df$cyl, df$wt, colorize=TRUE)
#' with(df, rp.scatterplot(hp, wt, facet = am))
#' rp.boxplot(cyl, wt, data=df)
#' rp.boxplot(cyl, wt, am, df)
#' }
rp.boxplot <- function(x, y=NULL, facet=NULL, data=NULL, theme=getOption('stlye.color.palette'), colorize=getOption('stlye.colorize'), ...) {
    mc <- match.call()
    if (!missing(data)) {
        if (missing(facet)) {
            rp.boxplot(x=eval(mc$x, data), y=eval(mc$y, data),
                       theme=theme, colorize=colorize, ...)
        } else {
            rp.boxplot(x=eval(mc$x, data), y=eval(mc$y, data),
                       facet=eval(mc$facet, data), theme=theme, colorize=colorize, ...)
        }
    } else {
        rp.graph.check(x, ...)
 
        ## generating color from given palette
        if (colorize) {		#TODO: colorize box and lines (?)
            col <- rp.palette(1, theme, colorize)
        } else {
            col <- 'white'
        }
        ## getting labs
        xlab <- rp.label(x)
        if (xlab=='x') xlab <- tail(as.character(substitute(x)), 1)
        if (!is.null(y))
            ylab <- rp.label(y)
        ## if facet set
        if (is.null(facet)) {
            text <- 'y~x'
        } else {
            text='y~x|facet'
        }
        if (is.null(y))
            text <- 'x'; ylab <- ''
        if (ylab=='y') ylab <- tail(as.character(substitute(y)), 1)
        ## plot
        bwplot(eval(parse(text=text)), fill=col, xlab=xlab, ylab=ylab, ...)
    }
}

#' Scatterplot matrices
#'
#' This function is a wrapper around \code{\link{pairs}} which operates only on numeric variables.
#' Panel options are: \code{c('panel.cor', 'panel.smooth', 'panel.hist')}. Custom panels may be also added.
#'
#' @param x numeric variables
#' @param lower.panel see: \code{\link{pairs}} parameter. Default set to \code{'panel.smooth'}.
#' @param upper.panel see: \code{\link{pairs}} parameter. Default set to \code{'panel.cor'}.
#' @param data an optional data frame from which the variables should be taken
#' @param theme a color palette name from \code{\link{RColorBrewer}} or 'default'
#' @param colorize if set the color is chosen from palette at random
#' @param ... additional parameters to \code{\link{pairs}}
#' @export
#' @examples \dontrun{
#' df <- transform(mtcars, cyl = factor(cyl, labels = c('4', '6', '8')), am = factor(am, labels = c('automatic', 'manual')), vs = factor(vs))
#' rp.cor.plot(df)
#' rp.cor.plot(df, diag.panel='panel.hist')
#' }
rp.cor.plot <- function(x, lower.panel='panel.smooth', upper.panel='panel.cor', data=NULL, theme=getOption('stlye.color.palette'), colorize=getOption('stlye.colorize'), ...) {
    mc <- match.call()
    if (!missing(data)) {
        rp.cor.plot(x=eval(mc$x, data), lower.panel=NULL, upper.panel=NULL,
                    theme=theme, colorize=colorize, ...)
    } else {
        ## generating color from given palette
        col <- rp.palette(1, theme, colorize)
        ## panels
        panel.cor <- function(x, y, digits=2, prefix="", cex.cor)
            {
                usr <- par("usr"); on.exit(par(usr))
                par(usr = c(0, 1, 0, 1))
                r <- cor(x, y)
                txt <- format(c(r, 0.123456789), digits=digits)[1]
                txt <- paste(prefix, txt, sep="")
                if(missing(cex.cor)) cex <- 0.8/strwidth(txt)

                test <- cor.test(x,y)
                # borrowed from printCoefmat
                Signif <- symnum(test$p.value, corr = FALSE, na = FALSE,
                                 cutpoints = c(0, 0.001, 0.01, 0.05, 0.1, 1),
                                 symbols = c("***", "**", "*", ".", " "))

                text(0.5, 0.5, txt, cex = cex * abs(r) * 1.2)
                text(.8, .8, Signif, cex=cex, col=2)
            }
        panel.hist <- function(x, ...)
            {
                usr <- par("usr"); on.exit(par(usr))
                par(usr = c(usr[1:2], 0, 1.5) )
                h <- hist(x, plot = FALSE)
                breaks <- h$breaks; nB <- length(breaks)
                y <- h$counts; y <- y/max(y)
                rect(breaks[-nB], 0, breaks[-1], y, col="cyan", ...)
            }
        ## plot
        pairs(x, lower.panel=lower.panel, upper.panel=upper.panel, labels=lapply(x, rp.name), ...)
    }
}

#' Q-Q plot with Theoretical Distribution
#'
#' This function is a wrapper around \code{\link{qqmath}} which operates only on a numeric variable
#' with optional facet.
#'
#' @param x a numeric variable
#' @param dist a theoretical distribution
#' @param facet an optional categorical variable to make facets by
#' @param data an optional data frame from which the variables should be taken
#' @param theme a color palette name from \code{\link{RColorBrewer}} or 'default'
#' @param colorize if set the color is chosen from palette at random
#' @param ... additional parameters to \code{\link{qqmath}}
#' @export
#' @examples \dontrun{
#'     df <- transform(mtcars, cyl = factor(cyl, labels = c('4', '6', '8')), am = factor(am, labels = c('automatic', 'manual')), vs = factor(vs))
#'     rp.qqplot(df$hp)
#'     rp.qqplot(df$hp, qunif)
#'     rp.label(df$hp) <- 'horsepower'; rp.qqplot(df$hp)
#'     rp.qqplot(df$hp, colorize=TRUE)
#'     rp.qqplot(df$hp, qunif, facet=df$am)
#'     with(df, rp.qqplot(hp))
#'     rp.qqplot(hp, data=df)
#'     rp.qqplot(hp, facet=am, data=df)
#'     rp.qqplot(hp, qunif, am, df)
#' }
rp.qqplot <- function(x, dist=qnorm, facet=NULL, data=NULL, theme=getOption('stlye.color.palette'), colorize=getOption('stlye.colorize'), ...) {
    mc <- match.call()
    if (!missing(data)) {
        if (missing(facet)) {
            rp.qqplot(x=eval(mc$x, data), dist=dist,
                      theme=theme, colorize=colorize, ...)
        } else {
            rp.qqplot(x=eval(mc$x, data), dist=dist,
                      facet=eval(mc$facet, data), theme=theme, colorize=colorize, ...)
        }
    } else {
        rp.graph.check(x, ...)
        if (!existsFunction(deparse(substitute(dist)))) stop('Invalid distribution function provided.')
        ## generating color from given palette
        col <- rp.palette(1, theme, colorize)
        ## getting labs
        ylab <- rp.label(x)
        if (ylab=='x') ylab <- tail(as.character(substitute(x)), 1)
        ## ylab is defined by used function's title (like: "The Normal Distribution", "The Unifomr Distribution")
        target <- gsub("^.+/library/(.+)/help.+$", "\\1", utils:::index.search(deparse(substitute(dist)), find.package()))
        doc.txt <- pkg_topic(target, deparse(substitute(dist)))
        dist.name <- doc.txt[[1]][[1]][1]
        ## if facet set
        if (is.null(facet)) {
            text <- 'x'
        } else {
            text='~x|facet'
        }
        ## plot
        qqmath(eval(parse(text=text)), distribution=dist, col=col, xlab=dist.name, ylab=ylab, ...)
    }
}
