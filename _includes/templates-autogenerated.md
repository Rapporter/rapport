<ul>
 	<li><a href="#correlations">correlations.tpl</a></li>
 	<li><a href="#crosstable">crosstable.tpl</a></li>
 	<li><a href="#example">example.tpl</a></li>
 	<li><a href="#multivar-descriptive">multivar-descriptive.tpl</a></li>
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

The highest correlation coefficient (0.2364) is between "it.edu" and "age" and the lowest (-0.049) is between "it.leisure" and "age". It seems that the strongest association (r=0.2364) is between "it.edu" and "age".

Higly correlated (r < 0.7 or r > 0.7) variables: -


Uncorrelated (-0.2 < r < 0.2) variables: 
 * "age" - "it.leisure"
 * "it.edu" - "it.leisure"

 === Correlation matrix  



/tmp/RtmpJbaurQ/file5e68b945.png


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
male     0.5360     0.0423           0.0310       
female   0.3695     0.0085           0.0127       
-------- ---------- ---------------- -------------


 === Row percentages  


         **city**   **small town**   **village**  
-------- ---------- ---------------- -------------
male     0.8796     0.0694           0.0509       
female   0.9458     0.0217           0.0325       
-------- ---------- ---------------- -------------


 === Column percentages  


         **city**   **small town**   **village**  
-------- ---------- ---------------- -------------
male     0.5919     0.8333           0.7097       
female   0.4081     0.1667           0.2903       
-------- ---------- ---------------- -------------


 == Chi-squared test  


            **X-squared**   **df**   **p-value**  
----------- --------------- -------- -------------
X-squared   9.72            2.00     0.01         
----------- --------------- -------- -------------


It seems that a real association can be pointed out between *gender* and *dwell* by the *Pearson's Chi-squared test* (χ=9.7188 at the degree of freedom being 2) at the significance level of 0.0078.
Based on Goodman and Kruskal's lambda it seems that *dwell* (λ=0.7581) has an effect on *gender* (λ=0) if we assume both variables to be nominal.
The association between the two variables seems to be weak based on Cramer's V (0.0828).

 === Pearson's residuals  


         **city**   **small town**   **village**  
-------- ---------- ---------------- -------------
male     -2.9409    2.8277           1.1713       
female   2.9409     -2.8277          -1.1713      
-------- ---------- ---------------- -------------


 === Mosaic chart  

/tmp/RtmpJbaurQ/file41963948.png


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

The average fuel consumption is 20.091 with SD of 6.0269.
Let's add one more line to this paragraph.
And another one.
Now, you've probably heard of _pi_? Right? Its value is 3.1416.

 == Graphs  

And some graphs:

/tmp/RtmpJbaurQ/file61bcd58b.png

So far we've been dealing with data.frames and plots, now let's deal with variables

Now we'll see if the Z var is working properly. If I omit it, it should perserve the default value (TRUE)... aaaand.... TRUE.

OK, so far, so good, but let's see what's going on with code chunks...


--------- --------- --------- --------- --------- --------- --------- --------- --------- ---------
-0.9327   -0.6299   -0.7198   0.2461    0.8854    0.9278    0.3995    -0.6785   0.3586    0.4648   
-0.4344   0.3235    -0.2991   -1.3013   3.5300    -2.2368   -0.6928   0.9728    -0.3658   -0.3104  
-0.8237   -0.0634   -0.3551   1.0446    0.1629    -0.6500   -1.0164   -0.5307   0.8883    1.0740   
0.4113    1.0291    -1.5656   -0.8810   -0.4871   1.3193    0.6434    0.8167    1.2250    -1.5493  
-1.2764   0.9608    0.1920    0.5124    1.2932    -0.8268   -0.2864   -0.4511   -0.1187   -0.1182  
1.1988    -0.4228   -2.0625   0.2879    0.9302    -0.0477   -0.4974   0.2758    0.9815    0.0829   
-0.1408   0.5212    -0.7817   0.6188    0.9700    0.0254    0.2904    2.7472    2.3647    -1.4550  
0.8798    -1.0738   -0.1269   0.7253    -0.1543   -1.5186   0.3193    -0.5014   -0.8978   -1.1879  
1.1879    0.9291    0.7278    0.1819    1.1283    -0.7595   -2.4204   1.9083    1.0055    0.2562   
-1.2726   -0.0407   -0.5423   0.2941    0.5185    -0.0944   0.5973    0.2897    -0.6580   0.9900   
--------- --------- --------- --------- --------- --------- --------- --------- --------- ---------


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

/tmp/RtmpJbaurQ/file61095cba.png

So far we've been dealing with data.frames and plots, now let's deal with variables

Now we'll see if the Z var is working properly. If I omit it, it should perserve the default value (TRUE)... aaaand.... TRUE.

OK, so far, so good, but let's see what's going on with code chunks...


