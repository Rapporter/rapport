<ul>
 	<li><a href="#anova">anova.tpl</a></li>
 	<li><a href="#correlations">correlations.tpl</a></li>
 	<li><a href="#crosstable">crosstable.tpl</a></li>
 	<li><a href="#example">example.tpl</a></li>
 	<li><a href="#multivar-descriptive">multivar-descriptive.tpl</a></li>
 	<li><a href="#outlier-test">outlier-test.tpl</a></li>
 	<li><a href="#type_demo">type_demo.tpl</a></li>
 	<li><a href="#univar-descriptive">univar-descriptive.tpl</a></li>
 </ul>

Please find below a detailed description about each with sample outputs of those in R console, HTML, odt and pdf too.

<a id="anova"> </a>
#### anova.tpl

 <ul class="tabs">
	<li><a class="active" href="#info-anova">Description</a></li>
	<li><a href="#inputs-anova">Inputs</a></li>
	<li><a href="#example-anova">Example</a></li>
	<li><a href="#export-anova">Export</a></li>
</ul>

 <ul class="tabs-content">
	<li class="active" id="info-anova"><div><h5>ANOVA Template</h5> by <em>Aleksandar Blagotić</em>
<br><br>
 An ANOVA report with table of descriptives, diagnostic tests and ANOVA-specific statistics.
<br><br>
<em>Required packages:</em> nortest
<br>
<em>Example:</em> 
{% highlight text %}
rapport("anova", ius2008, resp = "leisure", fac = c("gender", "student"))
{% endhighlight %}
</div></li>
	<li id="inputs-anova"><div><h5>Input parameters</h5><em>anova.tpl</em> template has the following options to be (optionally) set while calling <em>rapport</em>:<ul>
	<li><h6>resp: <small><em>Response variable</em></small></h6>
<div class="options">    <div class="options-desc">Dependent (response) variable
</div>
    <em>Type:</em>	numeric
<br>
    <em>Limits:</em>	exactly 1 variable
<br>

</div>
</li>
<br>
<li><h6>fac: <small><em>Factor variables</em></small></h6>
<div class="options">    <div class="options-desc">Independent variables (factors)
</div>
    <em>Type:</em>	factor
<br>
    <em>Limits:</em>	from 1, up to 2 variables
<br>

</div>
</li>
<br>
</ul></div></li>
	<li id="example-anova">
{% highlight text %}


#############################################################################################
##	 Running: rapport("anova", ius2008, resp = "leisure", fac = c("gender", "student"))
#############################################################################################

<ERROR>

 == Brief info  

Two-Way ANOVA was carried out, with _Gender_ and _Student_ as independent variables, and _Internet usage in leisure time (hours per day)_ as a response variable.

 == Descriptives  

The following table displays the descriptive statistics of ANOVA model. You can see the factors on the left-hand side of the table, and summary statistics on the right hand side.


**gender**   **student**   **min(resp)**   **max(resp)**   **mean(resp)**   **SD(resp)**   **median(resp)**   **M.A.D.(resp)**   **skewness(resp)**   **kurtosis(resp)**   **min(Total)**   **max(Total)**   **mean(Total)**   **SD(Total)**   **median(Total)**   **M.A.D.(Total)**   **skewness(Total)**   **kurtosis(Total)**  
------------ ------------- --------------- --------------- ---------------- -------------- ------------------ ------------------ -------------------- -------------------- ---------------- ---------------- ----------------- --------------- ------------------- ------------------- --------------------- ---------------------
male         no            0.00            10.00           3.47             2.05           3.00               1.48               0.66                 2.81                 0.00             10.00            3.47              2.05            3.00                1.48                0.66                  2.81                 
male         yes           0.00            12.00           3.17             1.94           3.00               1.48               1.37                 5.88                 0.00             12.00            3.17              1.94            3.00                1.48                1.37                  5.88                 
male         Total         0.00            12.00           3.32             2.00           3.00               1.48               0.99                 4.07                 0.00             12.00            3.32              2.00            3.00                1.48                0.99                  4.07                 
female       no            0.00            10.00           3.15             2.18           3.00               1.48               1.29                 4.59                 0.00             10.00            3.15              2.18            3.00                1.48                1.29                  4.59                 
female       yes           0.00            12.00           3.01             2.43           2.00               1.48               1.44                 5.00                 0.00             12.00            3.01              2.43            2.00                1.48                1.44                  5.00                 
female       Total         0.00            12.00           3.06             2.34           2.00               1.48               1.39                 4.90                 0.00             12.00            3.06              2.34            2.00                1.48                1.39                  4.90                 
Total        Total         0.00            12.00           3.22             2.14           3.00               1.48               1.17                 4.51                 0.00             12.00            3.22              2.14            3.00                1.48                1.17                  4.51                 
------------ ------------- --------------- --------------- ---------------- -------------- ------------------ ------------------ -------------------- -------------------- ---------------- ---------------- ----------------- --------------- ------------------- ------------------- --------------------- ---------------------

