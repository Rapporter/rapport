require(rapport)

## To use rapport you should call a template by \code{rapport} with some defined variables.
## To make this easy, check out the example commands of different templates, eg.:
## Will run: tpl.meta('example')$example
readline('Press ENTER to continue!')
tpl.meta('example')$example


## Let us run the first example of 'example.tpl'
## Will run: tpl.example('example', 1)
## Equivalent to running the first command of the above listed.
readline('Press ENTER to continue!')
tpl.example('example', 1)

## And find out other templates too!
## Will run: tpl.list() 
readline('Press ENTER to continue!')
tpl.list()

## Ok, 'correlations.tpl' seems interesting, let us run the example of that!
## Will run: tpl.example('correlations')
readline('Press ENTER to continue!')
tpl.example('correlations')

## Or let us run this template against our custom data:
## Will run: rapport('correlations', data=mtcars, vars=c('hp', 'mpg', 'wt')) 
readline('Press ENTER to continue!')
rapport('correlations', data=mtcars, vars=c('hp', 'mpg', 'wt'))

## Do not forget to check out the docs located @ \url{http://al3xa.github.com/rapport/}.
## Thanks for your kind attention!
