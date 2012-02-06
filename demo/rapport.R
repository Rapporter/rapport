require(rapport)
next.please <- function(msg = "Press ENTER to continue: ") invisible(readline(msg))

###################################
##                               ##
##    Welcome to rapport demo    ##
##                               ##
###################################


########################################################################################
##                                                                                    ##
## You will find some simple rapport calls below, for more details and tutorials      ##
## please check out our homepage at:                                                  ##
##                                                                                    ##
##                       http://rapport-package.info                                  ##
##                                                                                    ##
## NOTE: If you get "Hit <Return> to see next plot:" messages while running this demo ##
## (usually happens on a Windows machines), please rerun the demo with `ask = FALSE`: ##
##                                                                                    ##
##                       demo(rapport, ask = FALSE)                                   ##
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


#######################################
##                                   ##
## And find out other templates too! ##
##                                   ##
## Will run:                         ##
##      tpl.list()                   ##
##                                   ##
#######################################


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
rm(next.please)
rapport.html('correlations', data=mtcars, vars=c('mpg', 'hp', 'wt', 'qsec'), graph.hi.res = TRUE)


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