**Warning** in "rp.desc(fac, resp, c(min, max, mean, SD = sd, median, `M.A.D.` = mad, skewness, kurtosis), margins = TRUE)": "duplicated levels will not be allowed in factors anymore"

 == Diagnostics  

Before we carry out ANOVA, we'd like to check some basic assumptions. For those purposes, normality and homoscedascity tests are carried out alongside several graphs that may help you with your decision on model's goodness-of-fit.

 === Diagnostic tests  

 ==== Normality tests  

We will use _Shapiro-Wilk_, _Lilliefors_ and _Anderson-Darling_ tests to screen departures from normalitty.


-------- --------
0.9385   0.0000  
0.1681   0.0000  
4.4600   0.0000  
0.8802   0.0000  
0.1721   0.0000  
3.4441   0.0000  
0.8872   0.0000  
0.1752   0.0000  
6.1519   0.0000  
0.8533   0.0000  
0.1819   0.0000  
7.3685   0.0000  
-------- --------


 ==== Homoscedascity tests  

In order to test homoscedascity, _Bartlett_ and _Fligner-Kileen_ are applied.


    **B**   **F**  
--- ------- -------
D   10.72   3.40   
p   0.01    0.33   
--- ------- -------


 === Diagnostic plots  

Here you can see several diagnostic plots for ANOVA model.

<ERROR>

 == ANOVA table  

<ERROR>

 == Off-topic stuff  

input name: resp
variable name: _leisure_
variable label: _Internet usage in leisure time (hours per day)_
input label: _Response variable_
input description: _Dependent (response) variable_

input name: fac
variable name: _gender_ and _student_
variable label: _Gender_ and _Student_
input label: _Factor variables_
input description: _Independent variables (factors)_


{% endhighlight %}
</li>
	<li id="export-anova"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport("anova", ius2008, resp = "leisure", fac = c("gender", "student"))

{% endhighlight %}
<h6>Popular formats:</h6>
<ul>
	<li><a href="demo/anova.html" target="_blank">HTML</a></li>
	<li><a href="demo/anova.odt">odt (MS Word compatibile)</a></li>
	<li><a href="demo/anova.rtf">rtf (MS Word compatibile)</a></li>
	<li><a href="demo/anova.epub">epub</a></li>
	<li><a href="demo/anova.tex" target="_blank">latex</a></li>
	<li><a href="demo/anova-slidy.html" target="_blank">HTML slidy</a></li>
</ul>
<h6>Other morkdown formats</h6>
<ul>
	<li><a href="demo/anova.plain" target="_blank">plain text</a></li>
	<li><a href="demo/anova.textile" target="_blank">textile</a></li>
	<li><a href="demo/anova.xml" target="_blank">docbook</a></li>
	<li><a href="demo/anova.man" target="_blank">man</a></li>
	<li><a href="demo/anova.md" target="_blank">markdown</a></li>
	<li><a href="demo/anova.mediawiki" target="_blank">mediawiki</a></li>
	<li><a href="demo/anova.wiki" target="_blank">wiki</a></li>
	<li><a href="demo/anova.org" target="_blank">org</a></li>
	<li><a href="demo/anova.pandoc" target="_blank">pandoc</a></li>
</ul>
</div></li>
</ul>

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
rapport('correlations', data=ius2008, vars=c('age', 'edu', 'leisure'))
rapport('correlations', data=mtcars, vars=c('mpg', 'cyl', 'disp', 'hp', 'drat', 'wt', 'qsec', 'vs', 'am', 'gear', 'carb'))
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


##########################################################################################
##	 Running: rapport('correlations', data=ius2008, vars=c('age', 'edu', 'leisure'))
##########################################################################################

 == Variable description  

3 variables provided.

The highest correlation coefficient (0.2364) is between _edu_ and _age_ and the lowest (-0.049) is between _leisure_ and _age_. It seems that the strongest association (r=0.2364) is between _edu_ and _age_.

Higly correlated (r < 0.7 or r > 0.7) variables: -


Uncorrelated (-0.2 < r < 0.2) variables: 

 * _age_ and _leisure_
 * _edu_ and _leisure_

 === Correlation matrix  


          **age**          **edu**          **leisure**     
--------- ---------------  ---------------  --------------- 
age                        0.2364 \*\*\* -0.0490         
edu       0.2364 \*\*\*                  0.1714 \*\*\*
leisure   -0.0490          0.1714 \*\*\*                 
--------- ---------------  ---------------  --------------- 


/tmp/Rtmp3FBhc9/file1b42485b.png


##############################################################################################################################################
##	 Running: rapport('correlations', data=mtcars, vars=c('mpg', 'cyl', 'disp', 'hp', 'drat', 'wt', 'qsec', 'vs', 'am', 'gear', 'carb'))
##############################################################################################################################################

 == Variable description  

