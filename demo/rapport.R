require(rapport)
demo.opt <- getOption("demo.ask"); replay.opt <- getOption("graph.replay"); record.opt <- getOption("graph.record"); options("demo.ask" = FALSE)
next.please <- function(msg = "Press ENTER to continue: ") invisible(readline(msg))

########################################################################################
##                                                                                    ##
##    Welcome to rapport demo!                                                        ##
##                                                                                    ##
########################################################################################
##                                                                                    ##
## You will find some simple rapport calls below, for more details and tutorials      ##
## please check out our homepage at:                                                  ##
##                                                                                    ##
##                       http://rapport-package.info                                  ##
##                                                                                    ##
########################################################################################



##############################################################################################
##                                                                                          ##
## To use rapport you should call a template by \code{rapport} with some defined variables. ##
## To make this easy, check out the example commands of different templates:                ##
##                                                                                          ##
##       tpl.meta('example')$example                                                        ##
##                                                                                          ##
##############################################################################################


next.please()
tpl.meta('example')$example


###########################################################################
##                                                                       ##
## Let us run the first example of 'example.tpl'.                        ##
## Will run:                                                             ##
##                                                                       ##
##      tpl.example('example', 1)                                        ##
##                                                                       ##
## Which is equivalent to running the first command of the above listed: ##
##                                                                       ##
##      rapport("example", ius2008, var='leisure')                       ##
##                                                                       ##
###########################################################################


next.please()
tpl.example('example', 1)


############################################
##                                        ##
## You can see here some predefined text  ##
## updated by ius2008$leisure parameters. ##
##                                        ##
## That is the spiriot of rapport :)      ##
##                                        ##
## OK, find out other templates too!      ##
## Let us list all available templates:   ##
##                                        ##
## Will run:                              ##
##      tpl.list()                        ##
##                                        ##
#########################################>##


next.please()
tpl.list()


##############################################################################
##                                                                          ##
## OK, 'correlations.tpl' seems interesting, let us run an example of that! ##
##                                                                          ##
## Will run:                                                                ##
##                                                                          ##
##      tpl.example('correlations')                                         ##
##                                                                          ##
##############################################################################


next.please()
tpl.example('correlations')


#########################################################
##                                                     ##
## And check out the HTML export of *all* examples!    ##
##                                                     ##
## Will run:                                           ##
##                                                     ##
##    tpl.export(tpl.example('correlations', 'all'))   ##
##                                                     ##
## NOTE: this requires pandoc to be installed!         ##
##                                                     ##
#########################################################


next.please()
tpl.export(tpl.example('correlations', 'all'))


##################################################################################
##                                                                              ##
## Or let us run this template against our custom data:                         ##
##                                                                              ##
## Will run:                                                                    ##
##                                                                              ##
##      rapport('correlations', data=mtcars, vars=c('mpg', 'hp', 'wt', 'qsec')) ##
##                                                                              ##
##################################################################################


next.please()
rapport('correlations', data=mtcars, vars=c('mpg', 'hp', 'wt', 'qsec'))


##################################################################################
##                                                                              ##
## The last line is the path of a generated image which would be added          ##
## to the exported document.                                                    ##
##                                                                              ##
## If you would rather not export the report first but would like to easily     ##
## check out the generated images, please run `rapport` with custom options:    ##
##                                                                              ##
##     * graph.record = TRUE                                                    ##
##     * graph.replay = TRUE                                                    ##
##                                                                              ##
## These would tell `rapport` to save generated images and show them in the     ##
## the graphics device while printing. This would also let you resize images    ##
## on the fly.                                                                  ##
##                                                                              ##
## Will run:                                                                    ##
##                                                                              ##
##      options('graph.record' = TRUE)                                          ##
##      options('graph.record' = TRUE)                                          ##
##      rapport('correlations', data=mtcars, vars=c('mpg', 'hp', 'wt', 'qsec')) ##
##                                                                              ##
##################################################################################


next.please()
options('graph.record' = TRUE)
options('graph.replay' = TRUE)
rapport('correlations', data=mtcars, vars=c('mpg', 'hp', 'wt', 'qsec'))


############################################################################################################
##                                                                                                        ##
## And an easy wrapper to get the HTML export of the document in one run with hi-res images attached:     ##
##                                                                                                        ##
## Will run:                                                                                              ##
##                                                                                                        ##
##      rapport.html('correlations', data=mtcars, vars=c('mpg', 'hp', 'wt', 'qsec'), graph.hi.res = TRUE) ##
##                                                                                                        ##
## NOTE: this needs pandoc to be installed!                                                               ##
##                                                                                                        ##
############################################################################################################


next.please()
rapport.html('correlations', data=mtcars, vars=c('mpg', 'hp', 'wt', 'qsec'), graph.hi.res = TRUE)

rm(next.please); options("demo.ask" = demo.opt); options("graph.replay" = replay.opt); options("graph.record" = record.opt)

##############################################
##                                          ##
## ... and that would be it, no more demos! ##
##                                          ##
## Please visit "rapport" homepage:         ##
##                                          ##
##      http://rapport-package.info         ##
##                                          ##
## Thank you for your patience!             ##
##                                          ##
##               Goodbye!                   ##
##                                          ##
##############################################