--------- --------- --------- --------- --------- --------- --------- --------- --------- ---------
-0.1616   -0.5715   -0.7769   -0.3919   -1.6189   0.5879    -0.5762   0.0227    1.2391    -1.2047  
1.0642    1.7316    -0.3264   1.2424    1.4965    -0.0399   0.5267    1.0825    -1.6104   -1.5610  
-1.3431   -0.4759   -2.7010   1.0296    -0.9483   -0.5998   -0.4425   -1.3447   1.2613    1.7505   
-0.3118   -0.9283   1.5778    -1.0807   2.1936    1.0146    -1.7051   0.8285    0.4286    -0.6632  
0.8108    0.2312    0.9454    -1.4038   0.4596    -0.8734   -0.6411   1.0939    -1.3897   -0.3907  
-0.7725   0.6883    -0.7864   0.6414    0.7516    0.4668    0.5832    -0.3362   1.0392    0.0386   
-0.6062   -0.6419   -1.3357   -1.6324   0.5318    -0.8440   0.9080    -2.1594   0.3726    0.2603   
-1.3172   -0.0378   0.1522    1.2881    1.2180    0.0542    -0.3924   -0.1832   0.3585    -1.1622  
0.7011    -1.3382   -1.3899   -0.0663   -0.8006   0.2098    1.4345    0.0003    2.0289    -0.0981  
-0.6475   -1.2312   1.0109    -1.8725   0.1668    -0.4426   -0.8998   -0.7885   -0.9849   1.3439   
--------- --------- --------- --------- --------- --------- --------- --------- --------- ---------


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

/tmp/RtmpJbaurQ/file1a286603.png

So far we've been dealing with data.frames and plots, now let's deal with variables

Now we'll see if the Z var is working properly. If I omit it, it should perserve the default value (TRUE)... aaaand.... TRUE.

OK, so far, so good, but let's see what's going on with code chunks...


--------- --------- --------- --------- --------- --------- --------- --------- --------- ---------
0.1148    0.8458    -0.5708   -0.6093   -1.5891   -1.2956   1.4488    -0.8059   2.1344    -0.5908  
-1.0334   0.2518    0.1342    1.6441    0.0863    -0.5348   0.1175    0.3165    0.4410    -1.4682  
0.9537    -0.8880   -0.6739   1.1500    -0.7369   0.6251    0.9494    1.5190    1.0293    0.3860   
-0.1916   -0.7882   1.5101    -0.1941   0.9590    0.1699    0.9225    -0.0535   -1.1787   -1.7485  
-1.1163   0.1540    0.7081    -0.5700   -0.0189   1.7136    0.9864    0.5969    -0.8719   0.6612   
0.8153    0.4229    -0.6656   1.4790    -0.5948   -0.2644   -1.4804   -0.1952   -1.5308   0.4985   
0.0309    -1.0495   -0.0202   0.0057    0.6176    0.3065    0.4255    0.1641    1.5820    -0.8120  
-1.2820   -0.0373   -0.1170   0.0817    0.3629    -1.5551   0.7517    -0.2391   0.1615    2.1596   
0.1050    -0.5652   1.9919    -0.6588   -0.2776   0.4269    -0.3043   0.4903    -1.2378   0.0701   
-0.2296   -0.3297   -1.0412   1.7549    -1.2938   -0.2151   -0.3153   0.5222    -0.7847   -0.9733  
--------- --------- --------- --------- --------- --------- --------- --------- --------- ---------


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

<a id="multivar-descriptive"> </a>
#### multivar-descriptive.tpl

 <ul class="tabs">
	<li><a class="active" href="#info-multivar-descriptive">Description</a></li>
	<li><a href="#inputs-multivar-descriptive">Inputs</a></li>
	<li><a href="#example-multivar-descriptive">Example</a></li>
	<li><a href="#export-multivar-descriptive">Export</a></li>
</ul>

 <ul class="tabs-content">
	<li class="active" id="info-multivar-descriptive"><div><h5>Descriptives</h5> by <em>Gergely Daróczi</em>
<br><br>
 This template will return descriptive statistics of numerical, or frequency tables of categorical variables.
<br><br>
<em>Required packages:</em> 
<br>
<em>Example:</em> 
{% highlight text %}
rapport('multivar-descriptive', data=ius2009, vars=c("gender", 'age'))
rapport('multivar-descriptive', data=ius2009, vars=c("chatim", "game", "surf", "email", "download", "forum", "socnet", "xxx", "long.use"))
{% endhighlight %}
</div></li>
	<li id="inputs-multivar-descriptive"><div><h5>Input parameters</h5><em>multivar-descriptive.tpl</em> template has the following options to be (optionally) set while calling <em>rapport</em>:<ul>
	<li><h6>vars: <small><em>Variables</em></small></h6>
