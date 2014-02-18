\name{rapport.path.add}
\alias{rapport.path.add}
\alias{tpl.paths.add}
\title{Add Template Path}
\usage{
rapport.path.add(...)
}
\arguments{
  \item{...}{character vector of paths}
}
\value{
TRUE on success (invisibly)
}
\description{
Adds a new element to custom paths' list where rapport will
look for templates.
}
\examples{
\dontrun{
rapport.path.add('/tmp')
rapport.ls()
}
}

