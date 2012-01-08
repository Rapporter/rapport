#### Generic functions

##### decrypt: Decrypt a string
<p> Decrypts string encrypted by <code>encrypt</code> .</p>
<pre>decrypt(message)</pre>
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
<p>string</p>
##### encrypt: Encrypt a string
<p> A simple encryption function which reorders thecharacters in a given string based on a predefined key.As it can be seen: the used encryption is easy to crack,do not use this for sensitive data! The key is set bydefault on library startup. It can be changed bymodifying <code>options(&apos;.encrypt.key&apos;)</code> to any characterstring with same lenght as <code>options(&apos;.encrypt.chars&apos;)</code> . E.g. <code>intToUtf8(sample(c(33, 36:38, 48:57, 64:90, 97:122,  192:246, 248:382), nchar(getOption(&apos;.encrypt.chars&apos;)))))</code> would return a quite complex but readable key.</p>
<pre>encrypt(message)</pre>
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
<p>string</p>
##### evals: Evals chunk(s) of R code
<p> This function takes either a list of integer indiceswhich point to position of R code in body charactervector, or a list of strings with actual R code, thenevaluates each list element, and returns a list with twoelements: a character value with R code and generatedoutput. The output can be NULL (eg. <code>x &lt;-  runif(100)</code> ), a table (eg. <code>table(mtcars$am,  mtcars$cyl)</code> or any other R object. If a graph is plottedin the given text, the returned object is a stringspecifying the path to the saved png in temporarydirectory (see: <code>tmpfile()</code> ). The function takescare of warnings and errors too, please check the thereturned value below.</p>
<pre>evals(txt = NULL, ind = NULL, body = NULL,    classes = NULL, hooks = NULL, length = Inf,    output = c(&quot;all&quot;, &quot;src&quot;, &quot;output&quot;, &quot;type&quot;, &quot;msg&quot;),    env = NULL, ...)</pre>
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
<p>a list of parsed elements each containg: src (the command
run), output (what the command returns, NULL if nothing
returned), type (class of returned object if any) and
messages: warnings (if any returned by the command run,
otherwise set to NULL) and errors (if any returned by the
command run, otherwise set to NULL)</p>
#### Generic graph functions

##### rp.barplot: Barplot
<p> This function is a wrapper around <code>barchart</code> which operates only on factors with optional facet.</p>
<pre>rp.barplot(x, facet = NULL, data = NULL, groups = FALSE,    auto.key = FALSE, horizontal = TRUE, percent = FALSE,    theme = getOption(&quot;rp.color.palette&quot;),    colorize = getOption(&quot;rp.colorize&quot;), ...)</pre>
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
<pre>## Not run: 
df &lt;- transform(mtcars, cyl = factor(cyl, labels = c(&apos;4&apos;, &apos;6&apos;, &apos;8&apos;)), am = factor(am, labels = c(&apos;automatic&apos;, &apos;manual&apos;)), vs = factor(vs))
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

## End(Not run)</pre>
##### rp.boxplot: Boxplot
<p> This function is a wrapper around <code>bwplot</code> which operates only on numeric variables with optionalfacet.</p>
<pre>rp.boxplot(x, y = NULL, facet = NULL, data = NULL,    theme = getOption(&quot;rp.color.palette&quot;),    colorize = getOption(&quot;rp.colorize&quot;), ...)</pre>
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
<pre>## Not run: 
df &lt;- transform(mtcars, cyl = factor(cyl, labels = c(&apos;4&apos;, &apos;6&apos;, &apos;8&apos;)), am = factor(am, labels = c(&apos;automatic&apos;, &apos;manual&apos;)), vs = factor(vs))
rp.boxplot(df$cyl)
	rp.boxplot(df$cyl, df$wt)
	rp.boxplot(df$cyl, df$hp, facet=df$am)
	rp.label(df$hp) &lt;- &apos;horsepower&apos;; rp.label(df$wt) &lt;- &apos;weight&apos;; rp.boxplot(df$cyl, df$wt)
	rp.boxplot(df$cyl, df$wt, colorize=TRUE)
	with(df, rp.scatterplot(hp, wt, facet = am))
	rp.boxplot(cyl, wt, data=df)
	rp.boxplot(cyl, wt, am, df)

## End(Not run)</pre>
##### rp.cor.plot: Scatterplot matrices
<p> This function is a wrapper around <code>pairs</code> which operates only on numeric variables. Panel optionsare: <code>c(&apos;panel.cor&apos;, &apos;panel.smooth&apos;, &apos;panel.hist&apos;)</code> .Custom panels may be also added.</p>
<pre>rp.cor.plot(x, lower.panel = &quot;panel.smooth&quot;,    upper.panel = &quot;panel.cor&quot;, data = NULL,    theme = getOption(&quot;rp.color.palette&quot;),    colorize = getOption(&quot;rp.colorize&quot;), ...)</pre>
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
<pre>## Not run: 
df &lt;- transform(mtcars, cyl = factor(cyl, labels = c(&apos;4&apos;, &apos;6&apos;, &apos;8&apos;)), am = factor(am, labels = c(&apos;automatic&apos;, &apos;manual&apos;)), vs = factor(vs))
	rp.cor.plot(df)
rp.cor.plot(df, diag.panel=&apos;panel.hist&apos;)

## End(Not run)</pre>
##### rp.densityplot: Density plot
<p> This function is a wrapper around <code>densityplot</code> which operates only on numericvectors with optional facet.</p>
<pre>rp.densityplot(x, facet = NULL, data = NULL,    theme = getOption(&quot;rp.color.palette&quot;),    colorize = getOption(&quot;rp.colorize&quot;), ...)</pre>
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
<pre>## Not run: 
df &lt;- transform(mtcars, cyl = factor(cyl, labels = c(&apos;4&apos;, &apos;6&apos;, &apos;8&apos;)),
    am = factor(am, labels = c(&apos;automatic&apos;, &apos;manual&apos;)), vs = factor(vs))
rp.densityplot(df$hp)
rp.densityplot(df$hp, facet=df$am)
rp.densityplot(df$hp, df$am)
rp.label(df$hp) &lt;- &apos;horsepower&apos;; rp.densityplot(df$hp)
rp.densityplot(df$hp, colorize=TRUE)
with(df, rp.densityplot(hp, facet = am))
rp.densityplot(hp, data = df)
rp.densityplot(hp, am, df)

## End(Not run)</pre>
##### rp.dotplot: Dotplot
<p> This function is a wrapper around <code>dotplot</code> which operates only on factors with optional facet.</p>
<pre>rp.dotplot(x, facet = NULL, data = NULL, groups = FALSE,    auto.key = FALSE, horizontal = TRUE,    theme = getOption(&quot;rp.color.palette&quot;),    colorize = getOption(&quot;rp.colorize&quot;), ...)</pre>
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
<pre>## Not run: 
df &lt;- transform(mtcars, cyl = factor(cyl, labels = c(&apos;4&apos;, &apos;6&apos;, &apos;8&apos;)), am = factor(am, labels = c(&apos;automatic&apos;, &apos;manual&apos;)), vs = factor(vs))
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

## End(Not run)</pre>