<div class="options">    <div class="options-desc">Categorical or numerical variables. The template will determine the measurement level of the given variable and will return detailed frequency tables or appropriate descriptive statistics for numerics.
</div>
    <em>Type:</em>	variable
<br>
    <em>Limits:</em>	from 1, up to 10 variables
<br>

</div>
</li>
<br>
</ul></div></li>
	<li id="example-multivar-descriptive">
{% highlight text %}


##########################################################################################
##	 Running: rapport('multivar-descriptive', data=ius2009, vars=c("gender", 'age'))
##########################################################################################

 == *gender* ("Gender")  

The dataset has 709 observations with 709 valid values (missing: 0) in *gender* ("Gender").
This variable seems to be a factor.

 === Base statistics  


**gender**   **N**     **pct**   **cum.n**   **cum.pct**  
------------ --------- --------- ----------- -------------
male         7344.00   60.93     7344.00     60.93        
female       4709.00   39.07     12053.00    100.00       
------------ --------- --------- ----------- -------------


 === Barplot  

/tmp/RtmpJbaurQ/file1a65c456.png

It seems that the highest value is 2 which is exactly 2 times higher than the smallest value (1).

 == *age* ("Age")  

The dataset has 709 observations with 709 valid values (missing: 0) in *age* ("Age").
This variable seems to be numeric.

 === Base statistics  


**value**   **mean**   **sd**   **var**  
----------- ---------- -------- ---------
(all)       24.56      6.84     46.78    
----------- ---------- -------- ---------


 === Histogram  

/tmp/RtmpJbaurQ/file3db9807d.png

It seems that the highest value is 58 which is exactly 3.625 times higher than the smallest value (16).

The standard deviation is 6.8399 (variance: 46.784). The expected value is around 24.557, somewhere between 24.054 and 25.061 (SE: 0.2569).

If we suppose that *Age* is not near to a normal distribution (test: , skewness: 1.9568, kurtosis: 7.6428), checking the median (23) might be a better option instead of the mean. The interquartile range (6) measures the statistics dispersion of the variable (similar to standard deviation) based on median.




##############################################################################################################################################################
##	 Running: rapport('multivar-descriptive', data=ius2009, vars=c("chatim", "game", "surf", "email", "download", "forum", "socnet", "xxx", "long.use"))
##############################################################################################################################################################

 == *chatim* ("Chat & IM usage")  

The dataset has 709 observations with 709 valid values (missing: 0) in *chatim* ("Chat & IM usage").
This variable seems to be a factor.

 === Base statistics  


**chatim**    **N**     **pct**   **cum.n**   **cum.pct**  
------------- --------- --------- ----------- -------------
never         896.00    9.03      896.00      9.03         
very rarely   1092.00   11.00     1988.00     20.03        
rarely        910.00    9.17      2898.00     29.20        
sometimes     1736.00   17.49     4634.00     46.69        
often         1988.00   20.03     6622.00     66.71        
very often    1316.00   13.26     7938.00     79.97        
always        1988.00   20.03     9926.00     100.00       
------------- --------- --------- ----------- -------------

**Warning** in "if (is.numeric(var)) { ;         rp.desc(NULL, rp.name(var), c('mean', 'sd', 'var'), rp.data) ;     } else { ;         rp.freq(rp.name(var), rp.data) ;     }": "invalid factor level, NAs generated + invalid factor level, NAs generated + invalid factor level, NAs generated"

 === Barplot  

/tmp/RtmpJbaurQ/file44f7759e.png

It seems that the highest value is 7 which is exactly 7 times higher than the smallest value (1).

 == *game* ("On-line games usage")  

The dataset has 709 observations with 709 valid values (missing: 0) in *game* ("On-line games usage").
This variable seems to be a factor.

 === Base statistics  


**game**      **N**     **pct**   **cum.n**   **cum.pct**  
------------- --------- --------- ----------- -------------
never         5152.00   51.90     5152.00     51.90        
very rarely   1848.00   18.62     7000.00     70.52        
rarely        490.00    4.94      7490.00     75.46        
sometimes     910.00    9.17      8400.00     84.63        
often         532.00    5.36      8932.00     89.99        
very often    518.00    5.22      9450.00     95.20        
always        476.00    4.80      9926.00     100.00       
------------- --------- --------- ----------- -------------

**Warning** in "if (is.numeric(var)) { ;         rp.desc(NULL, rp.name(var), c('mean', 'sd', 'var'), rp.data) ;     } else { ;         rp.freq(rp.name(var), rp.data) ;     }": "invalid factor level, NAs generated + invalid factor level, NAs generated + invalid factor level, NAs generated"

 === Barplot  

/tmp/RtmpJbaurQ/file1499300.png

It seems that the highest value is 7 which is exactly 7 times higher than the smallest value (1).

 == *surf* ("Web surfing usage")  

The dataset has 709 observations with 709 valid values (missing: 0) in *surf* ("Web surfing usage").
This variable seems to be a factor.

 === Base statistics  