11 variables provided.

The highest correlation coefficient (0.902) is between _disp_ and _cyl_ and the lowest (-0.8677) is between _wt_ and _mpg_. It seems that the strongest association (r=0.902) is between _disp_ and _cyl_.

Higly correlated (r < 0.7 or r > 0.7) variables: 

 * _mpg_ and _cyl_
 * _mpg_ and _disp_
 * _cyl_ and _disp_
 * _mpg_ and _hp_
 * _cyl_ and _hp_
 * _disp_ and _hp_
 * _disp_ and _drat_
 * _mpg_ and _wt_
 * _cyl_ and _wt_
 * _disp_ and _wt_
 * _drat_ and _wt_
 * _hp_ and _qsec_
 * _cyl_ and _vs_
 * _disp_ and _vs_
 * _hp_ and _vs_
 * _qsec_ and _vs_
 * _drat_ and _am_
 * _am_ and _gear_
 * _hp_ and _carb_

Uncorrelated (-0.2 < r < 0.2) variables: 

 * _drat_ and _qsec_
 * _wt_ and _qsec_
 * _vs_ and _am_
 * _hp_ and _gear_
 * _drat_ and _carb_
 * _am_ and _carb_

 === Correlation matrix  


       **mpg**           **cyl**           **disp**          **hp**            **drat**          **wt**            **qsec**          **vs**            **am**            **gear**          **carb**         
------ ----------------  ----------------  ----------------  ----------------  ----------------  ----------------  ----------------  ----------------  ----------------  ----------------  ---------------- 
mpg                      -0.8522 \*\*\* -0.8476 \*\*\* -0.7762 \*\*\* 0.6812 \*\*\*  -0.8677 \*\*\* 0.4187 \*        0.6640 \*\*\*  0.5998 \*\*\*  0.4803 \*\*     -0.5509 \*\*   
cyl    -0.8522 \*\*\*                   0.9020 \*\*\*  0.8324 \*\*\*  -0.6999 \*\*\* 0.7825 \*\*\*  -0.5912 \*\*\* -0.8108 \*\*\* -0.5226 \*\*    -0.4927 \*\*    0.5270 \*\*    
disp   -0.8476 \*\*\* 0.9020 \*\*\*                    0.7909 \*\*\*  -0.7102 \*\*\* 0.8880 \*\*\*  -0.4337 \*       -0.7104 \*\*\* -0.5912 \*\*\* -0.5556 \*\*\* 0.3950 \*       
hp     -0.7762 \*\*\* 0.8324 \*\*\*  0.7909 \*\*\*                    -0.4488 \*\*    0.6587 \*\*\*  -0.7082 \*\*\* -0.7231 \*\*\* -0.2432           -0.1257           0.7498 \*\*\* 
drat   0.6812 \*\*\*  -0.6999 \*\*\* -0.7102 \*\*\* -0.4488 \*\*                      -0.7124 \*\*\* 0.0912            0.4403 \*        0.7127 \*\*\*  0.6996 \*\*\*  -0.0908          
wt     -0.8677 \*\*\* 0.7825 \*\*\*  0.8880 \*\*\*  0.6587 \*\*\*  -0.7124 \*\*\*                   -0.1747           -0.5549 \*\*\* -0.6925 \*\*\* -0.5833 \*\*\* 0.4276 \*       
qsec   0.4187 \*        -0.5912 \*\*\* -0.4337 \*       -0.7082 \*\*\* 0.0912            -0.1747                             0.7445 \*\*\*  -0.2299           -0.2127           -0.6562 \*\*\*
vs     0.6640 \*\*\*  -0.8108 \*\*\* -0.7104 \*\*\* -0.7231 \*\*\* 0.4403 \*        -0.5549 \*\*\* 0.7445 \*\*\*                    0.1683            0.2060            -0.5696 \*\*\*
am     0.5998 \*\*\*  -0.5226 \*\*    -0.5912 \*\*\* -0.2432           0.7127 \*\*\*  -0.6925 \*\*\* -0.2299           0.1683                              0.7941 \*\*\*  0.0575           
gear   0.4803 \*\*     -0.4927 \*\*    -0.5556 \*\*\* -0.1257           0.6996 \*\*\*  -0.5833 \*\*\* -0.2127           0.2060            0.7941 \*\*\*                    0.2741           
carb   -0.5509 \*\*    0.5270 \*\*     0.3950 \*        0.7498 \*\*\*  -0.0908           0.4276 \*        -0.6562 \*\*\* -0.5696 \*\*\* 0.0575            0.2741                             
------ ----------------  ----------------  ----------------  ----------------  ----------------  ----------------  ----------------  ----------------  ----------------  ----------------  ---------------- 


/tmp/Rtmp3FBhc9/file1a0c4682.png


