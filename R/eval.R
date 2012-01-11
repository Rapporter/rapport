##' Evals chunk(s) of R code
##'
##' This function takes either a list of integer indices which point to position of R code in \code{body} character vector, or a vector/list of strings with actual R code, then evaluates each list element, and returns a list with four elements: a character value with R code, generated output, class of generated output and possible error/warning messages. If a graph is plotted in the given text, the returned object is a string specifying the path to the saved png in temporary directory. Please see Details below.
##'
##' If input strings are given as vector or not nested list (or even only one string), the returned list's length equals to the length of the input - as each string is evalued as separate R code in the same environment. If a nested list is provided like \code{list(c('runif(1)', 'runif(1)'))} then all strings found in a list element is evaled at one run so the length of returned list equals to the length of parent list. See examples below.
##'
##' As \code{\link{evals}} tries to grab the plots internally, pleas do not run commands that set graphic device or \code{\link{dev.off()}} if you want to use \code{\link{evals}} to save the images and return the path of generated png(s). Eg. running \code{evals(c('png("/tmp/x.png")', 'plot(1:10)', 'dev.off()'))} would fail.
##'
##' Returned result values: list with the following elements
##' \itemize{
##'     \item \emph{src} - a character value with specified R code.
##'     \item \emph{output} - generated output. NULL if nothing is returned. If any string returned an R object while evaling then the \emph{last} R object will be returned as a raw R object. If a graph is plotted in the given text, the returned object is a string specifying the path to the saved png in temporary directory (see: \code{tmpfile()}). If multiple plots was run in the same run (see: nested lists as inputs above) then the last plot is saved. If graphic device was touched, then no other R objects will be returned.
##'     \item \emph{type} - class of generated output. "NULL" if nothing is returned, "image" if the graphic device was touched, "error" if some error occured.
##'     \item \emph{msg} - possible messages grabbed while evaling specified R code with the following structure:
##'     \itemize{
##'         \item \emph{messages} - string of possible diagnostic message(s)
##'         \item \emph{warnings} - string of possible warning message(s)
##'         \item \emph{errors} - string of possible error message(s)
##'     }
##' }
##'
##' Please check the examples carefully below to get a detailed overview of \code{\link{evals}}.
##' @param txt a list with character values containing R code
##' @param ind a list with numeric indices pointing to R code in \code{body}
##' @param body a character vector that contains template body
##' @param classes a vector or list of classes which should be returned. If set to NULL (by default) all R objects will be returned.
##' @param hooks list of hooks to bo run for given classes in the form of \code{list(class=fn)}. If you	would also specify some parameters of the function, a list should be provided in the form of \code{list(fn, param1, param2=NULL)} etc. So the hooks would become \code{list(class1=list(fn, param1, param2=NULL), ...)}. See example below. A default hook can be specified too by setting the class to \code{'default'}. This can be handy if you do not want to define separate methods/functions to each possible class, but automatically apply the default hook to all classes not mentioned in the list. You may also specify only one element in the list like: \code{hooks=list('default'=ascii)}.
##' @param length R object exceeding the specified length will not be returned. The default value (\code{Inf}) does not have any restrictions.
##' @param output a character vector of required returned values. See below.
##' @param env environment where evaluation takes place. If not set (by default), a new temporary environment is created.
##' @param ... optional parameters passed to \code{png(...)}
##' @return a list of parsed elements each containg: src (the command run), output (what the command returns, NULL if nothing returned, path to image file if a plot was genereted), type (class of returned object if any) and messages: warnings (if any returned	by the command run, otherwise set to NULL) and errors (if any returned by the command run, otherwise set to NULL). See Details above.
##' @author Gergely Daróczi
##' @examples \dontrun{
##' # parsing line-by-line
##' txt <- readLines(textConnection('x <- rnorm(100)
##'   runif(10)
##'   warning("You should check out rapport package!")
##'   plot(1:10)
##'   qplot(rating, data=movies, geom="histogram")
##'   y <- round(runif(100))
##'   cor.test(x, y)
##'   crl <- cor.test(runif(10), runif(10))
##'   table(mtcars$am, mtcars$cyl)
##'   ggplot(mtcars) + geom_point(aes(x = hp, y = mpg))'))
##' evals(txt)
##'
##' ## parsing a list of commnads
##' txt <- list('df <- mtcars',
##'  c('plot(mtcars$hp, pch = 19)','text(mtcars$hp, label = rownames(mtcars), pos = 4)'),
##'  'ggplot(mtcars) + geom_point(aes(x = hp, y = mpg))')
##' evals(txt)
##'
##' ## returning only a few classes
##' txt <- readLines(textConnection('rnorm(100)
##'   list(x = 10:1, y = "Godzilla!")
##'   c(1,2,3)
##    matrix(0,3,5)'))
##' evals(txt, classes='numeric')
##' evals(txt, classes=c('numeric', 'list'))
##'
##' ## handling warnings
##' evals('chisq.test(mtcars$gear, mtcars$hp)')
##' evals(list(c('chisq.test(mtcars$gear, mtcars$am)', 'pi', 'chisq.test(mtcars$gear, mtcars$hp)')))
##' evals(c('chisq.test(mtcars$gear, mtcars$am)', 'pi', 'chisq.test(mtcars$gear, mtcars$hp)'))
##'
##' ## handling errors
##' evals('runiff(20)')
##' evals('Old MacDonald had a farm\\dots')
##' evals('## Some comment')
##' evals(list(c('runiff(20)', 'Old MacDonald had a farm?')))
##' evals(c('mean(1:10)', 'no.R.function()'))
##' evals(list(c('mean(1:10)', 'no.R.function()')))
##' evals(c('no.R.object', 'no.R.function()', 'very.mixed.up(stuff)'))
##' evals(list(c('no.R.object', 'no.R.function()', 'very.mixed.up(stuff)')))
##' evals(c('no.R.object', 'Old MacDonald had a farm\\dots', 'pi'))
##' evals(list(c('no.R.object', 'Old MacDonald had a farm\\dots', 'pi')))
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
    
    ## env for running all lines of code -> eval()
    if (is.null(env)) env <- new.env()
    if (!is.environment(env)) stop('Wrong env paramater (not an environment) provided!')
    ## env for checking output before truly eval-ing -> evaluate()
    env.evaluate <- env

    lapply(txt, function(src) {

        clear.devs <- function() while (!is.null(dev.list())) dev.off(as.numeric(dev.list()))

        clear.devs()
        file <- tempfile(fileext = '.png', ...)
        png(file)

        ## running evalute for checking outputs and grabbing warnings/errors
        eval <- suppressWarnings(try(evaluate(src, envir = env.evaluate), silent=TRUE))

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
                            errors   = sprintf('**Error** in "%s": "%s"',  ifelse(paste(sapply(eval[error-1], function(x) x$src), collapse = ' + ')=='', paste(src, collapse=' + '), paste(sapply(eval[error-1], function(x) x$src), collapse = ' + ')), ifelse(class(eval)=='try-error', gsub('Error in parse.(text) = string, src = src) : <text>:[[:digit:]]:[[:digit:]]: |\n.*', '', as.character(eval[error])), paste(sapply(eval[error], function(x) x$message), collapse = " + "))))
            )
            return(res[output])
        }

        ## warnings
        warnings <- grep('warning', lapply(eval, function(x) class(x)))
        if (length(warnings) == 0) {
            warnings <- NULL
        } else
            warnings <- sprintf('**Warning** in "%s": "%s"', paste(sapply(eval[warnings], function(x) x$call), collapse = " + "), paste(sapply(eval[warnings], function(x) x$message), collapse = " + "))

        ### good code survived here!

        ### checking out wich element produced the output               ## outRageous coding starts here
        ## removing messages/errors
        eval.no.msg <- eval[sapply(eval, function(x) {if (is.list(x)) all(names(x) == 'src') else TRUE})]
        ## which elements are the sources?
        eval.sources.n <- which(sapply(eval.no.msg, function(x) {if (!is.null(names(x))) (all(names(x) == 'src')) else FALSE}))
        ## the sources
        eval.sources <- eval.no.msg[eval.sources.n]
        ## which sources do output?
        eval.sources.outputs <- eval.sources.n[which(sapply(eval.sources.n, function(x) {
                                    if (x+1 > length(eval.no.msg))
                                        FALSE
                                    else
                                        class(eval.no.msg[[x+1]]) == "character"
                                }))]
        ## which is the last element that produces output?              ## Rage /off
        if (length(eval.sources.outputs) > 0)
            eval.sources.last.outputs <- tail(eval.sources.outputs, 1)

        ## graph was produced?
        graph <- ifelse(is.na(file.info(file)$size), FALSE, file)
        ## any returned value?
        if (length(eval.sources.outputs) > 0) {
            if (is.logical(graph)) {
                ## if last element returns value (happily)
                if (eval.sources.last.outputs == tail(eval.sources.n, 1)) {
                    returns <- suppressWarnings(eval(parse(text = src), envir = env))
                } else {    # if not the last element returns the value (lame)
                    ## eval in temp environment all elements before last element that really do output
                    env.temp <- env
                    ## run commands before the last element which does output something
                    if (eval.sources.last.outputs != 1)
                        lapply(1:(which(eval.sources.last.outputs == eval.sources.n)-1), function(i) {
                            suppressWarnings(eval(parse(text = eval.sources[[i]]$src), envir = env.temp))
                        })
                    ## grab output at last with last element with output
                    returns <- suppressWarnings(eval(parse(text = eval.sources[[eval.sources.last.outputs]]$src), envir = env.temp))
                    ## and run all stuff in main environment for consistency
                    suppressWarnings(eval(parse(text = src), envir = env))
                }
            }
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