**surf**      **N**     **pct**   **cum.n**   **cum.pct**  
------------- --------- --------- ----------- -------------
never         238.00    2.40      238.00      2.40         
very rarely   364.00    3.67      602.00      6.06         
rarely        476.00    4.80      1078.00     10.86        
sometimes     1624.00   16.36     2702.00     27.22        
often         2296.00   23.13     4998.00     50.35        
very often    2114.00   21.30     7112.00     71.65        
always        2814.00   28.35     9926.00     100.00       
------------- --------- --------- ----------- -------------

**Warning** in "if (is.numeric(var)) { ;         rp.desc(NULL, rp.name(var), c('mean', 'sd', 'var'), rp.data) ;     } else { ;         rp.freq(rp.name(var), rp.data) ;     }": "invalid factor level, NAs generated + invalid factor level, NAs generated + invalid factor level, NAs generated"

 === Barplot  

/tmp/RtmpJbaurQ/file3fc74fca.png

It seems that the highest value is 7 which is exactly 7 times higher than the smallest value (1).

 == *email* ("Email usage")  

The dataset has 709 observations with 709 valid values (missing: 0) in *email* ("Email usage").
This variable seems to be a factor.

 === Base statistics  


**email**     **N**     **pct**   **cum.n**   **cum.pct**  
------------- --------- --------- ----------- -------------
never         182.00    1.83      182.00      1.83         
very rarely   532.00    5.36      714.00      7.19         
rarely        714.00    7.19      1428.00     14.39        
sometimes     1260.00   12.69     2688.00     27.08        
often         1806.00   18.19     4494.00     45.28        
very often    1624.00   16.36     6118.00     61.64        
always        3808.00   38.36     9926.00     100.00       
------------- --------- --------- ----------- -------------

**Warning** in "if (is.numeric(var)) { ;         rp.desc(NULL, rp.name(var), c('mean', 'sd', 'var'), rp.data) ;     } else { ;         rp.freq(rp.name(var), rp.data) ;     }": "invalid factor level, NAs generated + invalid factor level, NAs generated + invalid factor level, NAs generated"

 === Barplot  

/tmp/RtmpJbaurQ/file6670860f.png

It seems that the highest value is 7 which is exactly 7 times higher than the smallest value (1).

 == *download* ("Download usage")  

The dataset has 709 observations with 709 valid values (missing: 0) in *download* ("Download usage").
This variable seems to be a factor.

 === Base statistics  


**download**   **N**     **pct**   **cum.n**   **cum.pct**  
-------------- --------- --------- ----------- -------------
never          154.00    1.55      154.00      1.55         
very rarely    406.00    4.09      560.00      5.64         
rarely         420.00    4.23      980.00      9.87         
sometimes      1190.00   11.99     2170.00     21.86        
often          1820.00   18.34     3990.00     40.20        
very often     2394.00   24.12     6384.00     64.32        
always         3542.00   35.68     9926.00     100.00       
-------------- --------- --------- ----------- -------------

**Warning** in "if (is.numeric(var)) { ;         rp.desc(NULL, rp.name(var), c('mean', 'sd', 'var'), rp.data) ;     } else { ;         rp.freq(rp.name(var), rp.data) ;     }": "invalid factor level, NAs generated + invalid factor level, NAs generated + invalid factor level, NAs generated"

 === Barplot  

/tmp/RtmpJbaurQ/file657bd4a9.png

It seems that the highest value is 7 which is exactly 7 times higher than the smallest value (1).

 == *forum* ("Web forums usage")  

The dataset has 709 observations with 709 valid values (missing: 0) in *forum* ("Web forums usage").
This variable seems to be a factor.

 === Base statistics  


**forum**     **N**     **pct**   **cum.n**   **cum.pct**  
------------- --------- --------- ----------- -------------
never         1120.00   11.28     1120.00     11.28        
very rarely   1176.00   11.85     2296.00     23.13        
rarely        1036.00   10.44     3332.00     33.57        
sometimes     1736.00   17.49     5068.00     51.06        
often         1568.00   15.80     6636.00     66.85        
very often    1750.00   17.63     8386.00     84.49        
always        1540.00   15.51     9926.00     100.00       
------------- --------- --------- ----------- -------------

**Warning** in "if (is.numeric(var)) { ;         rp.desc(NULL, rp.name(var), c('mean', 'sd', 'var'), rp.data) ;     } else { ;         rp.freq(rp.name(var), rp.data) ;     }": "invalid factor level, NAs generated + invalid factor level, NAs generated + invalid factor level, NAs generated"

 === Barplot  

/tmp/RtmpJbaurQ/file74e090c5.png

It seems that the highest value is 7 which is exactly 7 times higher than the smallest value (1).

 == *socnet* ("Social networks usage")  

