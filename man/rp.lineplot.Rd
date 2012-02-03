\name{rp.lineplot}
\alias{rp.lineplot}
\title{Lineplot}
\usage{
  rp.lineplot(x, y, facet = NULL, data = NULL,
    groups = NULL, ...)
}
\arguments{
  \item{x}{a numeric variable}

  \item{y}{a numeric variable}

  \item{facet}{an optional categorical variable to make
  facets by}

  \item{groups}{an optional categorical grouping variable}

  \item{data}{an optional data frame from which the
  variables should be taken}

  \item{...}{additional parameters to \code{\link{xyplot}}}
}
\description{
  This function is a wrapper around \code{\link{xyplot}}
  with custom panel. Only numeric variables are accepted
  with optional facet.
}
\details{
  Default parameters are read from \code{options}:

  \itemize{ \item 'style.theme'. }
}
\examples{
\dontrun{
a <- aggregate(wt~gear, mtcars, mean)
rp.lineplot(a$gear, a$wt)
rp.lineplot(gear, wt, data=a)

## lame demo:
rp.lineplot(1:length(mtcars$hp), mtcars$hp, facet=mtcars$cyl)

## advanced usage
rp.lineplot(partner, age, data = rp.desc('age', 'partner', fn = 'mean', data=ius2008))
rp.lineplot(partner, age, gender, data = rp.desc('age', c('gender', 'partner'), fn = 'mean', data=ius2008))
rp.lineplot(partner, age, groups = gender, data=rp.desc('age', c('gender', 'partner'), fn = 'mean', data = ius2008))

## Did you noticed the nasty axis titles? Why not correct those? :)
df <- rp.desc('age', 'partner', fn = 'mean', data = ius2008)
lapply(names(df), function(x) rp.label(df[, x]) <<- x)   # nasty solution!
rp.lineplot(partner, age, data = df)
df <- rp.desc('age', c('gender', 'partner'), fn = 'mean', data = ius2008)
lapply(names(df), function(x) rp.label(df[, x]) <<- x)  # nasty solution!
rp.lineplot(partner, age, gender, data = df)
df <- rp.desc('age', c('gender', 'partner'), fn = 'mean', data = ius2008)
lapply(names(df), function(x) rp.label(df[, x]) <<- x)  # nasty solution!
rp.lineplot(partner, age, groups = gender, data = df)
}
}