{% endhighlight %}
</li>
	<li id="export-correlations"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport('correlations', data=ius2008, vars=c('age', 'edu', 'leisure'))
rapport('correlations', data=mtcars, vars=c('mpg', 'cyl', 'disp', 'hp', 'drat', 'wt', 'qsec', 'vs', 'am', 'gear', 'carb'))

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
rapport('crosstable', data=ius2008, row='gender', col='dwell')
rapport('crosstable', data=ius2008, row='email', col='dwell')
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
##	 Running: rapport('crosstable', data=ius2008, row='gender', col='dwell')
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

/tmp/Rtmp3FBhc9/file2f5ddc53.png


#################################################################################
##	 Running: rapport('crosstable', data=ius2008, row='email', col='dwell')
#################################################################################

 == Variable description  

Two variables specified:

 * "email" ("Email usage") with 709 and
 * "dwell" ("Dwelling") with 709 valid values.

 == Counts  


              **city**   **small town**   **village**  
------------- ---------- ---------------- -------------
never         12         0                1            
very rarely   34         1                3            
rarely        46         3                2            
sometimes     76         6                8            
often         113        11               5            
very often    106        5                5            
always        255        10               7            
------------- ---------- ---------------- -------------


 == Percentages  


              **city**   **small town**   **village**  
------------- ---------- ---------------- -------------
never         0.0169     0.0000           0.0014       
very rarely   0.0480     0.0014           0.0042       
rarely        0.0649     0.0042           0.0028       
sometimes     0.1072     0.0085           0.0113       
often         0.1594     0.0155           0.0071       
very often    0.1495     0.0071           0.0071       
always        0.3597     0.0141           0.0099       
------------- ---------- ---------------- -------------


 === Row percentages  


              **city**   **small town**   **village**  
------------- ---------- ---------------- -------------
never         0.9231     0.0000           0.0769       
very rarely   0.8947     0.0263           0.0789       
rarely        0.9020     0.0588           0.0392       
sometimes     0.8444     0.0667           0.0889       
often         0.8760     0.0853           0.0388       
very often    0.9138     0.0431           0.0431       
always        0.9375     0.0368           0.0257       
------------- ---------- ---------------- -------------


 === Column percentages  


              **city**   **small town**   **village**  
------------- ---------- ---------------- -------------
never         0.0187     0.0000           0.0323       
very rarely   0.0530     0.0278           0.0968       
rarely        0.0717     0.0833           0.0645       
sometimes     0.1184     0.1667           0.2581       
often         0.1760     0.3056           0.1613       
very often    0.1651     0.1389           0.1613       
always        0.3972     0.2778           0.2258       
------------- ---------- ---------------- -------------


 == Chi-squared test  


            **X-squared**   **df**   **p-value**  
----------- --------------- -------- -------------
X-squared   14.37           12.00    0.28         
----------- --------------- -------- -------------


It seems that no real association can be pointed out between *email* and *dwell* by the *Pearson's Chi-squared test* (χ=14.366 at the degree of freedom being 12) at the significance level of 0.2779.
For this end no other statistical tests were performed.

 === Pearson's residuals  


              **city**   **small town**   **village**  
------------- ---------- ---------------- -------------
never         0.2187     -0.8417          0.5908       
very rarely   -0.2332    -0.7060          1.0915       
rarely        -0.0897    0.2717           -0.1634      
sometimes     -2.1192    0.7349           2.2426       
often         -1.2678    1.9731           -0.3048      
very often    0.3338     -0.4116          -0.0357      
always        2.2980     -1.3407          -1.8480      
------------- ---------- ---------------- -------------


 === Mosaic chart  

/tmp/Rtmp3FBhc9/file6e2a981e.png


{% endhighlight %}
</li>
	<li id="export-crosstable"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport('crosstable', data=ius2008, row='gender', col='dwell')
rapport('crosstable', data=ius2008, row='email', col='dwell')

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
	<li class="active" id="info-example"><div><h5>Example template</h5> by <em>Gergely Daróczi</em>
<br><br>
 This template demonstrates the basic features of rapport. We all hope you will like it!
<br><br>
<em>Required packages:</em> lattice
<br>
<em>Example:</em> 
{% highlight text %}
rapport("example", ius2008, var='leisure')
rapport("example", ius2008, var='leisure', desc=FALSE)
rapport("example", ius2008, var='leisure', desc=FALSE, hist=T)
rapport("example", ius2008, var='leisure', desc=FALSE, hist=T, theme='Set2')
{% endhighlight %}
</div></li>
	<li id="inputs-example"><div><h5>Input parameters</h5><em>example.tpl</em> template has the following options to be (optionally) set while calling <em>rapport</em>:<ul>
	<li><h6>var: <small><em>Variable</em></small></h6>
<div class="options">    <div class="options-desc">A numeric variable.
</div>
    <em>Type:</em>	numeric
