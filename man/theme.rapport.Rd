\name{theme.rapport}
\alias{theme.rapport}
\title{Rapport theme}
\usage{
  theme.rapport(bw = FALSE,
    palette = getOption("style.color.palette"),
    colorize = getOption("style.colorize"),
    font = getOption("style.font"), custom)
}
\arguments{
  \item{bw}{generating black and white output?}

  \item{palette}{color palette to use. See:
  \code{rp.palette} for details.}

  \item{colorize}{adding some random noise instead of using
  first available color(s) from palette}

  \item{font}{specified font family}

  \item{custom}{list of custom lattice options to change.
  E.g. \code{par.main.text = list(lineheight = 2)}}
}
\value{
  list of lattice parameters
}
\description{
  Custom minimalistic but colorful lattice/trellis theme
  used by default in rapport.
}
\details{
  Default parameters are read from \code{options}:

  \itemize{ \item 'style.color.palette', \item
  'style.colorize', \item 'style.font'. }
}
\examples{
\dontrun{
theme.rapport()
theme.rapport(palette='Greens')
theme.rapport(palette='Greens', colorize = FALSE)
theme.rapport(custom=list(par.main.text = list(lineheight = 2)))
}
}
\references{
  Forked from \code{latticeExtra::ggplot2like()} and
  \code{lattice::standard.theme()}.
}

