<a id="Datasets"> </a>
#### Datasets

<a id="ius2008"> </a>
##### ius2008: Internet Usage Survey
###### Description:
<p>This dataset contains data gathered in a survey of Internet usage in Serbian population in the period from April to May 2008. During 90-day period, there were gathered 709 valid responses via on-line distributed questionnaire.</p>
###### Details:
<p>  However, this dataset does not contain the original data, as some  <code>NA</code>  s were added to dataset afterwards, in order to demonstrate functionality of  <em>rapport</em>  helpers. </p>
<p>  Dataset variables can be divided into 3 sets:  <em>demographic data</em>  ,  <em>Internet usage aspects</em>  and  <em>application usage/content preference</em>  . </p>
<p>  <strong>Demographic variables</strong> </p>
<ul>  <li>   <p>    <em>gender</em>    - respondent&apos;s gender (factor with 2 levels: &quot;male&quot; and &quot;female&quot;)   </p>  </li>  <li>   <p>    <em>age</em>    - respondent&apos;s age   </p>  </li>  <li>   <p>    <em>dwell</em>    - dwelling (factor with 3 levels: &quot;village&quot;, &quot;small town&quot; and &quot;city&quot;)   </p>  </li>  <li>   <p>    <em>student</em>    - is respondent a student? (factor with 2 levels: &quot;no&quot; and &quot;yes&quot;)   </p>  </li>  <li>   <p>    <em>partner</em>    - partnership status (factor with 3 levels: &quot;single&quot;, &quot;in a relationship&quot; and &quot;married&quot;)   </p>  </li> </ul>
<p>  <strong>Internet usage aspects</strong> </p>
<p>Following variables depict various aspects of Internet usage:</p>
<ul>  <li>   <p>    <em>edu</em>    - time spent on-line in educational purposes (expressed in hours)   </p>  </li>  <li>   <p>    <em>leisure</em>    - time spent on-line in leisure time (expressed in hours)   </p>  </li>  <li>   <p>    <em>net.required</em>    - is Internet access required for your proffesion? (factor with 5 levels: &quot;never&quot;, &quot;rarely&quot;, &quot;sometimes&quot;, &quot;often&quot; and &quot;always&quot;)   </p>  </li>  <li>   <p>    <em>net.pay</em>    - who pays for Internet access? (factor with 5 levels: &quot;parents&quot;, &quot;school/faculty&quot;, &quot;employer&quot;, &quot;self-funded&quot; and &quot;other&quot;)   </p>  </li>  <li>   <p>    <em>net.use</em>    - how long is respondent using Internet? (ordered factor with 7 levels, ranging from &quot;less than 6 months&quot; to &quot;more than 5 years&quot;)   </p>  </li> </ul>
<p>  <strong>Application usage and on-line content preference</strong> </p>
<p>These variables include data on the use of Internet applications and content available on the Internet. Practically, they contain responses from a set of 8 questions on a five-point Likert scale.</p>
<ul>  <li>   <p>    <em>chatim</em>    - usage of chat and/or instant messaging applications   </p>  </li>  <li>   <p>    <em>game</em>    - usage of on-line games   </p>  </li>  <li>   <p>    <em>surf</em>    - frequency of web-surfing   </p>  </li>  <li>   <p>    <em>email</em>    - usage of e-mail applications   </p>  </li>  <li>   <p>    <em>download</em>    - frequency of file downloading   </p>  </li>  <li>   <p>    <em>forum</em>    - attendance at web-forums   </p>  </li>  <li>   <p>    <em>socnet</em>    - usage of social networking services   </p>  </li>  <li>   <p>    <em>xxx</em>    - traffic to pornographic websites   </p>  </li> </ul>###### Examples:
<div class="highlight"><pre><code class="r">rapport(&quot;example&quot;, ius2008, var = &quot;it.leisure&quot;)
</code></pre>
</div>


<a id="Generic-functions"> </a>
#### Generic functions

<a id="decrypt"> </a>
##### decrypt: Decrypt a string
###### Description:
<p>  Decrypts string encrypted by  <code>encrypt</code>  . </p>
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
<p>  A simple encryption function which reorders the characters in a given string based on a predefined key. As it can be seen: the used encryption is easy to crack, do not use this for sensitive data! The key is set by default on library startup. It can be changed by modifying  <code>options(&apos;.encrypt.key&apos;)</code>  to any character string with same lenght as  <code>options(&apos;.encrypt.chars&apos;)</code>  . E.g.  <code>intToUtf8(sample(c(33, 36:38, 48:57, 64:90, 97:122,   192:246, 248:382), nchar(getOption(&apos;.encrypt.chars&apos;))))</code>  would return a quite complex but readable key. </p>
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

<a id="eval.msgs"> </a>
##### eval.msgs: Eval with messages
###### Description:
<p>This function takes text(s) of R code, evaluates all at one run then returns a list with four elements:</p>
###### Details:
<ul>  <li>   <p>    <em>src</em>    - a character value with specified R code.   </p>  </li>  <li>   <p>    <em>output</em>    - generated output.    <code>NULL</code>    if nothing is returned. If any string returned an R object while evaling then the    <em>last</em>    R object will be returned as a raw R object. If a graph is plotted in the given text, the returned object is a string specifying the path to the saved png in temporary directory (see:    <code>tmpfile()</code>    ). If multiple plots was run in the same run (see: nested lists as inputs above) then the last plot is saved. If graphic device was touched, then no other R objects will be returned.   </p>  </li>  <li>   <p>    <em>type</em>    - class of generated output. &quot;NULL&quot; if nothing is returned, &quot;image&quot; if the graphic device was touched, &quot;error&quot; if some error occured.   </p>  </li>  <li>   <p>    <em>msg</em>    - possible messages grabbed while evaling specified R code with the following structure:   </p>   <ul>    <li>     <p>      <em>messages</em>      - string of possible diagnostic message(s)     </p>    </li>    <li>     <p>      <em>warnings</em>      - string of possible warning message(s)     </p>    </li>    <li>     <p>      <em>errors</em>      - string of possible error message(s)     </p>    </li>   </ul>  </li> </ul>
<p>  Note, that  <code>ggplot2</code>  and  <code>lattice</code>  graphs should be printed in  <code>evals.msg</code>  to show the plot. </p>###### Usage:
<div class="highlight">
	<pre><code class="r">eval.msgs(src, env = NULL)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>src</code>
  </td>
  <td>
   <p>character values containing R code</p>
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
</table>
###### Returned value:
<p>
 a list of parsed elements each containg: src (the command
run), output (what the command returns,
 <code>NULL</code>
 if
nothing returned, path to image file if a plot was
genereted), type (class of returned object if any) and
messages: warnings (if any returned by the command run,
otherwise set to
 <code>NULL</code>
 ) and errors (if any returned
by the command run, otherwise set to
 <code>NULL</code>
 ). See
Details above.
</p>
###### Examples:
<div class="highlight"><pre><code class="r">eval.msgs(&apos;1:5&apos;)
eval.msgs(c(&apos;1:3&apos;, &apos;runiff(23)&apos;))
eval.msgs(c(&apos;1:5&apos;, &apos;3:5&apos;))
eval.msgs(c(&apos;pi&apos;, &apos;1:10&apos;, &apos;NULL&apos;))
eval.msgs(&apos;pi&apos;)
eval.msgs(&apos;1:2&apos;)
identical(evals(&apos;pi&apos;)[[1]], eval.msgs(&apos;pi&apos;))
</code></pre>
</div>

