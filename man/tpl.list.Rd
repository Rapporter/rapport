\name{tpl.list}
\alias{tpl.list}
\title{Package Templates}
\usage{
  tpl.list(...)
}
\arguments{
  \item{...}{additional parameters for \code{\link{dir}}
  function}
}
\value{
  a character vector with template files
}
\description{
  Lists all templates bundled with current package build.
  By default, it will search for all \code{.tpl} files in
  current directory, path specified in \code{tpl.paths}
  option and package library path.
}