The dataset has 709 observations with 709 valid values (missing: 0) in *socnet* ("Social networks usage").
This variable seems to be a factor.

 === Base statistics  


**socnet**    **N**     **pct**   **cum.n**   **cum.pct**  
------------- --------- --------- ----------- -------------
never         2940.00   29.62     2940.00     29.62        
very rarely   1554.00   15.66     4494.00     45.28        
rarely        826.00    8.32      5320.00     53.60        
sometimes     1316.00   13.26     6636.00     66.85        
often         1148.00   11.57     7784.00     78.42        
very often    1190.00   11.99     8974.00     90.41        
always        952.00    9.59      9926.00     100.00       
------------- --------- --------- ----------- -------------

**Warning** in "if (is.numeric(var)) { ;         rp.desc(NULL, rp.name(var), c('mean', 'sd', 'var'), rp.data) ;     } else { ;         rp.freq(rp.name(var), rp.data) ;     }": "invalid factor level, NAs generated + invalid factor level, NAs generated + invalid factor level, NAs generated"

 === Barplot  

/tmp/RtmpJbaurQ/file25106382.png

It seems that the highest value is 7 which is exactly 7 times higher than the smallest value (1).

 == *xxx* ("Adult sites usage")  

The dataset has 709 observations with 709 valid values (missing: 0) in *xxx* ("Adult sites usage").
This variable seems to be a factor.

 === Base statistics  


**xxx**       **N**     **pct**   **cum.n**   **cum.pct**  
------------- --------- --------- ----------- -------------
never         4102.00   41.33     4102.00     41.33        
very rarely   1792.00   18.05     5894.00     59.38        
rarely        770.00    7.76      6664.00     67.14        
sometimes     1918.00   19.32     8582.00     86.46        
often         672.00    6.77      9254.00     93.23        
very often    406.00    4.09      9660.00     97.32        
always        266.00    2.68      9926.00     100.00       
------------- --------- --------- ----------- -------------

**Warning** in "if (is.numeric(var)) { ;         rp.desc(NULL, rp.name(var), c('mean', 'sd', 'var'), rp.data) ;     } else { ;         rp.freq(rp.name(var), rp.data) ;     }": "invalid factor level, NAs generated + invalid factor level, NAs generated + invalid factor level, NAs generated"

 === Barplot  

/tmp/RtmpJbaurQ/file4c8c554b.png

It seems that the highest value is 7 which is exactly 7 times higher than the smallest value (1).

 == *long.use* ("How long you've been on the Internet?")  

The dataset has 709 observations with 709 valid values (missing: 0) in *long.use* ("How long you've been on the Internet?").
This variable seems to be a factor.

 === Base statistics  


**long.use**         **N**     **pct**   **cum.n**   **cum.pct**  
-------------------- --------- --------- ----------- -------------
less than 6 months   294.00    2.96      294.00      2.96         
1 years              728.00    7.33      1022.00     10.30        
2 years              966.00    9.73      1988.00     20.03        
3 years              1092.00   11.00     3080.00     31.03        
4 years              1064.00   10.72     4144.00     41.75        
5 years              1036.00   10.44     5180.00     52.19        
5 years and more     4746.00   47.81     9926.00     100.00       
-------------------- --------- --------- ----------- -------------

**Warning** in "if (is.numeric(var)) { ;         rp.desc(NULL, rp.name(var), c('mean', 'sd', 'var'), rp.data) ;     } else { ;         rp.freq(rp.name(var), rp.data) ;     }": "invalid factor level, NAs generated + invalid factor level, NAs generated + invalid factor level, NAs generated"

 === Barplot  

/tmp/RtmpJbaurQ/file7f33dbd7.png

It seems that the highest value is 7 which is exactly 7 times higher than the smallest value (1).




{% endhighlight %}
</li>
	<li id="export-multivar-descriptive"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport('multivar-descriptive', data=ius2009, vars=c("gender", 'age'))
rapport('multivar-descriptive', data=ius2009, vars=c("chatim", "game", "surf", "email", "download", "forum", "socnet", "xxx", "long.use"))

{% endhighlight %}
<h6>Popular formats:</h6>
<ul>
	<li><a href="demo/multivar-descriptive.html" target="_blank">HTML</a></li>
	<li><a href="demo/multivar-descriptive.odt">odt (MS Word compatibile)</a></li>
	<li><a href="demo/multivar-descriptive.rtf">rtf (MS Word compatibile)</a></li>
	<li><a href="demo/multivar-descriptive.epub">epub</a></li>
	<li><a href="demo/multivar-descriptive.tex" target="_blank">latex</a></li>
	<li><a href="demo/multivar-descriptive-slidy.html" target="_blank">HTML slidy</a></li>
