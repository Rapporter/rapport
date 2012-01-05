.onLoad <- function(libname, pkgname)
{
    options('rp.user'  = '(Username not set)')
    options('rp.email' = '(E-mail address not set)')

    options('rp.decimal'       = 4)
    options('rp.decimal.mark'  = '.')
    options('rp.color.palette' = 'default')
    options('rp.colorize'      = FALSE)
    options('asciiType'        = 'pandoc')

    ## generate static encryption key
    options('.encrypt.chars'   = paste(c(LETTERS, letters, 0:9, ' ', '(', ')', '=', '~', '.', '+', '"', "'",'$', '#'), collapse = ""))
    set.seed(1956)
    options('.encrypt.key'     = paste(sample(c(LETTERS, letters, 0:9,'=','|','_','.',',','*','$',':',';','~','-'), nchar(getOption('.encrypt.chars'))), collapse=''))

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
