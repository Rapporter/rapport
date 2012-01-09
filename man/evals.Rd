\name{evals}
\alias{evals}
\title{Evals chunk(s) of R code}
\usage{
  evals(txt = NULL, ind = NULL, body = NULL,
    classes = NULL, hooks = NULL, length = Inf,
    output = c("all", "src", "output", "type", "msg"),
    env = NULL, ...)
}
\arguments{
  \item{txt}{a list with character values containing R
  code}

  \item{ind}{a list with numeric indices pointing to R code
  in \code{body}}

  \item{body}{a character vector that contains template
  body}

  \item{classes}{a vector or list of classes which should
  be returned. If set to NULL (by default) all R objects
  will be returned.}

  \item{hooks}{list of hooks to bo run for given classes in
  the form of \code{list(class=fn)}. If you would also
  specify some parameters of the function, a list should be
  provided in the form of \code{list(fn, param1,
  param2=NULL)} etc. So the hooks would become
  \code{list(class1=list(fn, param1, param2=NULL), ...)}.
  See example below. A default hook can be specified too by
  setting the class to \code{'default'}. This can be handy
  if you do not want to define separate methods/functions
  to each possible class, but automatically apply the
  default hook to all classes not mentioned in the list.
  You may also specify only one element in the list like:
  \code{hooks=list('default'=ascii)}.}

  \item{length}{R object exceeding the specified length
  will not be returned. The default value (\code{Inf}) does
  not have any restrictions.}

  \item{output}{a character vector of required returned
  values. See below.}

  \item{env}{environment where evaluation takes place. If
  not set (by default), a new temporary environment is
  created.}

  \item{...}{optional parameters passed to \code{png(...)}}
}
\value{
  a list of parsed elements each containg: src (the command
  run), output (what the command returns, NULL if nothing
  returned), type (class of returned object if any) and
  messages: warnings (if any returned by the command run,
  otherwise set to NULL) and errors (if any returned by the
  command run, otherwise set to NULL)
}
\description{
  This function takes either a list of integer indices
  which point to position of R code in body character
  vector, or a list of strings with actual R code, then
  evaluates each list element, and returns a list with two
  elements: a character value with R code and generated
  output. The output can be NULL (eg. \code{x <-
  runif(100)}), a table (eg. \code{table(mtcars$am,
  mtcars$cyl)} or any other R object. If a graph is plotted
  in the given text, the returned object is a string
  specifying the path to the saved png in temporary
  directory (see: \code{tmpfile()}). The function takes
  care of warnings and errors too, please check the the
  returned value below.
}
\examples{
\dontrun{
# parsing line-by-line
txt <- readLines(textConnection('x <- rnorm(100)
  runif(10)
  warning("You should check out rapport package!")
  plot(1:10)
  qplot(rating, data=movies, geom="histogram")
  y <- round(runif(100))
  cor.test(x, y)
  crl <- cor.test(runif(10), runif(10))
  table(mtcars$am, mtcars$cyl)
  ggplot(mtcars) + geom_point(aes(x = hp, y = mpg))'))
evals(txt)

## parsing a list of commnads
txt <- list('df <- mtcars',
 c('plot(mtcars$hp, pch = 19)','text(mtcars$hp, label = rownames(mtcars), pos = 4)'),
 'ggplot(mtcars) + geom_point(aes(x = hp, y = mpg))')
evals(txt)

## returning only a few classes
txt <- readLines(textConnection('rnorm(100)
  list(x = 10:1, y = "Godzilla!")
  c(1,2,3)
evals(txt, classes='numeric')
evals(txt, classes=c('numeric', 'list'))

## handling warnings
evals('chisq.test(mtcars$gear, mtcars$hp)')

## handling errors
evals('runiff(20)')
evals('Old MacDonald had a farm\\\\dots')
evals('## Some comment')

## hooks
hooks <- list('numeric'=round, 'matrix'=ascii)
evals(txt, hooks=hooks)
evals('22/7', hooks=list('numeric'=rp.round))
evals('matrix(runif(25), 5, 5)', hooks=list('matrix'=rp.round))

## using rapport's default hook
evals('22/7', hooks=TRUE)

## setting default hook
evals(c('runif(10)', 'matrix(runif(9), 3, 3)'), hooks=list('default'=round))
## round all values except for matrices
evals(c('runif(10)', 'matrix(runif(9), 3, 3)'), hooks=list(matrix='print', 'default'=round))

# advanced hooks
fun <- function(x, asciiformat) paste(capture.output(print(ascii(x), asciiformat)), collapse='\\n')
hooks <- list('numeric'=list(round, 2), 'matrix'=list(fun, "rest"))
evals(txt, hooks=hooks)

# return only returned values
evals(txt, output='output')

# return only messages (for checking syntax errors etc.)
evals(txt, output='msg')

# check the length of returned values
evals('runif(10)', length=5)

# note the following will not be filtered!
evals('matrix(1,1,1)', length=1)

# if you do not want to let such things be evaled in the middle of a string use it with other filters :)
evals('matrix(1,1,1)', length=1, classes='numeric')

	# hooks & filtering
evals('matrix(5,5,5)', hooks=list('matrix'=ascii), output='output')

# evaling chunks in given environment
myenv <- new.env()
evals('x <- c(0,10)', env=myenv)
evals('mean(x)', env=myenv)
rm(myenv)
# note: if you had not specified 'myenv', the second 'evals' would have failed
evals('x <- c(0,10)')
evals('mean(x)')
}
}
\author{
  Gergely Daróczi
}

