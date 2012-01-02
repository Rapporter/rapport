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
	<li class="active" id="info-correlations"><div><h5>Correlations</h5> by <em>daroczig</em>
<br><br>
 This template will return the correlation matrix of supplied numerical variables.
<br><br>
<em>Required packages:</em> ascii
<br>
<em>Example:</em> </div></li>
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
	<li id="example-correlations">No examples provided with template, sorry.</li>
	<li id="export-correlations">No examples provided with template, sorry.</li>
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
<em>Example:</em> rapport('crosstable', data=ius2009, row='gender', col='dwell')</div></li>
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

/tmp/RtmpCAfBcV/file3f334dd7.png

{% endhighlight %}
</li>
	<li id="export-crosstable"><div><h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have the following types for demonstartion purposes:<ul>
	<li><a href="demo/crosstable.html" target="_blank">HTML</a></li>
	<li><a href="demo/crosstable.odt">odt (MS Word compatibile)</a></li>
</ul></div></li>
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
<em>Example:</em> rapport("example", mtcars, x = "mpg", y = "hp")</div></li>
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


 == Descriptive statistics  

The average fuel consumption is 20.091 with SD of 6.027.
Let's add one more line to this paragraph.
And another one.
Now, you've probably heard of _pi_? Right? Its value is 3.1416.

 == Graphs  

And some graphs:

/tmp/RtmpCAfBcV/file6d824270.png

So far we've been dealing with data.frames and plots, now let's deal with variables

Now we'll see if the Z var is working properly. If I omit it, it should perserve the default value (TRUE)... aaaand.... TRUE.

OK, so far, so good, but let's see what's going on with code chunks...


---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------
0.21696    0.50174    0.22349    -2.49296   0.83943    0.92650    0.12971    0.28960    2.49944    0.70745   
-0.00474   -0.44688   0.63431    0.16124    0.13629    -1.68244   -0.77522   0.04510    -2.16911   -1.36643  
-0.60781   -0.49399   -0.76930   1.15453    -0.25689   1.10013    -2.02654   -0.19706   0.20225    -1.49571  
0.15967    -0.13376   -0.01630   -0.66398   -1.34999   0.27609    -1.59700   -0.92464   1.22796    0.86069   
0.85585    1.98238    0.86331    -0.58917   -2.07967   0.35422    -0.23036   0.56239    -0.44610   0.41423   
0.44926    -3.02493   0.16428    -0.64600   1.01250    -1.25318   0.00740    0.06426    0.30169    0.05773   
0.48462    1.18370    -1.12861   0.76260    -0.20068   0.82466    2.01900    -1.11847   0.29299    -0.80400  
0.38761    -1.37269   -0.73651   -0.51947   -0.52728   -0.84735   0.85965    1.28130    -0.96874   -1.48523  
-0.52076   0.16741    1.61759    -0.43654   -0.85698   -1.26634   0.09499    1.23600    0.04324    0.58843   
-1.93349   0.78008    0.56110    0.83768    -0.67731   1.07995    -0.39401   -0.79811   -1.18033   0.62871   
---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------


When it comes to CSV values, let us see how do they work. You have chosen the "foo".

{% endhighlight %}
</li>
	<li id="export-example"><div><h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have the following types for demonstartion purposes:<ul>
	<li><a href="demo/example.html" target="_blank">HTML</a></li>
	<li><a href="demo/example.odt">odt (MS Word compatibile)</a></li>
</ul></div></li>
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
<em>Example:</em> rapport('outlier-test', data=ius2009, var='it.edu')</div></li>
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


 == Boxplot  

/tmp/RtmpCAfBcV/file1bb2817b.png

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
	<li id="export-outlier-test"><div><h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have the following types for demonstartion purposes:<ul>
	<li><a href="demo/outlier-test.html" target="_blank">HTML</a></li>
	<li><a href="demo/outlier-test.odt">odt (MS Word compatibile)</a></li>
</ul></div></li>
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
<em>Example:</em> rapport('univar-descriptive', data=ius2009, var='it.edu')</div></li>
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


 == Variable description  

The dataset has 709 observations with 709 valid values (missing: 0) in "it.edu" ("Internet usage for educational purposes (hours per day)").
This variable seems to be numeric.

 == Base statistics  


    **0**   **0.5**   **1**   **1.5**   **2**   **2.5**   **3**   **3.5**   **4**   **4.5**   **5**   **5.5**   **6**   **6.5**   **7**   **8**   **8.5**   **9**   **10**   **12**  
--- ------- --------- ------- --------- ------- --------- ------- --------- ------- --------- ------- --------- ------- --------- ------- ------- --------- ------- -------- --------
1   61      102       204     27        109     17        66      2         37      2         33      1         13      1         1       25      1         2       2        3       
--- ------- --------- ------- --------- ------- --------- ------- --------- ------- --------- ------- --------- ------- --------- ------- ------- --------- ------- -------- --------


 == Histogram  

/tmp/RtmpCAfBcV/file1f44ac69.png

It seems that the highest value is 12 which is exactly Inf times higher than the smalles values (0).

If we suppose that "Internet usage for educational purposes (hours per day) is not near to a normal distribution (test: , skewness: 1.8593, kurtosis: 6.8501), checking the median (1) might be a better option instead of the mean. The interquartile range (2) measures the statistics dispersion of the variable (similar to standard deviation) based on median. 

{% endhighlight %}
</li>
	<li id="export-univar-descriptive"><div><h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have the following types for demonstartion purposes:<ul>
	<li><a href="demo/univar-descriptive.html" target="_blank">HTML</a></li>
	<li><a href="demo/univar-descriptive.odt">odt (MS Word compatibile)</a></li>
</ul></div></li>
</ul>

