<a id="Datasets"> </a>
#### Datasets

<a id="ius2008"> </a>
##### ius2008: Internet Usage Survey
###### Description:
<p>This dataset contains data gathered in a survey ofInternet usage in Serbian population in the period fromApril to May 2008. During 90-day period, there weregathered 709 valid responses via on-line distributedquestionnaire.</p>
###### Examples:
<div class="highlight"><pre><code class="r">rapport(&quot;example&quot;, ius2008, var = &quot;it.leisure&quot;)
</code></pre>
</div>

<a id="typeDemoData"> </a>
##### typeDemoData: Rapport Input Type Demo Data
###### Description:
<p> This dataset contains dummy-data that demonstratesvarious input types supported by <code>rapport</code> .</p>

<a id="Generic-functions"> </a>
#### Generic functions

<a id="decrypt"> </a>
##### decrypt: Decrypt a string
###### Description:
<p> Decrypts string encrypted by <code>encrypt</code> .</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">decrypt(message)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>message</code>
  </td>
  <td>
   <p>a string to decrypt</p>
  </td>
 </tr>
</table>
###### Returned value:
<p>string</p>
###### References:
<p>
 Credits goes to Barry Rowlingson and Hadley Wickham:
 <a href="https://stat.ethz.ch/pipermail/r-help/2010-March/232533.html">https://stat.ethz.ch/pipermail/r-help/2010-March/232533.html</a>
</p>
###### Examples:
<div class="highlight"><pre><code class="r">decrypt(&quot;loRR7KT72R=!&quot;)
strsplit(decrypt(&quot;MrhKPzRK=tBrK0rK=2g~KT~K8BoPK1BKgMKhog2KPg2A&quot;), &quot; &quot;)[[1]]
eval(parse(text=decrypt(&quot;rR7~HM~Pg2B40r,KP7Rkp2o=pc&quot;)))
	
</code></pre>
</div>

<a id="encrypt"> </a>
##### encrypt: Encrypt a string
###### Description:
<p> A simple encryption function which reorders thecharacters in a given string based on a predefined key.As it can be seen: the used encryption is easy to crack,do not use this for sensitive data! The key is set bydefault on library startup. It can be changed bymodifying <code>options(&apos;.encrypt.key&apos;)</code> to any characterstring with same lenght as <code>options(&apos;.encrypt.chars&apos;)</code> . E.g. <code>intToUtf8(sample(c(33, 36:38, 48:57, 64:90, 97:122,  192:246, 248:382), nchar(getOption(&apos;.encrypt.chars&apos;))))</code> would return a quite complex but readable key.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">encrypt(message)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>message</code>
  </td>
  <td>
   <p>a string to encrypt</p>
  </td>
 </tr>
</table>
###### Returned value:
<p>string</p>
###### References:
<p>
 Credits goes to Barry Rowlingson and Hadley Wickham:
 <a href="https://stat.ethz.ch/pipermail/r-help/2010-March/232533.html">https://stat.ethz.ch/pipermail/r-help/2010-March/232533.html</a>
</p>
###### Examples:
<div class="highlight"><pre><code class="r">encrypt(&quot;Hello world!&quot;)
encrypt(paste(names(mtcars), collapse=&quot; &quot;))
	
</code></pre>
</div>

