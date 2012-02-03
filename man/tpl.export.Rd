\name{tpl.export}
\alias{tpl.export}
\title{Export rapport class}
\usage{
  tpl.export(rp = NULL, file = NULL, append = FALSE,
    create = TRUE, open = TRUE,
    date = format(Sys.time(), getOption("rp.date.format")),
    desc = TRUE, format = "html", backend = "pandoc",
    options = NULL, logo = TRUE)
}
\arguments{
  \item{rp}{a rapport class object or list of rapport class
  objects}

  \item{file}{filename (NULL returns a tempfile)}

  \item{append}{FALSE (new report created) or an R object
  (class of "Report") to which the new report will be
  added}

  \item{create}{should export really happen? It might be
  handy if you want to append several reports.}

  \item{open}{open the exported document? Default set to
  TRUE.}

  \item{date}{character string as the date field of the
  report. If not set, current time will be set.}

  \item{desc}{add Description of the rapport class
  (template)? Default set to TRUE.}

  \item{format}{format of the wanted report, see:
  \code{ascii:::asciiOpts(".outputs")}}

  \item{backend}{backend for the format conversions, see:
  \code{ascii:::asciiOpts(".backends")}}

  \item{options}{command line options passed to backend}

  \item{logo}{add rapport logo}
}
\description{
  This function exports rapport class objects to various
  formats based on ascii package.
}
\details{
  By default this function tries to export the report to
  HTML with pandoc. Some default styles are applied. If you
  do not like those default settings, use your own
  \code{options}.

  Default parameters are read from \code{options}:

  \itemize{ \item "getOption('rp.date.format')", \item
  "getOption('tpl.user')", \item "getOption('tpl.email')".
  }

  Please be sure to set \code{'tpl.user'} and
  \code{'tpl.email'} options with \code{options()} to get
  your name in the head of your generated reports!
}
\examples{
\dontrun{

## eval some template
x <- rapport('descriptives-univar', data=mtcars, var="hp")

## try basic parameters
tpl.export(x)
tpl.export(x, file='demo')
tpl.export(x, file='demo', format='odt')

### append reports
# 1) Create a report object with the first report and do not export (optional)
report <- tpl.export(x, create=F)
# 2) Append some other reports without exporting (optional)
report <- tpl.export(x, create=F, append=report)
# 3) Export it!
tpl.export(append=report)
# 4) Export it to other formats too! (optional)
tpl.export(append=report, format='rst')

### exporting multiple reports at once
tpl.export(tpl.example('example', 'all'))
tpl.export(tpl.example('example', 'all'), format='odt')
tpl.export(list(rapport('univar-descriptive', data=mtcars, var="hp"),
    rapport('univar-descriptive', data=mtcars, var="mpg")))

### Never do this as being dumb:
tpl.export()

### Adding own custom CSS to exported HTML
tpl.export(x, options=sprintf('-c \%s', system.file('templates/css/default.css', package='rapport')))
## For other formats check out backend specific documentation!
## E.g. pandoc uses "--reference-odt" as styles reference for odt exports.
}
}

