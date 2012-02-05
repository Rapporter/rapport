require(rapport)

## To use rapport you should call a template by \code{rapport} with some defined variables.
## To make this easy, check out the example commands of different templates, eg.:
## Will run: tpl.meta('example')$example
readline('Press ENTER to continue!')
tpl.meta('example')$example


## Let us run the first example of 'example.tpl'.
## Will run: tpl.example('example', 1)
## Equivalent to running the first command of the above listed.
readline('Press ENTER to continue!')
tpl.example('example', 1)

## And find out other templates too!
## Will run: tpl.list() 
readline('Press ENTER to continue!')
tpl.list()

## Ok, 'correlations.tpl' seems interesting, let us run an example of that!
## Will run: tpl.example('correlations')
readline('Press ENTER to continue!')
tpl.example('correlations')

## And check out the HTML export of *all* examples!
## Will run: tpl.export(tpl.example('correlations', 'all'))
## NOTE: this needs pandoc to be installed!
readline('Press ENTER to continue!')
tpl.export(tpl.example('correlations', 'all'))

## Or let us run this template against our custom data:
## Will run: rapport('correlations', data=mtcars, vars=c('mpg', 'hp', 'wt', 'qsec')) 
readline('Press ENTER to continue!')
rapport('correlations', data=mtcars, vars=c('mpg', 'hp', 'wt', 'qsec')) 

## And an easy wrapper to get the HTML export of the document in one run:
## Will run: rapport.html('correlations', data=mtcars, vars=c('mpg', 'hp', 'wt', 'qsec')) 
## NOTE: this needs pandoc to be installed!
rapport.html('correlations', data=mtcars, vars=c('mpg', 'hp', 'wt', 'qsec'))
 
## Do not forget to check out the docs located @ \url{http://rapport-package.info}.
## Thanks for your kind attention!
