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

    ## pander options
    eO  <- getOption('evals')
    eO$graph.unify <- TRUE
    options('evals' = eO)

    ## image format/envir settings
    options('graph.replay'        = FALSE) # TODO: fix on Win platform!

    ## tag regexes
    ## TODO: user customized "brew" tags should be added here
    options('rp.tags' = c(
                header.open   = '^<!--head$',
                header.close  = '^head-->$',
                comment.open  = '<!--',
                comment.close = '-->'
                ))

}
