\name{tpl.export}
\alias{tpl.export}
\title{Export rapport object}
\usage{
  tpl.export(rp = NULL, file, append = FALSE,
    create = TRUE, open = TRUE,
    date = pander.return(Sys.time()), desc = TRUE,
    format = "html", options = "", logo = TRUE)
}
\arguments{
  \item{rp}{a rapport class object or list of rapport class
  objects}

  \item{file}{filename of the generated document. Inherited
  from rapport class if not set. If \code{file} is set with
  path (not equal to \code{getwd()}), please set an
  absolute path for images (see: \code{evalsOptions()}).}

  \item{append}{FALSE (new report created) or an R object
  (class of "Report") to which the new report will be
  added}

  \item{create}{should export really happen? It might be
  handy if you want to append several reports.}

  \item{open}{open the exported document? Default set to
  TRUE.}

  \item{date}{character string as the date field of the
  report. If not set, current time will be set.}

  \item{desc}{add \code{Description} of the rapport class
  (template)? Default set to TRUE.}

  \item{format}{format of the wanted report. See Pandoc's
  user manual for details. In short, choose something like:
  \code{html}, \code{pdf}, \code{odt} or \code{docx}.}

  \item{options}{options passed to \code{Pandoc.convert}.}

  \item{logo}{add rapport logo}
}
\value{
  filepath on \code{create = TRUE}, \code{Report} class
  otherwise
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

  \itemize{ \item 'tpl.user' }

  Please be sure to set \code{'tpl.user'} option with
  \code{options()} to get your name in the head of your
  generated reports!
}
\examples{
\dontrun{

## eval some template
x <- rapport('example', data = mtcars, var="hp")

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
tpl.export(list(rapport('univar-descriptive', data = mtcars, var="hp"),
    rapport('univar-descriptive', data = mtcars, var="mpg")))

### Never do this as being dumb:
tpl.export()

### Using other backends
## asciidoc
tpl.export(tpl.example('example', 'all'), backend='asciidoc')
## txt2tags
tpl.export(tpl.example('example', 'all'), backend='t2t')

### Adding own custom CSS to exported HTML
tpl.export(x, options=sprintf('-c \%s', system.file('templates/css/default.css', package='rapport')))
}
}
\references{
  John MacFarlane (2012): _Pandoc User's Guide_.
  \url{http://johnmacfarlane.net/pandoc/README.html}
}
\seealso{
  \code{\link{rapport.html}} \code{\link{rapport.pdf}}
  \code{\link{rapport.odt}} \code{\link{rapport.docx}}
}

