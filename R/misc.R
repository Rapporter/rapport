##########################
## miscelaneous helpers ##
##########################


#' Variables
#'
#' From \emph{rapport}'s point of view, a \code{variable} is a non-\code{NULL} atomic vector that has no dimension attribute (see \code{dim} for details). This approach bypasses \code{factor} issues with \code{\link{is.vector}}, and also eliminates multidimensional vectors, such as matrices and arrays.
#' @param x an object to be checked for "variable" format
#' @return a logical value indicating that provided object is a "variable"
#' @examples
#' is.variable(rnorm(100))  # [1] TRUE
#' is.variable(LETTERS)     # [1] TRUE
#' is.variable(NULL)        # [1] FALSE
#' is.variable(mtcars)      # [1] FALSE
#' is.variable(HairEyeColor[, , 1])  # [1] FALSE
#' is.variable(list())      # [1] FALSE
#' @export
is.variable <- function(x){
    if (missing(x))
        stop('test object not provided')
    is.atomic(x) & !is.null(x) & is.null(dim(x))
}


#' Tabular Structure
#'
#' Checks if object has "tabular" structure (not to confuse with \code{\link{table}}) - in this particular case, that means \code{\link{matrix}} and \code{\link{data.frame}} objects only.
#' @param x an object to be checked for "tabular" format
#' @return a logical value indicating that provided object has tabular structure
#' @examples
#' is.tabular(HairEyeColor[, , 1])  # [1] TRUE
#' is.tabular(mtcars)               # [1] TRUE
#' is.tabular(table(mtcars$cyl))    # [1] FALSE
#' is.tabular(rnorm(100))           # [1] FALSE
#' is.tabular(LETTERS)              # [1] FALSE
#' is.tabular(pi)                   # [1] FALSE
#' @export
is.tabular <- function(x){
    if (missing(x))
        stop('no object to test table')
    inherits(x, c('matrix', 'data.frame')) && length(dim(x)) == 2
}


#' Percent
#'
#' Appends a percent sign to provided numerical value. Rounding is carried out according to value passed in \code{decimals} formal argument (defaults to value specified in \code{panderOptions('digits')}).
#' @param x a numeric value that is to be rendered to percent
#' @param digits an integer value indicating number of decimal places
#' @param type a character value indicating whether percent or proportion value was provided (partial match is allowed)
#' @param check.value perform a sanity check to see if provided numeric value is correct (defaults to \code{TRUE})
#' @return a character value with formatted percent
#' @export
pct <- function(x, digits = panderOptions('digits'), type = c('percent', '%', 'proportion'), check.value = TRUE){

    if (!is.numeric(x))
        stop('only numeric values should be provided')

    val <- switch(match.arg(type),
                  proportion = {
                      if (check.value)
                          stopifnot(all(x >= 0 & x <= 1))
                      x * 100
                  },
                  '%'=,
                  percent = {
                      if (check.value)
                          stopifnot(all(x >= 0 & x <= 100))
                      x
                  },
                  stop('unsupported number format')
                  )

    dec <- ifelse(is.null(digits), 0, digits)
    fmt <- paste('%.', dec, 'f%%', sep = '')

    sprintf(fmt, val)
}


#' Create Formula from Strings
#'
#' Takes multiple character arguments as left and right-hand side arguments of a formula, and concatenates them in a single string.
#' @param left a string with left-hand side formula argument
#' @param right a character vector with right-hand side formula arguments
#' @param join.left concatenation string for elements of character vector specified in \code{left}
#' @param join.right concatenation string for elements of character vector specified in \code{right}
#' @examples
#' fml("hp", c("am", "cyl"))    # "hp ~ am + cyl"
#' @export
fml <- function(left, right, join.left = ' + ', join.right = ' + '){
    sprintf('%s ~ %s', paste(left, collapse = join.left), paste(right, collapse = join.right))
}


########################################
## undocumented functions
##  ->  (not to export in final release)
########################################


## http://stackoverflow.com/questions/8379570/get-functions-title-from-documentation
pkg_topic <- function(package, topic, file = NULL) {
                                        # Find "file" name given topic name/alias
    if (is.null(file)) {
        topics <- pkg_topics_index(package)
        topic_page <- subset(topics, alias == topic, select = file)$file

        if(length(topic_page) < 1)
            topic_page <- subset(topics, file == topic, select = file)$file

        stopifnot(length(topic_page) >= 1)
        file <- topic_page[1]
    }

    rdb_path <- file.path(system.file("help", package = package), package)
    tools:::fetchRdDB(rdb_path, file)
}

## http://stackoverflow.com/questions/8379570/get-functions-title-from-documentation
pkg_topics_index <- function(package) {
    help_path <- system.file("help", package = package)

    file_path <- file.path(help_path, "AnIndex")
    if (length(readLines(file_path, n = 1)) < 1) {
        return(NULL)
    }

    topics <- read.table(file_path, sep = "\t",
                         stringsAsFactors = FALSE, comment.char = "", quote = "", header = FALSE)

    names(topics) <- c("alias", "file")
    topics[complete.cases(topics), ]
}
