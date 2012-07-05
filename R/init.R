.onLoad <- function(libname, pkgname)
{

    ## file path and name settings
    options('rp.file.name'          = 'rapport-%T-%N-%n')
    options('rp.file.path'          = tempdir())

    ## tpl username
    options('tpl.user'  = {
        if (is.empty(getOption('tpl.user'), TRUE, leading = TRUE))
            'Anonymous'
        else
            getOption('tpl.user')
    })

    ## use labels
    ## IMO, this should be implemented for all functions (sometimes you may not want labels)
    options('rp.use.labels' = TRUE)

    ## paths settings
    options('tpl.paths' = NULL)

    ## style settings
    options('style.theme'         = 'theme.rapport')
    ## other theme options:
    ##  * standard.theme() from lattice (default theme)
    ##  * ggplot2like() from latticeExtra package
    ##  * theEconomist.theme() from latticeExtra package
    ##  * custom.theme.black() from latticist package
    ##  * set custom theme to an R object, details: ?trellis.par.get()
    options('style.grid'          = 'both')         # to draw grids for 'x', 'y', 'both' axis or 'none'
    if (.Platform$OS.type == "windows")             # set Windows fonts if necessary
        grDevices:::windowsFonts(Helvetica = grDevices:::windowsFont("TT Helvetica"))
    options('style.font'          = 'Helvetica')
    options('style.color.palette' = 'default')      # for other palette options, see: ?brewer.pal.info
    options('style.colorize'      = FALSE)

    ## image format/envir settings
    options('graph.replay'        = FALSE) # TODO: fix on Win platform!

    ## tag regexes
    ## TODO: deprecated? Do we use has.tags etc.? @aL3xa: please check out!
    ## As far as I know `tpl.body`, `tpl.header` and `grab.chunks`, `get.tags`, `tags.misplaced`, `purge.comments` builds on that
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
