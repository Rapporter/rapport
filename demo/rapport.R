require(rapport)
require(pander)
demo.opt <- getOption("demo.ask"); dev.ask <- getOption("device.ask.default"); replay.opt <- getOption("rapport.graph.replay"); record.opt <- evalsOptions('graph.recordplot'); options("demo.ask" = FALSE); options("device.ask.default" = FALSE)
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
##       rapport.meta('Example')$example                                                        ##
##                                                                                              ##
##################################################################################################


next.please()
rapport.meta('Example')$example


#########################################################
##                                                     ##
## Let us run the first example of 'Example.rapport'.  ##
##                                                     ##
## Will run:                                           ##
##                                                     ##
##      rapport.example('Example', 1)                  ##
##                                                     ##
## Which is equivalent to:                             ##
##                                                     ##
##      rapport("Example", ius2008, v = 'leisure')     ##
##                                                     ##
#########################################################


next.please()
rapport.example('Example', 1)


############################################################################################
##                                                                                        ##
## In our previous example, we provided "leisure" variable to the template.               ##
## In the same manner you can provide other inputs. See `?rapport.inputs` for details.    ##
##                                                                                        ##
## OK, let's see other templates. We'll list all templates bundled with the package:      ##
##                                                                                        ##
## Will run:                                                                              ##
##                                                                                        ##
##      rapport.ls()                                                                      ##
##                                                                                        ##
############################################################################################


next.please()
rapport.ls()


#################################################################################
##                                                                             ##
## OK, 'Correlation.rapport' seems interesting, let us run a template example! ##
##                                                                             ##
## Will run:                                                                   ##
##                                                                             ##
##      rapport.example('Correlation')                                         ##
##                                                                             ##
#################################################################################


next.please()
rapport.example('Correlation')


################################################################
##                                                            ##
## And check out the HTML export of *all* examples!           ##
##                                                            ##
## Will run:                                                  ##
##                                                            ##
##    rapport.export(rapport.example('Correlation', 'all'))   ##
##                                                            ##
## NOTE: this requires Pandoc to be installed!                ##
##       Please check out our INSTALLATION file for details.  ##
##                                                            ##
################################################################


next.please()
rapport.export(rapport.example('Correlation', 'all'))


##################################################################################
##                                                                              ##
## Or let us run this template against the variables from `mtcars` dataset:     ##
##                                                                              ##
## Will run:                                                                    ##
##                                                                              ##
##      rapport('Correlation', data=mtcars, vars=c('mpg', 'hp', 'wt', 'qsec'))  ##
##                                                                              ##
##################################################################################


next.please()
rapport('Correlation', data = mtcars, vars = c('mpg', 'hp', 'wt', 'qsec'))


##################################################################################
##                                                                              ##
## The last line is the path of the generated image which would be added        ##
## to the exported document.                                                    ##
##                                                                              ##
## If you would rather not export the report first but would just like to       ##
## check out the generated images, please run `rapport` with custom options:    ##
##                                                                              ##
##     * evalsOptions('graph.recordplot', TRUE)                                 ##
##     * options('rapport.graph.replay' = TRUE)                                 ##
##                                                                              ##
## This would tell `rapport` to save generated images and show them in the      ##
## the graphics device while printing. This would also let you resize images    ##
## on the fly.                                                                  ##
##                                                                              ##
## Will run:                                                                    ##
##                                                                              ##
##      evalsOptions('graph.recordplot', TRUE)                                  ##
##      options('rapport.graph.replay' = TRUE)                                  ##
##      rapport('Correlation', data=mtcars, vars=c('mpg', 'hp', 'wt', 'qsec'))  ##
##                                                                              ##
##################################################################################


next.please()
evalsOptions('graph.recordplot', TRUE)
options('rapport.graph.replay' = TRUE)
report <- rapport('Correlation', data = mtcars, vars = c('mpg', 'hp', 'wt', 'qsec'))
report


############################################################################################################
##                                                                                                        ##
## And let us export this report to OpenDocument format with the resized image:                           ##
##                                                                                                        ##
## Will run:                                                                                              ##
##                                                                                                        ##
##    rapport.export(report, format = 'odt')                                                              ##
##                                                                                                        ##
## NOTE: this requires Pandoc to be installed!                                                            ##
##                                                                                                        ##
############################################################################################################


next.please()
rapport.export(report, format = 'odt')


############################################################################################################
##                                                                                                        ##
## Or call an easy wrapper to get the HTML export of the document in one run with hi-res images attached: ##
##                                                                                                        ##
## Will run:                                                                                              ##
##                                                                                                        ##
##      rapport.html('Correlation', data=mtcars, vars=c('mpg', 'hp', 'wt', 'qsec'), graph.hi.res = TRUE)  ##
##                                                                                                        ##
## NOTE: this requires Pandoc to be installed!                                                            ##
##                                                                                                        ##
############################################################################################################


next.please()
rapport.html('Correlation', data = mtcars, vars = c('mpg', 'hp', 'wt', 'qsec'), graph.hi.res = TRUE)


rm(next.please); rm(report); options("demo.ask" = demo.opt); options("rapport.graph.replay" = replay.opt); evalsOptions("graph.recordplot", record.opt); options("device.ask.default" = dev.ask)


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
