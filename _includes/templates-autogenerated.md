<ul>
 	<li><a href="#correlations">correlations.tpl</a></li>
 	<li><a href="#crosstable">crosstable.tpl</a></li>
 	<li><a href="#example">example.tpl</a></li>
 	<li><a href="#outlier-test">outlier-test.tpl</a></li>
 	<li><a href="#type_demo">type_demo.tpl</a></li>
 	<li><a href="#univar-descriptive">univar-descriptive.tpl</a></li>
 </ul>

Please find below a detailed description about each with sample outputs of those in R console, HTML, odt and pdf too.

<a id="correlations"> </a>
#### correlations.tpl

 <ul class="tabs">
	<li><a class="active" href="#info-correlations">Description</a></li>
	<li><a href="#inputs-correlations">Inputs</a></li>
	<li><a href="#example-correlations">Example</a></li>
	<li><a href="#export-correlations">Export</a></li>
</ul>

 <ul class="tabs-content">
	<li class="active" id="info-correlations"><div><h5>Correlations</h5> by <em>Daróczi Gergely</em>
<br><br>
 This template will return the correlation matrix of supplied numerical variables.
<br><br>
<em>Required packages:</em> ascii
<br>
<em>Example:</em> 
{% highlight text %}
rapport('correlations', data=ius2009, vars=c('age', 'it.edu', 'it.leisure'))
{% endhighlight %}
</div></li>
	<li id="inputs-correlations"><div><h5>Input parameters</h5><em>correlations.tpl</em> template has the following options to be (optionally) set while calling <em>rapport</em>:<ul>
	<li><h6>vars: <small><em>Variable</em></small></h6>
<div class="options">    <div class="options-desc">Numerical variables
</div>
    <em>Type:</em>	numeric
<br>
    <em>Limits:</em>	from 1, up to 10 variables
<br>

</div>
</li>
<br>
<li><h6>cor.matrix: <small><em>Correlation matrix</em></small></h6>
<div class="options">    <div class="options-desc">Show correlation matrix (numbers)?
</div>
    <em>Type:</em>	boolean
<br>
    <em>Limits:</em>	exactly 1 variable
<br>
    <em>Default value:</em>	TRUE
</div>
</li>
<br>
<li><h6>cor.plot: <small><em>Scatterplot matrix</em></small></h6>
<div class="options">    <div class="options-desc">Show scatterplot matrix (image)?
</div>
    <em>Type:</em>	boolean
<br>
    <em>Limits:</em>	exactly 1 variable
<br>
    <em>Default value:</em>	TRUE
</div>
</li>
<br>
</ul></div></li>
	<li id="example-correlations">
{% highlight text %}


################################################################################################
##	 Running: rapport('correlations', data=ius2009, vars=c('age', 'it.edu', 'it.leisure'))
################################################################################################

 == Variable description  

3 variables provided.

The highest correlation coefficient (0.23644) is between "it.edu" and "age" and the lowest (-0.04905) is between "it.leisure" and "age". It seems that the strongest association (r=0.23644) is between "it.edu" and "age".

Higly correlated (r < 0.7 or r > 0.7) variables: -


Uncorrelated (-0.2 < r < 0.2) variables: 
 * "age" - "it.leisure"
 * "it.edu" - "it.leisure"

 === Correlation matrix  


             **age**       **it.edu**    **it.leisure**  
------------ ------------- ------------- ----------------
age                        0.23644 ***   -0.04905        
it.edu       0.23644 ***                 0.17142 ***     
it.leisure   -0.04905      0.17142 ***                   
------------ ------------- ------------- ----------------


/tmp/RtmpV1PMjn/file13d8d1c0.png


{% endhighlight %}
</li>
	<li id="export-correlations"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport('correlations', data=ius2009, vars=c('age', 'it.edu', 'it.leisure'))

{% endhighlight %}
<h6>Popular formats:</h6>
<ul>
	<li><a href="demo/correlations.html" target="_blank">HTML</a></li>
	<li><a href="demo/correlations.odt">odt (MS Word compatibile)</a></li>
	<li><a href="demo/correlations.rtf">rtf (MS Word compatibile)</a></li>
	<li><a href="demo/correlations.epub">epub</a></li>
	<li><a href="demo/correlations.tex" target="_blank">latex</a></li>
	<li><a href="demo/correlations-slidy.html" target="_blank">HTML slidy</a></li>
</ul>
<h6>Other morkdown formats</h6>
<ul>
	<li><a href="demo/correlations.plain" target="_blank">plain text</a></li>
	<li><a href="demo/correlations.textile" target="_blank">textile</a></li>
	<li><a href="demo/correlations.xml" target="_blank">docbook</a></li>
	<li><a href="demo/correlations.man" target="_blank">man</a></li>
	<li><a href="demo/correlations.md" target="_blank">markdown</a></li>
	<li><a href="demo/correlations.mediawiki" target="_blank">mediawiki</a></li>
	<li><a href="demo/correlations.wiki" target="_blank">wiki</a></li>
	<li><a href="demo/correlations.org" target="_blank">org</a></li>
	<li><a href="demo/correlations.pandoc" target="_blank">pandoc</a></li>
</ul>
</div></li>
</ul>

<a id="crosstable"> </a>
#### crosstable.tpl

 <ul class="tabs">
	<li><a class="active" href="#info-crosstable">Description</a></li>
	<li><a href="#inputs-crosstable">Inputs</a></li>
	<li><a href="#example-crosstable">Example</a></li>
	<li><a href="#export-crosstable">Export</a></li>
</ul>

 <ul class="tabs-content">
	<li class="active" id="info-crosstable"><div><h5>Crosstable</h5> by <em>Gergely Daróczi</em>
