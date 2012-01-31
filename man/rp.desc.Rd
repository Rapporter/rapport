\name{rp.desc}
\alias{rp.desc}
\title{Descriptive Statistics}
\usage{
  rp.desc(measure.vars, id.vars = NULL, fn, data = NULL,
    na.rm = TRUE, margins = NULL, subset = TRUE, fill = NA,
    add.missing = FALSE, total.name = "Total",
    varcol.name = "Variable",
    use.labels = getOption("rp.use.labels"),
    remove.duplicate = TRUE)
}
\arguments{
  \item{measure.vars}{either a character vector with
  variable names from \code{data}, a numeric vector, or a
  \code{data.frame}}

  \item{id.vars}{same rules apply as in
  \code{measure.vars}, but defaults to \code{NULL}}

  \item{fn}{a list with functions or a character vector
  with function names}

  \item{data}{a \code{data.frame} holding variables
  specified in \code{id.vars} and \code{measure.vars}}

  \item{na.rm}{a logical value indicating whether \code{NA}
  values should be removed}

  \item{margins}{should margins be included? (see
  documentation for eponymous argument in
  \code{\link[reshape]{melt.data.frame}})}

  \item{subset}{a logical vector to subset the data before
  aggregating}

  \item{fill}{value to replace missing level combinations
  (see documentation for eponymous argument in
  \code{\link[reshape]{melt.data.frame}})}

  \item{add.missing}{show missing level combinations}

  \item{total.name}{a character string with name for
  "grand" margin (defaults to "Total")}

  \item{varcol.name}{character string for column that
  contains summarised variables (defaults to
  \code{"Variable"})}

  \item{use.labels}{use labels instead of variable names in
  table header (handle with care, especially if you have
  lengthy labels). Defaults to value specified in
  \code{rp.use.labels} option.}

  \item{remove.duplicate}{should name/label of the variable
  provided in \code{measure.vars} be removed from each
  column if only one \code{measure.var} is provided
  (defaults to \code{TRUE})}
}
\value{
  a \code{data.frame} with aggregated data
}
\description{
  Aggregate table of descriptives according to functions
  provided in \code{fn} argument. This function follows
  melt/cast approach used in \code{reshape} package.
  Variable names specified in \code{measure.vars} argument
  are treated as \code{measure.vars}, while the ones in
  \code{id.vars} are treated as \code{id.vars} (see
  \code{\link[reshape]{melt.data.frame}} for details).
  Other its formal arguments match with corresponding
  arguments for \code{\link[reshape]{cast}} function. Some
  post-processing is done after reshaping, in order to get
  pretty row and column labels.
}
\examples{
rp.desc("cyl", "am", c(mean, sd), mtcars, margins = TRUE)
## c
rp.desc("age", c("gender", "student"), c("Average" = mean, "Deviation" = sd), ius2008, remove.duplicate = FALSE)
}

