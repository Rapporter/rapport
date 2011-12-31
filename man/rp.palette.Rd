\name{rp.palette}
\alias{rp.palette}
\title{Color palettes}
\usage{
  rp.palette(num, theme = getOption("rp.color.palette"),
    colorize = getOption("rp.colorize"))
}
\arguments{
  \item{num}{number of colors to return}

  \item{theme}{a palette name from
  \code{\link{RColorBrewer}} or 'default'}

  \item{colorize}{if set colors are chosen from palette at
  random order}
}
\description{
  This function returns a given number of color codes from
  given palette by default falling back to a
  color-blind-friendly palette from
  \url{http://jfly.iam.u-tokyo.ac.jp/color/}.
}
\examples{
{
rp.palette(1)
rp.palette(1, colorize = TRUE)
rp.palette(5, 'Greens')
rp.palette(5, 'Greens', colorize = TRUE)
}
}