<br><br>
 Returning the Chi-squared test of two given variables with count, percentages and Pearson's residuals table.
<br><br>
<em>Required packages:</em> descr
<br>
<em>Example:</em> 
{% highlight text %}
rapport('crosstable', data=ius2009, row='gender', col='dwell')
{% endhighlight %}
</div></li>
	<li id="inputs-crosstable"><div><h5>Input parameters</h5><em>crosstable.tpl</em> template has the following options to be (optionally) set while calling <em>rapport</em>:<ul>
	<li><h6>row: <small><em>Row variable</em></small></h6>
<div class="options">    <div class="options-desc">A categorical variable.
</div>
    <em>Type:</em>	factor
<br>
    <em>Limits:</em>	exactly 1 variable
<br>

</div>
</li>
<br>
<li><h6>col: <small><em>Column variable</em></small></h6>
<div class="options">    <div class="options-desc">A categorical variable.
</div>
    <em>Type:</em>	factor
<br>
    <em>Limits:</em>	exactly 1 variable
<br>

</div>
</li>
<br>
</ul></div></li>
	<li id="example-crosstable">
{% highlight text %}


##################################################################################
##	 Running: rapport('crosstable', data=ius2009, row='gender', col='dwell')
##################################################################################

 == Variable description  

Two variables specified:
 * "gender" ("Gender") with 709 and
 * "dwell" ("Dwelling") with 709 valid values.

 == Counts  


         **city**   **small town**   **village**  
-------- ---------- ---------------- -------------
male     380        30               22           
female   262        6                9            
-------- ---------- ---------------- -------------


 == Percentages  


         **city**   **small town**   **village**  
-------- ---------- ---------------- -------------
male     0.53597    0.04231          0.03103      
female   0.36953    0.00846          0.01269      
-------- ---------- ---------------- -------------


 === Row percentages  


         **city**   **small town**   **village**  
-------- ---------- ---------------- -------------
male     0.87963    0.06944          0.05093      
female   0.94585    0.02166          0.03249      
-------- ---------- ---------------- -------------


 === Column percentages  


         **city**   **small town**   **village**  
-------- ---------- ---------------- -------------
male     0.59190    0.83333          0.70968      
female   0.40810    0.16667          0.29032      
-------- ---------- ---------------- -------------


 == Chi-squared test  


            **X-squared**   **df**   **p-value**  
----------- --------------- -------- -------------
X-squared   9.72            2.00     0.01         
----------- --------------- -------- -------------


It seems that a real association can be pointed out between *gender* and *dwell* by the *Pearson's Chi-squared test* (χ=9.7188 at the degree of freedom being 2) at the significance level of 0.00776.
Based on Goodman and Kruskal's lambda it seems that *dwell* (λ=0.75812) has an effect on *gender* (λ=0) if we assume both variables to be nominal.
The association between the two variables seems to be weak based on Cramer's V (0.08279).

 === Pearson's residuals  


         **city**   **small town**   **village**  
-------- ---------- ---------------- -------------
male     -2.9409    2.8277           1.1712       
female   2.9409     -2.8277          -1.1712      
-------- ---------- ---------------- -------------


 === Mosaic chart  

/tmp/RtmpV1PMjn/file5afb1ab.png


{% endhighlight %}
</li>
	<li id="export-crosstable"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport('crosstable', data=ius2009, row='gender', col='dwell')

{% endhighlight %}
<h6>Popular formats:</h6>
<ul>
	<li><a href="demo/crosstable.html" target="_blank">HTML</a></li>
	<li><a href="demo/crosstable.odt">odt (MS Word compatibile)</a></li>
	<li><a href="demo/crosstable.rtf">rtf (MS Word compatibile)</a></li>
	<li><a href="demo/crosstable.epub">epub</a></li>
	<li><a href="demo/crosstable.tex" target="_blank">latex</a></li>
	<li><a href="demo/crosstable-slidy.html" target="_blank">HTML slidy</a></li>
</ul>
<h6>Other morkdown formats</h6>
<ul>
	<li><a href="demo/crosstable.plain" target="_blank">plain text</a></li>
	<li><a href="demo/crosstable.textile" target="_blank">textile</a></li>
	<li><a href="demo/crosstable.xml" target="_blank">docbook</a></li>
	<li><a href="demo/crosstable.man" target="_blank">man</a></li>
	<li><a href="demo/crosstable.md" target="_blank">markdown</a></li>
	<li><a href="demo/crosstable.mediawiki" target="_blank">mediawiki</a></li>
	<li><a href="demo/crosstable.wiki" target="_blank">wiki</a></li>
	<li><a href="demo/crosstable.org" target="_blank">org</a></li>
	<li><a href="demo/crosstable.pandoc" target="_blank">pandoc</a></li>
</ul>
</div></li>
</ul>

<a id="example"> </a>
#### example.tpl

 <ul class="tabs">
	<li><a class="active" href="#info-example">Description</a></li>
	<li><a href="#inputs-example">Inputs</a></li>
	<li><a href="#example-example">Example</a></li>
	<li><a href="#export-example">Export</a></li>
</ul>

 <ul class="tabs-content">
	<li class="active" id="info-example"><div><h5>example script</h5> by <em>Aleksandar Blagotić</em>
<br><br>
 A simple report.
<br><br>
<em>Required packages:</em> 
<br>
<em>Example:</em> 
{% highlight text %}
rapport("example", mtcars, x = "mpg", y = "hp")
rapport("example", mtcars, x = "hp", y = "wt")
rapport("example", ius2009, x = "it.edu", y = "it.leisure")
{% endhighlight %}
</div></li>
	<li id="inputs-example"><div><h5>Input parameters</h5><em>example.tpl</em> template has the following options to be (optionally) set while calling <em>rapport</em>:<ul>
	<li><h6>x: <small><em>Var X</em></small></h6>
