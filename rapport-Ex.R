pkgname <- "rapport"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('rapport')

assign(".oldSearch", search(), pos = 'CheckExEnv')
cleanEx()
nameEx("check.limit")
### * check.limit

flush(stderr()); flush(stdout())

### Name: check.limit
### Title: Input Limits
### Aliases: check.limit

### ** Examples

## Not run: 
##D rapport:::check.limit("[1,20]")
##D rapport:::check.limit("[1]")
##D 
## End(Not run)



cleanEx()
nameEx("check.type")
### * check.type

flush(stderr()); flush(stdout())

### Name: check.type
### Title: Check Type
### Aliases: check.type

### ** Examples

## Not run: 
##D rapport:::check.type("factor")
##D rapport:::check.type("character[1,20]")
##D rapport:::check.type("fee, fi, foo, fam")
##D rapport:::check.type("FALSE")
## End(Not run)



cleanEx()
nameEx("decrypt")
### * decrypt

flush(stderr()); flush(stdout())

### Name: decrypt
### Title: Decrypt a string
### Aliases: decrypt

### ** Examples

## Not run: 
##D 		decrypt("loRR7KT72R=!")
##D 		strsplit(decrypt("MrhKPzRK=tBrK0rK=2g~KT~K8BoPK1BKgMKhog2KPg2A"), " ")[[1]]
##D 		eval(parse(text=decrypt("rR7~HM~Pg2B40r,KP7Rkp2o=pc")))
##D 	
## End(Not run)



cleanEx()
nameEx("encrypt")
### * encrypt

flush(stderr()); flush(stdout())

### Name: encrypt
### Title: Encrypt a string
### Aliases: encrypt

### ** Examples

## Not run: 
##D 		encrypt("Hello world!")
##D 		encrypt(paste(names(mtcars), collapse=" "))
##D 	
## End(Not run)



cleanEx()
nameEx("evals")
### * evals

flush(stderr()); flush(stdout())

### Name: evals
### Title: Evals chunk(s) of R code
### Aliases: evals

### ** Examples

## Not run: 
##D # parsing line-by-line
##D txt <- readLines(textConnection('x <- rnorm(100)
##D 	runif(10)
##D 	warning("You should check out rapport package!")
##D 	plot(1:10)
##D 	qplot(rating, data=movies, geom="histogram")
##D 	y <- round(runif(100))
##D 	cor.test(x, y)
##D 	crl <- cor.test(runif(10), runif(10))
##D 	table(mtcars$am, mtcars$cyl)
##D 	ggplot(mtcars) + geom_point(aes(x = hp, y = mpg))'))
##D evals(txt)
##D 
##D ## parsing a list of commnads
##D txt <- list('df <- mtcars',
##D 		c('plot(mtcars$hp, pch = 19)','text(mtcars$hp, label = rownames(mtcars), pos = 4)'),
##D 		'ggplot(mtcars) + geom_point(aes(x = hp, y = mpg))')
##D evals(txt)
##D 
##D ## returning only a few classes
##D txt <- readLines(textConnection('rnorm(100)
##D 	list(x = 10:1, y = "Godzilla!")
##D 	c(1,2,3)
##D 	matrix(0,3,5)'))
##D evals(txt, classes='numeric')
##D evals(txt, classes=c('numeric', 'list'))
##D 
##D ## handling warnings
##D evals('chisq.test(mtcars$gear, mtcars$hp)')
##D 
##D ## handling errors
##D evals('runiff(20)')
##D evals('Old MacDonald had a farm\...')
##D evals('## Some comment')
##D 
##D ## hooks
##D hooks <- list('numeric'=round, 'matrix'=ascii)
##D evals(txt, hooks=hooks)
##D evals('22/7', hooks=list('numeric'=rp.round))
##D evals('matrix(runif(25), 5, 5)', hooks=list('matrix'=rp.round))
##D 
##D ## using rapport's default hook
##D evals('22/7', hooks=TRUE)
##D 
##D ## setting default hook
##D evals(c('runif(10)', 'matrix(runif(9), 3, 3)'), hooks=list('default'=round))
##D ## round all values except for matrices
##D evals(c('runif(10)', 'matrix(runif(9), 3, 3)'), hooks=list(matrix='print', 'default'=round))
##D 
##D # advanced hooks
##D fun <- function(x, asciiformat) paste(capture.output(print(ascii(x), asciiformat)), collapse='\n')
##D hooks <- list('numeric'=list(round, 2), 'matrix'=list(fun, "rest"))
##D evals(txt, hooks=hooks)
##D 
##D # return only returned values
##D evals(txt, output='output')
##D 
##D # return only messages (for checking syntax errors etc.)
##D evals(txt, output='msg')
##D 
##D # check the length of returned values
##D evals('runif(10)', length=5)
##D 
##D # note the following will not be filtered!
##D evals('matrix(1,1,1)', length=1)
##D 
##D # if you do not want to let such things be evaled in the middle of a string use it with other filters :)
##D evals('matrix(1,1,1)', length=1, classes='numeric')
##D 
##D 	# hooks & filtering
##D evals('matrix(5,5,5)', hooks=list('matrix'=ascii), output='output')
##D 
##D # evaling chunks in given environment
##D myenv <- new.env()
##D evals('x <- c(0,10)', env=myenv)
##D evals('mean(x)', env=myenv)
##D rm(myenv)
##D # note: if you had not specified 'myenv', the second 'evals' would have failed
##D evals('x <- c(0,10)')
##D evals('mean(x)')
## End(Not run)