</ul>
<h6>Other morkdown formats</h6>
<ul>
	<li><a href="demo/multivar-descriptive.plain" target="_blank">plain text</a></li>
	<li><a href="demo/multivar-descriptive.textile" target="_blank">textile</a></li>
	<li><a href="demo/multivar-descriptive.xml" target="_blank">docbook</a></li>
	<li><a href="demo/multivar-descriptive.man" target="_blank">man</a></li>
	<li><a href="demo/multivar-descriptive.md" target="_blank">markdown</a></li>
	<li><a href="demo/multivar-descriptive.mediawiki" target="_blank">mediawiki</a></li>
	<li><a href="demo/multivar-descriptive.wiki" target="_blank">wiki</a></li>
	<li><a href="demo/multivar-descriptive.org" target="_blank">org</a></li>
	<li><a href="demo/multivar-descriptive.pandoc" target="_blank">pandoc</a></li>
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

/tmp/RtmpJbaurQ/file1aefbb67.png

 == Lund test  

It seems that 5 extreme values can be found in "Internet usage for educational purposes (hours per day)". These are: 10, 10, 12, 12, 12.

 === Explanation  

The above test for outliers was based on *lm(1 ~ it.edu)*:


              **Estimate**   **Std. Error**   **t value**   **Pr(>|t|)**  
------------- -------------- ---------------- ------------- --------------
(Intercept)   2.06           0.08             26.92         0.00          
------------- -------------- ---------------- ------------- --------------


 === The residuals returned:  