<br>
    <em>Limits:</em>	exactly 1 variable
<br>

</div>
</li>
<br>
<li><h6>desc: <small><em>Boolean</em></small></h6>
<div class="options">    <div class="options-desc">Show descriptive statistics of specified variable?
</div>
    <em>Type:</em>	boolean
<br>
    <em>Limits:</em>	exactly 1 variable
<br>
    <em>Default value:</em>	TRUE
</div>
</li>
<br>
<li><h6>hist: <small><em>Boolean</em></small></h6>
<div class="options">    <div class="options-desc">Show histogram of specified variable?
</div>
    <em>Type:</em>	boolean
<br>
    <em>Limits:</em>	exactly 1 variable
<br>
    <em>Default value:</em>	FALSE
</div>
</li>
<br>
<li><h6>theme: <small><em>Color theme</em></small></h6>
<div class="options">    <div class="options-desc">Color theme of the diagram
</div>
    <em>Type:</em>	option
<br>
    <em>Limits:</em>	exactly 1 variable
<br>
    <em>Default value:</em>	Set1, Set2, Set3
</div>
</li>
<br>
</ul></div></li>
	<li id="example-example">
{% highlight text %}


##############################################################
##	 Running: rapport("example", ius2008, var='leisure')
##############################################################

 == Début  

Hello, world!

I have just specified a *Variable* in this template named to **leisure**. The label of this variable is "Internet usage in leisure time (hours per day)".

And wow, the mean of *leisure* is 3.2221!

 === Descriptive statistics  


    **Min.**   **1st Qu.**   **Median**   **Mean**   **3rd Qu.**   **Max.**  
--- ---------- ------------- ------------ ---------- ------------- ----------
1   0.00       2.00          3.00         3.22       4.00          12.00     
--- ---------- ------------- ------------ ---------- ------------- ----------


The 5 highest values are: _12_, _12_, _10_, _10_ and _10_.


##########################################################################
##	 Running: rapport("example", ius2008, var='leisure', desc=FALSE)
##########################################################################

 == Début  

Hello, world!

I have just specified a *Variable* in this template named to **leisure**. The label of this variable is "Internet usage in leisure time (hours per day)".

And wow, the mean of *leisure* is 3.2221!

**For more detailed statistics, you should have set `desc=TRUE`!**


##################################################################################
##	 Running: rapport("example", ius2008, var='leisure', desc=FALSE, hist=T)
##################################################################################

 == Début  

Hello, world!

I have just specified a *Variable* in this template named to **leisure**. The label of this variable is "Internet usage in leisure time (hours per day)".

And wow, the mean of *leisure* is 3.2221!

**For more detailed statistics, you should have set `desc=TRUE`!**

 === Histogram  

/tmp/Rtmp3FBhc9/file4100cc1a.png


################################################################################################
##	 Running: rapport("example", ius2008, var='leisure', desc=FALSE, hist=T, theme='Set2')
################################################################################################

 == Début  

Hello, world!

I have just specified a *Variable* in this template named to **leisure**. The label of this variable is "Internet usage in leisure time (hours per day)".

And wow, the mean of *leisure* is 3.2221!

**For more detailed statistics, you should have set `desc=TRUE`!**

 === Histogram  

/tmp/Rtmp3FBhc9/file10053e6a.png


{% endhighlight %}
</li>
	<li id="export-example"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport("example", ius2008, var='leisure')
rapport("example", ius2008, var='leisure', desc=FALSE)
rapport("example", ius2008, var='leisure', desc=FALSE, hist=T)
rapport("example", ius2008, var='leisure', desc=FALSE, hist=T, theme='Set2')

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
rapport('multivar-descriptive', data=ius2008, vars=c("gender", 'age'))
rapport('multivar-descriptive', data=ius2008, vars=c("chatim", "game", "surf", "email", "download", "forum", "socnet", "xxx"))
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
##	 Running: rapport('multivar-descriptive', data=ius2008, vars=c("gender", 'age'))
##########################################################################################

 == *gender* ("Gender")  

The dataset has 709 observations with 709 valid values (missing: 0) in *gender* ("Gender").
This variable seems to be a factor.

 === Base statistics  


        **gender**   **N**    **pct**   **cumul.count**   **cumul.pct**  
------- ------------ -------- --------- ----------------- ---------------
1       male         432.00   60.93     432.00            60.93          
2       female       277.00   39.07     709.00            100.00         
Total                709.00   100.00    709.00            100.00         
------- ------------ -------- --------- ----------------- ---------------


 === Barplot  

/tmp/Rtmp3FBhc9/file67b7ff12.png

It seems that the highest value is 2 which is exactly 2 times higher than the smallest value (1).

 == *age* ("Age")  

The dataset has 709 observations with 709 valid values (missing: 0) in *age* ("Age").
This variable seems to be numeric.

 === Base statistics  