cleanEx()
nameEx("extract.meta")
### * extract.meta

flush(stderr()); flush(stdout())

### Name: extract.meta
### Title: Extract Template Metadata
### Aliases: extract.meta

### ** Examples

## Not run: 
##D     extract.metadata("Name: John Smith", "Name", "[[:alpha:]]+( [[:alpha:]]+)?")
##D     ## $name
##D     ## [1] "John Smith"
##D 
##D     extract.metadata("Name: John", "Name", "[[:alpha:]]+( [[:alpha:]]+)?")
##D     ## $name
##D     ## [1] "John"
## End(Not run)



cleanEx()
nameEx("grab.chunks")
### * grab.chunks

flush(stderr()); flush(stdout())

### Name: grab.chunks
### Title: Inline Chunk Contents
### Aliases: grab.chunks

### ** Examples

## Not run: 
##D     s <- c("As you know, pi equals <%pi%>",  "2 raised to the power of 3 is <%2^3%>")
##D     grab.chunks(s, "<%", "%>", FALSE)
##D     ## [1] "pi"  "2^3"
##D     grab.chunks(s, "<%", "%>", FALSE)
##D     ## [1] "<%pi%>"  "<%2^3%>"
## End(Not run)



cleanEx()
nameEx("guess.convert")
### * guess.convert

flush(stderr()); flush(stdout())

### Name: guess.convert
### Title: Guess Mode
### Aliases: guess.convert

### ** Examples

## Not run: 
##D storage.mode(guess.mode("234"))
##D 
##D storage.mode(guess.mode("234.23"))
##D 
##D storage.mode(guess.mode("234.23.234"))
##D 
##D storage.mode(guess.mode("TRUE"))
##D 
##D storage.mode(guess.mode("TRUE         "))
##D 
##D storage.mode(guess.mode("     TRUE         ", TRUE))
##D 
## End(Not run)



cleanEx()
nameEx("is.string")
### * is.string

flush(stderr()); flush(stdout())

### Name: is.string
### Title: Strings
### Aliases: is.string

### ** Examples

is.string("foobar")          # [1] TRUE
    is.string(1)                 # [1] FALSE
    is.string(c("foo", "bar"))   # [1] FALSE



cleanEx()
nameEx("makes.plot")
### * makes.plot

flush(stderr()); flush(stdout())

### Name: makes.plot
### Title: Check plot creation
### Aliases: makes.plot

### ** Examples

## Not run: 
##D     makes.plot(plot(rnorm(100))) # returns TRUE
##D     makes.plot(sample(10))       # returns FALSE
## End(Not run)