<a id="evals"> </a>
##### evals: Evaluate and Check R Code
###### Description:
<p>  This function takes either a list of integer indices which point to position of R code in  <code>body</code>  character vector, or a vector/list of strings with actual R code, then evaluates each list element, and returns a list with four elements: a character value with R code, generated output, class of generated output and possible error/warning messages. If a graph is plotted in the given text, the returned object is a string specifying the path to the saved png in temporary directory. Please see Details below. </p>
###### Details:
<p>  If input strings are given as vector or not nested list (or even only one string), the returned list&apos;s length equals to the length of the input - as each string is evalued as separate R code in the same environment. If a nested list is provided like  <code>list(c(&apos;runif(1)&apos;,   &apos;runif(1)&apos;))</code>  then all strings found in a list element is evaled at one run so the length of returned list equals to the length of parent list. See examples below. </p>
<p>  As  <code>evals</code>  tries to grab the plots internally, pleas do not run commands that set graphic device or  <code>dev.off</code>  if you want to use  <code>evals</code>  to save the images and return the path of generated png(s). Eg. running  <code>evals(c(&apos;png(&quot;/tmp/x.png&quot;)&apos;, &apos;plot(1:10)&apos;,   &apos;dev.off()&apos;))</code>  would fail. </p>
<p>Returned result values: list with the following elements</p>
<ul>  <li>   <p>    <em>src</em>    - a character value with specified R code.   </p>  </li>  <li>   <p>    <em>output</em>    - generated output.    <code>NULL</code>    if nothing is returned. If any string returned an R object while evaling then the    <em>last</em>    R object will be returned as a raw R object. If a graph is plotted in the given text, the returned object is a string specifying the path to the saved png in temporary directory (see:    <code>tmpfile()</code>    ). If multiple plots was run in the same run (see: nested lists as inputs above) then the last plot is saved. If graphic device was touched, then no other R objects will be returned.   </p>  </li>  <li>   <p>    <em>type</em>    - class of generated output. &quot;NULL&quot; if nothing is returned, &quot;image&quot; if the graphic device was touched, &quot;error&quot; if some error occured.   </p>  </li>  <li>   <p>    <em>msg</em>    - possible messages grabbed while evaling specified R code with the following structure:   </p>   <ul>    <li>     <p>      <em>messages</em>      - string of possible diagnostic message(s)     </p>    </li>    <li>     <p>      <em>warnings</em>      - string of possible warning message(s)     </p>    </li>    <li>     <p>      <em>errors</em>      - string of possible error message(s)     </p>    </li>   </ul>  </li> </ul>
<p>  With  <code>check.output</code>  options set to  <code>FALSE</code>  ,  <code>evals</code>  will not check each line of passed R code for outputs to speed up runtime. This way the user is required to pass only reliable and well structured/formatted text to  <code>evals</code>  . A list to check before running code in  <code>evals</code>  : </p>
<ul>  <li>   <p>the code should return on the last line of the passed code (if it returns before that, it would not be grabbed),</p>  </li>  <li>   <p>    the code should always return something on the last line (if you do not want to return anything, add    <code>NULL</code>    as the last line),   </p>  </li>  <li>   <p>ggplot and lattice graphs should be always printed (of course on the last line),</p>  </li>  <li>   <p>    the code should be checked before live run with    <code>check.output</code>    option set to    <code>TRUE</code>    just to be sure if everything goes OK.   </p>  </li> </ul>
<p>  Please check the examples carefully below to get a detailed overview of  <code>evals</code>  . </p>###### Usage:
<div class="highlight">
	<pre><code class="r">evals(txt = NULL, ind = NULL, body = NULL,    classes = NULL, hooks = NULL, length = Inf,    output = c(&quot;all&quot;, &quot;src&quot;, &quot;output&quot;, &quot;type&quot;, &quot;msg&quot;),    env = NULL, check.output = TRUE, graph.output = &quot;png&quot;,    ...)</code></pre>
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
   <p>
    a vector or list of classes which should
be returned. If set to
    <code>NULL</code>
    (by default) all R
objects will be returned.
   </p>
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
   <code>check.output</code>
  </td>
  <td>
   <p>
    to check each line of
    <code>txt</code>
    for
outputs. If set to
    <code>TRUE</code>
    you would result in some
overhead as all commands have to be run twice (first to
check if any output was generated and if so in which
part(s), later the R objects are to be grabbed). With
    <code>FALSE</code>
    settings
    <code>evals</code>
    runs much faster, but
as now checks are made, some requirements apply, see
Details.
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>graph.output</code>
  </td>
  <td>
   <p>set the required file format of saved
plots</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>
    optional parameters passed to graphics device
(eg.
    <code>width</code>
    ,
    <code>height</code>
    etc.)
   </p>
  </td>
 </tr>
</table>
###### Returned value:
<p>
 a list of parsed elements each containg: src (the command
run), output (what the command returns,
 <code>NULL</code>
 if
nothing returned, path to image file if a plot was
genereted), type (class of returned object if any) and
messages: warnings (if any returned by the command run,
otherwise set to
 <code>NULL</code>
 ) and errors (if any returned
by the command run, otherwise set to
 <code>NULL</code>
 ). See
Details above.
</p>
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
   matrix(0,3,5)&apos;))