<div class="options">    <div class="options-desc">One or two factors for one/two-way ANOVA
</div>
    <em>Type:</em>	numeric
<br>
    <em>Limits:</em>	exactly 1 variable
<br>

</div>
</li>
<br>
<li><h6>y: <small><em>Var Y</em></small></h6>
<div class="options">    <div class="options-desc">A dependent (response) variable
</div>
    <em>Type:</em>	numeric
<br>
    <em>Limits:</em>	exactly 1 variable
<br>

</div>
</li>
<br>
<li><h6>bool: <small><em>Boolean</em></small></h6>
<div class="options">    <div class="options-desc">some boolean values
</div>
    <em>Type:</em>	boolean
<br>
    <em>Limits:</em>	exactly 1 variable
<br>
    <em>Default value:</em>	TRUE
</div>
</li>
<br>
<li><h6>csv: <small><em>CSV</em></small></h6>
<div class="options">    <div class="options-desc">comma separated values
</div>
    <em>Type:</em>	option
<br>
    <em>Limits:</em>	exactly 1 variable
<br>
    <em>Default value:</em>	foo, bar
</div>
</li>
<br>
</ul></div></li>
	<li id="example-example">
{% highlight text %}


###################################################################
##	 Running: rapport("example", mtcars, x = "mpg", y = "hp")
###################################################################

 == Descriptive statistics  

The average fuel consumption is 20.091 with SD of 6.027.
Let's add one more line to this paragraph.
And another one.
Now, you've probably heard of _pi_? Right? Its value is 3.1416.

 == Graphs  

And some graphs:

/tmp/RtmpV1PMjn/file1dbeadc8.png

So far we've been dealing with data.frames and plots, now let's deal with variables

Now we'll see if the Z var is working properly. If I omit it, it should perserve the default value (TRUE)... aaaand.... TRUE.

OK, so far, so good, but let's see what's going on with code chunks...


---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------
0.68581    1.02705    1.84060    -0.93514   -0.88256   0.05850    0.50313    0.97422    0.40265    1.20301   
-0.42391   1.49881    0.23022    1.75651    2.12127    1.05795    0.31745    -0.66831   -1.13775   -0.08294  
-0.39504   0.44203    -0.05203   0.75932    0.28744    0.12987    -0.05781   -0.24921   -0.09108   -1.23996  
-1.49650   1.22348    -0.74750   0.04138    0.72973    0.38346    -0.57475   -0.50059   -1.85845   0.02823   
1.12419    -1.01385   0.76911    1.03493    1.90332    -0.45268   0.68487    1.84153    -0.26411   -0.38101  
-0.45158   0.20689    -1.66460   0.31363    2.20809    -0.32738   -0.67558   0.54113    -1.57139   -0.13375  
2.18045    -0.40841   -0.23173   -0.04850   -0.89918   -0.58743   0.27330    -0.23866   0.35055    0.40085   
0.49154    0.95370    -1.04429   0.39949    -1.20858   -0.79431   -0.76594   -0.36113   -0.29245   1.45965   
0.47843    -1.63091   -0.93888   1.48541    -1.74184   -1.20638   1.05930    0.03196    -0.80265   1.74231   
-0.70797   0.48712    -0.60968   0.45807    -1.12980   0.79780    1.13584    -0.62595   0.84215    1.16999   
---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------


When it comes to CSV values, let us see how do they work. You have chosen the "foo".


##################################################################
##	 Running: rapport("example", mtcars, x = "hp", y = "wt")
##################################################################

 == Descriptive statistics  

The average fuel consumption is 146.69 with SD of 68.563.
Let's add one more line to this paragraph.
And another one.
Now, you've probably heard of _pi_? Right? Its value is 3.1416.

 == Graphs  

And some graphs:

/tmp/RtmpV1PMjn/file4980c2e3.png

So far we've been dealing with data.frames and plots, now let's deal with variables

Now we'll see if the Z var is working properly. If I omit it, it should perserve the default value (TRUE)... aaaand.... TRUE.

OK, so far, so good, but let's see what's going on with code chunks...


---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------
-0.20438   -0.97608   -0.37527   -0.00471   0.42691    0.64429    -0.37826   -0.02315   1.08438    -0.55651  
-0.89103   -0.87173   1.28848    1.48051    -0.24372   -1.67347   -1.54156   -0.32257   0.45316    -0.73320  
-0.15353   -0.44144   0.84805    -0.54710   -1.41090   2.00564    0.66384    -1.04778   1.00067    0.81082   
0.87244    -2.18386   0.53396    1.67174    1.54852    -0.40589   -1.54990   0.68612    0.27048    -0.27375  
-1.33242   0.10848    0.16683    1.19140    2.27289    -0.82416   0.98360    0.86021    -0.84644   1.50901   
0.76963    -0.08177   -0.48671   -1.33007   -0.45298   0.34856    -0.00249   0.90691    -0.19339   -1.30748  
-0.51805   0.66530    1.75604    -0.87319   0.78045    1.47267    -0.47716   0.38239    0.78734    -0.87843  
0.31337    -1.16321   -1.36180   -0.72139   0.52902    -0.88114   0.33539    1.22315    -0.75551   0.36756   
0.62489    0.08321    0.02511    -0.60689   -2.34480   0.27271    -1.80025   -1.89355   -0.24590   0.01972   
-1.84983   0.36127    -0.09217   0.62969    0.24963    0.56068    -0.62246   -0.39854   -2.30407   -0.95548  
---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------