cleanEx()
nameEx("print.rapport")
### * print.rapport

flush(stderr()); flush(stdout())

### Name: print.rapport
### Title: Prints rapport
### Aliases: print.rapport

### ** Examples

## Not run: 
##D rapport('univar-descriptive', data=mtcars, var='hp')
##D print(rapport('univar-descriptive', data=mtcars, var='hp'), metadata=T)
##D print(rapport('univar-descriptive', data=mtcars, var='hp'), metadata=T, inputs=T)
##D print(rapport('example', data=mtcars, x='hp', y='mpg'), metadata=T, inputs=T)
##D print(rapport('example', data=mtcars, x='hp', y='mpg'), metadata=T, inputs=T, body=F)
## End(Not run)



cleanEx()
nameEx("rp.barplot")
### * rp.barplot

flush(stderr()); flush(stdout())

### Name: rp.barplot
### Title: Barplot
### Aliases: rp.barplot

### ** Examples

## Not run: 
##D df <- transform(mtcars, cyl = factor(cyl, labels = c('4', '6', '8')), am = factor(am, labels = c('automatic', 'manual')), vs = factor(vs))
##D 	rp.barplot(df$cyl)
##D 	rp.barplot(df$cyl, horizontal = FALSE)
##D 	rp.barplot(df$cyl, facet=df$am)
##D 	rp.barplot(df$cyl, facet=df$am, horizontal=FALSE)
##D 	rp.barplot(df$cyl, facet=df$am, colorize=TRUE)
##D 	rp.barplot(df$cyl, facet=df$am, colorize=TRUE, groups=T)
##D 	rp.barplot(df$cyl, facet=df$am, colorize=TRUE, groups=T, horizontal=FALSE)
##D 	rp.label(df$cyl) <- 'Number of cylinders'; rp.barplot(df$cyl)
##D 	with(df, rp.barplot(cyl, facet = am))
##D 	rp.barplot(cyl, data=df)
##D 	rp.barplot(cyl, am, df)
## End(Not run)



cleanEx()
nameEx("rp.boxplot")
### * rp.boxplot

flush(stderr()); flush(stdout())

### Name: rp.boxplot
### Title: Boxplot
### Aliases: rp.boxplot

### ** Examples

## Not run: 
##D df <- transform(mtcars, cyl = factor(cyl, labels = c('4', '6', '8')), am = factor(am, labels = c('automatic', 'manual')), vs = factor(vs))
##D rp.boxplot(df$cyl)
##D 	rp.boxplot(df$cyl, df$wt)
##D 	rp.boxplot(df$cyl, df$hp, facet=df$am)
##D 	rp.label(df$hp) <- 'horsepower'; rp.label(df$wt) <- 'weight'; rp.boxplot(df$cyl, df$wt)
##D 	rp.boxplot(df$cyl, df$wt, colorize=TRUE)
##D 	with(df, rp.scatterplot(hp, wt, facet = am))
##D 	rp.boxplot(cyl, wt, data=df)
##D 	rp.boxplot(cyl, wt, am, df)
## End(Not run)



cleanEx()
nameEx("rp.cor.plot")
### * rp.cor.plot

flush(stderr()); flush(stdout())

### Name: rp.cor.plot
### Title: Scatterplot matrices
### Aliases: rp.cor.plot

### ** Examples

## Not run: 
##D df <- transform(mtcars, cyl = factor(cyl, labels = c('4', '6', '8')), am = factor(am, labels = c('automatic', 'manual')), vs = factor(vs))
##D 	rp.cor.plot(df)
##D rp.cor.plot(df, diag.panel='panel.hist')
## End(Not run)



cleanEx()
nameEx("rp.densityplot")
### * rp.densityplot

flush(stderr()); flush(stdout())

### Name: rp.densityplot
### Title: Density plot
### Aliases: rp.densityplot

### ** Examples