**value**   **mean(age)**   **sd(age)**   **var(age)**  
----------- --------------- ------------- --------------
(all)       24.56           6.84          46.78         
----------- --------------- ------------- --------------


 === Histogram  

/tmp/Rtmp3FBhc9/file51dd22bc.png

It seems that the highest value is 58 which is exactly 3.625 times higher than the smallest value (16).

The standard deviation is 6.8399 (variance: 46.784). The expected value is around 24.557, somewhere between 24.054 and 25.061 (SE: 0.2569).

If we suppose that *Age* is not near to a normal distribution (test: , skewness: 1.9568, kurtosis: 7.6428), checking the median (23) might be a better option instead of the mean. The interquartile range (6) measures the statistics dispersion of the variable (similar to standard deviation) based on median.




##################################################################################################################################################
##	 Running: rapport('multivar-descriptive', data=ius2008, vars=c("chatim", "game", "surf", "email", "download", "forum", "socnet", "xxx"))
##################################################################################################################################################

 == *chatim* ("Chat & IM usage")  

The dataset has 709 observations with 709 valid values (missing: 0) in *chatim* ("Chat & IM usage").
This variable seems to be a factor.

 === Base statistics  


        **chatim**    **N**    **pct**   **cumul.count**   **cumul.pct**  
------- ------------- -------- --------- ----------------- ---------------
1       never         64.00    9.03      64.00             9.03           
2       very rarely   78.00    11.00     142.00            20.03          
3       rarely        65.00    9.17      207.00            29.20          
4       sometimes     124.00   17.49     331.00            46.69          
5       often         142.00   20.03     473.00            66.71          
6       very often    94.00    13.26     567.00            79.97          
7       always        142.00   20.03     709.00            100.00         
Total                 709.00   100.00    709.00            100.00         
------- ------------- -------- --------- ----------------- ---------------


 === Barplot  

/tmp/Rtmp3FBhc9/file10ee7c7f.png

It seems that the highest value is 7 which is exactly 7 times higher than the smallest value (1).

 == *game* ("On-line games usage")  

The dataset has 709 observations with 709 valid values (missing: 0) in *game* ("On-line games usage").
This variable seems to be a factor.

 === Base statistics  


        **game**      **N**    **pct**   **cumul.count**   **cumul.pct**  
------- ------------- -------- --------- ----------------- ---------------
1       never         368.00   51.90     368.00            51.90          
2       very rarely   132.00   18.62     500.00            70.52          
3       rarely        35.00    4.94      535.00            75.46          
4       sometimes     65.00    9.17      600.00            84.63          
5       often         38.00    5.36      638.00            89.99          
6       very often    37.00    5.22      675.00            95.20          
7       always        34.00    4.80      709.00            100.00         
Total                 709.00   100.00    709.00            100.00         
------- ------------- -------- --------- ----------------- ---------------


 === Barplot  

/tmp/Rtmp3FBhc9/file69a47f05.png

It seems that the highest value is 7 which is exactly 7 times higher than the smallest value (1).

 == *surf* ("Web surfing usage")  

The dataset has 709 observations with 709 valid values (missing: 0) in *surf* ("Web surfing usage").
This variable seems to be a factor.

 === Base statistics  


        **surf**      **N**    **pct**   **cumul.count**   **cumul.pct**  
------- ------------- -------- --------- ----------------- ---------------
1       never         17.00    2.40      17.00             2.40           
2       very rarely   26.00    3.67      43.00             6.06           
3       rarely        34.00    4.80      77.00             10.86          
4       sometimes     116.00   16.36     193.00            27.22          
5       often         164.00   23.13     357.00            50.35          
6       very often    151.00   21.30     508.00            71.65          
7       always        201.00   28.35     709.00            100.00         
Total                 709.00   100.00    709.00            100.00         
------- ------------- -------- --------- ----------------- ---------------


 === Barplot  

/tmp/Rtmp3FBhc9/file640f48aa.png

It seems that the highest value is 7 which is exactly 7 times higher than the smallest value (1).

 == *email* ("Email usage")  

The dataset has 709 observations with 709 valid values (missing: 0) in *email* ("Email usage").
This variable seems to be a factor.

 === Base statistics  


        **email**     **N**    **pct**   **cumul.count**   **cumul.pct**  
------- ------------- -------- --------- ----------------- ---------------
1       never         13.00    1.83      13.00             1.83           
2       very rarely   38.00    5.36      51.00             7.19           
3       rarely        51.00    7.19      102.00            14.39          
4       sometimes     90.00    12.69     192.00            27.08          
5       often         129.00   18.19     321.00            45.28          
6       very often    116.00   16.36     437.00            61.64          
7       always        272.00   38.36     709.00            100.00         
Total                 709.00   100.00    709.00            100.00         
------- ------------- -------- --------- ----------------- ---------------


 === Barplot  

/tmp/Rtmp3FBhc9/file31606eb8.png