When it comes to CSV values, let us see how do they work. You have chosen the "foo".


###############################################################################
##	 Running: rapport("example", ius2009, x = "it.edu", y = "it.leisure")
###############################################################################

 == Descriptive statistics  

The average fuel consumption is 2.0628 with SD of 2.0404.
Let's add one more line to this paragraph.
And another one.
Now, you've probably heard of _pi_? Right? Its value is 3.1416.

 == Graphs  

And some graphs:

/tmp/RtmpV1PMjn/file8947597.png

So far we've been dealing with data.frames and plots, now let's deal with variables

Now we'll see if the Z var is working properly. If I omit it, it should perserve the default value (TRUE)... aaaand.... TRUE.

OK, so far, so good, but let's see what's going on with code chunks...


---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------
-1.11399   -1.43540   -0.61238   0.80214    -2.74797   0.99691    1.96794    0.68774    0.43944    0.16000   
-0.04246   1.57804    0.77817    1.15685    -1.00604   0.09471    -0.62177   -0.77256   0.27875    0.94441   
-1.07627   -0.14223   0.26994    0.31511    -2.06595   -0.71035   1.12444    -1.07330   -0.73219   -1.16904  
0.45218    1.29579    0.18678    -0.51041   -1.43740   0.20114    0.03252    -0.39004   -1.50238   -0.10493  
3.62513    -1.88824   -0.42495   1.25649    -0.79032   -0.35434   -0.28040   0.48377    0.08898    -0.13333  
0.45540    2.46298    -0.08426   -0.15603   0.11776    0.19825    -1.26084   -0.48908   0.90705    1.07223   
-0.41106   -0.28563   0.83612    0.08258    -0.61284   -1.10612   -0.65941   -0.23793   -0.76714   1.45379   
-0.11498   -0.50775   -0.32924   -1.05956   0.95726    0.00047    1.37302    -0.79764   -0.60718   0.43473   
1.84206    0.66827    0.49570    0.09892    -1.18682   -1.60310   0.71164    1.88750    -0.30469   -0.24915  
-0.07789   0.13431    -0.54607   -1.17242   1.19911    0.09651    1.25640    0.21273    1.97152    -1.29210  
---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------


When it comes to CSV values, let us see how do they work. You have chosen the "foo".


{% endhighlight %}
</li>
	<li id="export-example"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport("example", mtcars, x = "mpg", y = "hp")
rapport("example", mtcars, x = "hp", y = "wt")
rapport("example", ius2009, x = "it.edu", y = "it.leisure")

{% endhighlight %}
<h6>Popular formats:</h6>
<ul>
	<li><a href="demo/example.html" target="_blank">HTML</a></li>
	<li><a href="demo/example.odt">odt (MS Word compatibile)</a></li>
	<li><a href="demo/example.rtf">rtf (MS Word compatibile)</a></li>
	<li><a href="demo/example.epub">epub</a></li>
	<li><a href="demo/example.tex" target="_blank">latex</a></li>
	<li><a href="demo/example-slidy.html" target="_blank">HTML slidy</a></li>
</ul>
<h6>Other morkdown formats</h6>
<ul>
	<li><a href="demo/example.plain" target="_blank">plain text</a></li>
	<li><a href="demo/example.textile" target="_blank">textile</a></li>
	<li><a href="demo/example.xml" target="_blank">docbook</a></li>
	<li><a href="demo/example.man" target="_blank">man</a></li>
	<li><a href="demo/example.md" target="_blank">markdown</a></li>
	<li><a href="demo/example.mediawiki" target="_blank">mediawiki</a></li>
	<li><a href="demo/example.wiki" target="_blank">wiki</a></li>
	<li><a href="demo/example.org" target="_blank">org</a></li>
	<li><a href="demo/example.pandoc" target="_blank">pandoc</a></li>
</ul>
</div></li>
</ul>

<a id="outlier-test"> </a>
#### outlier-test.tpl

 <ul class="tabs">
	<li><a class="active" href="#info-outlier-test">Description</a></li>
	<li><a href="#inputs-outlier-test">Inputs</a></li>
	<li><a href="#example-outlier-test">Example</a></li>
	<li><a href="#export-outlier-test">Export</a></li>
</ul>

 <ul class="tabs-content">
	<li class="active" id="info-outlier-test"><div><h5>Outlier test</h5> by <em>Gergely Daróczi</em>
<br><br>
 This template will check if provided variable has any outliers.
<br><br>
<em>Required packages:</em> outliers
<br>
<em>Example:</em> 
{% highlight text %}
rapport('outlier-test', data=ius2009, var='it.edu')
{% endhighlight %}
</div></li>
	<li id="inputs-outlier-test"><div><h5>Input parameters</h5><em>outlier-test.tpl</em> template has the following options to be (optionally) set while calling <em>rapport</em>:<ul>
	<li><h6>var: <small><em>Variable</em></small></h6>
<div class="options">    <div class="options-desc">Numerical variable
</div>
    <em>Type:</em>	numeric
<br>
    <em>Limits:</em>	exactly 1 variable
<br>

</div>
</li>
<br>
<li><h6>references: <small><em>References</em></small></h6>
<div class="options">    <div class="options-desc">Print references?
</div>
    <em>Type:</em>	boolean
<br>
    <em>Limits:</em>	exactly 1 variable
<br>
    <em>Default value:</em>	TRUE
</div>
</li>
<br>
<li><h6>grubb: <small><em>Grubb's test</em></small></h6>
<div class="options">    <div class="options-desc">Show Grubb's test?
</div>
    <em>Type:</em>	boolean