-0.0308,  2.9119, -0.2760, -0.5212, -0.5212, -0.7665, -1.0117, -0.2760, -0.5212,  1.4406, -0.5212,  0.9501,  3.8929, -0.0308, -0.5212, -0.7665, -0.0308,  1.4406, -0.5212,  0.4597,  1.9310, -0.5212,  0.9501, -0.5212,  0.9501, -0.0308,  0.4597, -0.7665,  0.9501, -0.7665, -0.5212, -0.5212, -0.5212,  1.4406,  3.4024, -0.5212, -0.5212, -0.2760, -0.5212, -0.5212, -0.7665, -0.7665,  0.9501,  0.4597, -0.5212,  1.4406,  1.4406, -0.5212, -0.7665,  0.4597, -0.0308,  1.4406, -0.5212,  2.9119,  0.4597, -0.7665,  1.4406,  0.9501,  1.4406, -0.7665, -0.5212, -0.0308, -0.7665, -0.5212,  0.4597, -0.7665,  0.9501, -0.7665, -0.5212, -0.7665, -0.0308, -0.5212,  0.4597,  0.4597, -0.0308, -0.7665, -1.0117, -0.7665, -0.5212, -0.5212, -0.2760, -0.7665, -0.7665,  2.9119, -0.0308,  2.9119,  0.4597, -0.0308, -0.5212, -0.5212, -0.2760, -0.7665,  0.9501, -0.5212, -0.0308, -0.7665,  0.7049, -0.5212, -0.7665, -0.5212,  0.2144, -0.0308, -0.0308, -0.0308, -1.0117, -0.7665, -0.2760,  2.9119, -1.0117,  1.1954,  0.9501,  2.9119, -0.2760, -0.0308,  0.9501, -0.7665, -1.0117, -0.7665, -0.5212,  0.4597, -0.7665, -1.0117,  2.9119, -0.5212, -0.7665, -0.5212, -0.7665, -0.5212, -1.0117, -0.5212,  2.4215, -0.5212, -0.5212,  1.4406,  0.2144,  0.2144,  0.9501,  0.4597,  0.2144, -0.2760,  0.9501,  1.9310, -0.7665,  0.2144, -0.0308, -0.5212, -1.0117, -1.0117, -0.0308, -0.0308, -0.0308, -0.7665, -0.5212, -0.5212, -0.5212, -0.5212, -0.5212, -1.0117, -0.5212,  0.4597, -0.0308, -0.5212,  0.4597, -0.7665,  0.2144,  1.4406,  1.4406, -1.0117,  1.4406,  0.9501, -0.7665, -0.5212, -0.7665, -0.7665, -0.0308, -0.5212,  0.4597, -0.0308, -0.5212, -0.5212, -0.0308, -0.7665, -0.5212,  2.9119, -0.7665, -0.7665, -0.5212, -0.7665, -0.0308, -0.0308, -0.7665, -0.5212, -0.5212, -1.0117, -0.5212, -0.5212,  0.4597, -0.0308,  0.4597, -0.5212, -0.5212, -1.0117, -1.0117, -0.0308, -1.0117, -0.5212, -0.5212,  0.9501, -0.7665,  2.9119, -0.5212, -0.0308, -1.0117,  1.4406,  0.4597, -0.5212, -0.0308, -0.7665, -0.5212, -0.5212, -1.0117, -0.7665, -0.7665, -1.0117, -0.7665, -0.5212,  0.4597, -0.0308, -0.0308, -1.0117, -0.7665, -0.5212, -0.0308, -0.5212, -0.0308, -1.0117,  0.9501,  0.4597, -0.0308, -0.0308,  0.4597, -0.5212, -1.0117,  2.9119, -0.0308, -0.5212,  0.9501, -0.5212, -0.0308,  3.4024,  0.4597, -0.5212, -0.5212, -0.5212, -0.0308, -0.7665, -0.5212, -0.7665, -0.7665, -0.5212, -1.0117, -0.5212,  0.4597, -0.0308, -0.5212, -0.0308, -0.5212, -0.5212,  0.4597, -1.0117, -0.0308, -0.7665,  3.8929,  0.4597, -0.7665,  0.4597, -1.0117, -0.7665, -0.7665, -0.0308, -0.2760, -0.0308, -0.7665, -0.7665, -0.0308,  0.4597, -0.5212, -0.5212, -0.5212, -0.0308, -0.2760, -0.5212, -0.0308,  1.9310,  1.9310,  2.9119, -0.7665,  0.4597,  4.8738, -0.7665,  1.4406,  2.9119, -0.5212,  0.9501, -1.0117, -0.5212,  2.9119, -0.0308,  2.9119, -0.5212,  0.9501,  0.9501,  0.4597, -0.5212, -0.2760, -0.5212, -0.7665, -0.5212, -0.5212, -0.5212, -0.5212,  0.4597, -0.7665,  1.4406, -0.5212, -0.0308, -0.0308, -0.0308, -0.5212, -0.5212, -0.7665,  1.9310, -0.5212, -0.0308, -0.5212, -1.0117, -0.5212,  0.4597, -0.7665, -0.5212,  0.4597, -0.5212,  4.8738, -0.5212, -0.2760, -0.5212,  0.4597, -1.0117, -0.7665, -0.5212,  2.9119,  1.4406, -0.0308, -0.2760,  1.9310,  2.9119, -0.5212,  2.9119,  0.4597, -0.5212,  0.9501,  0.2144, -0.0308, -0.5212, -1.0117, -1.0117,  1.6858,  0.2144, -0.5212, -0.5212, -0.2760, -1.0117, -0.5212, -1.0117, -0.5212, -0.7665, -0.5212,  0.4597, -0.0308, -1.0117, -0.0308,  0.4597,  0.4597,  0.4597, -0.5212, -0.5212,  2.9119, -0.5212, -1.0117,  2.9119, -1.0117, -0.5212,  0.4597, -1.0117,  1.4406, -0.0308,  0.9501, -1.0117,  2.9119, -0.5212, -0.7665,  0.9501, -0.0308, -0.5212,  0.2144, -0.0308, -0.5212, -0.7665,  4.8738,  1.9310,  0.9501, -0.0308,  0.9501,  1.1954,  0.4597, -0.7665, -0.7665, -1.0117,  0.9501,  2.9119,  0.4597,  1.4406,  2.9119, -0.5212,  0.4597,  1.4406, -1.0117, -0.0308,  0.4597, -0.0308,  1.9310, -0.5212, -0.5212,  1.4406, -0.0308, -0.5212, -0.7665, -0.5212, -0.5212,  0.2144, -0.5212, -0.5212, -0.5212, -0.5212, -0.0308, -0.7665, -0.0308,  0.9501, -0.5212,  0.4597, -0.0308, -0.7665, -0.0308, -0.5212, -0.5212, -0.5212, -0.0308, -0.5212, -0.5212, -0.7665, -0.5212, -0.2760, -0.7665, -0.0308, -0.7665, -0.5212,  1.4406, -1.0117,  0.9501, -0.0308, -0.7665, -0.7665, -0.5212, -0.5212, -0.5212, -0.5212, -0.0308, -0.7665, -0.5212, -0.5212, -0.5212, -0.5212,  0.7049, -0.0308, -0.5212,  0.4597, -0.0308, -0.5212, -0.7665, -0.5212, -0.7665, -1.0117, -0.0308, -0.5212, -0.0308,  0.9501, -0.5212, -0.5212, -0.0308, -0.7665, -0.5212,  0.2144, -0.2760, -0.0308, -0.5212, -0.7665, -0.5212, -0.0308, -0.0308, -0.5212, -0.0308, -0.5212,  1.9310, -0.2760,  1.9310, -0.5212, -0.5212, -0.2760, -0.5212, -0.0308,  0.4597, -0.7665, -0.5212,  0.4597,  0.9501, -0.0308,  1.4406, -0.5212,  0.4597,  0.4597, -0.5212, -0.2760,  0.2144,  1.4406, -0.2760,  1.4406, -0.0308,  0.4597,  1.4406, -0.5212, -0.2760, -0.5212, -0.5212, -0.0308, -0.5212, -0.0308, -0.7665, -0.7665, -0.7665, -0.5212, -0.7665, -0.5212, -0.2760, -0.0308,  0.4597,  0.9501, -1.0117, -0.2760,  1.9310,  1.9310, -0.5212, -0.5212,  0.4597, -0.5212,  0.9501, -0.5212, -1.0117, -0.0308,  0.9501, -0.7665, -0.0308,  0.9501, -0.5212, -0.2760,  2.1763, -0.0308,  0.9501,  0.4597,  1.4406,  0.2144, -0.7665, -0.5212, -1.0117, -0.0308,  0.4597, -0.7665, -1.0117, -1.0117, -0.5212, -0.5212, -0.0308, -0.5212, -0.2760, -1.0117, -0.0308,  0.4597, -0.7665, -0.5212, -0.5212, -0.5212, -0.0308, -0.5212, -0.5212,  0.4597, -0.5212, -1.0117, -1.0117,  0.4597, -0.2760, -0.5212,  1.9310, -0.0308, -0.5212, -1.0117, -0.5212, -0.7665, -1.0117,  0.9501,  0.9501,  1.4406, -0.7665, -0.5212, -0.5212, -0.0308,  1.4406, -1.0117,  0.4597, -0.5212,  1.4406,  0.4597, -0.7665, -0.5212, -0.7665, -1.0117, -0.7665, -0.7665, -0.0308, -1.0117,  0.2144,  0.4597,  2.9119,  0.4597, -0.7665, -0.7665, -0.0308,  0.2144, -0.0308,  0.4597, -0.5212,  0.2144,  2.9119, -1.0117, -0.5212, -0.5212,  1.4406, -0.5212, -0.2760, -1.0117, -0.0308, -0.0308, -0.0308,  0.2144, -1.0117,  0.4597, -0.5212, -0.7665, -0.5212, -0.7665, -0.0308, -0.5212,  0.4597, -0.5212, -1.0117, -0.0308, -0.0308, -0.0308, -0.0308,  1.4406,  0.9501, -1.0117, -0.0308,  1.4406, -0.5212, -0.0308,  0.4597, -0.5212,  1.4406,  0.4597, -0.5212,  0.4597, -0.5212, -0.7665, -0.5212, -1.0117, -0.7665, -0.0308, -0.5212, -0.7665, -0.0308, -0.7665, -0.5212, -0.5212, -0.7665,  2.9119,  3.1572, -1.0117, -1.0117, -0.7665, -0.5212

 === References  

 * Lund, R. E. 1975, "Tables for An Approximate Test for Outliers in Linear Models", Technometrics, vol. 17, no. 4, pp. 473-476.
 * Prescott, P. 1975, "An Approximate Test for Outliers in Linear Models", Technometrics, vol. 17, no. 1, pp. 129-132.

 == Grubb's test  