evals(txt, classes=&apos;numeric&apos;)
evals(txt, classes=c(&apos;numeric&apos;, &apos;list&apos;))
## handling warnings
evals(&apos;chisq.test(mtcars$gear, mtcars$hp)&apos;)
evals(list(c(&apos;chisq.test(mtcars$gear, mtcars$am)&apos;, &apos;pi&apos;, &apos;chisq.test(mtcars$gear, mtcars$hp)&apos;)))
evals(c(&apos;chisq.test(mtcars$gear, mtcars$am)&apos;, &apos;pi&apos;, &apos;chisq.test(mtcars$gear, mtcars$hp)&apos;))
## handling errors
evals(&apos;runiff(20)&apos;)
evals(&apos;Old MacDonald had a farm\\dots&apos;)
evals(&apos;## Some comment&apos;)
evals(list(c(&apos;runiff(20)&apos;, &apos;Old MacDonald had a farm?&apos;)))
evals(c(&apos;mean(1:10)&apos;, &apos;no.R.function()&apos;))
evals(list(c(&apos;mean(1:10)&apos;, &apos;no.R.function()&apos;)))
evals(c(&apos;no.R.object&apos;, &apos;no.R.function()&apos;, &apos;very.mixed.up(stuff)&apos;))
evals(list(c(&apos;no.R.object&apos;, &apos;no.R.function()&apos;, &apos;very.mixed.up(stuff)&apos;)))
evals(c(&apos;no.R.object&apos;, &apos;Old MacDonald had a farm\\dots&apos;, &apos;pi&apos;))
evals(list(c(&apos;no.R.object&apos;, &apos;Old MacDonald had a farm\\dots&apos;, &apos;pi&apos;)))
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
<p>  This function is a wrapper around  <code>barchart</code>  which operates only on factors with optional facet. </p>
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
<p>  This function is a wrapper around  <code>bwplot</code>  which operates only on numeric variables with optional facet. </p>
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
<p>  This function is a wrapper around  <code>pairs</code>  which operates only on numeric variables. Panel options are:  <code>c(&apos;panel.cor&apos;, &apos;panel.smooth&apos;, &apos;panel.hist&apos;)</code>  . Custom panels may be also added. </p>
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
   <code>upper.panel</code>
  </td>
  <td>
   <p>
    see:
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
<p>  This function is a wrapper around  <code>densityplot</code>  which operates only on numeric vectors with optional facet. </p>
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
<p>  This function is a wrapper around  <code>dotplot</code>  which operates only on factors with optional facet. </p>
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
<p>  Internal function used by eg.  <code>rp.histogram</code>  . </p>
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
<p>  This function is a wrapper around  <code>histogram</code>  which operates only on numeric vectors with optional facet. </p>
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
<p>  This function is a wrapper around  <code>xyplot</code>  with custom panel. Only numeric variables are accepted with optional facet. </p>
###### Usage:
<div class="highlight">
	<pre><code class="r">rp.lineplot(x, y, facet = NULL, data = NULL,    groups = NULL, theme = getOption(&quot;rp.color.palette&quot;),    colorize = getOption(&quot;rp.colorize&quot;), ...)</code></pre>
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
   <code>groups</code>
  </td>
  <td>
   <p>an optional categorical grouping variable</p>
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
## advanced usage
rp.lineplot(partner, age, data=rp.desc(&apos;age&apos;, &apos;partner&apos;, fn=&apos;mean&apos;, data=ius2008))
rp.lineplot(partner, age, gender, data=rp.desc(&apos;age&apos;, c(&apos;gender&apos;, &apos;partner&apos;), fn=&apos;mean&apos;, data=ius2008))
rp.lineplot(partner, age, groups=gender, data=rp.desc(&apos;age&apos;, c(&apos;gender&apos;, &apos;partner&apos;), fn=&apos;mean&apos;, data=ius2008))
## Did you noticed the nasty axis titles? Why not correct those? :)
df &lt;- rp.desc(&apos;age&apos;, &apos;partner&apos;, fn=&apos;mean&apos;, data=ius2008)
lapply(names(df), function(x) rp.label(df[, x]) &lt;&lt;- x)   # nasty solution!
rp.lineplot(partner, age, data=df)
df &lt;- rp.desc(&apos;age&apos;, c(&apos;gender&apos;, &apos;partner&apos;), fn=&apos;mean&apos;, data=ius2008)
lapply(names(df), function(x) rp.label(df[, x]) &lt;&lt;- x)  # nasty solution!
rp.lineplot(partner, age, gender, data=df)
df &lt;- rp.desc(&apos;age&apos;, c(&apos;gender&apos;, &apos;partner&apos;), fn=&apos;mean&apos;, data=ius2008)
lapply(names(df), function(x) rp.label(df[, x]) &lt;&lt;- x)  # nasty solution!
rp.lineplot(partner, age, groups=gender, data=df)
</code></pre>
</div>

<a id="rp.palette"> </a>
##### rp.palette: Color palettes
###### Description:
<p>  This function returns a given number of color codes from given palette by default falling back to a color-blind-friendly palette from  <a href="http://jfly.iam.u-tokyo.ac.jp/color/">http://jfly.iam.u-tokyo.ac.jp/color/</a>  . </p>
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

<a id="rp.qqplot"> </a>
##### rp.qqplot: Q-Q plot with Theoretical Distribution
###### Description:
<p>  This function is a wrapper around  <code>qqmath</code>  which operates only on a numeric variable with optional facet. </p>
###### Usage:
<div class="highlight">
	<pre><code class="r">rp.qqplot(x, dist = qnorm, facet = NULL, data = NULL,    theme = getOption(&quot;rp.color.palette&quot;),    colorize = getOption(&quot;rp.colorize&quot;), ...)</code></pre>
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
   <code>dist</code>
  </td>
  <td>
   <p>a theoretical distribution</p>
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
    <code>qqmath</code>
   </p>
  </td>
 </tr>
</table>
###### Examples:
<div class="highlight"><pre><code class="r">    df &lt;- transform(mtcars, cyl = factor(cyl, labels = c(&apos;4&apos;, &apos;6&apos;, &apos;8&apos;)), am = factor(am, labels = c(&apos;automatic&apos;, &apos;manual&apos;)), vs = factor(vs))
    rp.qqplot(df$hp)
    rp.qqplot(df$hp, qunif)
    rp.label(df$hp) &lt;- &apos;horsepower&apos;; rp.qqplot(df$hp)
    rp.qqplot(df$hp, colorize=TRUE)
    rp.qqplot(df$hp, qunif, facet=df$am)
    with(df, rp.qqplot(hp))
    rp.qqplot(hp, data=df)
    rp.qqplot(hp, facet=am, data=df)
    rp.qqplot(hp, qunif, am, df)
</code></pre>
</div>

<a id="rp.scatterplot"> </a>
##### rp.scatterplot: Scatterplot
###### Description:
<p>  This function is a wrapper around  <code>xyplot</code>  which operates only on numeric variables with optional facet. </p>
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
<p>  Similar to  <code>rle</code>  function, this function detects &quot;runs&quot; of adjacent integers, and displays vector of run lengths and list of corresponding integer sequences. See original thread for more details  <a href="http://stackoverflow.com/a/8467446/457898">http://stackoverflow.com/a/8467446/457898</a>  . Special thanks to Gabor Grothendieck for this one! </p>
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
<p>  This function tests if given variable &quot;appears&quot; to be an integer. To qualify as such, two conditions need to be satisfied: it should be stored as  <code>numeric</code>  object, and it should pass regular expression test if it consists only of digits. </p>
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
<a id="capitalise"> </a>
##### capitalise: Capitalise String
###### Description:
<p>Capitalises strings in provided character vector</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">capitalise(x)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>a character vector to capitalise</p>
  </td>
 </tr>
</table>
###### Returned value:
<p>character vector with capitalised string elements</p>
###### Examples:
<div class="highlight"><pre><code class="r">capitalise(c(&quot;foo&quot;, &quot;bar&quot;)) # [1] &quot;Foo&quot; &quot;Bar&quot;</code></pre>
</div>

<a id="catn"> </a>
##### catn: Concatenate with newline
###### Description:
<p>  A simple wrapper for  <code>cat</code>  function that appends newline to output. </p>
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
<p>&quot;Guesses&quot; a mode of provided character vector and converts it to appropriate mode.</p>
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

<a id="is.number"> </a>
##### is.number: Numbers
###### Description:
<p>Checks if provided object is a number, i.e. a length-one numeric vector.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">is.number(x)</code></pre>
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
<div class="highlight"><pre><code class="r">is.number(3)              # [1] TRUE
is.number(3:4)            # [1] FALSE
is.number(&quot;3&quot;)            # [1] FALSE
is.number(NaN)            # [1] TRUE
is.number(NA_integer_)    # [1] TRUE</code></pre>
</div>

<a id="is.string"> </a>
##### is.string: Strings
###### Description:
<p>Checks if provided object is a string i.e. a length-one character vector.</p>
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
<p>  This function checks if given expression generates a plot. See original thread for more details (  <a href="http://stackoverflow.com/a/2744434/457898">http://stackoverflow.com/a/2744434/457898</a>  ). Special thanks to Hadley Wickam for this one! </p>
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
<p>  This helper combines  <code>stop</code>  function with  <code>sprintf</code>  thus allowing string interpolated messages when execution is halted. </p>
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
<p>Convert character vector to camelcase - capitalise first letter of each word.</p>
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
<p>  Removes leading and/or trailing space(s) from a character vector value. By default, it removes only trailing spaces. In order to trim both leading and trailing spaces, pass  <code>TRUE</code>  to both  <code>leading</code>  and  <code>trailing</code>  arguments. </p>
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
<p>  A simple wrapper for  <code>gsub</code>  that replaces all patterns from  <code>pattern</code>  argument with ones in  <code>replacement</code>  over vector provided in argument  <code>x</code>  . See original thread for more details  <a href="http://stackoverflow.com/a/6954308/457898">http://stackoverflow.com/a/6954308/457898</a>  . Special thanks to user Jean-Robert for this one! </p>
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
<p>  Wraps vector elements with string provided in  <code>wrap</code>  argument. </p>
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
<div class="highlight"><pre><code class="r">wrap(&quot;foobar&quot;)
wrap(c(&quot;fee&quot;, &quot;fi&quot;, &quot;foo&quot;, &quot;fam&quot;), &quot;_&quot;)
</code></pre>
</div>


<a id="Generic-stat-functions"> </a>
#### Generic stat functions

<a id="rp.desc"> </a>
##### rp.desc: Descriptive Statistics
###### Description:
<p>  Aggregate table of descriptives according to functions provided in  <code>fn</code>  argument. This function follows melt/cast approach used in  <code>reshape</code>  package. Variable names specified in  <code>measure.vars</code>  argument are treated as  <code>measure.vars</code>  , while the ones in  <code>id.vars</code>  are treated as  <code>id.vars</code>  (see  <code>melt.data.frame</code>  for details). Other its formal arguments match with corresponding arguments for  <code>cast</code>  function. Some post-processing is done after reshaping, in order to get pretty row and column labels. </p>
###### Usage:
<div class="highlight">
	<pre><code class="r">rp.desc(measure.vars, id.vars = NULL, fn, data = NULL,    na.rm = TRUE, margins = NULL, subset = TRUE, fill = NA,    add.missing = FALSE, total.name = &quot;Total&quot;)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>measure.vars</code>
  </td>
  <td>
   <p>
    either a character vector with
variable names from
    <code>data</code>
    , a numeric vector, or a
    <code>data.frame</code>
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>id.vars</code>
  </td>
  <td>
   <p>
    same rules apply as in
    <code>measure.vars</code>
    , but defaults to
    <code>NULL</code>
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
	<pre><code class="r">rp.freq(f.vars, data, na.rm = TRUE, include.na = FALSE,    drop.unused.levels = FALSE, count = TRUE, pct = TRUE,    cumul.count = TRUE, cumul.pct = TRUE,    total.name = &quot;Total&quot;)</code></pre>
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
   <code>total.name</code>
  </td>
  <td>
   <p>a sting containing footer label
(defaults to &quot;Total&quot;)</p>
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
<p>  Calculates interquartile range of given variable. See  <code>rp.univar</code>  for details. </p>
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
<p>  Calculates kurtosis of given variable. See  <code>rp.univar</code>  for details. </p>
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
<p>  Returns the maximum of all values in a vector by passing {codemax as  <code>fn</code>  argument to  <code>rp.univar</code>  function. </p>
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
<p>  Calculates mean of given variable by passing  <code>sum</code>  as  <code>fn</code>  argument to  <code>rp.univar</code>  function. </p>
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
<p>  Calculates median of given variable. See  <code>rp.univar</code>  for details. </p>
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
<p>  Returns the minimum of all values in a vector by passing {codemin as  <code>fn</code>  argument to  <code>rp.univar</code>  function. </p>
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
<p>  Returns a number of missing (  <code>NA</code>  ) values in a variable. This is a wrapper around  <code>rp.univar</code>  function with anonymous function passed to count number of  <code>NA</code>  elements in a variable. </p>
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
<a id="rp.percent"> </a>
##### rp.percent: Percent
###### Description:
<p>  Calculates percentage of cases for provided variable and criteria specified in  <code>subset</code>  argument. Function accepts numeric, factor and logical variables for  <code>x</code>  parameter. If numeric and/or factor is provided, subsetting can be achieved via  <code>subset</code>  argument. Depending on value of  <code>na.rm</code>  argument, either valid (  <code>na.rm = TRUE</code>  ) or all cases (  <code>na.rm = FALSE</code>  ) are taken into account. By passing logical variable to  <code>x</code>  , a sum of (  <code>TRUE</code>  ) elements is calculated instead, and valid percents are used (  <code>NA</code>  are excluded). </p>
###### Usage:
<div class="highlight">
	<pre><code class="r">rp.percent(x, subset = NULL, na.rm = TRUE, pct = FALSE,    ...)</code></pre>
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
    )
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>na.rm</code>
  </td>
  <td>
   <p>should missing values be</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>pct</code>
  </td>
  <td>
   <p>print percent string too?</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>
    additional arguments for
    <code>pct</code>
    function
   </p>
  </td>
 </tr>
</table>
###### Returned value:
<p>
 a numeric or string depending on the value of
 <code>pct</code>
</p>
###### Examples:
<div class="highlight"><pre><code class="r">set.seed(0)
x &lt;- sample(5, 100, replace = TRUE)
rp.percent(x &gt; 2)
</code></pre>
</div>

<a id="rp.range"> </a>
##### rp.range: Range
###### Description:
<p>  Calculates difference between the largest and the smallest value in a vector. See  <code>rp.univar</code>  for details. </p>
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
<p>  Calculates standard deviation of given variable. See  <code>rp.univar</code>  for details. </p>
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
<p>  Calculates standard error of mean for given variable. See  <code>rp.univar</code>  for details. </p>
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
<p>  Calculates skewness of given variable. See  <code>rp.univar</code>  for details. </p>
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
<p>  Returns the sum of variable&apos;s elements, by passing  <code>sum</code>  as  <code>fn</code>  argument to  <code>rp.univar</code>  function. </p>
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
<p>  This function operates only on vectors or their subsets, by calculating a descriptive statistic specified in  <code>fn</code>  argument. </p>
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
<p>  Returns a number of valid (non-  <code>NA</code>  ) values in a variable. This is a wrapper around  <code>rp.univar</code>  function with  <code>length</code>  function passed in  <code>fn</code>  argument, but with missing values previously removed. However, it&apos;s not possible to cancel  <code>NA</code>  omission with this function (doing so will yield error). </p>
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
<p>  Calculates variance of given variable. See  <code>rp.univar</code>  for details. </p>
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
<p>  This function uses  <code>htest.short</code>  , to extract statistic and p-value from  <code>htest</code>  -classed object. Main advantage of using  <code>htest</code>  is that it&apos;s vectorised, and can accept multiple methods. </p>
###### Usage:
<div class="highlight">
	<pre><code class="r">htest(x, ..., use.labels = TRUE, colnames = NULL,    rownames = NULL)</code></pre>
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
 <tr valign="top">
  <td>
   <code>colnames</code>
  </td>
  <td>
   <p>a character string containing column
names</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>rownames</code>
  </td>
  <td>
   <p>a character string containing row names</p>
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
<p>  Extract value of statistic and its p-value from  <code>htest</code>  object. </p>
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
<p>A simple test for outliers. This functions returns all extreme values (if any) found in the specified vector.</p>
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
<p>  Checks input limits based on provided string. If provided string is syntactically correct, a list with integers containing limit boundaries (minimum and maximum value) is returned. If provided input limit exceeds value specified in  <code>max.lim</code>  argument, it will be coerced to  <code>max.lim</code>  and warning will be returned. Default upper input limit is 50 (variables). </p>
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
rapport:::check.limit(&quot;[1, 0]&quot;)  # will throw error
</code></pre>
</div>

<a id="check.name"> </a>
##### check.name: Naming Conventions
###### Description:
<p>Checks package-specific naming conventions: variables should start by a letter, followed either by a letter or a digit, while the words should be separated with dots or underscores.</p>
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
###### Examples:
<div class="highlight"><pre><code class="r">check.name(&quot;foo&quot;)               # [1] TRUE
check.name(&quot;foo.bar&quot;)           # [1] TRUE
check.name(&quot;foo_bar&quot;)           # [1] TRUE
check.name(&quot;foo.bar.234&quot;)       # [1] TRUE
check.name(&quot;foo.bar.234_asdf&quot;)  # [1] TRUE
check.name(&quot;234.asdf&quot;)          # [1] FALSE
check.name(&quot;_asdf&quot;)             # [1] FALSE
check.name(&quot;.foo&quot;)              # [1] FALSE</code></pre>
</div>

<a id="check.type"> </a>
##### check.type: Check Type
###### Description:
<p>Checks type of template input, based on provided sting. If input definition is syntactically correct, a list is returned, containing input type, size limits, and default value (for CSV options and boolean types only).</p>
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
rapport:::check.type(&quot;number[3]=123.456&quot;)
</code></pre>
</div>

<a id="elem.eval"> </a>
##### elem.eval: Evaluate Template Elements
###### Description:
<p>  This function grabs template elements from  <code>tpl.elem</code>  and evaluates them. For  <code>rp.block</code>  -classed elements just a vanilla  <code>evals</code>  call is carried out, while  <code>rp.inline</code>  and  <code>rp.heading</code>  classes have some additional post-evaluation proccesing (heading level is stored, as well as &quot;raw&quot; and evaluated chunk contents). </p>
###### Usage:
<div class="highlight">
	<pre><code class="r">elem.eval(x, tag.open = get.tags(&quot;inline.open&quot;),    tag.close = get.tags(&quot;inline.close&quot;),    remove.comments = TRUE, rapport.mode = &quot;normal&quot;, ...)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>
    a template file pointer (see
    <code>tpl.find</code>
    for details)
   </p>
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
 <tr valign="top">
  <td>
   <code>remove.comments</code>
  </td>
  <td>
   <p>should comments be omitted on
evaluation?</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>rapport.mode</code>
  </td>
  <td>
   <p>
    see:
    <code>?rapport</code>
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>
    additional params for
    <code>grep</code>
    -like
functions
   </p>
  </td>
 </tr>
</table>
<a id="extract_meta"> </a>
##### extract_meta: Extract Template Metadata
###### Description:
<p>Check if template metadata field matches provided format, and return matched value in a list.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">extract_meta(x, title, regex, short = NULL,    trim.white = TRUE, mandatory = TRUE,    default.value = NULL, field.length = 1000, ...)</code></pre>
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
   <code>default.value</code>
  </td>
  <td>
   <p>fallback to this value if
non-mandatory field is not found/malformed</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>field.length</code>
  </td>
  <td>
   <p>maximum number of field characters
(defaults to 1000)</p>
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
<div class="highlight"><pre><code class="r">    extract_meta(&quot;Name: John Smith&quot;, &quot;Name&quot;, &quot;[[:alpha:]]+( [[:alpha:]]+)?&quot;)
    ## $name
    ## [1] &quot;John Smith&quot;
    extract_meta(&quot;Name: John&quot;, &quot;Name&quot;, &quot;[[:alpha:]]+( [[:alpha:]]+)?&quot;)
    ## $name
    ## [1] &quot;John&quot;
</code></pre>
</div>

<a id="fml"> </a>
##### fml: Create Formula from Strings
###### Description:
<p>Takes multiple character arguments as left and right-hand side arguments of a formula, and concatenates them in a single string.</p>
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
<p>Returns report tag vales (usually regexes): either user-defined, or the default ones.</p>
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
regexes</p>
###### Examples:
<div class="highlight"><pre><code class="r">get.tags()        # same as &apos;get.tags(&quot;all&quot;)&apos;
get.tags(&quot;chunk.open&quot;)</code></pre>
</div>

<a id="grab.chunks"> </a>
##### grab.chunks: Inline Chunk Contents
###### Description:
<p>Returns inline code chunks with or without tags that wrap them.</p>
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
<div class="highlight"><pre><code class="r">s &lt;- c(&quot;As you know, pi equals &lt;%pi%&gt;&quot;,  &quot;2 raised to the power of 3 is &lt;%2^3%&gt;&quot;)
grab.chunks(s, &quot;&lt;%&quot;, &quot;%&gt;&quot;, FALSE)
## [1] &quot;pi&quot;  &quot;2^3&quot;
grab.chunks(s, &quot;&lt;%&quot;, &quot;%&gt;&quot;, FALSE)
## [1] &quot;&lt;%pi%&gt;&quot;  &quot;&lt;%2^3%&gt;&quot;
</code></pre>
</div>

<a id="has.tags"> </a>
##### has.tags: Tag Existence
###### Description:
<p>Checks if a character vector elements contain specified tags. Note that this helper does not parse R code within tags, but just checks for tag existence in provided string!</p>
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
   <p>a character value to check for tag strings</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>an argument list with tags to check</p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a logical value indicating if the string has passed the
check</p>
###### Examples:
<div class="highlight"><pre><code class="r">has.tags(&quot;&lt;% pi %&gt;&quot;, &quot;&lt;%&quot;)
has.tags(&quot;&lt;% pi %&gt;&quot;, &quot;&lt;%&quot;, &quot;%&gt;&quot;, &quot;&lt;!--&quot;, &quot;--&gt;&quot;)
has.tags(c(&quot;&lt;% pi %&gt;&quot;, &quot;&lt;!-- foobar --&gt;&quot;), &quot;&lt;%&quot;, &quot;%&gt;&quot;, &quot;&lt;!--&quot;, &quot;--&gt;&quot;)</code></pre>
</div>

<a id="is.heading"> </a>
##### is.heading: Pandoc Heading
###### Description:
<p>Checks if provided string is a valid ATX-style pandoc heading.</p>
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
##### is.rapport: Rapport Object
###### Description:
<p>Checks if provided R object is of &quot;rapport&quot; class.</p>
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
<p>a logical value</p>
<a id="is.rp.block"> </a>
##### is.rp.block: Rapport Block Element
###### Description:
<p>  Checks if provided R object is a  <code>rapport</code>  block element. </p>
###### Usage:
<div class="highlight">
	<pre><code class="r">is.rp.block(x)</code></pre>
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
<p>a logical value</p>
<a id="is.rp.heading"> </a>
##### is.rp.heading: Rapport Heading Element
###### Description:
<p>  Checks if provided R object is a  <code>rapport</code>  inline element. </p>
###### Usage:
<div class="highlight">
	<pre><code class="r">is.rp.heading(x)</code></pre>
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
<p>a logical value</p>
<a id="is.rp.inline"> </a>
##### is.rp.inline: Rapport Inline Element
###### Description:
<p>  Checks if provided R object is a  <code>rapport</code>  inline element. </p>
###### Usage:
<div class="highlight">
	<pre><code class="r">is.rp.inline(x)</code></pre>
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
<p>a logical value</p>
<a id="is.tabular"> </a>
##### is.tabular: Tabular Structure
###### Description:
<p>  Checks if object has &quot;tabular&quot; structure (not to confuse with  <code>table</code>  ) - in this particular case, that means  <code>matrix</code>  and  <code>data.frame</code>  objects only. </p>
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
###### Examples:
<div class="highlight"><pre><code class="r">is.tabular(HairEyeColor[, , 1])  # [1] TRUE
is.tabular(mtcars)               # [1] TRUE
is.tabular(table(mtcars$cyl))    # [1] FALSE
is.tabular(rnorm(100))           # [1] FALSE
is.tabular(LETTERS)              # [1] FALSE
is.tabular(pi)                   # [1] FALSE</code></pre>
</div>

<a id="is.variable"> </a>
##### is.variable: Variables
###### Description:
<p>  From our point of view, a  <code>variable</code>  is a non-  <code>NULL</code>  atomic vector that has no dimensions. This approach bypasses  <code>factor</code>  issues with  <code>is.vector</code>  , and also eliminates multidimensional vectors, such as matrices and arrays. </p>
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
###### Examples:
<div class="highlight"><pre><code class="r">is.variable(rnorm(100))  # [1] TRUE
is.variable(LETTERS)     # [1] TRUE
is.variable(NULL)        # [1] FALSE
is.variable(mtcars)      # [1] FALSE
is.variable(HairEyeColor[, , 1])  # [1] FALSE
is.variable(list())      # [1] FALSE</code></pre>
</div>

<a id="pct"> </a>
##### pct: Percent
###### Description:
<p>  Appends a percent sign to provided numerical value. Rounding is carried out according to value passed in  <code>decimals</code>  formal argument (defaults to value specified in  <code>rp.decimal.short</code>  option). </p>
###### Usage:
<div class="highlight">
	<pre><code class="r">pct(x, digits = getOption(&quot;rp.decimal.short&quot;),    type = c(&quot;percent&quot;, &quot;%&quot;, &quot;proportion&quot;),    check.value = TRUE)</code></pre>
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
   <code>digits</code>
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
 <tr valign="top">
  <td>
   <code>check.value</code>
  </td>
  <td>
   <p>perform a sanity check to see if
provided numeric value is correct</p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a character value with formatted percent</p>
<a id="p"> </a>
##### p: Inline Printing
###### Description:
<p>Merge atomic vector elements in one string for pretty inline printing.</p>
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
<p>Default print method for &quot;rapport&quot; class objects which show the report body.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">## S3 method for class &apos;rapport&apos; print(x, ...)</code></pre>
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
   <code>...</code>
  </td>
  <td>
   <p>ignored</p>
  </td>
 </tr>
</table>
###### Examples:
<div class="highlight"><pre><code class="r">rapport(&apos;univar-descriptive&apos;, data=mtcars, var=&apos;hp&apos;)
print(rapport(&apos;univar-descriptive&apos;, data=mtcars, var=&apos;hp&apos;))
</code></pre>
</div>

<a id="print.rp.info"> </a>
##### print.rp.info: Print Template Header
###### Description:
<p>Prints out the contents of template header (metadata and inputs) in human-readable format, so you can get insight about template requirements.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">## S3 method for class &apos;rp.info&apos; print(x, ...)</code></pre>
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
   <code>...</code>
  </td>
  <td>
   <p>ignored</p>
  </td>
 </tr>
</table>
<a id="print.rp.inputs"> </a>
##### print.rp.inputs: Print Template Inputs
###### Description:
<p>Prints out the contents of template inputs in human-readable format.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">## S3 method for class &apos;rp.inputs&apos; print(x, ...)</code></pre>
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
   <code>...</code>
  </td>
  <td>
   <p>ignored</p>
  </td>
 </tr>
</table>
<a id="print.rp.meta"> </a>
##### print.rp.meta: Print Template Metadata
###### Description:
<p>Prints out the contents of template metadata in human-readable format.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">## S3 method for class &apos;rp.meta&apos; print(x, ...)</code></pre>
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
   <code>...</code>
  </td>
  <td>
   <p>ignored</p>
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
<a id="rapport.html"> </a>
##### rapport.html: Rapport to HTML
###### Description:
<p>  This is a simple wrapper around  <code>rapport</code>  and  <code>tpl.export</code>  . Basically it works like  <code>rapport</code>  but the returned class is exported at one go. </p>
###### Usage:
<div class="highlight">
	<pre><code class="r">rapport.html(...)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>
    parameters passed directly to
    <code>rapport</code>
   </p>
  </td>
 </tr>
</table>
<a id="rapport.odt"> </a>
##### rapport.odt: Rapport to odt
###### Description:
<p>  This is a simple wrapper around  <code>rapport</code>  and  <code>tpl.export</code>  . Basically it works like  <code>rapport</code>  but the returned class is exported at one go. </p>
###### Usage:
<div class="highlight">
	<pre><code class="r">rapport.odt(...)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>
    parameters passed directly to
    <code>rapport</code>
   </p>
  </td>
 </tr>
</table>
<a id="rapport"> </a>
##### rapport: rapport: An R engine for reproducible template generation
###### Description:
<p>  <em>rapport</em>  is an R package that facilitates creation of reproducible statistical report templates. Once created,  <em>rapport</em>  templates can be exported to various external formats:  <em>HTML</em>  ,  <em>LaTeX</em>  ,  <em>PDF</em>  ,  <em>ODT</em>  , etc. Apart from R, all you need to know to start writing your own templates is  <em>pandoc</em>  markup syntax, and several  <em>rapport</em>  -specific conventions that allow the reproducibility of the template.  <em>rapport</em>  uses  <em>brew</em>  -like tags to support dynamic inline and/or block evaluation of R code. Unlike many other report-writing conventions in R (  <em>Sweave</em>  ,  <em>brew</em>  ),  <em>rapport</em>  converts generated output in a convenient form via  <em>acii</em>  function.  <em>rapport</em>  also comes with support for plots: images are automatically saved to temporary file, and image path is returned. </p>
###### Usage:
<div class="highlight">
	<pre><code class="r">rapport(fp, data = NULL, ..., reproducible = FALSE,    header.levels.offset = 0,    rapport.mode = getOption(&quot;rapport.mode&quot;),    graph.output = &quot;png&quot;)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>fp</code>
  </td>
  <td>
   <p>
    a template file pointer (see
    <code>tpl.find</code>
    for details)
   </p>
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
 <tr valign="top">
  <td>
   <code>header.levels.offset</code>
  </td>
  <td>
   <p>number added to header levels
(handy when using nested templates)</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>rapport.mode</code>
  </td>
  <td>
   <p>
    forces
    <code>rapport</code>
    to run in
    <em>performance</em>
    or
    <em>debug</em>
    mode instead of normal
behaviour. Change this only if you really know what are
you doing! In
    <code>performance</code>
    mode
    <code>rapport</code>
    will
evaluate all templates in
    <code>strict</code>
    mode (see:
    <code>evals(..., check.output = FALSE)</code>
    ), while in
    <code>debug</code>
    mode
    <code>rapport</code>
    will halt on first
error.
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>graph.output</code>
  </td>
  <td>
   <p>set the required file format of saved
plots</p>
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
<div class="highlight"><pre><code class="r">rapport(&quot;example&quot;, ius2008, var=&quot;leisure&quot;)
rapport(&quot;example&quot;, ius2008, var=&quot;leisure&quot;, desc=FALSE, hist=T, themer=&quot;Set1&quot;)
rapport(&quot;example&quot;, ius2008, var=&quot;leisure&quot;, rapport.mode=&apos;debug&apos;)
rapport(&quot;example&quot;, ius2008, var=&quot;leisure&quot;, rapport.mode=&apos;performance&apos;)
## Or set \code{&apos;rapport.mode&apos;} option to \code{debug}, \code{performance} or back to \code{normal}.
</code></pre>
</div>

<a id="rp.label"> </a>
##### rp.label: Get Variable Label
###### Description:
<p>  This function returns character value previously stored in variable&apos;s  <code>label</code>  attribute. If none found, the function fallbacks to object&apos;s name (retrieved by  <code>deparse(substitute(x))</code>  ). </p>
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
rp.label(mtcars)         # returns &quot;Horsepower&quot; instead of &quot;hp&quot;
rp.label(mtcars, FALSE)  # returns NA where no labels are found
</code></pre>
</div>

<a id="rp.label-set"> </a>
##### rp.label-set: Set Variable Label
###### Description:
<p>  This function sets a label to a variable, by storing a character string to its  <code>label</code>  attribute. </p>
###### Usage:
<div class="highlight">
	<pre><code class="r">rp.label(var) &lt;- value</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>var</code>
  </td>
  <td>
   <p>
    a variable (see
    <code>is.variable</code>
    for
details)
   </p>
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
<div class="highlight"><pre><code class="r">rp.label(mtcars$mpg) &lt;- &quot;fuel consumption&quot;
x &lt;- rnorm(100); ( rp.label(x) &lt;- &quot;pseudo-random normal variable&quot; )
</code></pre>
</div>

<a id="rp.name"> </a>
##### rp.name: Variable Name
###### Description:
<p>  This function returns character value previously stored in variable&apos;s  <code>name</code>  attribute. If none found, the function fallbacks to object&apos;s name. </p>
###### Usage:
<div class="highlight">
	<pre><code class="r">rp.name(x)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>x</code>
  </td>
  <td>
   <p>an R (atomic or data.frame/list) object to
extract names from</p>
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
<p>Some standard formatting is applied to the value which is returned as ascii object.</p>
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
rp.prettyascii(summary(mtcars$hp))
rp.prettyascii(htest(rnorm(100), shapiro.test))
rp.prettyascii(table(mtcars$am,mtcars$gear))
rp.prettyascii(data.frame(x=1:2, y=3:4))
rp.prettyascii(data.frame(x=1:2, y=3:4, z=c(22/7, pi)))
rp.prettyascii(mtcars)
rp.prettyascii(table(mtcars$am))
## it is better to \code{cat} the output
cat(rp.prettyascii(rp.freq(&quot;gender&quot;, data = ius2008)))
</code></pre>
</div>

<a id="rp.round"> </a>
##### rp.round: Round numeric values
###### Description:
<p>  Round numeric values with default number of decimals (see:  <code>getOption(&apos;rp.decimal&apos;</code>  ) and decimal mark (see:  <code>getOption(&apos;rp.decimal&apos;)</code>  ). </p>
###### Usage:
<div class="highlight">
	<pre><code class="r">rp.round(x, short = FALSE, digits = NULL)</code></pre>
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
   <code>short</code>
  </td>
  <td>
   <p>
    if
    <code>getOption(&apos;rp.decimal.short&apos;</code>
    should be used instead of
    <code>getOption(&apos;rp.decimal&apos;</code>
    .
Can be overwritten by
    <code>digits</code>
    parameter, see
below.
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>digits</code>
  </td>
  <td>
   <p>(optional) number of decimals</p>
  </td>
 </tr>
</table>
###### Returned value:
<p>character vector of rounded value(s)</p>
###### Examples:
<div class="highlight"><pre><code class="r">rp.round(22/7)
rp.round(22/7, short = TRUE)
rp.round(22/7, TRUE)
rp.round(22/7, digits = 10)
rp.round(matrix(runif(9), 3, 3))
}</code></pre>
</div>

<a id="table.json"> </a>
##### table.json: Convert table-like structures to JSON object
###### Description:
<p>  This function takes either a  <code>matrix</code>  or a  <code>data.frame</code>  object to extract column names, row names and the &quot;body&quot; of the table-like object, hence exports them to JSON. </p>
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
<p>Returns contents of template body.</p>
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
   <p>
    a template file pointer (see
    <code>tpl.find</code>
    for details)
   </p>
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
<a id="tpl.check"> </a>
##### tpl.check: Check Template
###### Description:
<p>Checks if the examples of given template can be run without any error and if the same output would be returned by calling the template in &quot;strict&quot; mode.</p>
###### Details:
<p>  Strict mode is a huge performance gain (principally with nested templates where the overhead of extra checks lead to exponential slowdown with every level of nested hierarchy) based on  <code>evals</code>  &apos;  <code>check.output</code>  parameter: no checks would be performed on template body about outputs. Thanks to this, strict mode templates should be written considering the following requirements: </p>
<ul>  <li>   <p>each block should return on the last line of the code,</p>  </li>  <li>   <p>    each block should always return something on the last line (if you do not want to return anything, add    <code>NULL</code>    to the last line),   </p>  </li>  <li>   <p>ggplot and lattice graphs should be always printed (of course on the last line),</p>  </li>  <li>   <p>    the template should be checked before live run with    <code>tpl.check</code>    .   </p>  </li> </ul>
<p>  <code>tpl.check</code>  will print on the console some text messages about the result of the test (errors etc.), but will also return a  <code>list</code>  invisible. List elements: </p>
<ul>  <li>   <p>run: if all blocks could run without error (TRUE/FALSE),</p>  </li>  <li>   <p>strict: if rapport in &quot;performance&quot; (strict) mode returns the same output (TRUE/FALSE).</p>  </li> </ul>
<p>  If everything went fine and you get two  <code>TRUE</code>  values, update your template to use &quot;performance&quot; mode on default by adding &quot;Strict: TRUE&quot; to template header. </p>###### Usage:
<div class="highlight">
	<pre><code class="r">tpl.check(fp)</code></pre>
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
</table>
###### Returned value:
<p>list of logicals - see details above</p>
###### Examples:
<div class="highlight"><pre><code class="r">tpl.check(&apos;example&apos;)
</code></pre>
</div>

<a id="tpl.elem"> </a>
##### tpl.elem: Template Elements
###### Description:
<p>  Returns a  <code>data.frame</code>  containing summary of relevant template elements:  <code>ind</code>  - indice of current element in template&apos;s body,  <code>type</code>  - a string indicating the type of the content (&quot;heading&quot;, &quot;inline&quot; or &quot;block&quot;), and  <code>chunk</code>  - a string containing R expression found in a code chunk. </p>
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
   <p>
    a template file pointer (see
    <code>tpl.find</code>
    for details)
   </p>
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
<p>  Displays template examples defined in  <code>Example</code>  section. Handy to check out what template does and how does it look like once it&apos;s rendered. If multiple examples are available, and  <code>index</code>  argument is  <code>NULL</code>  , you will be prompted for input. In case when only one example is available in the header, user is not prompted for input action, and given template is evaluated automatically. At any time you can provide an integer vector with example indices to  <code>index</code>  argument, and specified examples will be evaluated without prompting the user, thus returning a list of  <code>rapport</code>  objects. Example output can be easily exported to various formats (HTML, ODT, etc.) - check out documentation for  <code>tpl.export</code>  for more info. </p>
###### Usage:
<div class="highlight">
	<pre><code class="r">tpl.example(fp, index = NULL, env = .GlobalEnv)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>fp</code>
  </td>
  <td>
   <p>
    a template file pointer (see
    <code>tpl.find</code>
    for details)
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>index</code>
  </td>
  <td>
   <p>a numeric vector indicating the example
index - meaningful only for templates with multiple
examples. Accepts vector of integers to match IDs of
template example. Using &apos;all&apos; (character string) as index
will return all examples.</p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>env</code>
  </td>
  <td>
   <p>
    an environment where example will be evaluated
(defaults to
    <code>.GlobalEnv</code>
    )
   </p>
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
<p>List of all available backend formats (from ascii package).</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">tpl.export.backends()</code></pre>
</div>
<a id="tpl.export.outputs"> </a>
##### tpl.export.outputs: tpl.export.outputs
###### Description:
<p>List of all available output formats (from ascii package).</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">tpl.export.outputs()</code></pre>
</div>
<a id="tpl.export"> </a>
##### tpl.export: Export rapport class
###### Description:
<p>  This function exports rapport class objects to various formats based on ascii package. Note that no error/warning messages will be shown! By default this function tries to export the report to HTML with pandoc. Some default styles are applied. If you do not need those default settings, use your own  <code>options</code>  . </p>
###### Usage:
<div class="highlight">
	<pre><code class="r">tpl.export(rp = NULL, file = NULL, append = FALSE,    create = TRUE, open = TRUE,    date = format(Sys.time(), getOption(&quot;rp.date.format&quot;)),    desc = TRUE, format = &quot;html&quot;, backend = &quot;pandoc&quot;,    options = NULL, logo = TRUE)</code></pre>
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
 <tr valign="top">
  <td>
   <code>logo</code>
  </td>
  <td>
   <p>add rapport logo</p>
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
<p>  Reads file either from template name in system folder, file path or remote URL, and splits it into lines for easier handling by  <em>rapport</em>  internal parser. &quot;find&quot; in  <code>tpl.find</code>  is borrowed from Emacs parlance - this function actually reads the template. </p>
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
a template name (for package-bundled templates only),
template contents separated by newline (
    <code>\n</code>
    ), or a
character vector with template contents.
   </p>
  </td>
 </tr>
</table>
###### Returned value:
<p>a character vector with template contents</p>
<a id="tpl.header"> </a>
##### tpl.header: Template Header
###### Description:
<p>  Returns  <code>rapport</code>  template header from provided path or a character vector. </p>
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
   <p>
    a template file pointer (see
    <code>tpl.find</code>
    for details)
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>open.tag</code>
  </td>
  <td>
   <p>
    a string with opening tag (defaults to
value of user-defined
    <code>&quot;header.open&quot;</code>
    tag)
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>close.tag</code>
  </td>
  <td>
   <p>
    a string with closing tag (defaults to
value of user-defined
    <code>&quot;header.close&quot;</code>
    tag)
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
<p>Provides information about template metadata and/or inputs.</p>
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
   <p>
    a template file pointer (see
    <code>tpl.find</code>
    for details)
   </p>
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
<p>  Displays summary of template inputs from header section.  <code>rp.inputs</code>  -class object is returned invisibly. </p>
###### Details:
<p>  <strong>Input Specifications</strong> </p>
<p>  Apart from _template metadata_, header also requires specification for template  <em>inputs</em>  . In most cases,  <em>inputs</em>  refer to variable names in provided dataset, but some inputs have special meaning inside  <code>rapport</code>  , and some of them don&apos;t have anything to do with provided dataset whatsoever. Most inputs can contain limit specification, and some inputs can also have a default value. At first we&apos;ll explain input specifications on the fly, and in following sections we&apos;ll discuss each part in thorough details. Let&apos;s start with a single dummy input specification: </p>
<p>  <code>*foo.bar | numeric[1,6] | Numeric variable | A set   of up to 6 numeric variables</code> </p>
<p>  <strong>Required Inputs</strong> </p>
<p>Asterisk sign (&apos;*&apos;) in front of an input name indicates a mandatory input. So it is possible to omit input (unless it&apos;s required, of course), but you may want to use this feature carefully, as you may end up with ugly output. If an input isn&apos;t mandatory, NULL is assigned to provided input name, and the object is stored in transient evaluation environment.</p>
<p>  <strong>Input Name</strong> </p>
<p>  <em>rapport</em>  has its own naming conventions which are compatible, but different from traditional  <strong>R</strong>  naming conventions. Input name (&quot;foo.bar&quot; in previous example) must start with an alphabet letter, followed either by other alphabet letters or numbers, separated with &apos;_&apos; or &apos;.&apos;. For example, valid names are: &apos;foo.bar&apos;, &apos;f00_bar&apos;, or &apos;Fo0_bar.input&apos;. Input name length is limited on 30 characters by default. At any time you can check your desired input name with &apos;check.name&apos; function. Note that input names are case-sensitive, just like  <code>symbol</code>  s in  <strong>R</strong>  . </p>
<p>  <strong>Input Type</strong> </p>
<p>  _Input type_ is specified in the second input block. It is the most (read: &quot;only&quot;) complex field in an input specification. It consists of _type specification_, _limit specification_ and sometimes a _default value specification_. Most input types are compatible with eponymous  <strong>R</strong>  modes:  <em>character</em>  ,  <em>complex</em>  ,  <em>logical</em>  ,  <em>numeric</em>  , or  <strong>R</strong>  classes like  <em>factor</em>  . Some are used as &quot;wildcards&quot;, like  <em>variable</em>  , and some do not refer to dataset variables at all:  <em>boolean</em>  ,  <em>number</em>  ,  <em>string</em>  and  <em>option</em>  . Here we&apos;ll discuss each input type thoroughly. We will use term  <em>variable</em>  to denote a vector taken from a dataset (for more details see documentation for &apos;is.variable&apos;). All inputs can be divided into two groups, depending on whether they require a dataset or not: </p>
<ul>  <li>   <p>    <strong>dataset inputs</strong>    :   </p>   <ul>    <li>     <p>      <em>character</em>      - matches a character variable     </p>    </li>    <li>     <p>      <em>complex</em>      - matches a character variable     </p>    </li>    <li>     <p>      <em>numeric</em>      - matches a numeric variable     </p>    </li>    <li>     <p>      <em>factor</em>      - matches a factor variable (i.e. R object of      <code>factor</code>      class)     </p>    </li>    <li>     <p>      <em>variable</em>      - matches any variable of previously defined types     </p>    </li>   </ul>  </li>  <li>   <p>    <strong>standalone inputs</strong>    :   </p>   <ul>    <li>     <p>      <em>string</em>      - accepts an atomic character vector     </p>    </li>    <li>     <p>      <em>number</em>      - accepts an atomic numeric vector     </p>    </li>    <li>     <p>      <em>boolean</em>      - accepts a logical value     </p>    </li>    <li>     <p>      <em>option</em>      - accepts a comma-separated list of values, that are to be matched with      <code>match.arg</code>      . The first value in a list is a default one.     </p>    </li>   </ul>  </li> </ul>
<p>  Now we&apos;ll make a little digression and talk about  <strong>input limits</strong>  . You may have noticed some additional stuff in type specification, e.g. &apos;numeric[1,6]&apos;. All dataset inputs, as well as *string* and *numeric standalone inputs* can contain _limit specifications_. If you want to bundle several variables from dataset or provide a vector with several string/numeric values, you can apply some rules within square brackets in &apos;[a,b]&apos; format, where &apos;[a,b]&apos; stands for &quot;from  <code>a</code>  to  <code>b</code>  inputs&quot;, e.g. &apos;[1,6]&apos; means &quot;from 1 to 6 inputs&quot;. Limit specifications can be left out, but even in that case implicit limit rules are applied, with  <code>a</code>  and  <code>b</code>  being set to 1.  <strong>Dataset inputs</strong>  will match one or more variables from a dataset (d&apos;uh), and check its mode and/or class.  <code>variable</code>  type is a bit different, since it matches any kind of variable (not to confuse with  <code>Any</code>  type), but it still refers to variable(s) from a provided dataset. Dataset inputs cannot have default value, but can be optional (just leave out &apos;*&apos; sign in front of input name). Note that if you provide more than one variable name in  <code>rapport</code>  function call, that input will be stored as a &apos;data.frame&apos;, otherwise, it will be stored as a  <em>variable</em>  (atomic vector).  <strong>Standalone inputs</strong>  are a bit different since they do not refer to any varible from a dataset. However, they are more complex than *dataset inputs*, especially because they can contain default values. -  <strong>number</strong>  and  <strong>string</strong>  inputs are defined with  <code>number</code>  and  <code>string</code>  declaration, respectively. They can also contain limit specifications, e.g. &apos;number[1,6]&apos; accepts numeric vector with at least 1 and at most 6 elements. Of course, you can pass the same specification to string inputs: &apos;string[1,6]&apos;. In this case, you&apos;re setting length limits to a character vector.  <em>number</em>  and  <em>string</em>  inputs can have  <em>default value</em>  , which can be defined by placing &apos;=&apos; after type/limit specification followed by default value. For instance, &apos;number[1,6]=3.14&apos; sets value &apos;3.14&apos; as default. Same stands for string inputs: default value can be defined in the same manner: &apos;string=foo&apos; sets &quot;foo&quot; as default string value (note that you don&apos;t have to specify quotes unless they are the part of the default string). -  <strong>boolean</strong>  inputs can contain either  <code>TRUE</code>  or  <code>FALSE</code>  values. The specified value is the default one. They cannot contain limit specification. -  <strong>option</strong>  inputs are nothing more than a comma-separated list of strings. Even if you specify numbers in a list, they will be coerced to strings once the list is parsed. Values in  <em>option</em>  list will be placed in a character vector, and matched with &apos;match.arg&apos; function. That means that you could only choose one value from a list. Partial matches are allowed, and the first value in  <em>option</em>  list is the defalt one. </p>
<p>  <strong>Input Label and Description</strong> </p>
<p>  Third block in input definition is an input label. While  <em>variable</em>  can have its own label (see &apos;rp.label&apos;), you may want to use the one defined in input specifications. At last, fourth block contains input description, which should be a lengthy description of current input. Just to remind you - all fields in input specification are mandatory. You can cheat, though, by providing &apos;.&apos; or something like that as input label and/or description, but please don&apos;t do that unless you&apos;re testing the template. Labels and descriptions are meant to be informative. </p>###### Usage:
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
   <p>
    a template file pointer (see
    <code>tpl.find</code>
    for details)
   </p>
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
<a id="tpl.meta"> </a>
##### tpl.meta: Header Metadata
###### Description:
<p>  Displays summary of template metadata stored in a header section. This part of template header consists of several  <em>key: value</em>  pairs, which define some basic template info, such as  <em>Title</em>  ,  <em>Example</em>  ,  <em>Strict</em>  , etc. If you&apos;re familiar with package development in R, you&apos;ll probably find this approach very similar to  <code>DESCRIPTION</code>  file. </p>
###### Details:
<p>  <strong>Mandatory Fields</strong> </p>
<p>The following fields must be specified in the template header and their size limits must be taken into account:</p>
<ul>  <li>   <p>    <em>Title</em>    - a template title (at most 500 characters)   </p>  </li>  <li>   <p>    <em>Author</em>    - author&apos;s (nick)name (at most 100 characters)   </p>  </li>  <li>   <p>    <em>Description</em>    - template description (at most 5000 characters)   </p>  </li> </ul>
<p>  <strong>Optional Fields</strong> </p>
<p>Some fields are not required by the template. However, you should reconsider including them in the template, so that the other users could get a better impression of what your template does. These are currently supported fields:</p>
<ul>  <li>   <p>    <em>Email</em>    - author&apos;s email address (defaults to    <code>NULL</code>    )   </p>  </li>  <li>   <p>    <em>Packages</em>    - a comma-separated list of packages required by the template (defaults to    <code>NA</code>    )   </p>  </li>  <li>   <p>    <em>Data required</em>    - is dataset required by a template? Field accepts    <code>TRUE</code>    or    <code>FALSE</code>    , and defaults to    <code>FALSE</code>    .   </p>  </li>  <li>   <p>    <em>Example</em>    - newline-separated example calls to    <code>rapport</code>    function, including template data and inputs (defaults to    <code>NULL</code>    )   </p>  </li>  <li>   <p>    <em>Strict</em>    - &quot;strict mode&quot; returns only the last warning from a chunk. Field accepts    <code>TRUE</code>    or    <code>FALSE</code>    , and defaults to    <code>FALSE</code>    .   </p>  </li> </ul>
<p>  Upon successful execution,  <code>rp.meta</code>  -class object is returned invisibly. </p>###### Usage:
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
    a template file pointer (see
    <code>tpl.find</code>
    for details)
   </p>
  </td>
 </tr>
 <tr valign="top">
  <td>
   <code>fields</code>
  </td>
  <td>
   <p>a list of named lists containing key-value
pairs of field titles and corresponding regexes</p>
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
<a id="tpl.paths.add"> </a>
##### tpl.paths.add: Add Template Path
###### Description:
<p>Adds a new element to custom paths&apos; list where rapport will look for templates.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">tpl.paths.add(...)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>character vector of paths</p>
  </td>
 </tr>
</table>
###### Returned value:
<p>TRUE on success (invisibly)</p>
###### Examples:
<div class="highlight"><pre><code class="r">tpl.paths.add(&apos;/tmp&apos;)
tpl.list()
## might trigger an error:
tpl.paths.add(&apos;/home&apos;, &apos;/rapport&apos;)
</code></pre>
</div>

<a id="tpl.paths"> </a>
##### tpl.paths: Template Paths
###### Description:
<p>List all custom paths where rapport will look for templates.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">tpl.paths()</code></pre>
</div>
###### Returned value:
<p>a character vector with paths</p>
###### Examples:
<div class="highlight"><pre><code class="r">tpl.paths()
</code></pre>
</div>

<a id="tpl.paths.remove"> </a>
##### tpl.paths.remove: Remove Template Path
###### Description:
<p>Removes an element from custom paths&apos; list where rapport will look for templates.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">tpl.paths.remove(...)</code></pre>
</div>
###### Arguments:
<table summary="R argblock">
 <tr valign="top">
  <td>
   <code>...</code>
  </td>
  <td>
   <p>character vector of paths</p>
  </td>
 </tr>
</table>
###### Returned value:
<p>TRUE on success (invisibly)</p>
###### Examples:
<div class="highlight"><pre><code class="r">tpl.paths()
tpl.paths.add(&apos;/tmp&apos;)
tpl.paths()
tpl.paths.remove(&apos;/tmp&apos;)
tpl.paths()
## might trigger an error:
tpl.paths.remove(&apos;/root&apos;)
</code></pre>
</div>

<a id="tpl.paths.reset"> </a>
##### tpl.paths.reset: Reset Template Paths
###### Description:
<p>Resets to default (NULL) all custom paths where rapport will look for templates.</p>
###### Usage:
<div class="highlight">
	<pre><code class="r">tpl.paths.reset()</code></pre>
</div>
###### Examples:
<div class="highlight"><pre><code class="r">tpl.paths.reset()
</code></pre>
</div>

<a id="tpl.rerun"> </a>
##### tpl.rerun: Reproduce Template
###### Description:
<p>  Runs template with data and arguments included in  <code>rapport</code>  object. In order to get reproducible example, you have to make sure that  <code>reproducible</code>  argument is set to  <code>TRUE</code>  in  <code>rapport</code>  function. </p>
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
<div class="highlight"><pre><code class="r">tmp &lt;- rapport(&quot;example&quot;, mtcars, x = &quot;hp&quot;, y = &quot;mpg&quot;, reproducible = TRUE)
tpl.rerun(tmp)
</code></pre>
</div>