## Not run: 
##D df <- transform(mtcars, cyl = factor(cyl, labels = c('4', '6', '8')),
##D     am = factor(am, labels = c('automatic', 'manual')), vs = factor(vs))
##D rp.densityplot(df$hp)
##D rp.densityplot(df$hp, facet=df$am)
##D rp.densityplot(df$hp, df$am)
##D rp.label(df$hp) <- 'horsepower'; rp.densityplot(df$hp)
##D rp.densityplot(df$hp, colorize=TRUE)
##D with(df, rp.densityplot(hp, facet = am))
##D rp.densityplot(hp, data = df)
##D rp.densityplot(hp, am, df)
## End(Not run)



cleanEx()
nameEx("rp.desc")
### * rp.desc

flush(stderr()); flush(stdout())

### Name: rp.desc
### Title: Descriptive Statistics
### Aliases: rp.desc

### ** Examples

rp.desc("cyl", "am", c(mean, sd), mtcars, margins = TRUE)



cleanEx()
nameEx("rp.dotplot")
### * rp.dotplot

flush(stderr()); flush(stdout())

### Name: rp.dotplot
### Title: Dotplot
### Aliases: rp.dotplot

### ** Examples

## Not run: 
##D df <- transform(mtcars, cyl = factor(cyl, labels = c('4', '6', '8')), am = factor(am, labels = c('automatic', 'manual')), vs = factor(vs))
##D 	rp.dotplot(df$cyl)
##D 	rp.dotplot(df$cyl, horizontal = FALSE)
##D 	rp.dotplot(df$cyl, facet=df$am)
##D 	rp.dotplot(df$cyl, facet=df$am, horizontal=FALSE)
##D 	rp.dotplot(df$cyl, facet=df$am, colorize=TRUE)
##D 	rp.dotplot(df$cyl, facet=df$am, colorize=TRUE, groups=T)
##D 	rp.label(df$cyl) <- 'Number of cylinders'; rp.dotplot(df$cyl)
##D 	with(df, rp.dotplot(cyl, facet = am))
##D 	rp.dotplot(cyl, data=df)
##D 	rp.dotplot(cyl, am, df)
## End(Not run)



cleanEx()
nameEx("rp.hist")
### * rp.hist

flush(stderr()); flush(stdout())

### Name: rp.hist
### Title: Histogram
### Aliases: rp.hist

### ** Examples

## Not run: 
##D df <- transform(mtcars, cyl = factor(cyl, labels = c('4', '6', '8')),
##D 	    am = factor(am, labels = c('automatic', 'manual')), vs = factor(vs))
##D 	rp.hist(df$hp)
##D 	rp.hist(df$hp, facet=df$am)
##D 	rp.hist(df$hp, df$am)
##D 	rp.label(df$hp) <- 'horsepower'; rp.hist(df$hp)
##D 	rp.hist(df$hp, colorize=TRUE)
##D 	with(df, rp.hist(hp, facet = am))
##D 	rp.hist(hp, data = df)
##D 	rp.hist(hp, am, df)
## End(Not run)



cleanEx()
nameEx("rp.label-set")
### * rp.label-set

flush(stderr()); flush(stdout())

### Name: rp.label<-
### Title: Set variable label
### Aliases: rp.label<-

### ** Examples

## Not run: 
##D     rp.label(mtcars$mpg) <- "fuel consumption"
##D     x <- rnorm(100); ( rp.label(x) <- "pseudo-random normal variable" )
## End(Not run)



cleanEx()
nameEx("rp.label")
### * rp.label

flush(stderr()); flush(stdout())

### Name: rp.label
### Title: Get variable label
### Aliases: rp.label

### ** Examples

## Not run: 
##D 	rp.label(mtcars$am)
##D 	x <- 1:10; rp.label(x)
## End(Not run)



cleanEx()
nameEx("rp.lineplot")
### * rp.lineplot

flush(stderr()); flush(stdout())

### Name: rp.lineplot
### Title: Lineplot
### Aliases: rp.lineplot

### ** Examples

