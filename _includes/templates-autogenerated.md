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


/tmp/RtmpV1PMjn/file3a680b48.png


{% endhighlight %}
</li>
	<li id="export-correlations"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}


{% highlight text %}
rapport('correlations', data=ius2009, vars=c('age', 'it.edu', 'it.leisure'))
{% endhighlight %}


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

/tmp/RtmpV1PMjn/filed15c41.png


{% endhighlight %}
</li>
	<li id="export-crosstable"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}


{% highlight text %}
rapport('crosstable', data=ius2009, row='gender', col='dwell')
{% endhighlight %}


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

/tmp/RtmpV1PMjn/file56c78f7d.png

So far we've been dealing with data.frames and plots, now let's deal with variables

Now we'll see if the Z var is working properly. If I omit it, it should perserve the default value (TRUE)... aaaand.... TRUE.

OK, so far, so good, but let's see what's going on with code chunks...


---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------
-1.27636   0.96081    0.19199    0.51244    1.29318    -0.82680   -0.28635   -0.45113   -0.11866   -0.11821  
1.19881    -0.42282   -2.06247   0.28793    0.93021    -0.04774   -0.49743   0.27583    0.98154    0.08292   
-0.14084   0.52121    -0.78167   0.61880    0.97000    0.02538    0.29040    2.74724    2.36473    -1.45499  
0.87975    -1.07376   -0.12692   0.72526    -0.15434   -1.51862   0.31935    -0.50143   -0.89776   -1.18791  
1.18793    0.92908    0.72780    0.18187    1.12828    -0.75949   -2.42037   1.90834    1.00548    0.25622   
-1.27256   -0.04073   -0.54227   0.29410    0.51848    -0.09437   0.59731    0.28967    -0.65800   0.99000   
-0.62991   -0.71978   0.24608    0.88538    0.92780    0.39946    -0.67847   0.35863    0.46481    -0.07676  
0.32348    -0.29905   -1.30131   3.52997    -2.23682   -0.69281   0.97283    -0.36578   -0.31037   0.23444   
-0.06335   -0.35513   1.04456    0.16292    -0.65003   -1.01636   -0.53073   0.88828    1.07396    -0.97657  
1.02907    -1.56559   -0.88096   -0.48706   1.31933    0.64340    0.81668    1.22500    -1.54932   1.03326   
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

/tmp/RtmpV1PMjn/file5a66b585.png

So far we've been dealing with data.frames and plots, now let's deal with variables

Now we'll see if the Z var is working properly. If I omit it, it should perserve the default value (TRUE)... aaaand.... TRUE.

OK, so far, so good, but let's see what's going on with code chunks...


---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------
0.81077    0.23123    0.94538    -1.40375   0.45960    -0.87336   -0.64105   1.09390    -1.38965   -0.39066  
-0.77254   0.68833    -0.78643   0.64142    0.75162    0.46680    0.58316    -0.33615   1.03916    0.03863   
-0.60618   -0.64189   -1.33575   -1.63239   0.53177    -0.84403   0.90804    -2.15938   0.37262    0.26030   
-1.31719   -0.03783   0.15223    1.28806    1.21800    0.05418    -0.39239   -0.18316   0.35853    -1.16219  
0.70113    -1.33815   -1.38986   -0.06633   -0.80063   0.20983    1.43452    0.00025    2.02889    -0.09806  
-0.64748   -1.23123   1.01092    -1.87250   0.16680    -0.44258   -0.89983   -0.78854   -0.98486   1.34389   
-0.57151   -0.77686   -0.39192   -1.61887   0.58786    -0.57619   0.02274    1.23910    -1.20468   -1.40794  
1.73160    -0.32638   1.24241    1.49652    -0.03991   0.52671    1.08254    -1.61040   -1.56102   1.20094   
-0.47591   -2.70098   1.02962    -0.94826   -0.59977   -0.44253   -1.34469   1.26127    1.75049    -0.29679  
-0.92829   1.57782    -1.08072   2.19359    1.01465    -1.70510   0.82853    0.42864    -0.66320   1.08963   
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

/tmp/RtmpV1PMjn/file3a5ef46c.png

So far we've been dealing with data.frames and plots, now let's deal with variables

Now we'll see if the Z var is working properly. If I omit it, it should perserve the default value (TRUE)... aaaand.... TRUE.

OK, so far, so good, but let's see what's going on with code chunks...


---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------
-1.11625   0.15397    0.70807    -0.56996   -0.01887   1.71365    0.98635    0.59693    -0.87190   0.66118   
0.81533    0.42288    -0.66562   1.47900    -0.59480   -0.26437   -1.48043   -0.19521   -1.53085   0.49847   
0.03088    -1.04953   -0.02020   0.00573    0.61759    0.30647    0.42549    0.16405    1.58203    -0.81203  
-1.28201   -0.03730   -0.11698   0.08172    0.36286    -1.55510   0.75167    -0.23912   0.16146    2.15956   
0.10498    -0.56516   1.99188    -0.65875   -0.27765   0.42691    -0.30430   0.49028    -1.23781   0.07006   
-0.22958   -0.32969   -1.04122   1.75488    -1.29384   -0.21514   -0.31531   0.52219    -0.78471   -0.97331  
0.84577    -0.57077   -0.60929   -1.58908   -1.29564   1.44880    -0.80586   2.13437    -0.59078   0.88979   
0.25180    0.13418    1.64411    0.08629    -0.53475   0.11754    0.31651    0.44102    -1.46816   -0.07527  
-0.88805   -0.67393   1.14999    -0.73687   0.62511    0.94937    1.51905    1.02928    0.38598    -1.29219  
-0.78823   1.51008    -0.19413   0.95899    0.16995    0.92247    -0.05349   -1.17871   -1.74851   -0.53615  
---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------


When it comes to CSV values, let us see how do they work. You have chosen the "foo".


{% endhighlight %}
</li>
	<li id="export-example"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}


{% highlight text %}
rapport("example", mtcars, x = "mpg", y = "hp")
rapport("example", mtcars, x = "hp", y = "wt")
rapport("example", ius2009, x = "it.edu", y = "it.leisure")
{% endhighlight %}


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

/tmp/RtmpV1PMjn/file10c45998.png

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


{% highlight text %}
rapport('outlier-test', data=ius2009, var='it.edu')
{% endhighlight %}


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

/tmp/RtmpV1PMjn/file8c563e1.png

It seems that the highest value is 12 which is exactly Inf times higher than the smalles values (0).

If we suppose that "Internet usage for educational purposes (hours per day) is not near to a normal distribution (test: , skewness: 1.8593, kurtosis: 6.8501), checking the median (1) might be a better option instead of the mean. The interquartile range (2) measures the statistics dispersion of the variable (similar to standard deviation) based on median. 


{% endhighlight %}
</li>
	<li id="export-univar-descriptive"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}


{% highlight text %}
rapport('univar-descriptive', data=ius2009, var='it.edu')
{% endhighlight %}


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