<br>
    <em>Limits:</em>	exactly 1 variable
<br>
    <em>Default value:</em>	TRUE
</div>
</li>
<br>
<li><h6>dixon: <small><em>Dixon's test</em></small></h6>
<div class="options">    <div class="options-desc">Show Dixon's test?
</div>
    <em>Type:</em>	boolean
<br>
    <em>Limits:</em>	exactly 1 variable
<br>
    <em>Default value:</em>	TRUE
</div>
</li>
<br>
</ul></div></li>
	<li id="example-outlier-test">
{% highlight text %}


#######################################################################
##	 Running: rapport('outlier-test', data=ius2009, var='it.edu')
#######################################################################

 == Boxplot  

/tmp/RtmpV1PMjn/file5b2bbc80.png

 == Lund test  

It seems that 5 extreme values can be found in "Internet usage for educational purposes (hours per day)". These are: 10, 10, 12, 12, 12.

 === Explanation  

The above test for outliers was based on *lm(1 ~ it.edu)*:


              **Estimate**   **Std. Error**   **t value**   **Pr(>|t|)**  
------------- -------------- ---------------- ------------- --------------
(Intercept)   2.06           0.08             26.92         0.00          
------------- -------------- ---------------- ------------- --------------


 === The residuals returned:  

-0.03078,  2.91195, -0.27601, -0.52124, -0.52124, -0.76647, -1.01169, -0.27601, -0.52124,  1.44058, -0.52124,  0.95013,  3.89286, -0.03078, -0.52124, -0.76647, -0.03078,  1.44058, -0.52124,  0.45967,  1.93104, -0.52124,  0.95013, -0.52124,  0.95013, -0.03078,  0.45967, -0.76647,  0.95013, -0.76647, -0.52124, -0.52124, -0.52124,  1.44058,  3.40240, -0.52124, -0.52124, -0.27601, -0.52124, -0.52124, -0.76647, -0.76647,  0.95013,  0.45967, -0.52124,  1.44058,  1.44058, -0.52124, -0.76647,  0.45967, -0.03078,  1.44058, -0.52124,  2.91195,  0.45967, -0.76647,  1.44058,  0.95013,  1.44058, -0.76647, -0.52124, -0.03078, -0.76647, -0.52124,  0.45967, -0.76647,  0.95013, -0.76647, -0.52124, -0.76647, -0.03078, -0.52124,  0.45967,  0.45967, -0.03078, -0.76647, -1.01169, -0.76647, -0.52124, -0.52124, -0.27601, -0.76647, -0.76647,  2.91195, -0.03078,  2.91195,  0.45967, -0.03078, -0.52124, -0.52124, -0.27601, -0.76647,  0.95013, -0.52124, -0.03078, -0.76647,  0.70490, -0.52124, -0.76647, -0.52124,  0.21444, -0.03078, -0.03078, -0.03078, -1.01169, -0.76647, -0.27601,  2.91195, -1.01169,  1.19535,  0.95013,  2.91195, -0.27601, -0.03078,  0.95013, -0.76647, -1.01169, -0.76647, -0.52124,  0.45967, -0.76647, -1.01169,  2.91195, -0.52124, -0.76647, -0.52124, -0.76647, -0.52124, -1.01169, -0.52124,  2.42149, -0.52124, -0.52124,  1.44058,  0.21444,  0.21444,  0.95013,  0.45967,  0.21444, -0.27601,  0.95013,  1.93104, -0.76647,  0.21444, -0.03078, -0.52124, -1.01169, -1.01169, -0.03078, -0.03078, -0.03078, -0.76647, -0.52124, -0.52124, -0.52124, -0.52124, -0.52124, -1.01169, -0.52124,  0.45967, -0.03078, -0.52124,  0.45967, -0.76647,  0.21444,  1.44058,  1.44058, -1.01169,  1.44058,  0.95013, -0.76647, -0.52124, -0.76647, -0.76647, -0.03078, -0.52124,  0.45967, -0.03078, -0.52124, -0.52124, -0.03078, -0.76647, -0.52124,  2.91195, -0.76647, -0.76647, -0.52124, -0.76647, -0.03078, -0.03078, -0.76647, -0.52124, -0.52124, -1.01169, -0.52124, -0.52124,  0.45967, -0.03078,  0.45967, -0.52124, -0.52124, -1.01169, -1.01169, -0.03078, -1.01169, -0.52124, -0.52124,  0.95013, -0.76647,  2.91195, -0.52124, -0.03078, -1.01169,  1.44058,  0.45967, -0.52124, -0.03078, -0.76647, -0.52124, -0.52124, -1.01169, -0.76647, -0.76647, -1.01169, -0.76647, -0.52124,  0.45967, -0.03078, -0.03078, -1.01169, -0.76647, -0.52124, -0.03078, -0.52124, -0.03078, -1.01169,  0.95013,  0.45967, -0.03078, -0.03078,  0.45967, -0.52124, -1.01169,  2.91195, -0.03078, -0.52124,  0.95013, -0.52124, -0.03078,  3.40240,  0.45967, -0.52124, -0.52124, -0.52124, -0.03078, -0.76647, -0.52124, -0.76647, -0.76647, -0.52124, -1.01169, -0.52124,  0.45967, -0.03078, -0.52124, -0.03078, -0.52124, -0.52124,  0.45967, -1.01169, -0.03078, -0.76647,  3.89286,  0.45967, -0.76647,  0.45967, -1.01169, -0.76647, -0.76647, -0.03078, -0.27601, -0.03078, -0.76647, -0.76647, -0.03078,  0.45967, -0.52124, -0.52124, -0.52124, -0.03078, -0.27601, -0.52124, -0.03078,  1.93104,  1.93104,  2.91195, -0.76647,  0.45967,  4.87377, -0.76647,  1.44058,  2.91195, -0.52124,  0.95013, -1.01169, -0.52124,  2.91195, -0.03078,  2.91195, -0.52124,  0.95013,  0.95013,  0.45967, -0.52124, -0.27601, -0.52124, -0.76647, -0.52124, -0.52124, -0.52124, -0.52124,  0.45967, -0.76647,  1.44058, -0.52124, -0.03078, -0.03078, -0.03078, -0.52124, -0.52124, -0.76647,  1.93104, -0.52124, -0.03078, -0.52124, -1.01169, -0.52124,  0.45967, -0.76647, -0.52124,  0.45967, -0.52124,  4.87377, -0.52124, -0.27601, -0.52124,  0.45967, -1.01169, -0.76647, -0.52124,  2.91195,  1.44058, -0.03078, -0.27601,  1.93104,  2.91195, -0.52124,  2.91195,  0.45967, -0.52124,  0.95013,  0.21444, -0.03078, -0.52124, -1.01169, -1.01169,  1.68581,  0.21444, -0.52124, -0.52124, -0.27601, -1.01169, -0.52124, -1.01169, -0.52124, -0.76647, -0.52124,  0.45967, -0.03078, -1.01169, -0.03078,  0.45967,  0.45967,  0.45967, -0.52124, -0.52124,  2.91195, -0.52124, -1.01169,  2.91195, -1.01169, -0.52124,  0.45967, -1.01169,  1.44058, -0.03078,  0.95013, -1.01169,  2.91195, -0.52124, -0.76647,  0.95013, -0.03078, -0.52124,  0.21444, -0.03078, -0.52124, -0.76647,  4.87377,  1.93104,  0.95013, -0.03078,  0.95013,  1.19535,  0.45967, -0.76647, -0.76647, -1.01169,  0.95013,  2.91195,  0.45967,  1.44058,  2.91195, -0.52124,  0.45967,  1.44058, -1.01169, -0.03078,  0.45967, -0.03078,  1.93104, -0.52124, -0.52124,  1.44058, -0.03078, -0.52124, -0.76647, -0.52124, -0.52124,  0.21444, -0.52124, -0.52124, -0.52124, -0.52124, -0.03078, -0.76647, -0.03078,  0.95013, -0.52124,  0.45967, -0.03078, -0.76647, -0.03078, -0.52124, -0.52124, -0.52124, -0.03078, -0.52124, -0.52124, -0.76647, -0.52124, -0.27601, -0.76647, -0.03078, -0.76647, -0.52124,  1.44058, -1.01169,  0.95013, -0.03078, -0.76647, -0.76647, -0.52124, -0.52124, -0.52124, -0.52124, -0.03078, -0.76647, -0.52124, -0.52124, -0.52124, -0.52124,  0.70490, -0.03078, -0.52124,  0.45967, -0.03078, -0.52124, -0.76647, -0.52124, -0.76647, -1.01169, -0.03078, -0.52124, -0.03078,  0.95013, -0.52124, -0.52124, -0.03078, -0.76647, -0.52124,  0.21444, -0.27601, -0.03078, -0.52124, -0.76647, -0.52124, -0.03078, -0.03078, -0.52124, -0.03078, -0.52124,  1.93104, -0.27601,  1.93104, -0.52124, -0.52124, -0.27601, -0.52124, -0.03078,  0.45967, -0.76647, -0.52124,  0.45967,  0.95013, -0.03078,  1.44058, -0.52124,  0.45967,  0.45967, -0.52124, -0.27601,  0.21444,  1.44058, -0.27601,  1.44058, -0.03078,  0.45967,  1.44058, -0.52124, -0.27601, -0.52124, -0.52124, -0.03078, -0.52124, -0.03078, -0.76647, -0.76647, -0.76647, -0.52124, -0.76647, -0.52124, -0.27601, -0.03078,  0.45967,  0.95013, -1.01169, -0.27601,  1.93104,  1.93104, -0.52124, -0.52124,  0.45967, -0.52124,  0.95013, -0.52124, -1.01169, -0.03078,  0.95013, -0.76647, -0.03078,  0.95013, -0.52124, -0.27601,  2.17627, -0.03078,  0.95013,  0.45967,  1.44058,  0.21444, -0.76647, -0.52124, -1.01169, -0.03078,  0.45967, -0.76647, -1.01169, -1.01169, -0.52124, -0.52124, -0.03078, -0.52124, -0.27601, -1.01169, -0.03078,  0.45967, -0.76647, -0.52124, -0.52124, -0.52124, -0.03078, -0.52124, -0.52124,  0.45967, -0.52124, -1.01169, -1.01169,  0.45967, -0.27601, -0.52124,  1.93104, -0.03078, -0.52124, -1.01169, -0.52124, -0.76647, -1.01169,  0.95013,  0.95013,  1.44058, -0.76647, -0.52124, -0.52124, -0.03078,  1.44058, -1.01169,  0.45967, -0.52124,  1.44058,  0.45967, -0.76647, -0.52124, -0.76647, -1.01169, -0.76647, -0.76647, -0.03078, -1.01169,  0.21444,  0.45967,  2.91195,  0.45967, -0.76647, -0.76647, -0.03078,  0.21444, -0.03078,  0.45967, -0.52124,  0.21444,  2.91195, -1.01169, -0.52124, -0.52124,  1.44058, -0.52124, -0.27601, -1.01169, -0.03078, -0.03078, -0.03078,  0.21444, -1.01169,  0.45967, -0.52124, -0.76647, -0.52124, -0.76647, -0.03078, -0.52124,  0.45967, -0.52124, -1.01169, -0.03078, -0.03078, -0.03078, -0.03078,  1.44058,  0.95013, -1.01169, -0.03078,  1.44058, -0.52124, -0.03078,  0.45967, -0.52124,  1.44058,  0.45967, -0.52124,  0.45967, -0.52124, -0.76647, -0.52124, -1.01169, -0.76647, -0.03078, -0.52124, -0.76647, -0.03078, -0.76647, -0.52124, -0.52124, -0.76647,  2.91195,  3.15718, -1.01169, -1.01169, -0.76647, -0.52124

 === References  

 * Lund, R. E. 1975, "Tables for An Approximate Test for Outliers in Linear Models", Technometrics, vol. 17, no. 4, pp. 473-476.
 * Prescott, P. 1975, "An Approximate Test for Outliers in Linear Models", Technometrics, vol. 17, no. 1, pp. 129-132.

 == Grubb's test  