## Not run: 
##D df <- transform(mtcars, cyl = factor(cyl, labels = c('4', '6', '8')), am = factor(am, labels = c('automatic', 'manual')), vs = factor(vs))
##D a <- aggregate(wt~gear, df, mean)
##D rp.lineplot(a$gear, a$wt)
##D rp.lineplot(1:length(df$hp), df$hp, facet=df$cyl)
##D rp.label(a$wt) <- 'weight'; rp.lineplot(a$gear, a$wt)
##D rp.lineplot(a$gear, a$wt, colorize=TRUE)
##D rp.lineplot(gear, wt, data=a)
## End(Not run)



cleanEx()
nameEx("rp.name")
### * rp.name

flush(stderr()); flush(stdout())

### Name: rp.name
### Title: Get variable name
### Aliases: rp.name

### ** Examples

## Not run: 
##D rp.name(mtcars$am)
##D x <- 1:10; rp.name(x)
## End(Not run)



cleanEx()
nameEx("rp.outlier")
### * rp.outlier

flush(stderr()); flush(stdout())

### Name: rp.outlier
### Title: Outlier test
### Aliases: rp.outlier

### ** Examples

## Not run: 
##D rp.outlier(mtcars$hp)
##D rp.outlier(c(rep(1,100), 200))
##D rp.outlier(c(rep(1,100), 200,201))
## End(Not run)



cleanEx()
nameEx("rp.palette")
### * rp.palette

flush(stderr()); flush(stdout())

### Name: rp.palette
### Title: Color palettes
### Aliases: rp.palette

### ** Examples

{
rp.palette(1)
rp.palette(1, colorize = TRUE)
rp.palette(5, 'Greens')
rp.palette(5, 'Greens', colorize = TRUE)
}



cleanEx()
nameEx("rp.prettyascii")
### * rp.prettyascii

flush(stderr()); flush(stdout())

### Name: rp.prettyascii
### Title: Return pretty ascii form
### Aliases: rp.prettyascii

### ** Examples

## Not run: 
##D rp.prettyascii('Hallo, World?')
##D rp.prettyascii(22/7)
##D rp.prettyascii(matrix(runif(25), 5, 5))
##D 	rp.prettyascii(lm(hp~wt, mtcars))
##D 
## End(Not run)



cleanEx()
nameEx("rp.round")
### * rp.round

flush(stderr()); flush(stdout())

### Name: rp.round
### Title: Round numeric values
### Aliases: rp.round

### ** Examples

{
	rp.round(22/7)
	rp.round(matrix(runif(9),3,3))
}



cleanEx()
nameEx("rp.scatterplot")
### * rp.scatterplot

flush(stderr()); flush(stdout())

### Name: rp.scatterplot
### Title: Scatterplot
### Aliases: rp.scatterplot

### ** Examples

## Not run: 
##D df <- transform(mtcars, cyl = factor(cyl, labels = c('4', '6', '8')), am = factor(am, labels = c('automatic', 'manual')), vs = factor(vs))
##D 	rp.scatterplot(df$hp, df$wt)
##D 	rp.scatterplot(df$hp, df$wt, facet=df$cyl)
##D 	rp.label(df$hp) <- 'horsepower'; rp.label(df$wt) <- 'weight'; rp.scatterplot(df$hp, df$wt)
##D 	rp.scatterplot(df$hp, df$wt, colorize=TRUE)
##D 	with(df, rp.scatterplot(hp, wt, facet = am))
##D 	rp.scatterplot(hp, wt, data=df)
##D 	rp.scatterplot(hp, wt, am, df)
## End(Not run)



cleanEx()
nameEx("table.json")
### * table.json

flush(stderr()); flush(stdout())

### Name: table.json
### Title: Convert table-like structures to JSON object
### Aliases: table.json

### ** Examples

## Not run: 
##D     table.json(mtcars)
##D 
##D     set.seed(1)
##D     m <- matrix(sample(10, 100, TRUE), 10)
##D     table.json(m)
## End(Not run)



cleanEx()
nameEx("tocamel")
### * tocamel

flush(stderr()); flush(stdout())

### Name: tocamel
### Title: CamelCase
### Aliases: tocamel

### ** Examples

