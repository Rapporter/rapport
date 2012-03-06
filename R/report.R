#' Method based reporting
#' @param ... 
#' @export
report <- function (...) {
    UseMethod("report")
}


#' Report a numeric object
#' @param x 
#' @param digits 
#' @param decimal.mark 
#' @param tpl 
#' @param ... 
#' @examples \dontrun{
#' report(pi)
#' report(pi, 20)
#' report(pi, 20)
#' report(pi, 5, ',')
#' report(pi, decimal.mark = '|')
#' report(1:10/3, decimal.mark = '|')
#' report(matrix(1:25, 5, 5))
#' }
#' @export
report.numeric <-function(x, digits = 5, decimal.mark = '.', tpl = 'classes/numeric.tpl', ...){
    if (is.null(tryCatch(rapport:::tpl.find(tpl), error = function(e) NULL)))
        stop('Template not found!')
    rapport(tpl, x = x, digits = digits, decimal.mark = decimal.mark, ...);
}


#' Report a matrix
#' @param x 
#' @param tpl 
#' @param ... 
#' @examples \dontrun{
#' report(matrix(1:25, 5, 5))
#' report(matrix(1:25/3, 5, 5))
#' }
#' @export
report.matrix <-function(x, tpl = 'classes/matrix.tpl', ...){
    if (is.null(tryCatch(rapport:::tpl.find(tpl), error = function(e) NULL)))
        stop('Template not found!')
    rapport(tpl, x = x, ...);
}
