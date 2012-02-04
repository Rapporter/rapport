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

## Ok, 'anova.tpl' seems interesting, let us run the example of that!
## Will run: tpl.example('anova', 'all')
readline('Press ENTER to continue!')
tpl.example('anova', 'all')

## And check out the HTML export of that *rapport*!
## Will run: tpl.export(tpl.example('anova', 'all'))
readline('Press ENTER to continue!')
tpl.export(tpl.example('anova', 'all'))

## Or let us run this template against our custom data:
## Will run: rapport('anova', data=ius2008, resp = 'edu', fac = 'dwell') 
readline('Press ENTER to continue!')
rapport('anova', data=ius2008, resp = 'edu', fac = 'dwell')

## And an easy wrapper to get the HTML export of the document in one run:
## Will run: rapport.html('anova', data=ius2008, resp = 'edu', fac = 'dwell') 
rapport.html('anova', data=ius2008, resp = 'edu', fac = 'dwell')

## Do not forget to check out the docs located @ \url{http://rapport-package.info}.
## Thanks for your kind attention!