tocamel("foo.bar")
    ## [1] "fooBar"

    tocamel("foo.bar", upper = TRUE)
    ## [1] "FooBar"

    tocamel(c("foobar", "foo.bar", "camel_case", "a.b.c.d"))
    ## [1] "foobar"    "fooBar"    "camelCase" "aBCD"



cleanEx()
nameEx("tpl.elem")
### * tpl.elem

flush(stderr()); flush(stdout())

### Name: tpl.elem
### Title: Template Elements
### Aliases: tpl.elem

### ** Examples

## Not run: 
##D     fp <- system.file("templates", "example.tpl", package = "rapport")
##D     tpl.elem(fp) # returns all elements (headings, blocks and chunks)
##D 
##D     ## returns only code chunks
##D     tpl.elem(fp, extract = "chunk")
## End(Not run)



cleanEx()
nameEx("tpl.example")
### * tpl.example

flush(stderr()); flush(stdout())

### Name: tpl.example
### Title: Template Examples
### Aliases: tpl.example

### ** Examples

## Not run: 
##D tpl.example('example')
##D tpl.example('crosstable')
##D tpl.export(tpl.example('crosstable'))
##D tpl.example('example', 1:2)
##D tpl.example('example', 'all')
## End(Not run)



cleanEx()
nameEx("tpl.export")
### * tpl.export

flush(stderr()); flush(stdout())

### Name: tpl.export
### Title: Export rapport class
### Aliases: tpl.export

### ** Examples

## Not run: 
##D 
##D ## eval some template
##D x <- rapport('univar-descriptive', data=mtcars, var="hp")
##D 
##D ## try basic parameters
##D tpl.export(x)
##D tpl.export(x, file='demo')
##D tpl.export(x, file='demo', format='odt')
##D 
##D ### append reports
##D # 1) Create a report object with the first report and do not export (optional)
##D report <- tpl.export(x, create=F)
##D # 2) Append some other reports without exporting (optional)
##D report <- tpl.export(x, create=F, append=report)
##D # 3) Export it!
##D tpl.export(append=report)
##D # 4) Export it to other formats too! (optional)
##D tpl.export(append=report, format='rst')
##D 
##D ### exporting multiple reports at once
##D tpl.export(tpl.example('example', 'all'))
##D tpl.export(tpl.example('example', 'all'), format='odt')
##D tpl.export(list(rapport('univar-descriptive', data=mtcars, var="hp"),
##D     rapport('univar-descriptive', data=mtcars, var="mpg")))
##D 
##D ### Never do this as being dumb:
##D tpl.export()
##D 
##D ### Adding own custom CSS to exported HTML
##D tpl.export(x, options=sprintf('-c %s', system.file('templates/css/default.css', package='rapport')))
##D ## For other formats check out backend specific documentation!
##D ## Eg. pandoc uses "--reference-odt" as styles reference for odt exports.
## End(Not run)



cleanEx()
nameEx("tpl.info")
### * tpl.info

flush(stderr()); flush(stdout())

### Name: tpl.info
### Title: Template Info
### Aliases: tpl.info

### ** Examples

## Not run: 
##D tpl.info('example')  # return both metadata and inputs
##D tpl.info('crosstable', inputs = FALSE)  # return only template metadata
##D tpl.info('correlations', meta = FALSE)  # return only template inputs
## End(Not run)



cleanEx()
nameEx("tpl.list")
### * tpl.list

flush(stderr()); flush(stdout())

### Name: tpl.list
### Title: Package Templates
### Aliases: tpl.list

### ** Examples

## Not run: 
##D tpl.list()
## End(Not run)



cleanEx()
nameEx("tpl.rerun")
### * tpl.rerun

flush(stderr()); flush(stdout())

### Name: tpl.rerun
### Title: Reproduce Template
### Aliases: tpl.rerun

### ** Examples

## Not run: 
##D tmp <- rapport("example", mtcars, x = "hp", y = "mpg")
##D tpl.rerun(tmp)
## End(Not run)



### * <FOOTER>
###
cat("Time elapsed: ", proc.time() - get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
