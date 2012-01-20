\name{tpl.paths.add}
\alias{tpl.paths.add}
\title{Add Template Path}
\usage{
  tpl.paths.add(...)
}
\arguments{
  \item{...}{character vector of paths}
}
\value{
  TRUE on success (invisibly)
}
\description{
  Adds a new element to custom paths' list where rapport
  will look for templates.
}
\examples{
\dontrun{
tpl.paths.add('/tmp')
tpl.list()

## might trigger an error:
tpl.paths.add('/home', '/rapport')
}
}