Grubbs test for one outlier shows that highest value 12 is an outlier (p=0.00032).

 === References  

 * Grubbs, F.E. (1950). Sample Criteria for testing outlying observations. Ann. Math. Stat. 21, 1, 27-58.

 == Dixon's test  

chi-squared test for outlier shows that highest value 12 is an outlier (p=0).

 === References  

 * Dixon, W.J. (1950). Analysis of extreme values. Ann. Math. Stat. 21, 4, 488-506.


{% endhighlight %}
</li>
	<li id="export-outlier-test"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport('outlier-test', data=ius2009, var='it.edu')

{% endhighlight %}
<h6>Popular formats:</h6>
<ul>
	<li><a href="demo/outlier-test.html" target="_blank">HTML</a></li>
	<li><a href="demo/outlier-test.odt">odt (MS Word compatibile)</a></li>
	<li><a href="demo/outlier-test.rtf">rtf (MS Word compatibile)</a></li>
	<li><a href="demo/outlier-test.epub">epub</a></li>
	<li><a href="demo/outlier-test.tex" target="_blank">latex</a></li>
	<li><a href="demo/outlier-test-slidy.html" target="_blank">HTML slidy</a></li>
</ul>
<h6>Other morkdown formats</h6>
<ul>
	<li><a href="demo/outlier-test.plain" target="_blank">plain text</a></li>
	<li><a href="demo/outlier-test.textile" target="_blank">textile</a></li>
	<li><a href="demo/outlier-test.xml" target="_blank">docbook</a></li>
	<li><a href="demo/outlier-test.man" target="_blank">man</a></li>
	<li><a href="demo/outlier-test.md" target="_blank">markdown</a></li>
	<li><a href="demo/outlier-test.mediawiki" target="_blank">mediawiki</a></li>
	<li><a href="demo/outlier-test.wiki" target="_blank">wiki</a></li>
	<li><a href="demo/outlier-test.org" target="_blank">org</a></li>
	<li><a href="demo/outlier-test.pandoc" target="_blank">pandoc</a></li>