<a id="evals"> </a>
##### evals: Evals chunk(s) of R code
###### Description:
<p> This function takes either a list of integer indiceswhich point to position of R code in body charactervector, or a list of strings with actual R code, thenevaluates each list element, and returns a list with twoelements: a character value with R code and generatedoutput. The output can be NULL (eg. <code>x &lt;-  runif(100)</code> ), a table (eg. <code>table(mtcars$am,  mtcars$cyl)</code> or any other R object. If a graph is plottedin the given text, the returned object is a stringspecifying the path to the saved png in temporarydirectory (see: <code>tmpfile()</code> ). The function takescare of warnings and errors too, please check the thereturned value below.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">evals(txt = NULL, ind = NULL, body = NULL,    classes = NULL, hooks = NULL, length = Inf,    output = c(&quot;all&quot;, &quot;src&quot;, &quot;output&quot;, &quot;type&quot;, &quot;msg&quot;),    env = NULL, ...)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>txt</code>
  </td>
  <td>
   <p>a list with character values containing R
code</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>ind</code>
  </td>
  <td>
   <p>
    a list with numeric indices pointing to R code
in
    <code>body</code>
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>body</code>
  </td>
  <td>
   <p>a character vector that contains template
body</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>classes</code>
  </td>
  <td>
   <p>a vector or list of classes which should
be returned. If set to NULL (by default) all R objects
will be returned.</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>hooks</code>
  </td>
  <td>
   <p>
    list of hooks to bo run for given classes in
the form of
    <code>list(class=fn)</code>
    . If you would also
specify some parameters of the function, a list should be
provided in the form of
    <code>list(fn, param1,
  param2=NULL)</code>
    etc. So the hooks would become
    <code>list(class1=list(fn, param1, param2=NULL), ...)</code>
    .
See example below. A default hook can be specified too by
setting the class to
    <code>&apos;default&apos;</code>
    . This can be handy
if you do not want to define separate methods/functions
to each possible class, but automatically apply the
default hook to all classes not mentioned in the list.
You may also specify only one element in the list like:
    <code>hooks=list(&apos;default&apos;=ascii)</code>
    .
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>length</code>
  </td>
  <td>
   <p>
    R object exceeding the specified length
will not be returned. The default value (
    <code>Inf</code>
    ) does
not have any restrictions.
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>output</code>
  </td>
  <td>
   <p>a character vector of required returned
values. See below.</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>env</code>
  </td>
  <td>
   <p>environment where evaluation takes place. If
not set (by default), a new temporary environment is
created.</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>
    optional parameters passed to
    <code>png(...)</code>
   </p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a list of parsed elements each containg: src (the command
run), output (what the command returns, NULL if nothing
returned), type (class of returned object if any) and
messages: warnings (if any returned by the command run,
otherwise set to NULL) and errors (if any returned by the
command run, otherwise set to NULL)</p>
###### Examples:
<div class="highlight"><pre><code class="r"># parsing line-by-line
txt &lt;- readLines(textConnection(&apos;x &lt;- rnorm(100)
  runif(10)
  warning(&quot;You should check out rapport package!&quot;)
  plot(1:10)
  qplot(rating, data=movies, geom=&quot;histogram&quot;)
  y &lt;- round(runif(100))
  cor.test(x, y)
  crl &lt;- cor.test(runif(10), runif(10))
  table(mtcars$am, mtcars$cyl)
  ggplot(mtcars) + geom_point(aes(x = hp, y = mpg))&apos;))
evals(txt)
## parsing a list of commnads
txt &lt;- list(&apos;df &lt;- mtcars&apos;,
 c(&apos;plot(mtcars$hp, pch = 19)&apos;,&apos;text(mtcars$hp, label = rownames(mtcars), pos = 4)&apos;),
 &apos;ggplot(mtcars) + geom_point(aes(x = hp, y = mpg))&apos;)
evals(txt)
## returning only a few classes
txt &lt;- readLines(textConnection(&apos;rnorm(100)
  list(x = 10:1, y = &quot;Godzilla!&quot;)
  c(1,2,3)
evals(txt, classes=&apos;numeric&apos;)
evals(txt, classes=c(&apos;numeric&apos;, &apos;list&apos;))
## handling warnings
evals(&apos;chisq.test(mtcars$gear, mtcars$hp)&apos;)
## handling errors
evals(&apos;runiff(20)&apos;)
evals(&apos;Old MacDonald had a farm\\dots&apos;)
evals(&apos;## Some comment&apos;)
## hooks
hooks &lt;- list(&apos;numeric&apos;=round, &apos;matrix&apos;=ascii)
evals(txt, hooks=hooks)
evals(&apos;22/7&apos;, hooks=list(&apos;numeric&apos;=rp.round))
evals(&apos;matrix(runif(25), 5, 5)&apos;, hooks=list(&apos;matrix&apos;=rp.round))
## using rapport&apos;s default hook
evals(&apos;22/7&apos;, hooks=TRUE)
## setting default hook
evals(c(&apos;runif(10)&apos;, &apos;matrix(runif(9), 3, 3)&apos;), hooks=list(&apos;default&apos;=round))
## round all values except for matrices
evals(c(&apos;runif(10)&apos;, &apos;matrix(runif(9), 3, 3)&apos;), hooks=list(matrix=&apos;print&apos;, &apos;default&apos;=round))
# advanced hooks
fun &lt;- function(x, asciiformat) paste(capture.output(print(ascii(x), asciiformat)), collapse=&apos;\n&apos;)
hooks &lt;- list(&apos;numeric&apos;=list(round, 2), &apos;matrix&apos;=list(fun, &quot;rest&quot;))
evals(txt, hooks=hooks)
# return only returned values
evals(txt, output=&apos;output&apos;)
# return only messages (for checking syntax errors etc.)
evals(txt, output=&apos;msg&apos;)
# check the length of returned values
evals(&apos;runif(10)&apos;, length=5)
# note the following will not be filtered!
evals(&apos;matrix(1,1,1)&apos;, length=1)
# if you do not want to let such things be evaled in the middle of a string use it with other filters :)
evals(&apos;matrix(1,1,1)&apos;, length=1, classes=&apos;numeric&apos;)
	# hooks &amp; filtering
evals(&apos;matrix(5,5,5)&apos;, hooks=list(&apos;matrix&apos;=ascii), output=&apos;output&apos;)
# evaling chunks in given environment
myenv &lt;- new.env()
evals(&apos;x &lt;- c(0,10)&apos;, env=myenv)
evals(&apos;mean(x)&apos;, env=myenv)
rm(myenv)
# note: if you had not specified &apos;myenv&apos;, the second &apos;evals&apos; would have failed
evals(&apos;x &lt;- c(0,10)&apos;)
evals(&apos;mean(x)&apos;)
</code></pre>
</div>


<a id="Generic-graph-functions"> </a>
#### Generic graph functions

<a id="rp.barplot"> </a>
##### rp.barplot: Barplot
###### Description:
<p> This function is a wrapper around <code>barchart</code> which operates only on factors with optional facet.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">rp.barplot(x, facet = NULL, data = NULL, groups = FALSE,    auto.key = FALSE, horizontal = TRUE, percent = FALSE,    theme = getOption(&quot;rp.color.palette&quot;),    colorize = getOption(&quot;rp.colorize&quot;), ...)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>a numeric variable</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>facet</code>
  </td>
  <td>
   <p>an optional categorical variable to make
facets by</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>data</code>
  </td>
  <td>
   <p>an optional data frame from which the
variables should be taken</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>horizontal</code>
  </td>
  <td>
   <p>
    see
    <code>xyplot</code>
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>groups</code>
  </td>
  <td>
   <p>
    see
    <code>xyplot</code>
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>percent</code>
  </td>
  <td>
   <p>
    an option to show percentages (100
category) instead of number of cases. Handy with
    <code>groups=TRUE</code>
    . Default value: FALSE without groups,
TRUE with groups.
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>auto.key</code>
  </td>
  <td>
   <p>
    see
    <code>xyplot</code>
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>theme</code>
  </td>
  <td>
   <p>
    a color palette name from
    <code>RColorBrewer</code>
    or &apos;default&apos;
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>colorize</code>
  </td>
  <td>
   <p>if set the color is chosen from palette
at random</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>
    additional parameters to
    <code>barchart</code>
   </p>
  </td>
 </tr>
</table>
###### Examples:
<div class="highlight"><pre><code class="r">df &lt;- transform(mtcars, cyl = factor(cyl, labels = c(&apos;4&apos;, &apos;6&apos;, &apos;8&apos;)), am = factor(am, labels = c(&apos;automatic&apos;, &apos;manual&apos;)), vs = factor(vs))
rp.barplot(df$cyl)
rp.barplot(df$cyl, horizontal = FALSE)
rp.barplot(df$cyl, facet=df$am)
rp.barplot(df$cyl, facet=df$am, horizontal=FALSE)
rp.barplot(df$cyl, facet=df$am, colorize=TRUE)
rp.barplot(df$cyl, facet=df$am, colorize=TRUE, groups=T)
rp.barplot(df$cyl, facet=df$am, colorize=TRUE, groups=T, horizontal=FALSE)
rp.label(df$cyl) &lt;- &apos;Number of cylinders&apos;; rp.barplot(df$cyl)
with(df, rp.barplot(cyl, facet = am))
rp.barplot(cyl, data=df)
rp.barplot(cyl, am, df)
</code></pre>
</div>

<a id="rp.boxplot"> </a>
##### rp.boxplot: Boxplot
###### Description:
<p> This function is a wrapper around <code>bwplot</code> which operates only on numeric variables with optionalfacet.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">rp.boxplot(x, y = NULL, facet = NULL, data = NULL,    theme = getOption(&quot;rp.color.palette&quot;),    colorize = getOption(&quot;rp.colorize&quot;), ...)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>a factor variable</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>y</code>
  </td>
  <td>
   <p>a numeric variable</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>facet</code>
  </td>
  <td>
   <p>an optional categorical variable to make
facets by</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>data</code>
  </td>
  <td>
   <p>an optional data frame from which the
variables should be taken</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>theme</code>
  </td>
  <td>
   <p>
    a color palette name from
    <code>RColorBrewer</code>
    or &apos;default&apos;
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>colorize</code>
  </td>
  <td>
   <p>if set the color is chosen from palette
at random</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>
    additional parameters to
    <code>bwplot</code>
   </p>
  </td>
 </tr>
</table>
###### Examples:
<div class="highlight"><pre><code class="r">df &lt;- transform(mtcars, cyl = factor(cyl, labels = c(&apos;4&apos;, &apos;6&apos;, &apos;8&apos;)), am = factor(am, labels = c(&apos;automatic&apos;, &apos;manual&apos;)), vs = factor(vs))
rp.boxplot(df$cyl)
rp.boxplot(df$cyl, df$wt)
rp.boxplot(df$cyl, df$hp, facet=df$am)
rp.label(df$hp) &lt;- &apos;horsepower&apos;; rp.label(df$wt) &lt;- &apos;weight&apos;; rp.boxplot(df$cyl, df$wt)
rp.boxplot(df$cyl, df$wt, colorize=TRUE)
with(df, rp.scatterplot(hp, wt, facet = am))
rp.boxplot(cyl, wt, data=df)
rp.boxplot(cyl, wt, am, df)
</code></pre>
</div>

<a id="rp.cor.plot"> </a>
##### rp.cor.plot: Scatterplot matrices
###### Description:
<p> This function is a wrapper around <code>pairs</code> which operates only on numeric variables. Panel optionsare: <code>c(&apos;panel.cor&apos;, &apos;panel.smooth&apos;, &apos;panel.hist&apos;)</code> .Custom panels may be also added.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">rp.cor.plot(x, lower.panel = &quot;panel.smooth&quot;,    upper.panel = &quot;panel.cor&quot;, data = NULL,    theme = getOption(&quot;rp.color.palette&quot;),    colorize = getOption(&quot;rp.colorize&quot;), ...)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>numeric variables</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>lower.panel</code>
  </td>
  <td>
   <p>
    see:
    <code>pairs</code>
    parameter.
Default set to
    <code>&apos;panel.smooth&apos;</code>
    .
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>upper.panelsee:</code>
  </td>
  <td>
   <p>
    <code>pairs</code>
    parameter.
Default set to
    <code>&apos;panel.cor&apos;</code>
    .
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>data</code>
  </td>
  <td>
   <p>an optional data frame from which the
variables should be taken</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>theme</code>
  </td>
  <td>
   <p>
    a color palette name from
    <code>RColorBrewer</code>
    or &apos;default&apos;
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>colorize</code>
  </td>
  <td>
   <p>if set the color is chosen from palette
at random</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>
    additional parameters to
    <code>pairs</code>
   </p>
  </td>
 </tr>
</table>
###### Examples:
<div class="highlight"><pre><code class="r">df &lt;- transform(mtcars, cyl = factor(cyl, labels = c(&apos;4&apos;, &apos;6&apos;, &apos;8&apos;)), am = factor(am, labels = c(&apos;automatic&apos;, &apos;manual&apos;)), vs = factor(vs))
rp.cor.plot(df)
rp.cor.plot(df, diag.panel=&apos;panel.hist&apos;)
</code></pre>
</div>

<a id="rp.densityplot"> </a>
##### rp.densityplot: Density plot
###### Description:
<p> This function is a wrapper around <code>densityplot</code> which operates only on numericvectors with optional facet.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">rp.densityplot(x, facet = NULL, data = NULL,    theme = getOption(&quot;rp.color.palette&quot;),    colorize = getOption(&quot;rp.colorize&quot;), ...)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>a numeric variable</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>facet</code>
  </td>
  <td>
   <p>an optional categorical variable to make
facets by</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>data</code>
  </td>
  <td>
   <p>an optional data frame from which the
variables should be taken</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>theme</code>
  </td>
  <td>
   <p>
    a color palette name from
    <code>RColorBrewer</code>
    or &apos;default&apos;
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>colorize</code>
  </td>
  <td>
   <p>if set the color is chosen from palette
at random</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>
    additional parameters to
    <code>densityplot</code>
   </p>
  </td>
 </tr>
</table>
###### Examples:
<div class="highlight"><pre><code class="r">df &lt;- transform(mtcars, cyl = factor(cyl, labels = c(&apos;4&apos;, &apos;6&apos;, &apos;8&apos;)),
  am = factor(am, labels = c(&apos;automatic&apos;, &apos;manual&apos;)), vs = factor(vs))
rp.densityplot(df$hp)
rp.densityplot(df$hp, facet=df$am)
rp.densityplot(df$hp, df$am)
rp.label(df$hp) &lt;- &apos;horsepower&apos;; rp.densityplot(df$hp)
rp.densityplot(df$hp, colorize=TRUE)
with(df, rp.densityplot(hp, facet = am))
rp.densityplot(hp, data = df)
rp.densityplot(hp, am, df)
</code></pre>
</div>

<a id="rp.dotplot"> </a>
##### rp.dotplot: Dotplot
###### Description:
<p> This function is a wrapper around <code>dotplot</code> which operates only on factors with optional facet.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">rp.dotplot(x, facet = NULL, data = NULL, groups = FALSE,    auto.key = FALSE, horizontal = TRUE,    theme = getOption(&quot;rp.color.palette&quot;),    colorize = getOption(&quot;rp.colorize&quot;), ...)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>a factor variable</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>facet</code>
  </td>
  <td>
   <p>an optional categorical variable to make
facets by</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>data</code>
  </td>
  <td>
   <p>an optional data frame from which the
variables should be taken</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>horizontal</code>
  </td>
  <td>
   <p>
    see
    <code>xyplot</code>
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>groups</code>
  </td>
  <td>
   <p>
    see
    <code>xyplot</code>
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>auto.key</code>
  </td>
  <td>
   <p>
    see
    <code>xyplot</code>
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>theme</code>
  </td>
  <td>
   <p>
    a color palette name from
    <code>RColorBrewer</code>
    or &apos;default&apos;
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>colorize</code>
  </td>
  <td>
   <p>if set the color is chosen from palette
at random</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>
    additional parameters to
    <code>dotplot</code>
   </p>
  </td>
 </tr>
</table>
###### Examples:
<div class="highlight"><pre><code class="r">df &lt;- transform(mtcars, cyl = factor(cyl, labels = c(&apos;4&apos;, &apos;6&apos;, &apos;8&apos;)), am = factor(am, labels = c(&apos;automatic&apos;, &apos;manual&apos;)), vs = factor(vs))
rp.dotplot(df$cyl)
rp.dotplot(df$cyl, horizontal = FALSE)
rp.dotplot(df$cyl, facet=df$am)
rp.dotplot(df$cyl, facet=df$am, horizontal=FALSE)
rp.dotplot(df$cyl, facet=df$am, colorize=TRUE)
rp.dotplot(df$cyl, facet=df$am, colorize=TRUE, groups=T)
rp.label(df$cyl) &lt;- &apos;Number of cylinders&apos;; rp.dotplot(df$cyl)
with(df, rp.dotplot(cyl, facet = am))
rp.dotplot(cyl, data=df)
rp.dotplot(cyl, am, df)
</code></pre>
</div>

<a id="rp.graph.check"> </a>
##### rp.graph.check: Input cheks (internal)
###### Description:
<p> Internal function used by eg. <code>rp.histogram</code> .</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">rp.graph.check(x, facet = NULL, subset = NULL, ...)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>a variable</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>facet</code>
  </td>
  <td>
   <p>if facet set</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>subset</code>
  </td>
  <td>
   <p>if subset set</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>other parameters</p>
  </td>
 </tr>
</table>
<a id="rp.hist"> </a>
##### rp.hist: Histogram
###### Description:
<p> This function is a wrapper around <code>histogram</code> which operates only on numeric vectors with optionalfacet.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">rp.hist(x, facet = NULL, data = NULL,    theme = getOption(&quot;rp.color.palette&quot;),    colorize = getOption(&quot;rp.colorize&quot;), ...)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>a numeric variable</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>facet</code>
  </td>
  <td>
   <p>an optional categorical variable to make
facets by</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>data</code>
  </td>
  <td>
   <p>an optional data frame from which the
variables should be taken</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>theme</code>
  </td>
  <td>
   <p>
    a color palette name from
    <code>RColorBrewer</code>
    or &apos;default&apos;
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>colorize</code>
  </td>
  <td>
   <p>if set the color is chosen from palette
at random</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>
    additional parameters to
    <code>histogram</code>
   </p>
  </td>
 </tr>
</table>
###### Examples:
<div class="highlight"><pre><code class="r">df &lt;- transform(mtcars, cyl = factor(cyl, labels = c(&apos;4&apos;, &apos;6&apos;, &apos;8&apos;)),
  am = factor(am, labels = c(&apos;automatic&apos;, &apos;manual&apos;)), vs = factor(vs))
rp.hist(df$hp)
rp.hist(df$hp, facet=df$am)
rp.hist(df$hp, df$am)
rp.label(df$hp) &lt;- &apos;horsepower&apos;; rp.hist(df$hp)
rp.hist(df$hp, colorize=TRUE)
with(df, rp.hist(hp, facet = am))
rp.hist(hp, data = df)
rp.hist(hp, am, df)
</code></pre>
</div>

<a id="rp.lineplot"> </a>
##### rp.lineplot: Lineplot
###### Description:
<p> This function is a wrapper around <code>xyplot</code> with custom panel. Only numeric variables are acceptedwith optional facet.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">rp.lineplot(x, y, facet = NULL, data = NULL,    theme = getOption(&quot;rp.color.palette&quot;),    colorize = getOption(&quot;rp.colorize&quot;), ...)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>a numeric variable</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>y</code>
  </td>
  <td>
   <p>a numeric variable</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>facet</code>
  </td>
  <td>
   <p>an optional categorical variable to make
facets by</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>data</code>
  </td>
  <td>
   <p>an optional data frame from which the
variables should be taken</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>theme</code>
  </td>
  <td>
   <p>
    a color palette name from
    <code>RColorBrewer</code>
    or &apos;default&apos;
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>colorize</code>
  </td>
  <td>
   <p>if set the color is chosen from palette
at random</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>
    additional parameters to
    <code>xyplot</code>
   </p>
  </td>
 </tr>
</table>
###### Examples:
<div class="highlight"><pre><code class="r">df &lt;- transform(mtcars, cyl = factor(cyl, labels = c(&apos;4&apos;, &apos;6&apos;, &apos;8&apos;)), am = factor(am, labels = c(&apos;automatic&apos;, &apos;manual&apos;)), vs = factor(vs))
a &lt;- aggregate(wt~gear, df, mean)
rp.lineplot(a$gear, a$wt)
rp.lineplot(1:length(df$hp), df$hp, facet=df$cyl)
rp.label(a$wt) &lt;- &apos;weight&apos;; rp.lineplot(a$gear, a$wt)
rp.lineplot(a$gear, a$wt, colorize=TRUE)
rp.lineplot(gear, wt, data=a)
</code></pre>
</div>

<a id="rp.palette"> </a>
##### rp.palette: Color palettes
###### Description:
<p> This function returns a given number of color codes fromgiven palette by default falling back to acolor-blind-friendly palette from <a href="http://jfly.iam.u-tokyo.ac.jp/color/">http://jfly.iam.u-tokyo.ac.jp/color/</a> .</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">rp.palette(num, theme = getOption(&quot;rp.color.palette&quot;),    colorize = getOption(&quot;rp.colorize&quot;))</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>num</code>
  </td>
  <td>
   <p>number of colors to return</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>theme</code>
  </td>
  <td>
   <p>
    a palette name from
    <code>RColorBrewer</code>
    or &apos;default&apos;
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>colorize</code>
  </td>
  <td>
   <p>if set colors are chosen from palette at
random order</p>
  </td>
 </tr>
</table>
###### Examples:
<div class="highlight"><pre><code class="r">rp.palette(1)
rp.palette(1, colorize = TRUE)
rp.palette(5, &apos;Greens&apos;)
rp.palette(5, &apos;Greens&apos;, colorize = TRUE)
}</code></pre>
</div>

<a id="rp.scatterplot"> </a>
##### rp.scatterplot: Scatterplot
###### Description:
<p> This function is a wrapper around <code>xyplot</code> which operates only on numeric variables with optionalfacet.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">rp.scatterplot(x, y, facet = NULL, data = NULL,    theme = getOption(&quot;rp.color.palette&quot;),    colorize = getOption(&quot;rp.colorize&quot;), ...)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>a numeric variable</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>y</code>
  </td>
  <td>
   <p>a numeric variable</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>facet</code>
  </td>
  <td>
   <p>an optional categorical variable to make
facets by</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>data</code>
  </td>
  <td>
   <p>an optional data frame from which the
variables should be taken</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>theme</code>
  </td>
  <td>
   <p>
    a color palette name from
    <code>RColorBrewer</code>
    or &apos;default&apos;
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>colorize</code>
  </td>
  <td>
   <p>if set the color is chosen from palette
at random</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>
    additional parameters to
    <code>xyplot</code>
   </p>
  </td>
 </tr>
</table>
###### Examples:
<div class="highlight"><pre><code class="r">df &lt;- transform(mtcars, cyl = factor(cyl, labels = c(&apos;4&apos;, &apos;6&apos;, &apos;8&apos;)), am = factor(am, labels = c(&apos;automatic&apos;, &apos;manual&apos;)), vs = factor(vs))
rp.scatterplot(df$hp, df$wt)
rp.scatterplot(df$hp, df$wt, facet=df$cyl)
rp.label(df$hp) &lt;- &apos;horsepower&apos;; rp.label(df$wt) &lt;- &apos;weight&apos;; rp.scatterplot(df$hp, df$wt)
rp.scatterplot(df$hp, df$wt, colorize=TRUE)
with(df, rp.scatterplot(hp, wt, facet = am))
rp.scatterplot(hp, wt, data=df)
rp.scatterplot(hp, wt, am, df)
</code></pre>
</div>


<a id="Generic-helper-functions"> </a>
#### Generic helper functions

<a id="adj.rle"> </a>
##### adj.rle: Adjacent Values Run Length Encoding
###### Description:
<p> Similar to <code>rle</code> function, this functiondetects &quot;runs&quot; of adjacent integers, and displays vectorof run lengths and list of corresponding integersequences. See original thread for more details <a href="http://stackoverflow.com/a/8467446/457898">http://stackoverflow.com/a/8467446/457898</a> . Specialthanks to Gabor Grothendieck for this one!</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">adj.rle(x)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>a numeric vector with</p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a list with two elements: vector of run lengths, and
another list of values corresponding to generated
sequences&apos; lengths.</p>
<a id="alike.integer"> </a>
##### alike.integer: Check integers
###### Description:
<p> This function tests if given variable &quot;appears&quot; to be aninteger. To qualify as such, two conditions need to besatisfied: it should be stored as <code>numeric</code> object, and it should pass regular expression test if itconsists only of digits.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">alike.integer(x)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>a numeric variable that is to be tested</p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a logical value that indicates that tested variable
&quot;looks like&quot; integer</p>
<a id="catn"> </a>
##### catn: Concatenate with newline
###### Description:
<p> A simple wrapper for <code>cat</code> function thatappends newline to output.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">catn(...)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>
    arguments to be passed to
    <code>cat</code>
    function
   </p>
  </td>
 </tr>
</table>
###### Returned value:
<p>None (invisible ‘NULL’).</p>
<a id="guess.convert"> </a>
##### guess.convert: Guess Mode
###### Description:
<p>&quot;Guesses&quot; a mode of provided character vector andconverts it to appropriate mode.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">guess.convert(x, trim.white = FALSE)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>an atomic vector to guess its mode</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>trim.white</code>
  </td>
  <td>
   <p>a logical value indicating whether
white spaces should be removed before guessing</p>
  </td>
 </tr>
</table>
###### Returned value:
<p>an atomic vector with (hopefully) successfully guessed
mode</p>
###### Examples:
<div class="highlight"><pre><code class="r">storage.mode(guess.mode(&quot;234&quot;))
storage.mode(guess.mode(&quot;234.23&quot;))
storage.mode(guess.mode(&quot;234.23.234&quot;))
storage.mode(guess.mode(&quot;TRUE&quot;))
storage.mode(guess.mode(&quot;TRUE         &quot;))
storage.mode(guess.mode(&quot;     TRUE         &quot;, TRUE))
</code></pre>
</div>

<a id="is.string"> </a>
##### is.string: Strings
###### Description:
<p>Checks if provided object is a string i.e. a length-onecharacter vector.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">is.string(x)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>an object to check</p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a logical value indicating whether provided object is a
string</p>
###### Examples:
<div class="highlight"><pre><code class="r">is.string(&quot;foobar&quot;)          # [1] TRUE
    is.string(1)                 # [1] FALSE
    is.string(c(&quot;foo&quot;, &quot;bar&quot;))   # [1] FALSE</code></pre>
</div>

<a id="makes.plot"> </a>
##### makes.plot: Check plot creation
###### Description:
<p> This function checks if given expression generates aplot. See original thread for more details( <a href="http://stackoverflow.com/a/2744434/457898">http://stackoverflow.com/a/2744434/457898</a> ).Special thanks to Hadley Wickam for this one!</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">makes.plot(cmd)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>cmd</code>
  </td>
  <td>
   <p>an expression that is to be tested</p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a logical value</p>
###### Examples:
<div class="highlight"><pre><code class="r">    makes.plot(plot(rnorm(100))) # returns TRUE
    makes.plot(sample(10))       # returns FALSE
</code></pre>
</div>

<a id="stopf"> </a>
##### stopf: Stop Execution with String Interpolated Messages
###### Description:
<p> This helper combines <code>stop</code> function with <code>sprintf</code> thus allowing string interpolated messageswhen execution is halted.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">stopf(s, ...)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>s</code>
  </td>
  <td>
   <p>a character vector of format strings</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>values to be interpolated</p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a string containing message that follows execution
termination</p>
###### Examples:
<div class="highlight"><pre><code class="r">stopf(&quot;%.3f is not larger than %d and/or smaller than %d&quot;, pi, 10, 40)
</code></pre>
</div>

<a id="tocamel"> </a>
##### tocamel: CamelCase
###### Description:
<p>Convert character vector to camelcase - capitalise firstletter of each word.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">tocamel(x, sep = &quot;[^[:alnum:]]&quot;, upper = FALSE, ...)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>a character vector to be converted to camelcase</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>sep</code>
  </td>
  <td>
   <p>a string containing regular expression word
delimiter</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>upper</code>
  </td>
  <td>
   <p>
    a logical value indicating if the first
letter of the first word should be capitalised (defaults
to
    <code>FALSE</code>
    )
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>
    additional arguments to be passed to
    <code>strsplit</code>
   </p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a character vector with strings put in camelcase</p>
###### Examples:
<div class="highlight"><pre><code class="r">tocamel(&quot;foo.bar&quot;)
    ## [1] &quot;fooBar&quot;
    tocamel(&quot;foo.bar&quot;, upper = TRUE)
    ## [1] &quot;FooBar&quot;
    tocamel(c(&quot;foobar&quot;, &quot;foo.bar&quot;, &quot;camel_case&quot;, &quot;a.b.c.d&quot;))
    ## [1] &quot;foobar&quot;    &quot;fooBar&quot;    &quot;camelCase&quot; &quot;aBCD&quot;</code></pre>
</div>

<a id="trim.space"> </a>
##### trim.space: Trim Spaces
###### Description:
<p> Removes leading and/or trailing space(s) from a charactervector value. By default, it removes only trailingspaces. In order to trim both leading and trailingspaces, pass <code>TRUE</code> to both <code>leading</code> and <code>trailing</code> arguments.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">trim.space(x, leading = FALSE, trailing = TRUE,    re = &quot;[:space:]&quot;, ...)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>a character vector which needs whitespace
trimming</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>leading</code>
  </td>
  <td>
   <p>
    a logical value indicating if leading
spaces should be removed (defaults to
    <code>FALSE</code>
    )
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>trailing</code>
  </td>
  <td>
   <p>
    a logical value indicating if trailing
spaces should be removed (defaults to
    <code>TRUE</code>
    )
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>re</code>
  </td>
  <td>
   <p>a character value containing a regex that
defines a space character</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>
    additional arguments for
    <code>gsub</code>
    function
   </p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a character vector with removed spaces</p>
<a id="vgsub"> </a>
##### vgsub: Vectorised String Replacement
###### Description:
<p> A simple wrapper for <code>gsub</code> that replaces allpatterns from <code>pattern</code> argument with ones in <code>replacement</code> over vector provided in argument <code>x</code> . See original thread for more details <a href="http://stackoverflow.com/a/6954308/457898">http://stackoverflow.com/a/6954308/457898</a> . Specialthanks to user Jean-Robert for this one!</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">vgsub(pattern, replacement, x, ...)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>pattern</code>
  </td>
  <td>
   <p>
    see eponymous argument for
    <code>gsub</code>
    function
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>replacement</code>
  </td>
  <td>
   <p>
    see eponymous argument for
    <code>gsub</code>
    function
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>
    see eponymous argument for
    <code>gsub</code>
    function
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>
    additional arguments for
    <code>gsub</code>
    function
   </p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a character vector with string replacements</p>
<a id="wrap"> </a>
##### wrap: Wrap Vector Elements
###### Description:
<p> Wraps vector elements with string provided in <code>wrap</code> argument.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">wrap(x, wrap = &quot;\&quot;&quot;)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>a vector to wrap</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>wrap</code>
  </td>
  <td>
   <p>a string to wrap around vector elements</p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a string with wrapped elements</p>
###### Examples:
<div class="highlight"><pre><code class="r">wrap(c(&quot;fee&quot;, &quot;fi&quot;, &quot;foo&quot;, &quot;fam&quot;), &quot;_&quot;)
## [1] &quot;_fee_&quot; &quot;_fi_&quot;  &quot;_foo_&quot; &quot;_fam_&quot;</code></pre>
</div>


<a id="Generic-stat-functions"> </a>
#### Generic stat functions

<a id="rp.desc"> </a>
##### rp.desc: Descriptive Statistics
###### Description:
<p> Aggregate table of descriptives according to functionsprovided in <code>fn</code> argument. This function followsmelt/cast approach used in <code>reshape</code> package.Variable names specified in <code>measure.vars</code> argumentare treated as <code>measure.vars</code> , while the ones in <code>id.vars</code> are treated as <code>id.vars</code> (see <code>melt.data.frame</code> for details).Other its formal arguments match with correspondingarguments for <code>cast</code> function. Somepost-processing is done after reshaping, in order to getpretty row and column labels.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">rp.desc(id.vars, measure.vars, fn, data = NULL,    na.rm = TRUE, margins = NULL, subset = TRUE, fill = NA,    add.missing = FALSE, total.name = &quot;Total&quot;)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>id.vars</code>
  </td>
  <td>
   <p>
    either a character vector with variable
names from
    <code>data</code>
    , a numeric vector, or a
    <code>data.frame</code>
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>measure.vars</code>
  </td>
  <td>
   <p>
    same as
    <code>id.vars</code>
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>fn</code>
  </td>
  <td>
   <p>a list with functions or a character vector
with function names</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>data</code>
  </td>
  <td>
   <p>
    a
    <code>data.frame</code>
    holding variables
specified in
    <code>id.vars</code>
    and
    <code>measure.vars</code>
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>na.rm</code>
  </td>
  <td>
   <p>
    a logical value indicating whether
    <code>NA</code>
    values should be removed
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>margins</code>
  </td>
  <td>
   <p>
    should margins be included? (see
documentation for eponymous argument in
    <code>melt.data.frame</code>
    )
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>subset</code>
  </td>
  <td>
   <p>a logical vector to subset the data before
aggregating</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>fill</code>
  </td>
  <td>
   <p>
    value to replace missing level combinations
(see documentation for eponymous argument in
    <code>melt.data.frame</code>
    )
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>add.missing</code>
  </td>
  <td>
   <p>show missing level combinations</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>total.name</code>
  </td>
  <td>
   <p>a character string with name for
&quot;grand&quot; margin (defaults to &quot;Total&quot;)</p>
  </td>
 </tr>
</table>
###### Returned value:
<p>
 a
 <code>data.frame</code>
 with aggregated data
</p>
###### Examples:
<div class="highlight"><pre><code class="r">rp.desc(&quot;cyl&quot;, &quot;am&quot;, c(mean, sd), mtcars, margins = TRUE)</code></pre>
</div>

<a id="rp.freq"> </a>
##### rp.freq: Frequency Table
###### Description:
<p>Diplay frequency table.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">rp.freq(f.vars, data, na.rm = TRUE, include.na = FALSE,    drop.unused.levels = FALSE, count = TRUE, pct = TRUE,    cumul.count = TRUE, cumul.pct = TRUE)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>f.vars</code>
  </td>
  <td>
   <p>a character vector with variable names</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>data</code>
  </td>
  <td>
   <p>
    a
    <code>data.frame</code>
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>na.rm</code>
  </td>
  <td>
   <p>should missing values be removed?</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>include.na</code>
  </td>
  <td>
   <p>should missing values be included in
frequency table?</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>drop.unused.levels</code>
  </td>
  <td>
   <p>should empty level combinations
be left out</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>count</code>
  </td>
  <td>
   <p>show frequencies?</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>pct</code>
  </td>
  <td>
   <p>show percentage?</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>cumul.count</code>
  </td>
  <td>
   <p>show cumulative frequencies?</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>cumul.pct</code>
  </td>
  <td>
   <p>show cumulative percentage?</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>drop.levels</code>
  </td>
  <td>
   <p>should unused levels be removed</p>
  </td>
 </tr>
</table>
###### Returned value:
<p>
 a
 <code>data.frame</code>
 with frequencies
</p>
###### Examples:
<div class="highlight"><pre><code class="r">rp.freq(c(&quot;am&quot;, &quot;cyl&quot;, &quot;vs&quot;), mtcars)
</code></pre>
</div>

<a id="rp.iqr"> </a>
##### rp.iqr: Interquartile Range
###### Description:
<p> Calculates interquartile range of given variable. See <code>rp.univar</code> for details.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">rp.iqr(...)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>
    parameters to be passed to
    <code>rp.univar</code>
    function
   </p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a numeric value with variable&apos;s interquartile range</p>
<a id="rp.kurtosis"> </a>
##### rp.kurtosis: Kurtosis
###### Description:
<p> Calculates kurtosis of given variable. See <code>rp.univar</code> for details.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">rp.kurtosis(...)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>
    parameters to be passed to
    <code>rp.univar</code>
    function
   </p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a numeric value with variable&apos;s kurtosis</p>
<a id="rp.max"> </a>
##### rp.max: Maximum
###### Description:
<p> Returns the maximum of all values in a vector by passing{codemax as <code>fn</code> argument to <code>rp.univar</code> function.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">rp.max(...)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>
    parameters to be passed to
    <code>rp.univar</code>
    function
   </p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a numeric value with maximum value</p>
<a id="rp.mean"> </a>
##### rp.mean: Mean
###### Description:
<p> Calculates mean of given variable by passing <code>sum</code> as <code>fn</code> argument to <code>rp.univar</code> function.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">rp.mean(...)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>
    parameters to be passed to
    <code>rp.univar</code>
    function
   </p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a numeric value with variable&apos;s mean</p>
<a id="rp.median"> </a>
##### rp.median: Median
###### Description:
<p> Calculates median of given variable. See <code>rp.univar</code> for details.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">rp.median(...)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>
    parameters to be passed to
    <code>rp.univar</code>
    function
   </p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a numeric value with variable&apos;s median</p>
<a id="rp.min"> </a>
##### rp.min: Minimum
###### Description:
<p> Returns the minimum of all values in a vector by passing{codemin as <code>fn</code> argument to <code>rp.univar</code> function.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">rp.min(...)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>
    parameters to be passed to
    <code>rp.univar</code>
    function
   </p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a numeric value with minimum value</p>
<a id="rp.missing"> </a>
##### rp.missing: Missing Cases
###### Description:
<p> Returns a number of missing ( <code>NA</code> ) values in avariable. This is a wrapper around <code>rp.univar</code> function with anonymous functionpassed to count number of <code>NA</code> elements in avariable.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">rp.missing(...)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>
    parameters to be passed to
    <code>rp.univar</code>
    function
   </p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a numeric value with number of missing vector elements</p>
<a id="rp.n"> </a>
##### rp.n: Sample Size
###### Description:
<p> Returns sample size with <code>NA</code> s included. This is awrapper around <code>rp.univar</code> function with <code>length</code> function passed in <code>fn</code> argument. However, it will not account for missing valuesregardless of the value of <code>na.rm</code> argument. Inorder to get a number of valid responses, use <code>rp.valid</code> .</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">rp.n(...)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>
    arguments to be passed to
    <code>rp.univar</code>
    function
   </p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a numeric value specifying vector length</p>
<a id="rp.range"> </a>
##### rp.range: Range
###### Description:
<p> Calculates difference between the largest and thesmallest value in a vector. See <code>rp.univar</code> for details.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">rp.range(...)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>
    parameters to be passed to
    <code>rp.univar</code>
    function
   </p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a numeric value with calculated range</p>
<a id="rp.sd"> </a>
##### rp.sd: Standard Deviation
###### Description:
<p> Calculates standard deviation of given variable. See <code>rp.univar</code> for details.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">rp.sd(...)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>
    parameters to be passed to
    <code>rp.univar</code>
    function
   </p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a numeric value with variable&apos;s standard deviation</p>
<a id="rp.se.mean"> </a>
##### rp.se.mean: Standard Error of Mean
###### Description:
<p> Calculates standard error of mean for given variable. See <code>rp.univar</code> for details.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">rp.se.mean(...)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>
    parameters to be passed to
    <code>rp.univar</code>
    function
   </p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a numeric value with standard error of mean</p>
<a id="rp.skewness"> </a>
##### rp.skewness: Skewness
###### Description:
<p> Calculates skewness of given variable. See <code>rp.univar</code> for details.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">rp.skewness(...)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>
    parameters to be passed to
    <code>rp.univar</code>
    function
   </p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a numeric value with variable&apos;s skewness</p>
<a id="rp.sum"> </a>
##### rp.sum: Sum
###### Description:
<p> Returns the sum of variable&apos;s elements, by passing <code>sum</code> as <code>fn</code> argument to <code>rp.univar</code> function.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">rp.sum(...)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>
    parameters to be passed to
    <code>rp.univar</code>
    function
   </p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a numeric value with sum of vector elements</p>
<a id="rp.univar"> </a>
##### rp.univar: Descriptive Statistics
###### Description:
<p> This function operates only on vectors or their subsets,by calculating a descriptive statistic specified in <code>fn</code> argument. Yielded result is rounded to 3decimal places by default (which can be changed bypassing an integer to <code>decimals</code> argument).</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">rp.univar(x, subset = NULL, fn, na.rm = TRUE, ...)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>a numeric variable to be summarised</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>subset</code>
  </td>
  <td>
   <p>
    an expression that evaluates to logical
vector (defaults to
    <code>NULL</code>
    , in which case the
function specified in
    <code>fun</code>
    is applied on a vector)
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>fn</code>
  </td>
  <td>
   <p>a function or a function name to be applied on
a variable or it&apos;s subset</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>na.rm</code>
  </td>
  <td>
   <p>
    a logical value indicating whether NA&apos;s
should be removed (defaults to
    <code>TRUE</code>
    )
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>
    additional arguments for function specified in
    <code>fn</code>
   </p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a numeric</p>
<a id="rp.valid"> </a>
##### rp.valid: Valid Cases
###### Description:
<p> Returns a number of valid (non- <code>NA</code> ) values in avariable. This is a wrapper around <code>rp.univar</code> function with <code>length</code> function passed in <code>fn</code> argument, but with missing values previously removed.However, it&apos;s not possible to cancel <code>NA</code> omissionwith this function(doing so will yield error) - use <code>rp.n</code> for those purposes.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">rp.valid(...)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>
    parameters to be passed to
    <code>rp.univar</code>
    function
   </p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a numeric value with number of valid (non-NA) vector
elements</p>
<a id="rp.var"> </a>
##### rp.var: Variance
###### Description:
<p> Calculates variance of given variable. See <code>rp.univar</code> for details.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">rp.var(...)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>
    parameters to be passed to
    <code>rp.univar</code>
    function
   </p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a numeric value with variable&apos;s variance</p>

<a id="Generic-stat-helper-functions"> </a>
#### Generic stat helper functions

<a id="htest"> </a>
##### htest: Hypothesis Tests
###### Description:
<p> This function uses <code>htest.short</code> , to extractstatistic and p-value from <code>htest</code> -classed object.Main advantage of using <code>htest</code> is that it&apos;svectorised, and can accept multiple methods.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">htest(x, ..., use.labels = TRUE)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>
    arguments to be passed to function specified in
    <code>test</code>
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>
    additional arguments for function specified in
    <code>test</code>
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>use.labels</code>
  </td>
  <td>
   <p>
    a logical value indicating whether
variable labels should be placed in row names. If set to
    <code>FALSE</code>
    , output of
    <code>deparse(substitute(x))</code>
    will be used.
   </p>
  </td>
 </tr>
</table>
###### Returned value:
<p>
 a
 <code>data.frame</code>
 with applied tests in rows, and their
results (statistic and p-value) in columns
</p>
###### Examples:
<div class="highlight"><pre><code class="r">library(nortest)
htest(rnorm(100), shapiro.test)
htest(rnorm(100), lillie.test, ad.test, shapiro.test)
htest(mtcars, lillie.test)
htest(mtcars, lillie.test, ad.test, shapiro.test)
</code></pre>
</div>

<a id="htest.short"> </a>
##### htest.short:  Extract Values from <code>htest</code> Objects
###### Description:
<p> Extract value of statistic and its p-value from <code>htest</code> object.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">htest.short(x)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>
    <code>htest</code>
    -class object
   </p>
  </td>
 </tr>
</table>
###### Returned value:
<p>named numeric vector with the value of statistic and its
p-value</p>
###### Examples:
<div class="highlight"><pre><code class="r">e(shapiro.test(rnorm(100))
</code></pre>
</div>

<a id="lambda.test"> </a>
##### lambda.test: Goodman and Kruskal&apos;s lambda
###### Description:
<p>Computes Goodman and Kruskal&apos;s lambda for given table.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">lambda.test(table, direction = 0)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>table</code>
  </td>
  <td>
   <p>
    a
    <code>table</code>
    of two variables
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>direction</code>
  </td>
  <td>
   <p>
    numeric value of
    <code>c(0,1,2)</code>
    where 1
means the lambda value computed for row, 2 for columns
and 0 for both
   </p>
  </td>
 </tr>
</table>
###### Returned value:
<p>numeric</p>
<a id="rp.outlier"> </a>
##### rp.outlier: Outlier test
###### Description:
<p>A simple test for outliers. This functions returns allextreme values (if any) found in the specified vector.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">rp.outlier(x)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>a numeric vector of values</p>
  </td>
 </tr>
</table>
###### Returned value:
<p>vecotor of outlier values</p>
###### References:
<p>
 Credit goes to PaulHurleyuk:
 <a href="http://stackoverflow.com/a/1444548/564164">http://stackoverflow.com/a/1444548/564164</a>
 Lund, R.
E. 1975, &quot;Tables for An Approximate Test for Outliers in
Linear Models&quot;, Technometrics, vol. 17, no. 4, pp.
473-476. Prescott, P. 1975, &quot;An Approximate Test for
Outliers in Linear Models&quot;, Technometrics, vol. 17, no.
1, pp. 129-132.
</p>
###### Examples:
<div class="highlight"><pre><code class="r">rp.outlier(mtcars$hp)
rp.outlier(c(rep(1,100), 200))
rp.outlier(c(rep(1,100), 200,201))
</code></pre>
</div>


<a id="Template-related-functions"> </a>
#### Template related functions

<a id="check.limit"> </a>
##### check.limit: Input Limits
###### Description:
<p> Checks input limits based on provided string. If providedstring is syntactically correct, a list with integerscontaining limit boundaries (minimum and maximum value)is returned. If provided input limit exceeds valuespecified in <code>max.lim</code> argument, it will be coercedto <code>max.lim</code> and warning will be returned. Defaultupper input limit is 50 (variables).</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">check.limit(x, max.lim = 50L)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>a character string containing limit substring</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>max.lim</code>
  </td>
  <td>
   <p>an integer containing upper input limit</p>
  </td>
 </tr>
</table>
###### Returned value:
<p>
 a named list with
 <code>min</code>
 imal and
 <code>max</code>
 imal input
limit
</p>
###### Examples:
<div class="highlight"><pre><code class="r">rapport:::check.limit(&quot;[1,20]&quot;)
rapport:::check.limit(&quot;[1]&quot;)

</code></pre>
</div>

<a id="check.name"> </a>
##### check.name: Naming Conventions
###### Description:
<p>Checks package-specific naming conventions: variablesshould start by a letter, followed either by a letter ora digit, while the words should be separated with dots orunderscores.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">check.name(x, size = 30L, ...)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>a character vector to test names</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>size</code>
  </td>
  <td>
   <p>an integer value that indicates maximum name
length</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>
    additional arguments to be passed to
    <code>grepl</code>
    function
   </p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a logical vector indicating which values satisfy the
naming conventions</p>
<a id="check.type"> </a>
##### check.type: Check Type
###### Description:
<p>Checks type of template input, based on provided sting.If input definition is syntactically correct, a list isreturned, containing input type, size limits, and defaultvalue (for CSV options and boolean types only).</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">check.type(x)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>a character string containing input definition</p>
  </td>
 </tr>
</table>
###### Examples:
<div class="highlight"><pre><code class="r">rapport:::check.type(&quot;factor&quot;)
rapport:::check.type(&quot;character[1,20]&quot;)
rapport:::check.type(&quot;fee, fi, foo, fam&quot;)
rapport:::check.type(&quot;FALSE&quot;)
</code></pre>
</div>

<a id="elem.eval"> </a>
##### elem.eval: Evaluate Template Element
###### Description:
<p> This is a generic method that evaluates R code found in <code>rapport</code> template elements. Currently there are twotypes of template elements: <code>blocks</code> of R code(similar to chunks in <code>Sweave</code> ) or <code>inline</code> elements.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">elem.eval(x, ...)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>either a list with character vector</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>additional arguments passed to other
evaluation methods</p>
  </td>
 </tr>
</table>
<a id="extract.meta"> </a>
##### extract.meta: Extract Template Metadata
###### Description:
<p>Check if template metadata field matches provided format,and return matched value in a list.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">extract.meta(x, title, regex, replacement = &quot;\1&quot;,    short = NULL, trim.white = TRUE, mandatory = TRUE, ...)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>a string containing template metadata</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>title</code>
  </td>
  <td>
   <p>a string containint metadata field title
(can be regex-powered)</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>regex</code>
  </td>
  <td>
   <p>a string with regular expression to match
field value</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>replacement</code>
  </td>
  <td>
   <p>
    a string containing a backreference to
matched string (defaults to first match
    <code>\1</code>
    )
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>short</code>
  </td>
  <td>
   <p>a string with a short name for given
metadata field</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>trim.white</code>
  </td>
  <td>
   <p>a logical value indicating whether
trailing and leading whitespaces of the given string
should be removed before extraction</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>mandatory</code>
  </td>
  <td>
   <p>a logical value indicating required
field</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>
    additional parameters for
    <code>grepl</code>
    function
   </p>
  </td>
 </tr>
</table>
###### Returned value:
<p>
 a list with matched content, or
 <code>NULL</code>
 if the field
is not required
</p>
###### Examples:
<div class="highlight"><pre><code class="r">    extract.metadata(&quot;Name: John Smith&quot;, &quot;Name&quot;, &quot;[[:alpha:]]+( [[:alpha:]]+)?&quot;)
    ## $name
    ## [1] &quot;John Smith&quot;
    extract.metadata(&quot;Name: John&quot;, &quot;Name&quot;, &quot;[[:alpha:]]+( [[:alpha:]]+)?&quot;)
    ## $name
    ## [1] &quot;John&quot;
</code></pre>
</div>

<a id="fml"> </a>
##### fml: Create Formula from Strings
###### Description:
<p>Takes multiple character arguments as left and right-handside arguments of a formula, and concatenates them in asingle string.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">fml(left, right, join.left = &quot; + &quot;, join.right = &quot; + &quot;)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>left</code>
  </td>
  <td>
   <p>a string with left-hand side formula
argument</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>right</code>
  </td>
  <td>
   <p>a character vector with right-hand side
formula arguments</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>join.left</code>
  </td>
  <td>
   <p>
    a string to catenate elements of
character vector specified in
    <code>left</code>
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>join.right</code>
  </td>
  <td>
   <p>
    a string to catenate elements of
character vector specified in
    <code>right</code>
   </p>
  </td>
 </tr>
</table>
###### Examples:
<div class="highlight"><pre><code class="r">fml(&quot;hp&quot;, c(&quot;am&quot;, &quot;cyl&quot;))</code></pre>
</div>

<a id="get.tags"> </a>
##### get.tags: Tag Values
###### Description:
<p>Returns report tag vales: either ones that were set byuser, or the default ones.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">get.tags(tag.type = c(&quot;all&quot;, &quot;chunk.open&quot;, &quot;chunk.close&quot;, &quot;inline.open&quot;, &quot;inline.close&quot;, &quot;header.open&quot;, &quot;header.close&quot;, &quot;comment.open&quot;, &quot;comment.close&quot;),    preset = c(&quot;user&quot;, &quot;default&quot;))</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>tag.type</code>
  </td>
  <td>
   <p>a character value with tag value name</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>preset</code>
  </td>
  <td>
   <p>a character value specifying which preset
to return</p>
  </td>
 </tr>
</table>
###### Returned value:
<p>either a list (default) or a character value with tag
names</p>
<a id="grab.chunks"> </a>
##### grab.chunks: Inline Chunk Contents
###### Description:
<p>Returns inline code chunks with or without tags that wrapthem.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">grab.chunks(x, tag.open = get.tags(&quot;inline.open&quot;),    tag.close = get.tags(&quot;inline.close&quot;), include = FALSE,    ...)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>a character vector</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>tag.open</code>
  </td>
  <td>
   <p>a character value with opening tag
regular expression</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>tag.close</code>
  </td>
  <td>
   <p>a character value with closing tag
regular expression</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>include</code>
  </td>
  <td>
   <p>
    a logical value indicating wheter chunks
should be returned (defaults to
    <code>FALSE</code>
    )
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>
    additional arguments for
    <code>gregexpr</code>
    function
   </p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a character vector with code chunks</p>
###### Examples:
<div class="highlight"><pre><code class="r">    s &lt;- c(&quot;As you know, pi equals &lt;%pi%&gt;&quot;,  &quot;2 raised to the power of 3 is &lt;%2^3%&gt;&quot;)
    grab.chunks(s, &quot;&lt;%&quot;, &quot;%&gt;&quot;, FALSE)
    ## [1] &quot;pi&quot;  &quot;2^3&quot;
    grab.chunks(s, &quot;&lt;%&quot;, &quot;%&gt;&quot;, FALSE)
    ## [1] &quot;&lt;%pi%&gt;&quot;  &quot;&lt;%2^3%&gt;&quot;
</code></pre>
</div>

<a id="has.tags"> </a>
##### has.tags: Tag Existence
###### Description:
<p>Checks if a character value contains specified tags.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">has.tags(x, ...)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>
    a character value to check for
    <code>brew</code>
    strings
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>
    additional arguments for
    <code>grepl</code>
    function
   </p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a logical value indicating if the string has passed the
check</p>
<a id="is.heading"> </a>
##### is.heading: Pandoc Heading
###### Description:
<p>Checks if provided string is a valid ATX-style pandocheading.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">is.heading(x)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>a string to test for pandoc heading format</p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a logical value indicating the string is (not) a pandoc
heading</p>
<a id="is.rapport"> </a>
##### is.rapport: Rapport
###### Description:
<p>Checks if provided R object is &quot;rapport&quot; class.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">is.rapport(x)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>any R object to check</p>
  </td>
 </tr>
</table>
###### Returned value:
<p>logical</p>
<a id="is.tabular"> </a>
##### is.tabular: Tabular Structure
###### Description:
<p> Checks if object has &quot;tabular&quot; structure - in thisparticular case, that means <code>matrix</code> and <code>data.frame</code> classes only.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">is.tabular(x)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>an object to be checked for &quot;tabular&quot; format</p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a logical value indicating that provided object has
tabular structure</p>
<a id="is.variable"> </a>
##### is.variable: Variables
###### Description:
<p> From our point of view, a <code>variable</code> is anon- <code>NULL</code> atomic vector that has no dimensions.This approach bypasses <code>factor</code> issues with <code>is.vector</code> , and also eliminatesmultidimensional vectors, such as matrices and arrays.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">is.variable(x)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>an object to be checked for &quot;variable&quot; format</p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a logical value indicating that provided object is a
&quot;variable&quot;</p>
<a id="pct"> </a>
##### pct: Percent
###### Description:
<p> Appends a percent sign to provided numerical value.Rounding is carried out according to value passed in <code>decimals</code> formal argument (defaults to 2 decimalplaces).</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">pct(x, decimals = 2,    type = c(&quot;percent&quot;, &quot;%&quot;, &quot;proportion&quot;))</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>a numeric value that is to be rendered to
percent</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>decimals</code>
  </td>
  <td>
   <p>an integer value indicating number of
decimal places</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>type</code>
  </td>
  <td>
   <p>a character value indicating whether percent
or proportion value was provided (partial match is
allowed)</p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a character value with formatted percent</p>
<a id="p"> </a>
##### p: Inline Printing
###### Description:
<p>Merge atomic vector elements in one string for prettyinline printing.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">p(x, wrap = getOption(&quot;p.wrap&quot;),    sep = getOption(&quot;p.sep&quot;),    copula = getOption(&quot;p.copula&quot;), limit = 20L)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>an atomic vector to get merged for inline
printing</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>wrap</code>
  </td>
  <td>
   <p>
    string to wrap vector elements (defaults to
    <code>_</code>
    , i.e. underline in pandoc)
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>sep</code>
  </td>
  <td>
   <p>a string with main separator (separates all
vector elements but the last one)</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>copula</code>
  </td>
  <td>
   <p>a string with last separator (usually a
copula like &quot;and&quot;)</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>limit</code>
  </td>
  <td>
   <p>maximum character length (defaults to 20
elements)</p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a string with catenated vector contents</p>
###### Examples:
<div class="highlight"><pre><code class="r">p(c(&quot;fee&quot;, &quot;fi&quot;, &quot;foo&quot;, &quot;fam&quot;))
## [1] &quot;_fee_, _fi_, _foo_ and _fam_&quot;</code></pre>
</div>

<a id="print.rapport"> </a>
##### print.rapport: Prints rapport
###### Description:
<p>Default print method for &quot;rapport&quot; class objects.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">print.rapport(x, metadata = FALSE, inputs = FALSE,    body = TRUE)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>any &quot;rapport&quot; class object</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>metadata</code>
  </td>
  <td>
   <p>logical: print metadata?</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>inputs</code>
  </td>
  <td>
   <p>logical: print input parameters?</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>body</code>
  </td>
  <td>
   <p>logical: print body?</p>
  </td>
 </tr>
</table>
###### Examples:
<div class="highlight"><pre><code class="r">rapport(&apos;univar-descriptive&apos;, data=mtcars, var=&apos;hp&apos;)
print(rapport(&apos;univar-descriptive&apos;, data=mtcars, var=&apos;hp&apos;), metadata=T)
print(rapport(&apos;univar-descriptive&apos;, data=mtcars, var=&apos;hp&apos;), metadata=T, inputs=T)
print(rapport(&apos;example&apos;, data=mtcars, x=&apos;hp&apos;, y=&apos;mpg&apos;), metadata=T, inputs=T)
print(rapport(&apos;example&apos;, data=mtcars, x=&apos;hp&apos;, y=&apos;mpg&apos;), metadata=T, inputs=T, body=F)
</code></pre>
</div>

<a id="print.rp.info"> </a>
##### print.rp.info: Print Template Header
###### Description:
<p>Prints out the contents of template header (metadata andinputs) in human-readable format, so you can get insightabout template requirements.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">print.rp.info(x, type = c(&quot;text&quot;, &quot;pandoc&quot;))</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>
    object of class
    <code>rp.header</code>
    . See
    <code>tpl.header</code>
    for details.
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>type</code>
  </td>
  <td>
   <p>a string with output format. Defaults to
plain text output.</p>
  </td>
 </tr>
</table>
<a id="print.rp.inputs"> </a>
##### print.rp.inputs: Print Template Inputs
###### Description:
<p>Prints out the contents of template inputs inhuman-readable format.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">print.rp.inputs(x, type = c(&quot;text&quot;, &quot;pandoc&quot;))</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>
    object of class
    <code>rp.inputs</code>
    . See
    <code>tpl.inputs</code>
    for details.
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>type</code>
  </td>
  <td>
   <p>a string with output format. Defaults to
plain text output.</p>
  </td>
 </tr>
</table>
<a id="print.rp.meta"> </a>
##### print.rp.meta: Print Template Metadata
###### Description:
<p>Prints out the contents of template metadata inhuman-readable format.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">print.rp.meta(x, type = c(&quot;text&quot;, &quot;pandoc&quot;))</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>
    object of class
    <code>rp.meta</code>
    . See
    <code>tpl.meta</code>
    for details.
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>type</code>
  </td>
  <td>
   <p>a string with output format. Defaults to
plain text output.</p>
  </td>
 </tr>
</table>
<a id="purge.comments"> </a>
##### purge.comments: Purge Comments
###### Description:
<p>Remove comments from provided character vector.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">purge.comments(x,    comment.open = get.tags(&quot;comment.open&quot;),    comment.close = get.tags(&quot;comment.close&quot;))</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>a character string to remove comments from</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>comment.open</code>
  </td>
  <td>
   <p>a string containing opening tag</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>comment.close</code>
  </td>
  <td>
   <p>a string containing closing tag</p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a string with removed pandoc comments</p>
<a id="rapport"> </a>
##### rapport: rapport templating system
###### Description:
<p>Description goes here.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">rapport(fp, data = NULL, ..., reproducible = FALSE)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>fp</code>
  </td>
  <td>
   <p>a string containing a template name/path or a
character vector with template contents</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>data</code>
  </td>
  <td>
   <p>
    a
    <code>data.frame</code>
    to be used in template
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>matches template inputs in format &apos;key =
&quot;value&quot;&apos;</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>reproducible</code>
  </td>
  <td>
   <p>
    a logical value indicating if the
call and data should be stored in template object, thus
making it reproducible (see
    <code>tpl.rerun</code>
    for
details)
   </p>
  </td>
 </tr>
</table>
###### Returned value:
<p>
 a list with
 <code>rapport</code>
 class.
</p>
###### Examples:
<div class="highlight"><pre><code class="r">rapport(&quot;example&quot;, ius2008, var=&quot;it.leisure&quot;, desc=FALSE, hist=T, color=&quot;green&quot;)
</code></pre>
</div>

<a id="rp.label"> </a>
##### rp.label: Get variable label
###### Description:
<p> This function returns character value previously storedin variable&apos;s <code>label</code> attribute. If none found, thefunction fallbacks to object&apos;s name (retrieved by <code>deparse(substitute(x))</code> ).</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">rp.label(x, fallback = TRUE)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>an R object to extract labels from</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>fallback</code>
  </td>
  <td>
   <p>a logical value indicating if labels
should fallback to object name(s)</p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a character vector with variable&apos;s label(s)</p>
###### Examples:
<div class="highlight"><pre><code class="r">x &lt;- rnorm(100)
rp.label(x)         # returns &quot;x&quot;
rp.label(x, FALSE)  # fails with error message
rp.label(mtcars$hp) &lt;- &quot;Horsepower&quot;
rp.label(mtcars)    # returns &quot;Horsepower&quot; instead of &quot;hp&quot;
rp.label(mtcars, FALSE)  # returns NA where no labels are found
</code></pre>
</div>

<a id="rp.label-set"> </a>
##### rp.label-set: Set variable label
###### Description:
<p> this function sets a label to an <code>atomic</code> vector, by storing a character value to its <code>label</code> attribute.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">rp.label(var, value) &lt;- value</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>var</code>
  </td>
  <td>
   <p>an atomic vector</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>value</code>
  </td>
  <td>
   <p>a character value that is to be set as
variable label</p>
  </td>
 </tr>
</table>
###### Examples:
<div class="highlight"><pre><code class="r">    rp.label(mtcars$mpg) &lt;- &quot;fuel consumption&quot;
    x &lt;- rnorm(100); ( rp.label(x) &lt;- &quot;pseudo-random normal variable&quot; )
</code></pre>
</div>

<a id="rp.name"> </a>
##### rp.name: Get variable name
###### Description:
<p> This function returns character value previously storedin variable&apos;s <code>name</code> attribute. If none found, thefunction fallbacks to object&apos;s name.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">rp.name(var)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>var</code>
  </td>
  <td>
   <p>an atomic vector</p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a character value with variable&apos;s label</p>
###### Examples:
<div class="highlight"><pre><code class="r">rp.name(mtcars$am)
x &lt;- 1:10; rp.name(x)
</code></pre>
</div>

<a id="rp.prettyascii"> </a>
##### rp.prettyascii: Return pretty ascii form
###### Description:
<p>Some standard formatting is applied to the value which isreturned as ascii object.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">rp.prettyascii(x)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>R object</p>
  </td>
 </tr>
</table>
###### Returned value:
<p>ascii</p>
###### Examples:
<div class="highlight"><pre><code class="r">rp.prettyascii(&apos;Hallo, World?&apos;)
rp.prettyascii(22/7)
rp.prettyascii(matrix(runif(25), 5, 5))
rp.prettyascii(lm(hp~wt, mtcars))

</code></pre>
</div>

<a id="rp.round"> </a>
##### rp.round: Round numeric values
###### Description:
<p> Round numeric values with default number of decimals(see: <code>getOption(&apos;rp.decimal&apos;</code> ) and decimal mark(see: <code>getOption(&apos;rp.decimal&apos;)</code> ).</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">rp.round(x, scientific = FALSE)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>numeric value(s)</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>scientific</code>
  </td>
  <td>
   <p>
    see
    <code>format</code>
    &apos;s manual: Either a
logical specifying whether elements of a real or complex
vector should be encoded in scientific format, or an
integer penalty (see ‘options(&quot;scipen&quot;)’).  Missing
values correspond to the current default penalty.
   </p>
  </td>
 </tr>
</table>
###### Returned value:
<p>character vector of rounded value(s)</p>
###### Examples:
<div class="highlight"><pre><code class="r">	rp.round(22/7)
	rp.round(matrix(runif(9),3,3))
}</code></pre>
</div>

<a id="table.json"> </a>
##### table.json: Convert table-like structures to JSON object
###### Description:
<p> This function takes either a <code>matrix</code> or a <code>data.frame</code> object to extract column names,row names and the &quot;body&quot; of the table-like object, henceexports them to JSON.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">table.json(d, name.rows = &quot;rows&quot;, name.cols = &quot;cols&quot;,    name.body = &quot;body&quot;)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>d</code>
  </td>
  <td>
   <p>
    either a
    <code>matrix</code>
    or a
    <code>data.frame</code>
    object
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>name.rows</code>
  </td>
  <td>
   <p>a string naming object that contains row
names</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>name.cols</code>
  </td>
  <td>
   <p>a string naming object that contains
columns names</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>name.body</code>
  </td>
  <td>
   <p>a string naming object that contains
table body</p>
  </td>
 </tr>
</table>
###### Returned value:
<p>
 string with JSON object containing
 <code>rows</code>
 ,
 <code>cols</code>
 and
 <code>body</code>
 attributes.
</p>
###### Examples:
<div class="highlight"><pre><code class="r">    table.json(mtcars)
    set.seed(1)
    m &lt;- matrix(sample(10, 100, TRUE), 10)
    table.json(m)
</code></pre>
</div>

<a id="tags.misplaced"> </a>
##### tags.misplaced: Misplaced Tags
###### Description:
<p>Searches for misplaced tags</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">tags.misplaced(x, tag.open = get.tags(&quot;inline.open&quot;),    tag.close = get.tags(&quot;inline.close&quot;))</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>a string to check for misplaced tags</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>tag.open</code>
  </td>
  <td>
   <p>a string containing opening tag</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>tag.close</code>
  </td>
  <td>
   <p>a string containing closing tag</p>
  </td>
 </tr>
</table>
###### Returned value:
<p>if no tags, or no mismatches are found, original string
is returned, otherwise the function will return
appropriate error</p>
<a id="tpl.body"> </a>
##### tpl.body: Template Body
###### Description:
<p>Returns template body contents from provided path or acharacter vector.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">tpl.body(fp, htag = get.tags(&quot;header.close&quot;), ...)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>fp</code>
  </td>
  <td>
   <p>a string containing a path to template, or a
character vector with template lines</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>htag</code>
  </td>
  <td>
   <p>a string with closing body tag</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>
    additional arguments to be passed to
    <code>grep</code>
    function
   </p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a character vector with template body contents</p>
<a id="tpl.elem"> </a>
##### tpl.elem: Template Elements
###### Description:
<p> Returns a <code>data.frame</code> containing summary ofrelevant template elements: <code>ind</code> - indice ofcurrent element in template&apos;s body, <code>type</code> - astring indicating the type of the content (&quot;heading&quot;,&quot;inline&quot; or &quot;block&quot;), and <code>chunk</code> - a stringcontaining R expression found in a code chunk.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">tpl.elem(fp,    extract = c(&quot;all&quot;, &quot;heading&quot;, &quot;inline&quot;, &quot;block&quot;),    use.body = FALSE, skip.blank.lines = TRUE,    skip.r.comments = FALSE, ...)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>fp</code>
  </td>
  <td>
   <p>a string containing a path to template, or a
character vector with template lines</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>extract</code>
  </td>
  <td>
   <p>a string indicating which elements should
be extracted from the template: headings, blocks, or code
chunks (by default it returns all of the above)</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>use.body</code>
  </td>
  <td>
   <p>a logical value indicating whether the
whole template should be used, or just its body</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>skip.blank.lines</code>
  </td>
  <td>
   <p>remove blank lines within R
chunks</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>skip.r.comments</code>
  </td>
  <td>
   <p>remove comments withing R chunks</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>
    additional arguments to be passed to
    <code>grep</code>
    and
    <code>get.tags</code>
    functions
   </p>
  </td>
 </tr>
</table>
###### Returned value:
<p>
 a
 <code>data.frame</code>
 with 3 columns:
</p>
###### Examples:
<div class="highlight"><pre><code class="r">    fp &lt;- system.file(&quot;templates&quot;, &quot;example.tpl&quot;, package = &quot;rapport&quot;)
    tpl.elem(fp) # returns all elements (headings, inlines and blocks)
    ## returns only code blocks
    tpl.elem(fp, extract = &quot;block&quot;)
</code></pre>
</div>

<a id="tpl.example"> </a>
##### tpl.example: Template Examples
###### Description:
<p> Runs the &quot;Example&quot; field found in specified template.Handy to check out what template does and how does itlook like once rendered. If multiple examples areavailable, and <code>index</code> argument is <code>NULL</code> , youwill be prompted for input. Example output can be easilyexported to various formats (HTML, ODT, etc.) - check outdocumentation for <code>tpl.export</code> for more info.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">tpl.example(fp, index = NULL)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>fp</code>
  </td>
  <td>
   <p>a character vector containing template name
(&quot;.tpl&quot; extension is optional), file path or a text to be
split by lines</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>index</code>
  </td>
  <td>
   <p>a numeric vector indicating the example
index. Meaningful only while running templates with
multiple examples specified, otherwise omitted. In most
cases this should be a single numeric value. If multiple
numbers are provided, the examples are returned in a
list. Using &apos;all&apos; (character string) as index will return
all examples.</p>
  </td>
 </tr>
</table>
###### Examples:
<div class="highlight"><pre><code class="r">tpl.example(&apos;example&apos;)
tpl.example(&apos;crosstable&apos;)
tpl.export(tpl.example(&apos;crosstable&apos;))
tpl.example(&apos;example&apos;, 1:2)
tpl.example(&apos;example&apos;, &apos;all&apos;)
</code></pre>
</div>

<a id="tpl.export.backends"> </a>
##### tpl.export.backends: tpl.export.backends
###### Description:
<p>List of all available backend formats (from asciipackage).</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">tpl.export.backends()</code></pre>
</div>
<a id="tpl.export.outputs"> </a>
##### tpl.export.outputs: tpl.export.outputs
###### Description:
<p>List of all available output formats (from asciipackage).</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">tpl.export.outputs()</code></pre>
</div>
<a id="tpl.export"> </a>
##### tpl.export: Export rapport class
###### Description:
<p> This function exports rapport class objects to variousformats based on ascii package. Note that noerror/warning messages will be shown! By default thisfunction tries to export the report to HTML with pandoc.Some default styles are applied. If you do not need thosedefault settings, use your own <code>options</code> .</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">tpl.export(rp = NULL, file = NULL, append = FALSE,    create = TRUE, open = TRUE,    date = format(Sys.time(), getOption(&quot;rp.date.format&quot;)),    desc = TRUE, format = &quot;html&quot;, backend = &quot;pandoc&quot;,    options = NULL)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>rp</code>
  </td>
  <td>
   <p>a rapport class object or list of rapport class
objects</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>file</code>
  </td>
  <td>
   <p>filename (NULL returns a tempfile)</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>append</code>
  </td>
  <td>
   <p>FALSE (new report created) or an R object
(class of &quot;Report&quot;) to which the new report will be
added</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>create</code>
  </td>
  <td>
   <p>should export really happen? It might be
handy if you want to append several reports.</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>open</code>
  </td>
  <td>
   <p>open the exported document? Default set to
TRUE.</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>date</code>
  </td>
  <td>
   <p>character string as the date field of the
report. If not set, current time will be set.</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>desc</code>
  </td>
  <td>
   <p>add Description of the rapport class
(template)? Default set to TRUE.</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>format</code>
  </td>
  <td>
   <p>
    format of the wanted report, see:
    <code>ascii:::asciiOpts(&quot;.outputs&quot;)</code>
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>backend</code>
  </td>
  <td>
   <p>
    backend for the format conversions, see:
    <code>scii:::asciiOpts(&quot;.backends&quot;)</code>
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>options</code>
  </td>
  <td>
   <p>command line options passed to backend</p>
  </td>
 </tr>
</table>
###### Examples:
<div class="highlight"><pre><code class="r">## eval some template
x &lt;- rapport(&apos;univar-descriptive&apos;, data=mtcars, var=&quot;hp&quot;)
## try basic parameters
tpl.export(x)
tpl.export(x, file=&apos;demo&apos;)
tpl.export(x, file=&apos;demo&apos;, format=&apos;odt&apos;)
### append reports
# 1) Create a report object with the first report and do not export (optional)
report &lt;- tpl.export(x, create=F)
# 2) Append some other reports without exporting (optional)
report &lt;- tpl.export(x, create=F, append=report)
# 3) Export it!
tpl.export(append=report)
# 4) Export it to other formats too! (optional)
tpl.export(append=report, format=&apos;rst&apos;)
### exporting multiple reports at once
tpl.export(tpl.example(&apos;example&apos;, &apos;all&apos;))
tpl.export(tpl.example(&apos;example&apos;, &apos;all&apos;), format=&apos;odt&apos;)
tpl.export(list(rapport(&apos;univar-descriptive&apos;, data=mtcars, var=&quot;hp&quot;),
    rapport(&apos;univar-descriptive&apos;, data=mtcars, var=&quot;mpg&quot;)))
### Never do this as being dumb:
tpl.export()
### Adding own custom CSS to exported HTML
tpl.export(x, options=sprintf(&apos;-c %s&apos;, system.file(&apos;templates/css/default.css&apos;, package=&apos;rapport&apos;)))
## For other formats check out backend specific documentation!
## Eg. pandoc uses &quot;--reference-odt&quot; as styles reference for odt exports.
</code></pre>
</div>

<a id="tpl.find"> </a>
##### tpl.find: Read Template
###### Description:
<p> Reads file either from template name, file path or URL,and splits it into lines for easier handling. &quot;find&quot; in <code>tpl.find</code> is borrowed from Emacs parlance - thisfunction actually reads the template.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">tpl.find(fp)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>fp</code>
  </td>
  <td>
   <p>
    a character string containing a template path,
a template name (for package-bundled templates only, and
&quot;.tpl&quot; extension is optional), or template contents
separated by newline (
    <code>\n</code>
    ), or a character vector
with template contents.
   </p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a character vector with template contents</p>
<a id="tpl.header"> </a>
##### tpl.header: Template Header
###### Description:
<p> Returns <code>rapport</code> template header from provided pathor a character vector. In case you&apos;re refering to atemplate bundled with package, you don&apos;t need to providea template extension.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">tpl.header(fp, open.tag = get.tags(&quot;header.open&quot;),    close.tag = get.tags(&quot;header.close&quot;), ...)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>fp</code>
  </td>
  <td>
   <p>a string containing template path, or a
character vector with template contents</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>open.tag</code>
  </td>
  <td>
   <p>a string with opening tag</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>close.tag</code>
  </td>
  <td>
   <p>a string with closing tag</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>
    additional arguments to be passed to
    <code>grep</code>
    function
   </p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a character vector with template header contents</p>
<a id="tpl.info"> </a>
##### tpl.info: Template Info
###### Description:
<p>Provides information about template metadata and inputs.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">tpl.info(fp, meta = TRUE, inputs = TRUE)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>fp</code>
  </td>
  <td>
   <p>a string containing a path to template, or a
character vector with template lines</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>meta</code>
  </td>
  <td>
   <p>
    return template metadata? (defaults to
    <code>TRUE</code>
    )
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>inputs</code>
  </td>
  <td>
   <p>
    return template inputs? (defaults to
    <code>TRUE</code>
    )
   </p>
  </td>
 </tr>
</table>
###### Examples:
<div class="highlight"><pre><code class="r">tpl.info(&apos;example&apos;)  # return both metadata and inputs
tpl.info(&apos;crosstable&apos;, inputs = FALSE)  # return only template metadata
tpl.info(&apos;correlations&apos;, meta = FALSE)  # return only template inputs
</code></pre>
</div>

<a id="tpl.inputs"> </a>
##### tpl.inputs: Template Inputs
###### Description:
<p>Grabs variable definitions from template header.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">tpl.inputs(fp, use.header = TRUE)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>fp</code>
  </td>
  <td>
   <p>a character vector containing template name
(&quot;.tpl&quot; extension is optional), file path or a text to be
split by lines</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>use.header</code>
  </td>
  <td>
   <p>
    a logical value indicating wether the
header section is provided in
    <code>h</code>
    argument
   </p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a list with variable info</p>
<a id="tpl.list"> </a>
##### tpl.list: Package Templates
###### Description:
<p>Lists all templates bundled with current package build.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">tpl.list(...)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>
    additional parameters for
    <code>dir</code>
    function
   </p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a character vector with template files</p>
###### Examples:
<div class="highlight"><pre><code class="r">tpl.list()
</code></pre>
</div>

<a id="tpl.meta"> </a>
##### tpl.meta: Header Metadata
###### Description:
<p>Returns metadata stored in template&apos;s header section,usually template title, nickname of an author, templatedescription and list of required packages.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">tpl.meta(fp, fields = NULL, use.header = FALSE,    trim.white = TRUE)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>fp</code>
  </td>
  <td>
   <p>
    a character vector containing template name
(&quot;.tpl&quot; extension is optional), file path or character
vector with template/header contents (depending on value
of
    <code>use.header</code>
    argument)
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>fields</code>
  </td>
  <td>
   <p>
    a list of named lists containing key-value
pairs that are to be passed to
    <code>extract.meta</code>
    function via
    <code>do.call</code>
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>use.header</code>
  </td>
  <td>
   <p>
    a logical value indicating if the
character vector provided in
    <code>fp</code>
    argument contains
header data
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>trim.white</code>
  </td>
  <td>
   <p>a logical value indicating if the extra
spaces should removed from header fields before
extraction</p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a list with template metadata</p>
<a id="tpl.rerun"> </a>
##### tpl.rerun: Reproduce Template
###### Description:
<p> Runs template with data and arguments included in <code>rapport</code> object. In order to get reproducibleexample, you have to make sure that <code>reproducible</code> argument is set to <code>TRUE</code> in <code>rapport</code> function.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">tpl.rerun(tpl)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>tpl</code>
  </td>
  <td>
   <p>
    a
    <code>rapport</code>
    object
   </p>
  </td>
 </tr>
</table>
###### Examples:
<div class="highlight"><pre><code class="r">tmp &lt;- rapport(&quot;example&quot;, mtcars, x = &quot;hp&quot;, y = &quot;mpg&quot;)
tpl.rerun(tmp)
</code></pre>
</div>


