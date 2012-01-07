##' Evals chunk(s) of R code
##'
##' This function takes either a list of integer indices which point to position of R code in body character vector, or a list of strings with actual R code, then evaluates each list element, and returns a list with two elements: a character value with R code and generated output. The output can be NULL (eg. \code{x <- runif(100)}), a table (eg. \code{table(mtcars$am, mtcars$cyl)} or any other R object. If a graph is plotted in the given text, the returned object is a string specifying the path to the saved png in temporary directory (see: \code{tmpfile()}). The function takes care of warnings and errors too, please check the the returned value below.
##' @param txt a list with character values containing R code
##' @param ind a list with numeric indices pointing to R code in \code{body}
##' @param body a character vector that contains template body
##' @param classes a vector or list of classes which should be returned. If set to NULL (by default) all R objects will be returned.
##' @param hooks list of hooks to bo run for given classes in the form of \code{list(class=fn)}. If you	would also specify some parameters of the function, a list should be provided in the form of \code{list(fn, param1, param2=NULL)} etc. So the hooks would become \code{list(class1=list(fn, param1, param2=NULL), ...)}. See example below. A default hook can be specified too by setting the class to \code{'default'}. This can be handy if you do not want to define separate methods/functions to each possible class, but automatically apply the default hook to all classes not mentioned in the list. You may also specify only one element in the list like: \code{hooks=list('default'=ascii)}.
##' @param length R object exceeding the specified length will not be returned. The default value (\code{Inf}) does not have any restrictions.
##' @param output a character vector of required returned values. See below.
##' @param env environment where evaluation takes place. If not set (by default), a new temporary environment is created.
##' @param ... optional parameters passed to \code{png(...)}
##' @return a list of parsed elements each containg: src (the command run), output (what the command returns, NULL if nothing returned), type (class of returned object if any) and messages: warnings (if any returned	by the command run, otherwise set to NULL) and errors (if any returned by the command run, otherwise set to NULL)
##' @author Gergely Daróczi
##' @examples \dontrun{
##' # parsing line-by-line
##' txt <- readLines(textConnection('x <- rnorm(100)
##' 	runif(10)
##' 	warning("You should check out rapport package!")
##' 	plot(1:10)
##' 	qplot(rating, data=movies, geom="histogram")
##' 	y <- round(runif(100))
##' 	cor.test(x, y)
##' 	crl <- cor.test(runif(10), runif(10))
##' 	table(mtcars$am, mtcars$cyl)
##' 	ggplot(mtcars) + geom_point(aes(x = hp, y = mpg))'))
##' evals(txt)
##'
##' ## parsing a list of commnads
##' txt <- list('df <- mtcars',
##'		c('plot(mtcars$hp, pch = 19)','text(mtcars$hp, label = rownames(mtcars), pos = 4)'),
##'		'ggplot(mtcars) + geom_point(aes(x = hp, y = mpg))')
##' evals(txt)
##'
##' ## returning only a few classes
##' txt <- readLines(textConnection('rnorm(100)
##' 	list(x = 10:1, y = "Godzilla!")
##' 	c(1,2,3)
##' 	matrix(0,3,5)'))
##' evals(txt, classes='numeric')
##' evals(txt, classes=c('numeric', 'list'))
##'
##' ## handling warnings
##' evals('chisq.test(mtcars$gear, mtcars$hp)')
##'
##' ## handling errors
##' evals('runiff(20)')
##' evals('Old MacDonald had a farm\\dots')
##' evals('## Some comment')
##'
##' ## hooks
##' hooks <- list('numeric'=round, 'matrix'=ascii)
##' evals(txt, hooks=hooks)
##' evals('22/7', hooks=list('numeric'=rp.round))
##' evals('matrix(runif(25), 5, 5)', hooks=list('matrix'=rp.round))
##'
##' ## using rapport's default hook
##' evals('22/7', hooks=TRUE)
##'
##' ## setting default hook
##' evals(c('runif(10)', 'matrix(runif(9), 3, 3)'), hooks=list('default'=round))
##' ## round all values except for matrices
##' evals(c('runif(10)', 'matrix(runif(9), 3, 3)'), hooks=list(matrix='print', 'default'=round))
##'
##' # advanced hooks
##' fun <- function(x, asciiformat) paste(capture.output(print(ascii(x), asciiformat)), collapse='\n')
##' hooks <- list('numeric'=list(round, 2), 'matrix'=list(fun, "rest"))
##' evals(txt, hooks=hooks)
##'
##' # return only returned values
##' evals(txt, output='output')
##'
##' # return only messages (for checking syntax errors etc.)
##' evals(txt, output='msg')
##'
##' # check the length of returned values
##' evals('runif(10)', length=5)
##'
##' # note the following will not be filtered!
##' evals('matrix(1,1,1)', length=1)
##'
##' # if you do not want to let such things be evaled in the middle of a string use it with other filters :)
##' evals('matrix(1,1,1)', length=1, classes='numeric')
##'
##'	# hooks & filtering
##' evals('matrix(5,5,5)', hooks=list('matrix'=ascii), output='output')
##'
##' # evaling chunks in given environment
##' myenv <- new.env()
##' evals('x <- c(0,10)', env=myenv)
##' evals('mean(x)', env=myenv)
##' rm(myenv)
##' # note: if you had not specified 'myenv', the second 'evals' would have failed
##' evals('x <- c(0,10)')
##' evals('mean(x)')
##' }
##' @export
evals <- function(txt = NULL, ind = NULL, body = NULL, classes = NULL, hooks = NULL, length = Inf, output = c('all', 'src', 'output', 'type', 'msg'), env = NULL, ...){

    if (!xor(missing(txt), missing(ind)))
        stop('either a list of text or a list of indices should be provided')

    if (!is.null(ind)){
        if (is.null(body))
            stop('you must provide body vector')

        txt <- lapply(ind, function(x) body[x])
    }

    if (!all(output %in% c('all', 'src', 'output', 'type', 'msg')))
        stop('Wrong output option!')

    if (sum(grepl('all', output)) > 0)
        output <- c('src', 'output', 'type', 'msg')

    if (!any(is.list(hooks), is.null(hooks))) stop('Wrong list of hooks provided!')

    if (is.null(env)) env <- new.env()
    if (!is.environment(env)) stop('Wrong env paramater (not an environment) provided!')

    lapply(txt, function(src) {

        clear.devs <- function() while (!is.null(dev.list())) dev.off(as.numeric(dev.list()))

        clear.devs()
        file <- tempfile(fileext = '.png', ...)
        png(file)

        eval <- suppressWarnings(try(evaluate(src, envir = env), silent=TRUE))

        ## error handling
        error <- grep('error', lapply(eval, function(x) class(x)))
        error <- c(error, grep('error', class(eval)))
        if (length(error) != 0) {

            res <- list(src          = src,
                    output       = NULL,
                    type         = 'error',
                    msg = list(
                            messages = NULL,
                            warnings = NULL,
                            errors   = sprintf('**Error** in "%s": "%s"', paste(src, collapse=' ; '), ifelse(error==1, gsub('Error in parse.(text) = string, src = src) : <text>:[[:digit:]]:[[:digit:]]: |\n.*', '', as.character(eval[error])), paste(eval[[error]]$message, collapse=' ; '))))
            )
            return(res[output])
        }

        ## warnings
        warnings <- grep('warning', lapply(eval, function(x) class(x)))
        if (length(warnings) == 0) {
            warnings <- NULL
        } else {
            ##warnings <- sprintf('**Warning** in "%s": "%s"', paste(src, collapse=' ; '), names(warnings()[1]))
            warnings <- sprintf('**Warning** in "%s": "%s"', paste(src, collapse=' ; '), paste(sapply(eval[warnings], function(x) x$message), collapse = " + "))
        }

        ## good code survived!
        graph <- ifelse(is.na(file.info(file)$size), FALSE, file)
        returns <- length(eval) > length(src)
        if (returns) {
            if (is.logical(graph)) returns <- suppressWarnings(eval(parse(text = src), envir = env))
        } else {
            returns <- NULL
        }
        if (is.character(graph)) {
            returns <- graph
            class(returns) <- "image"
        }
        clear.devs()

        ## check length
        if (length(returns) > length) returns <- NULL

        ## check classes
        if (!is.null(classes))
            if (!(class(returns) %in% classes))
                returns <- NULL

        ## run hooks if specified
        if (!is.null(hooks))
            ## Q: why not inherits(returns, names(hooks)) ?
            if (class(returns) %in% names(hooks)) {
                fn <- hooks[[class(returns)]]; params <- list(returns)
                if (is.list(fn)) {
                    params <- list(returns, fn[[-1]])
                    fn <- fn[[1]]
                }
                returns <- do.call(fn, params)
            } else {
                if ('default' %in% names(hooks)) {
                    fn <- hooks[['default']]; params <- list(returns)
                    if (is.list(fn)) {
                        params <- list(returns, fn[[-1]])
                        fn <- fn[[1]]
                    }
                    returns <- do.call(fn, params)
                }
            }

        ## return list at last
        res <- list(src      = src,
                    output   = returns,
                    type     = class(returns),
                    msg      = list(
                        messages = NULL,
                        warnings = warnings,
                        errors   = NULL)
                    )
        return(res[output])
    })
}