It seems that the highest value is 7 which is exactly 7 times higher than the smallest value (1).

 == *download* ("Download usage")  

The dataset has 709 observations with 709 valid values (missing: 0) in *download* ("Download usage").
This variable seems to be a factor.

 === Base statistics  


        **download**   **N**    **pct**   **cumul.count**   **cumul.pct**  
------- -------------- -------- --------- ----------------- ---------------
1       never          11.00    1.55      11.00             1.55           
2       very rarely    29.00    4.09      40.00             5.64           
3       rarely         30.00    4.23      70.00             9.87           
4       sometimes      85.00    11.99     155.00            21.86          
5       often          130.00   18.34     285.00            40.20          
6       very often     171.00   24.12     456.00            64.32          
7       always         253.00   35.68     709.00            100.00         
Total                  709.00   100.00    709.00            100.00         
------- -------------- -------- --------- ----------------- ---------------


 === Barplot  

/tmp/Rtmp3FBhc9/file3828bbbb.png

It seems that the highest value is 7 which is exactly 7 times higher than the smallest value (1).

 == *forum* ("Web forums usage")  

The dataset has 709 observations with 709 valid values (missing: 0) in *forum* ("Web forums usage").
This variable seems to be a factor.

 === Base statistics  


        **forum**     **N**    **pct**   **cumul.count**   **cumul.pct**  
------- ------------- -------- --------- ----------------- ---------------
1       never         80.00    11.28     80.00             11.28          
2       very rarely   84.00    11.85     164.00            23.13          
3       rarely        74.00    10.44     238.00            33.57          
4       sometimes     124.00   17.49     362.00            51.06          
5       often         112.00   15.80     474.00            66.85          
6       very often    125.00   17.63     599.00            84.49          
7       always        110.00   15.51     709.00            100.00         
Total                 709.00   100.00    709.00            100.00         
------- ------------- -------- --------- ----------------- ---------------


 === Barplot  

/tmp/Rtmp3FBhc9/file40a4e23a.png

It seems that the highest value is 7 which is exactly 7 times higher than the smallest value (1).

 == *socnet* ("Social networks usage")  

The dataset has 709 observations with 709 valid values (missing: 0) in *socnet* ("Social networks usage").
This variable seems to be a factor.

 === Base statistics  


        **socnet**    **N**    **pct**   **cumul.count**   **cumul.pct**  
------- ------------- -------- --------- ----------------- ---------------
1       never         210.00   29.62     210.00            29.62          
2       very rarely   111.00   15.66     321.00            45.28          
3       rarely        59.00    8.32      380.00            53.60          
4       sometimes     94.00    13.26     474.00            66.85          
5       often         82.00    11.57     556.00            78.42          
6       very often    85.00    11.99     641.00            90.41          
7       always        68.00    9.59      709.00            100.00         
Total                 709.00   100.00    709.00            100.00         
------- ------------- -------- --------- ----------------- ---------------


 === Barplot  

/tmp/Rtmp3FBhc9/filed4986bb.png

It seems that the highest value is 7 which is exactly 7 times higher than the smallest value (1).

 == *xxx* ("Adult sites usage")  

The dataset has 709 observations with 709 valid values (missing: 0) in *xxx* ("Adult sites usage").
This variable seems to be a factor.

 === Base statistics  


        **xxx**       **N**    **pct**   **cumul.count**   **cumul.pct**  
------- ------------- -------- --------- ----------------- ---------------
1       never         293.00   41.33     293.00            41.33          
2       very rarely   128.00   18.05     421.00            59.38          
3       rarely        55.00    7.76      476.00            67.14          
4       sometimes     137.00   19.32     613.00            86.46          
5       often         48.00    6.77      661.00            93.23          
6       very often    29.00    4.09      690.00            97.32          
7       always        19.00    2.68      709.00            100.00         
Total                 709.00   100.00    709.00            100.00         
------- ------------- -------- --------- ----------------- ---------------


 === Barplot  

/tmp/Rtmp3FBhc9/file3eaec021.png

It seems that the highest value is 7 which is exactly 7 times higher than the smallest value (1).




{% endhighlight %}
</li>
	<li id="export-multivar-descriptive"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport('multivar-descriptive', data=ius2008, vars=c("gender", 'age'))
rapport('multivar-descriptive', data=ius2008, vars=c("chatim", "game", "surf", "email", "download", "forum", "socnet", "xxx"))

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
rapport('outlier-test', data=ius2008, var='edu')
rapport('outlier-test', data=ius2008, var='edu', lund.res=FALSE)
rapport('outlier-test', data=ius2008, var='edu', lund.res=FALSE, references=FALSE, grubb=FALSE, dixon=FALSE)
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
<li><h6>lund.res: <small><em>Residuals</em></small></h6>
<div class="options">    <div class="options-desc">Return Lund's residuals?
</div>
    <em>Type:</em>	boolean
