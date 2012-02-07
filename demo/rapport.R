require(rapport)
demo.opt <- getOption("demo.ask"); dev.ask <- getOption("device.ask.default"); replay.opt <- getOption("graph.replay"); record.opt <- getOption("graph.record"); options("demo.ask" = FALSE); options("device.ask.default" = FALSE)
next.please <- function(msg = "Press ENTER to continue: ") invisible(readline(msg))


########################################################################################
##                                                                                    ##
##    Welcome to rapport demo!                                                        ##
##                                                                                    ##
## You will find some simple rapport calls below, for more details and tutorials      ##
## please check out our homepage at:                                                  ##
##                                                                                    ##
##                          http://rapport-package.info                               ##
##                                                                                    ##
## NOTE: If you get "Hit <Return> to see next plot:" messages while running this demo ##
## (usually happens on a Windows machine), please rerun the demo with `ask = FALSE`:  ##
##                                                                                    ##
##                           demo(rapport, ask = FALSE)                               ##
##                                                                                    ##
########################################################################################


##################################################################################################
##                                                                                              ##
## In order to render a template you should call \code{rapport} with some input specifications. ##
## To make this easy, check out the example commands of various templates:                      ##
##                                                                                              ##
##       tpl.meta('example')$example                                                            ##
##                                                                                              ##
##################################################################################################


next.please()
tpl.meta('example')$example


#####################################################
##                                                 ##
## Let us run the first example of 'example.tpl'.  ##
##                                                 ##
## Will run:                                       ##
##                                                 ##
##      tpl.example('example', 1)                  ##
##                                                 ##
## Which is equivalent to:                         ##
##                                                 ##
##      rapport("example", ius2008, var='leisure') ##
##                                                 ##
#####################################################


next.please()
tpl.example('example', 1)


#######################################################################################
##                                                                                   ##
## In our previous example, we provided "leisure" variable to the template.          ##
## In the same manner you can provide other inputs. See `?tpl.inputs` for details.   ##
##                                                                                   ##
## OK, let's see other templates. We'll list all templates bundled with the package: ##
##                                                                                   ##
## Will run:                                                                         ##
##                                                                                   ##
##      tpl.list()                                                                   ##
##                                                                                   ##
#######################################################################################


next.please()
tpl.list()


##############################################################################
##                                                                          ##
## OK, 'correlations.tpl' seems interesting, let us run a template example! ##
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
## Or let us run this template against the variables from `mtcars` dataset:     ##
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
## The last line is the path of the generated image which would be added        ##
## to the exported document.                                                    ##
##                                                                              ##
## If you would rather not export the report first but would just like to       ##
## check out the generated images, please run `rapport` with custom options:    ##
##                                                                              ##
##     * graph.record = TRUE                                                    ##
##     * graph.replay = TRUE                                                    ##
##                                                                              ##
## This would tell `rapport` to save generated images and show them in the      ##
## the graphics device while printing. This would also let you resize images    ##
## on the fly.                                                                  ##
##                                                                              ##
## Will run:                                                                    ##
##                                                                              ##
##      options('graph.record' = TRUE)                                          ##
##      options('graph.replay' = TRUE)                                          ##
##      rapport('correlations', data=mtcars, vars=c('mpg', 'hp', 'wt', 'qsec')) ##
##                                                                              ##
##################################################################################


next.please()
options('graph.record' = TRUE)
options('graph.replay' = TRUE)
report <- rapport('correlations', data=mtcars, vars=c('mpg', 'hp', 'wt', 'qsec'))
report


############################################################################################################
##                                                                                                        ##
## And let us export this report to OpenDocument format with the resized image:                           ##
##                                                                                                        ##
## Will run:                                                                                              ##
##                                                                                                        ##
##      tpl.export(report, format = 'odt')                                                                ##
##                                                                                                        ##
## NOTE: this requires pandoc to be installed!                                                            ##
##                                                                                                        ##
############################################################################################################


next.please()
tpl.export(report, format = 'odt')


############################################################################################################
##                                                                                                        ##
## Or call an easy wrapper to get the HTML export of the document in one run with hi-res images attached: ##
##                                                                                                        ##
## Will run:                                                                                              ##
##                                                                                                        ##
##      rapport.html('correlations', data=mtcars, vars=c('mpg', 'hp', 'wt', 'qsec'), graph.hi.res = TRUE) ##
##                                                                                                        ##
## NOTE: this requires pandoc to be installed!                                                            ##
##                                                                                                        ##
############################################################################################################


next.please()
rapport.html('correlations', data=mtcars, vars=c('mpg', 'hp', 'wt', 'qsec'), graph.hi.res = TRUE)


rm(next.please); rm(report); options("demo.ask" = demo.opt); options("graph.replay" = replay.opt); options("graph.record" = record.opt); options("device.ask.default" = dev.ask)


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
