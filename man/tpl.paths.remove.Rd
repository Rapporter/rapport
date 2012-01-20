\name{tpl.paths.remove}
\alias{tpl.paths.remove}
\title{Remove Template Path}
\usage{
  tpl.paths.remove(...)
}
\arguments{
  \item{...}{character vector of paths}
}
\value{
  TRUE on success (invisibly)
}
\description{
  Removes an element from custom paths' list where rapport
  will look for templates.
}
\examples{
\dontrun{
tpl.paths()
tpl.paths.add('/tmp')
tpl.paths()
tpl.paths.remove('/tmp')
tpl.paths()

## might trigger an error:
tpl.paths.remove('/root')
}
}