<br>
    <em>Limits:</em>	exactly 1 variable
<br>
    <em>Default value:</em>	FALSE
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


####################################################################
##	 Running: rapport('outlier-test', data=ius2008, var='edu')
####################################################################

 == Boxplot  

/tmp/Rtmp3FBhc9/file3c8d12ea.png

 == Lund test  

It seems that 5 extreme values can be found in "Internet usage for educational purposes (hours per day)". These are: 10, 10, 12, 12, 12.

 === Explanation  

The above test for outliers was based on *lm(1 ~ edu)*:


              **Estimate**   **Std. Error**   **t value**   **Pr(>|t|)**  
------------- -------------- ---------------- ------------- --------------
(Intercept)   2.06           0.08             26.92         0.00          
------------- -------------- ---------------- ------------- --------------


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


####################################################################################
##	 Running: rapport('outlier-test', data=ius2008, var='edu', lund.res=FALSE)
####################################################################################

 == Boxplot  

/tmp/Rtmp3FBhc9/file30c58059.png

 == Lund test  

It seems that 5 extreme values can be found in "Internet usage for educational purposes (hours per day)". These are: 10, 10, 12, 12, 12.

 === Explanation  

The above test for outliers was based on *lm(1 ~ edu)*:


              **Estimate**   **Std. Error**   **t value**   **Pr(>|t|)**  
------------- -------------- ---------------- ------------- --------------
(Intercept)   2.06           0.08             26.92         0.00          
------------- -------------- ---------------- ------------- --------------


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


################################################################################################################################
##	 Running: rapport('outlier-test', data=ius2008, var='edu', lund.res=FALSE, references=FALSE, grubb=FALSE, dixon=FALSE)
################################################################################################################################

 == Boxplot  

/tmp/Rtmp3FBhc9/file16443454.png

 == Lund test  

It seems that 5 extreme values can be found in "Internet usage for educational purposes (hours per day)". These are: 10, 10, 12, 12, 12.

 === Explanation  

The above test for outliers was based on *lm(1 ~ edu)*:


              **Estimate**   **Std. Error**   **t value**   **Pr(>|t|)**  
------------- -------------- ---------------- ------------- --------------
(Intercept)   2.06           0.08             26.92         0.00          
------------- -------------- ---------------- ------------- --------------



{% endhighlight %}
</li>
	<li id="export-outlier-test"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport('outlier-test', data=ius2008, var='edu')
rapport('outlier-test', data=ius2008, var='edu', lund.res=FALSE)
rapport('outlier-test', data=ius2008, var='edu', lund.res=FALSE, references=FALSE, grubb=FALSE, dixon=FALSE)

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
rapport('univar-descriptive', data=ius2008, var='gender')
rapport('univar-descriptive', data=ius2008, var='age')
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
##	 Running: rapport('univar-descriptive', data=ius2008, var='gender')
#############################################################################

 == *gender* ("Gender")  

The dataset has 709 observations with 709 valid values (missing: 0) in *gender* ("Gender").
This variable seems to be a factor.

 === Base statistics  


        **gender**   **N**    **pct**   **cumul.count**   **cumul.pct**  
------- ------------ -------- --------- ----------------- ---------------
1       male         432.00   60.93     432.00            60.93          
2       female       277.00   39.07     709.00            100.00         
Total                709.00   100.00    709.00            100.00         
------- ------------ -------- --------- ----------------- ---------------


 === Barplot  

/tmp/Rtmp3FBhc9/file6e8ecf14.png

It seems that the highest value is 2 which is exactly 2 times higher than the smallest value (1).


##########################################################################
##	 Running: rapport('univar-descriptive', data=ius2008, var='age')
##########################################################################

 == *age* ("Age")  

The dataset has 709 observations with 709 valid values (missing: 0) in *age* ("Age").
This variable seems to be numeric.

 === Base statistics  


**value**   **mean(age)**   **sd(age)**   **var(age)**  
----------- --------------- ------------- --------------
(all)       24.56           6.84          46.78         
----------- --------------- ------------- --------------


 === Histogram  

/tmp/Rtmp3FBhc9/file48c528be.png

It seems that the highest value is 58 which is exactly 3.625 times higher than the smallest value (16).

The standard deviation is 6.8399 (variance: 46.784). The expected value is around 24.557, somewhere between 24.054 and 25.061 (SE: 0.2569).

If we suppose that *Age* is not near to a normal distribution (test: , skewness: 1.9568, kurtosis: 7.6428), checking the median (23) might be a better option instead of the mean. The interquartile range (6) measures the statistics dispersion of the variable (similar to standard deviation) based on median.


{% endhighlight %}
</li>
	<li id="export-univar-descriptive"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport('univar-descriptive', data=ius2008, var='gender')
rapport('univar-descriptive', data=ius2008, var='age')

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

