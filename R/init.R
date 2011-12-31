.onLoad <- function(libname, pkgname)
{
    options('rp.user'  = '(Username not set)')
    options('rp.email' = '(E-mail address not set)')

    options('rp.decimal'       = as.numeric(options('digits')))
    options('rp.decimal.mark'  = '.')
    options('rp.color.palette' = 'default')
    options('rp.colorize'      = FALSE)
#    options('rp.active.data'   = mtcars) # this should be changed to demo.data or smth
    options('asciiType'        = 'pandoc')

    ## generate static encryption key
    options('.encrypt.chars'   = paste(c(LETTERS, letters, 0:9, ' ', '(', ')', '=', '~', '.', '+', '"', "'",'$'), collapse = ""))
    set.seed(1956)
    options('.encrypt.key'     = paste(sample(c(LETTERS, letters, 0:9,'=','|','_','.',',','*','$',':',';','~'), nchar(getOption('.encrypt.chars'))), collapse=''))

    ## ## stats options
    ## options('rp.stats' = c(
    ##         digits = 2,
    ##         na.rm  = TRUE
    ##         ))

    ## ## graphic options
    ## options('rp.graphs' = c(
    ##         rp.color.palette = 'default',
    ##         rp.colorize = FALSE
    ##        ))

    ## tag regexes
    options('rp.tags' = c(
            chunk.open    = '^<%$',
            chunk.close   = '^%>$',
            inline.open   = '<%=?',
            inline.close  = '-?%>',
            header.open   = '^<!--head$',
            header.close  = '^head-->$',
            comment.open  = '<!--',
            comment.close = '-->'
            ))
}

## also add default plot image dimensions

