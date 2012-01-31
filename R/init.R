.onLoad <- function(libname, pkgname)
{
    ## rapport settings
    options('rapport.mode'     = 'normal')
    options('asciiType'        = 'pandoc')

    ## encrypt/decrypt key generation settings
    options('.encrypt.chars'   = paste(c(LETTERS, letters, 0:9, ' ', '(', ')', '=', '~', '.', '+', '"', "'",'$', '#'), collapse = ""))
    set.seed(1956)
    options('.encrypt.key'     = paste(sample(c(LETTERS, letters, 0:9,'=','|','_','.',',','*','$',':',';','~','-'), nchar(getOption('.encrypt.chars'))), collapse=''))

    ## tpl username/email settings
    ## username
    options('tpl.user'  = {
        if (is.empty(getOption('tpl.user'), TRUE, leading = TRUE))
            'Anonymous'
        else
            getOption('tpl.user')
    })
    ## email
    options('tpl.email' = {
        if (is.empty(getOption('tpl.email'), TRUE, leading = TRUE))
            ''
        else
            getOption('tpl.email')
    })

    ## use labels
    ## IMO, this should be implemented for all functions (sometimes you may not want labels)
    options('rp.use.labels' = TRUE)

    ## paths settings
    options('tpl.paths' = NULL)

    ## "rp" prefix settings
    options('rp.date.format'   = "%Y/%m/%d %X")
    options('rp.decimal'       = 4)
    options('rp.decimal.short' = 2)
    options('rp.decimal.mark'  = '.')

    ## style settings
    options('style.theme'         = 'theme.rapport')
    ## other theme options:
    ##  * standard.theme() from lattice (default theme)
    ##  * ggplot2like() from latticeExtra package
    ##  * theEconomist.theme() from latticeExtra package
    ##  * custom.theme.black() from latticist package
    ##  * set custom theme to an R object, details: ?trellis.par.get()
    options('style.grid'          = 'both')           # to draw grids for 'x', 'y', 'both' axis or 'none'
    options('style.font'          = 'Helvetica')
    options('style.color.palette' = 'default')      # for other palette options, see: ?brewer.pal.info
    options('style.colorize'      = FALSE)
    ## image format settings
    options('graph.format'        = 'png')
    options('graph.width'         = 480)
    options('graph.height'        = 480)
    options('graph.res'           = 72)
    options('graph.hi.res'        = FALSE)

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

    ## rp_helpers stuff
    ## p()
    options('p.wrap'   = '_')     # wrapping character (italic by default)
    options('p.sep'    = ', ')    # separator: comma followed by space
    options('p.copula' = 'and')   # last separator (copula)
}
