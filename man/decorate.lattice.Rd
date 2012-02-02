\name{decorate.lattice}
\alias{decorate.lattice}
\title{Decorating lattice plots}
\usage{
  decorate.lattice(expr, theme = getOption("style.theme"),
    grid = getOption("style.grid"))
}
\arguments{
  \item{expr}{call to lattice which will be evaluated with
  added theme options}

  \item{theme}{name of theme to use. Besides
  \code{\link{theme.rapport}} there are several themes
  available in other packages too, eg.
  \code{standard.theme()} from lattice, \code{gplot2like()}
  and \code{theEconomist.theme()} from latticeExtra and
  \code{custom.theme.black()} from latticist package. Of
  course custom theme might be provided also, check out
  \code{?custom.theme} from latticeExtra package or head
  directly to: \code{?trellis.par.get()}}

  \item{grid}{show grid in the background? It is possible
  to render a grid for \code{'both'}, only for \code{'x'}
  or solely to \code{'y'} axis. \code{'none'} results in a
  blank background.}
}
\value{
  lattice/trellis object
}
\description{
  Apply required theme and grid options to called
  lattice/trellis plot.
}
\details{
  Default parameters are read from \code{options}:

  \itemize{ \item 'style.theme', \item 'style.grid'. }
}
\examples{
\dontrun{
decorate.lattice(histogram(mtcars$hp))
decorate.lattice(histogram(mtcars$hp), grid='y')
decorate.lattice(histogram(mtcars$hp), grid='both')
decorate.lattice(histogram(mtcars$hp), theme="theme.rapport(bw = TRUE)")
decorate.lattice(histogram(mtcars$hp, type = "density", panel = function(x, ...) {
  panel.histogram(x, ...)
  panel.densityplot(x, darg=list(na.rm=TRUE), ...)
}))
decorate.lattice(bwplot(decrease ~ treatment, OrchardSprays, groups = rowpos), grid='none')
decorate.lattice(bwplot(decrease ~ treatment, OrchardSprays, groups = rowpos), grid='y')
decorate.lattice(bwplot(voice.part ~ height, data = singer), grid='x')
decorate.lattice(bwplot(voice.part ~ height, data = singer), grid='x', theme="theme.rapport(bw = TRUE)")
decorate.lattice(barchart(VADeaths))
decorate.lattice(barchart(VADeaths), theme="theme.rapport(palette='Greens')", grid='x')
decorate.lattice(barchart(VADeaths), theme="theme.rapport(bw = TRUE)", grid='x')
decorate.lattice(barchart(VADeaths), theme="theme.rapport(font = 'Garamond')", grid='x')
decorate.lattice(barchart(VADeaths), theme="ggplot2like", grid='x')
decorate.lattice(barchart(VADeaths), theme="theEconomist.theme", grid='x')
decorate.lattice(barchart(VADeaths, main='TITLE (70-74)'), theme="theme.rapport(custom = list(axis.text = list(fontfamily='Garamond')))", grid='x')
}
}