Grubbs test for one outlier shows that highest value 12 is an outlier (p=0.0003).

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
rapport('univar-descriptive', data=ius2009, var='gender')
rapport('univar-descriptive', data=ius2009, var='age')
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
##	 Running: rapport('univar-descriptive', data=ius2009, var='gender')
#############################################################################

 == *gender* ("Gender")  

The dataset has 709 observations with 709 valid values (missing: 0) in *gender* ("Gender").
This variable seems to be a factor.

 === Base statistics  


**gender**   **N**     **pct**   **cum.n**   **cum.pct**  
------------ --------- --------- ----------- -------------
male         7344.00   60.93     7344.00     60.93        
female       4709.00   39.07     12053.00    100.00       
------------ --------- --------- ----------- -------------


 === Barplot  

/tmp/RtmpJbaurQ/file648aada5.png

It seems that the highest value is 2 which is exactly 2 times higher than the smallest value (1).


##########################################################################
##	 Running: rapport('univar-descriptive', data=ius2009, var='age')
##########################################################################

 == *age* ("Age")  

The dataset has 709 observations with 709 valid values (missing: 0) in *age* ("Age").
This variable seems to be numeric.

 === Base statistics  


**value**   **mean**   **sd**   **var**  
----------- ---------- -------- ---------
(all)       24.56      6.84     46.78    
----------- ---------- -------- ---------


 === Histogram  

/tmp/RtmpJbaurQ/file69c4e20a.png

It seems that the highest value is 58 which is exactly 3.625 times higher than the smallest value (16).

The standard deviation is 6.8399 (variance: 46.784). The expected value is around 24.557, somewhere between 24.054 and 25.061 (SE: 0.2569).

If we suppose that *Age* is not near to a normal distribution (test: , skewness: 1.9568, kurtosis: 7.6428), checking the median (23) might be a better option instead of the mean. The interquartile range (6) measures the statistics dispersion of the variable (similar to standard deviation) based on median.


{% endhighlight %}
</li>
	<li id="export-univar-descriptive"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport('univar-descriptive', data=ius2009, var='gender')
rapport('univar-descriptive', data=ius2009, var='age')

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

