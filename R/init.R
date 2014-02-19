.onLoad <- function(libname, pkgname)
{

    ## file path and name settings
    options('rapport.file.name'          = 'rapport-%T-%N-%n')
    options('rapport.file.path'          = tempdir())

    ## tpl username
    options('rapport.user'  = {
        if (is.empty(getOption('rapport.user')))
            'Anonymous'
        else
            getOption('rapport.user')
    })

    ## use labels
    ## IMO, this should be implemented for all functions (sometimes you may not want labels)
    options('rapport.use.labels' = TRUE)

    ## paths settings
    options('rapport.paths' = NULL)

    ## pander options
    eO  <- getOption('evals')
    eO$graph.unify <- TRUE
    options('evals' = eO)

    ## image format/envir settings
    options('rapport.graph.replay'        = FALSE) # TODO: fix on Win platform!

    ## tag regexes
    ## TODO: user customized "brew" tags should be added here
    options('rapport.tags' = c(
                header.open   = '^<!--head$',
                header.close  = '^head-->$',
                comment.open  = '<!--',
                comment.close = '-->'
                ))

}