</ul>
</div></li>
</ul>

<a id="type_demo"> </a>
#### type_demo.tpl

 <ul class="tabs">
	<li><a class="active" href="#info-type_demo">Description</a></li>
	<li><a href="#inputs-type_demo">Inputs</a></li>
	<li><a href="#example-type_demo">Example</a></li>
	<li><a href="#export-type_demo">Export</a></li>
</ul>

 <ul class="tabs-content">
	<li class="active" id="info-type_demo"><div><h5>Rapport types demo</h5> by <em>Aleksandar Blagotić</em>
<br><br>
 A sample template that describes the basic rapport types
<br><br>
<em>Required packages:</em> wordcloud
<br>
<em>Example:</em> </div></li>
	<li id="inputs-type_demo"><div><h5>Input parameters</h5><em>type_demo.tpl</em> template has the following options to be (optionally) set while calling <em>rapport</em>:<ul>
	<li><h6>a: <small><em>variable A</em></small></h6>
<div class="options">    <div class="options-desc">var A - from 1 up to 6 character variables
</div>
    <em>Type:</em>	character
<br>
    <em>Limits:</em>	from 1, up to 6 variables
<br>

</div>
</li>
<br>
<li><h6>b: <small><em>variable B</em></small></h6>
<div class="options">    <div class="options-desc">var B - length-one complex
</div>
    <em>Type:</em>	complex
<br>
    <em>Limits:</em>	exactly 1 variable
<br>

</div>
</li>
<br>
<li><h6>c: <small><em>variable C</em></small></h6>
<div class="options">    <div class="options-desc">var C - length-one factor
</div>
    <em>Type:</em>	factor
<br>
    <em>Limits:</em>	exactly 1 variable
<br>

</div>
</li>
<br>
<li><h6>d: <small><em>variable D</em></small></h6>
<div class="options">    <div class="options-desc">var D - length-one logical, defaults to FALSE
</div>
    <em>Type:</em>	logical
<br>
    <em>Limits:</em>	exactly 1 variable
<br>

</div>
</li>
<br>
<li><h6>e: <small><em>variable E</em></small></h6>
<div class="options">    <div class="options-desc">var E - 2-10 numeric vectors
</div>
    <em>Type:</em>	numeric
<br>
    <em>Limits:</em>	from 2, up to 10 variables
<br>

</div>
</li>
<br>
<li><h6>f: <small><em>variable F</em></small></h6>
<div class="options">    <div class="options-desc">var F - a variable (atomic vector of any type)
</div>
    <em>Type:</em>	variable
