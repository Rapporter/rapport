\name{rp.palette}
\alias{rp.palette}
\title{Color palettes}
\usage{
  rp.palette(num,
    palette = getOption("style.color.palette"),
    colorize = getOption("style.colorize"))
}
\arguments{
  \item{num}{number of colors to return}

  \item{palette}{a palette name from
  \code{\link{RColorBrewer}} or 'default'}

  \item{colorize}{if set colors are chosen from palette at
  random order}
}
\description{
  This function returns a given number of color codes from
  given palette from \code{\link{RColorBrewer}}. Besides
  those falling back to \code{'default'}: a
  color-blind-friendly palette from
  \url{http://jfly.iam.u-tokyo.ac.jp/color/}.
}
\details{
  Default parameters are read from \code{options}:

  \itemize{ \item 'style.color.palette', \item
  'style.colorize'. }
}
\examples{
{
rp.palette()
rp.palette(1)
rp.palette(1, colorize = TRUE)
rp.palette(5, 'Greens')
rp.palette(5, 'Greens', colorize = TRUE)
}
}