<br>
    <em>Limits:</em>	exactly 1 variable
<br>

</div>
</li>
<br>
<li><h6>g: <small><em>variable G</em></small></h6>
<div class="options">    <div class="options-desc">var G - it's an option list
</div>
    <em>Type:</em>	option
<br>
    <em>Limits:</em>	exactly 1 variable
<br>
    <em>Default value:</em>	foo, bar, blah
</div>
</li>
<br>
<li><h6>h: <small><em>variable H</em></small></h6>
<div class="options">    <div class="options-desc">var H - a boolean var
</div>
    <em>Type:</em>	boolean
<br>
    <em>Limits:</em>	exactly 1 variable
<br>
    <em>Default value:</em>	TRUE
</div>
</li>
<br>
</ul></div></li>
	<li id="example-type_demo">No examples provided with template, sorry.</li>
	<li id="export-type_demo">No examples provided with template, sorry.</li>
</ul>

<a id="univar-descriptive"> </a>
#### univar-descriptive.tpl

 <ul class="tabs">
	<li><a class="active" href="#info-univar-descriptive">Description</a></li>
	<li><a href="#inputs-univar-descriptive">Inputs</a></li>
	<li><a href="#example-univar-descriptive">Example</a></li>
	<li><a href="#export-univar-descriptive">Export</a></li>
</ul>

 <ul class="tabs-content">
	<li class="active" id="info-univar-descriptive"><div><h5>Descriptives</h5> by <em>Gergely Daróczi</em>
<br><br>
 This template will return descriptive statistics of a numerical, or a frequency table of a categorical variable.
<br><br>
<em>Required packages:</em> 
<br>
<em>Example:</em> 
{% highlight text %}
rapport('univar-descriptive', data=ius2009, var='it.edu')
{% endhighlight %}
</div></li>
	<li id="inputs-univar-descriptive"><div><h5>Input parameters</h5><em>univar-descriptive.tpl</em> template has the following options to be (optionally) set while calling <em>rapport</em>:<ul>
	<li><h6>var: <small><em>Variable</em></small></h6>
<div class="options">    <div class="options-desc">A categorical or numerical variable. The template will determine the measurement level of the given variable and will return a detailed frequency table or appropriate descriptive statistics for numerics.
</div>
    <em>Type:</em>	variable
<br>
    <em>Limits:</em>	exactly 1 variable
<br>

</div>
</li>
<br>
</ul></div></li>
	<li id="example-univar-descriptive">
{% highlight text %}


#############################################################################
##	 Running: rapport('univar-descriptive', data=ius2009, var='it.edu')
#############################################################################

 == Variable description  

The dataset has 709 observations with 709 valid values (missing: 0) in "it.edu" ("Internet usage for educational purposes (hours per day)").
This variable seems to be numeric.

 == Base statistics  


    **0**   **0.5**   **1**   **1.5**   **2**   **2.5**   **3**   **3.5**   **4**   **4.5**   **5**   **5.5**   **6**   **6.5**   **7**   **8**   **8.5**   **9**   **10**   **12**  
--- ------- --------- ------- --------- ------- --------- ------- --------- ------- --------- ------- --------- ------- --------- ------- ------- --------- ------- -------- --------
1   61      102       204     27        109     17        66      2         37      2         33      1         13      1         1       25      1         2       2        3       
--- ------- --------- ------- --------- ------- --------- ------- --------- ------- --------- ------- --------- ------- --------- ------- ------- --------- ------- -------- --------


 == Histogram  

/tmp/RtmpV1PMjn/file3c58326e.png

It seems that the highest value is 12 which is exactly Inf times higher than the smalles values (0).

If we suppose that "Internet usage for educational purposes (hours per day) is not near to a normal distribution (test: , skewness: 1.8593, kurtosis: 6.8501), checking the median (1) might be a better option instead of the mean. The interquartile range (2) measures the statistics dispersion of the variable (similar to standard deviation) based on median. 


{% endhighlight %}
</li>
	<li id="export-univar-descriptive"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport('univar-descriptive', data=ius2009, var='it.edu')

{% endhighlight %}
<h6>Popular formats:</h6>
<ul>
	<li><a href="demo/univar-descriptive.html" target="_blank">HTML</a></li>
	<li><a href="demo/univar-descriptive.odt">odt (MS Word compatibile)</a></li>
	<li><a href="demo/univar-descriptive.rtf">rtf (MS Word compatibile)</a></li>
	<li><a href="demo/univar-descriptive.epub">epub</a></li>
	<li><a href="demo/univar-descriptive.tex" target="_blank">latex</a></li>
	<li><a href="demo/univar-descriptive-slidy.html" target="_blank">HTML slidy</a></li>
</ul>
<h6>Other morkdown formats</h6>
<ul>
	<li><a href="demo/univar-descriptive.plain" target="_blank">plain text</a></li>
	<li><a href="demo/univar-descriptive.textile" target="_blank">textile</a></li>
	<li><a href="demo/univar-descriptive.xml" target="_blank">docbook</a></li>
	<li><a href="demo/univar-descriptive.man" target="_blank">man</a></li>
	<li><a href="demo/univar-descriptive.md" target="_blank">markdown</a></li>
	<li><a href="demo/univar-descriptive.mediawiki" target="_blank">mediawiki</a></li>
	<li><a href="demo/univar-descriptive.wiki" target="_blank">wiki</a></li>
	<li><a href="demo/univar-descriptive.org" target="_blank">org</a></li>
	<li><a href="demo/univar-descriptive.pandoc" target="_blank">pandoc</a></li>
</ul>
</div></li>
</ul>

