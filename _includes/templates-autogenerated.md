<ul>
 	<li><a href="#anova">anova.tpl</a></li>
 	<li><a href="#correlations">correlations.tpl</a></li>
 	<li><a href="#crosstable">crosstable.tpl</a></li>
 	<li><a href="#descriptives">descriptives.tpl</a></li>
 	<li><a href="#example">example.tpl</a></li>
 	<li><a href="#nortest">nortest.tpl</a></li>
 	<li><a href="#outlier-test">outlier-test.tpl</a></li>
 	<li><a href="#t-test">t-test.tpl</a></li>
 </ul>

Please find below a detailed description about each with sample outputs of those in R console, HTML, odt and pdf too. You can find 5 tabs below at each templates, which help you to gain more knowledge about them. At the Description tab you can see the basic information about the template (title, author, examples, required packages). After clicking on the Inputs tab you will find the input parameters which belong to the given template. Step on to the Example tab one could check a possible report based on the template. Export tab will list the possible options of formats to export the result. Clicking on them the template will show up in the required format. At the last but definitely not least you can find the code of the template after clicking on the Source tab.

<a id="anova"> </a>
#### anova.tpl

 <ul class="tabs">
	<li><a class="active" href="#info-anova">Description</a></li>
	<li><a href="#inputs-anova">Inputs</a></li>
	<li><a href="#example-anova">Example</a></li>
	<li><a href="#export-anova">Export</a></li>
	<li><a href="#source-anova">Source</a></li>
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
rapport("anova", ius2008, resp = "leisure", fac = "gender")  # one-way
rapport("anova", ius2008, resp = "leisure", fac = c("gender", "partner")) # two-way
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
<li><h6>fac.intr: <small><em>Factor interaction</em></small></h6>
<div class="options">    <div class="options-desc">Include factor interaction
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
	<li id="example-anova">
{% highlight text %}


##########################################################################################
##	 Running: rapport("anova", ius2008, resp = "leisure", fac = "gender")  # one-way
##########################################################################################








# Introduction


**Analysis of Variance** or **ANOVA** is a statistical procedure that tests equality of means for several samples. It was first introduced in 1921 by famous English statistician Sir Ronald Aylmer Fisher.


# Model Overview


One-Way ANOVA was carried out, with _Gender_ as independent variable, and _Internet usage in leisure time (hours per day)_ as a response variable. Factor interaction was taken into account.


# Descriptives


In order to get more insight on the model data, a table of frequencies for ANOVA factors is displayed, as well as a table of descriptives.


## Frequency Table


Below lies a frequency table for factors in ANOVA model. Note that the missing values are removed from the summary.


-----------------------------------------
gender   N   %      Cumul. N   Cumul. %  
-------- --- ------ ---------- ----------
male     410 60.92  410        60.92     

female   263 39.08  673        100.00    

Total    673 100.00 673        100.00    
-----------------------------------------




## Descriptive Statistics


The following table displays the descriptive statistics of ANOVA model. Factor levels and/or their combinations lie on the left hand side, while the corresponding statistics for response variable are given on the right-hand side.


-----------------------------------------------------
Gender   Min   Max   Mean   Std.Dev.   Median   IQR  
-------- ----- ----- ------ ---------- -------- -----
male     0     12    3.270  1.953      3        3    

female   0     12    3.064  2.355      2        3    
-----------------------------------------------------

 
---------------------
Skewness   Kurtosis  
---------- ----------
0.9443     0.9858    

1.3979     1.8696    
---------------------




# Diagnostics


Before we carry out ANOVA, we'd like to check some basic assumptions. For those purposes, normality and homoscedascity tests are carried out alongside several graphs that may help you with your decision on model's main assumptions.


## Diagnostics



### Univariate Normality


We will use _Shapiro-Wilk_, _Lilliefors_ and _Anderson-Darling_ tests to screen departures from normality in the response variable (_Internet usage in leisure time (hours per day)_).



-------------------------------------------------
Method                      Statistic   p-value  
--------------------------- ----------- ---------
Shapiro-Wilk normality test 0.9001      1.617e-20

Lilliefors                  0.1680      3.000e-52
(Kolmogorov-Smirnov)                             
normality test                                   

Anderson-Darling normality  18.7530     7.261e-44
test                                             
-------------------------------------------------




As you can see, applied tests confirm departures from normality.


### Homoscedascity


In order to test homoscedascity, _Bartlett_ and _Fligner-Kileen_ tests are applied.






--------------------------------------------------
Method                       Statistic   p-value  
---------------------------- ----------- ---------
Fligner-Killeen test of      0.4629      0.496287 
homogeneity of variances                          

Bartlett test of homogeneity 10.7698     0.001032 
of variances                                      
--------------------------------------------------




When it comes to equality of variances, applied tests yield inconsistent results. While _Fligner-Kileen test_ confirmed the hypotheses of homoscedascity, _Bartlett's test_ rejected it.


## Diagnostic Plots


Here you can see several diagnostic plots for ANOVA model:

 - residuals against fitted values
 - scale-location plot of square root of residuals against fitted values
 - normal Q-Q plot
 - residuals against leverages

[![](plots/anova-5.png)](plots/anova-5-hires.png)



# ANOVA Summary



## ANOVA Table







----------------------------------------------------------
&nbsp;          Df   Sum.Sq   Mean.Sq   F.value   Pr..F.  
--------------- ---- -------- --------- --------- --------
**gender**      1    6.422    6.422     1.43      0.2322  

**Residuals**   636  2855.630 4.490     NA        NA      
----------------------------------------------------------



_F-test_ for _Gender_ is not statistically significant, which implies that there is no Gender effect on response variable. 


#######################################################################################################
##	 Running: rapport("anova", ius2008, resp = "leisure", fac = c("gender", "partner")) # two-way
#######################################################################################################








# Introduction


**Analysis of Variance** or **ANOVA** is a statistical procedure that tests equality of means for several samples. It was first introduced in 1921 by famous English statistician Sir Ronald Aylmer Fisher.


# Model Overview


Two-Way ANOVA was carried out, with _Gender_ and _Relationship status_ as independent variables, and _Internet usage in leisure time (hours per day)_ as a response variable. Factor interaction was taken into account.


# Descriptives


In order to get more insight on the model data, a table of frequencies for ANOVA factors is displayed, as well as a table of descriptives.


## Frequency Table


Below lies a frequency table for factors in ANOVA model. Note that the missing values are removed from the summary.


------------------------------------------------------------
gender   partner           N   %       Cumul. N   Cumul. %  
-------- ----------------- --- ------- ---------- ----------
male     in a relationship 150 23.697  150        23.70     

female   in a relationship 120 18.957  270        42.65     

male     married           33  5.213   303        47.87     

female   married           29  4.581   332        52.45     

male     single            204 32.227  536        84.68     

female   single            97  15.324  633        100.00    

Total    Total             633 100.000 633        100.00    
------------------------------------------------------------




## Descriptive Statistics


The following table displays the descriptive statistics of ANOVA model. Factor levels and/or their combinations lie on the left hand side, while the corresponding statistics for response variable are given on the right-hand side.


------------------------------------------------------------
Gender   Relationship status   Min   Max   Mean   Std.Dev.  
-------- --------------------- ----- ----- ------ ----------
male     in a relationship     0.5   12    3.058  1.969     

male     married               0.0   8     2.985  2.029     

male     single                0.0   10    3.503  1.936     

female   in a relationship     0.5   10    3.044  2.216     

female   married               0.0   10    2.481  1.967     

female   single                0.0   12    3.323  2.679     
------------------------------------------------------------

 
------------------------------------
Median   IQR   Skewness   Kurtosis  
-------- ----- ---------- ----------
2.5      2.00  1.3239     2.64881   

3.0      2.00  0.8620     0.15095   

3.0      3.00  0.7574     0.08749   

3.0      3.00  1.3833     1.83058   

2.0      1.75  2.0626     5.58575   

3.0      3.50  1.1851     0.92806   
------------------------------------




# Diagnostics


Before we carry out ANOVA, we'd like to check some basic assumptions. For those purposes, normality and homoscedascity tests are carried out alongside several graphs that may help you with your decision on model's main assumptions.


## Diagnostics



### Univariate Normality


We will use _Shapiro-Wilk_, _Lilliefors_ and _Anderson-Darling_ tests to screen departures from normality in the response variable (_Internet usage in leisure time (hours per day)_).



-------------------------------------------------
Method                      Statistic   p-value  
--------------------------- ----------- ---------
Shapiro-Wilk normality test 0.9001      1.617e-20

Lilliefors                  0.1680      3.000e-52
(Kolmogorov-Smirnov)                             
normality test                                   

Anderson-Darling normality  18.7530     7.261e-44
test                                             
-------------------------------------------------




As you can see, applied tests confirm departures from normality.


### Homoscedascity


In order to test homoscedascity, _Bartlett_ and _Fligner-Kileen_ tests are applied.






--------------------------------------------------
Method                       Statistic   p-value  
---------------------------- ----------- ---------
Fligner-Killeen test of      1.123       0.2891837
homogeneity of variances                          

Bartlett test of homogeneity 11.127      0.0008509
of variances                                      
--------------------------------------------------




When it comes to equality of variances, applied tests yield inconsistent results. While _Fligner-Kileen test_ confirmed the hypotheses of homoscedascity, _Bartlett's test_ rejected it.


## Diagnostic Plots


Here you can see several diagnostic plots for ANOVA model:

 - residuals against fitted values
 - scale-location plot of square root of residuals against fitted values
 - normal Q-Q plot
 - residuals against leverages

[![](plots/anova-6.png)](plots/anova-6-hires.png)



# ANOVA Summary



## ANOVA Table







--------------------------------------------
&nbsp;               Df   Sum.Sq   Mean.Sq  
-------------------- ---- -------- ---------
**gender**           1    4.947    4.947    

**partner**          2    31.212   15.606   

**gender:partner**   2    3.038    1.519    

**Residuals**        593  2703.090 4.558    
--------------------------------------------

 
---------------------------------------
&nbsp;               F.value   Pr..F.  
-------------------- --------- --------
**gender**           1.0853    0.29793 

**partner**          3.4237    0.03324 

**gender:partner**   0.3332    0.71677 

**Residuals**        NA        NA      
---------------------------------------



_F-test_ for _Gender_ is not statistically significant, which implies that there is no Gender effect on response variable. Effect of _Relationship status_ on response variable is  significant. Interaction between levels of _Gender_ and _Relationship status_ wasn't found significant (p = 0.717).


{% endhighlight %}
</li>
	<li id="export-anova"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport("anova", ius2008, resp = "leisure", fac = "gender")  # one-way
rapport("anova", ius2008, resp = "leisure", fac = c("gender", "partner")) # two-way

{% endhighlight %}
<h6>Popular formats:</h6>
<ul>
	<li><a href="demo/anova.html" target="_blank">HTML</a></li>
	<li><a href="demo/anova.pdf" target="_blank">pdf</a></li>
	<li><a href="demo/anova.docx">docx (MS Word 2007 format)</a></li>
	<li><a href="demo/anova.odt">odt (MS Word compatible)</a></li>
	<li><a href="demo/anova.rtf">rtf (MS Word compatible)</a></li>
	<li><a href="demo/anova.epub">epub</a></li>
</ul>
<h6>Other morkdown formats</h6>
<ul>
	<li><a href="demo/anova.textile" target="_blank">textile</a></li>
	<li><a href="demo/anova.docbook" target="_blank">docbook</a></li>
	<li><a href="demo/anova.man" target="_blank">man</a></li>
	<li><a href="demo/anova.md" target="_blank">markdown</a></li>
	<li><a href="demo/anova.mediawiki" target="_blank">mediawiki</a></li>
	<li><a href="demo/anova.wiki" target="_blank">wiki</a></li>
	<li><a href="demo/anova.org" target="_blank">org</a></li>
	<li><a href="demo/anova.pandoc" target="_blank">pandoc</a></li>
</ul>
</div></li>
	<li id="source-anova"><div>
<h5>Source of `anova.tpl`</h5>
{% highlight text %}

<!--head
Title:        ANOVA Template
Author:       Aleksandar Blagotić
Description:  An ANOVA report with table of descriptives, diagnostic tests and ANOVA-specific statistics.
Packages:     nortest
Data required: TRUE
Example:      rapport("anova", ius2008, resp = "leisure", fac = "gender")  # one-way
              rapport("anova", ius2008, resp = "leisure", fac = c("gender", "partner")) # two-way

resp     | *numeric     | Response variable  | Dependent (response) variable
fac      | *factor[1,2] | Factor variables   | Independent variables (factors)
fac.intr | TRUE         | Factor interaction | Include factor interaction
head-->
<%=
d <- structure(data.frame(resp, fac), .Names = c(resp.iname, fac.name))
f.int <- fml(resp.iname, fac.name, join.right = "*")
f.nonint <- fml(resp.iname, fac.name, join.right = "+")
fit <- lm(ifelse(fac.intr, f.int, f.nonint), data = d)
fac.plu <- switch(fac.ilen, '', 's')
%>

# Introduction

**Analysis of Variance** or **ANOVA** is a statistical procedure that tests equality of means for several samples. It was first introduced in 1921 by famous English statistician Sir Ronald Aylmer Fisher.

# Model Overview

<%= switch(fac.ilen, 'One', 'Two') %>-Way ANOVA was carried out, with <%= p(fac.label) %> as independent variable<%= fac.plu %>, and <%= p(resp.label) %> as a response variable. Factor interaction was<%= ifelse(fac.intr, "", "n't")%> taken into account.

# Descriptives

In order to get more insight on the model data, a table of frequencies for ANOVA factors is displayed, as well as a table of descriptives.

## Frequency Table

Below lies a frequency table for factors in ANOVA model. Note that the missing values are removed from the summary.

<%=
(freq <- rp.freq(fac.name, rp.data))
%>

## Descriptive Statistics

The following table displays the descriptive statistics of ANOVA model. Factor levels and/or their combinations lie on the left hand side, while the corresponding statistics for response variable are given on the right-hand side.

<%=
(desc <- rp.desc(resp, fac, c(Min = min, Max = max, Mean = mean, Std.Dev. = sd, Median = median, IQR, Skewness = skewness, Kurtosis = kurtosis)))
%>

# Diagnostics

Before we carry out ANOVA, we'd like to check some basic assumptions. For those purposes, normality and homoscedascity tests are carried out alongside several graphs that may help you with your decision on model's main assumptions.

## Diagnostics

### Univariate Normality

We will use _Shapiro-Wilk_, _Lilliefors_ and _Anderson-Darling_ tests to screen departures from normality in the response variable (<%= p(resp.label) %>).

<%=
if (length(resp) < 5000) {
    ntest <- htest(resp, shapiro.test, lillie.test, ad.test)
} else {
    ntest <- htest(resp, lillie.test, ad.test)
}
ntest
%>


As you can see, applied tests <%= ifelse(all(ntest$p < .05), "confirm departures from normality", "yield different results on hypotheses of normality, so you may want to stick with one you find most appropriate or you trust the most.") %>.

### Homoscedascity

In order to test homoscedascity, _Bartlett_ and _Fligner-Kileen_ tests are applied.

<%=
hsced <- with(d, htest(as.formula(f.nonint), fligner.test, bartlett.test))
hp <- hsced$p
hcons <- all(hp < .05) | all(hp > .05)
hp.all <- all(hp < .05)
hsced
%>


When it comes to equality of variances, applied tests yield <%= ifelse(hcons, "consistent", "inconsistent") %> results. <%= if (hcons) sprintf("Homoscedascity assumption is %s.", ifelse(hp.all, "rejected", "confirmed")) else sprintf("While _Fligner-Kileen test_ %s the hypotheses of homoscedascity, _Bartlett's test_ %s it.", ifelse(hp[1] < .05, "rejected", "confirmed"), ifelse(hp[2] < .05, "rejected", "confirmed")) %>

## Diagnostic Plots

Here you can see several diagnostic plots for ANOVA model:

 - residuals against fitted values
 - scale-location plot of square root of residuals against fitted values
 - normal Q-Q plot
 - residuals against leverages

<%=
par(mfrow = c(2, 2))
+plot(fit)
%>

# ANOVA Summary

## ANOVA Table

<%=
a <- anova(fit)
a.f <- a$F
a.p <- a$Pr
a.fp <- a.p < .05
data.frame(a)
%>

_F-test_ for <%= p(fac.label[1]) %> is <%= ifelse(a.fp[1], "", "not") %> statistically significant, which implies that there is <%= ifelse(a.fp[1], "an", "no") %> <%= fac.label[1] %> effect on response variable. <%= if (fac.ilen == 2) sprintf("Effect of %s on response variable is %s significant. ", p(fac.label[2]), ifelse(a.fp[2], "", "not")) else "" %><%= if (fac.ilen == 2 & fac.intr) sprintf("Interaction between levels of %s %s found significant (p = %.3f).", p(fac.label), ifelse(a.fp[3], "was", "wasn't"), a.p[3]) else "" %>

{% endhighlight %}
</div></li>
</ul>

<a id="correlations"> </a>
#### correlations.tpl

 <ul class="tabs">
	<li><a class="active" href="#info-correlations">Description</a></li>
	<li><a href="#inputs-correlations">Inputs</a></li>
	<li><a href="#example-correlations">Example</a></li>
	<li><a href="#export-correlations">Export</a></li>
	<li><a href="#source-correlations">Source</a></li>
</ul>

 <ul class="tabs-content">
	<li class="active" id="info-correlations"><div><h5>Correlations</h5> by <em>Daróczi Gergely</em>
<br><br>
 This template will return the correlation matrix of supplied numerical variables.
<br><br>
<em>Required packages:</em> 
<br>
<em>Example:</em> 
{% highlight text %}
rapport('correlations', data=ius2008, vars=c('age', 'edu'))
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
    <em>Limits:</em>	from 2, up to 50 variables
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
<li><h6>quick.plot: <small><em>Using a sample for plotting</em></small></h6>
<div class="options">    <div class="options-desc">If set to TRUE, the scatterplot matrix will be drawn on a sample size of max. 1000 cases not to render millions of points.
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


###############################################################################
##	 Running: rapport('correlations', data=ius2008, vars=c('age', 'edu'))
###############################################################################


# Variable description


_2_ variables provided.









There are no highly correlated (r < -0.7 or r > 0.7) variables.




There are no uncorrelated correlated (r < -0.2 or r > 0.2) variables.



## Correlation matrix



-------------------------------
   &nbsp;    age        edu    
--------- ---------- ----------
  **age**            0.2185 ★★★

  **edu** 0.2185 ★★★           
-------------------------------

Table: Correlation matrix



Where the stars represent the [significance levels](http://en.wikipedia.org/wiki/Statistical_significance) of the bivariate correlation coefficients: one star for `0.05`, two for `0.01` and three  for `0.001`.

[![Scatterplot matrix (based on a sample size of 1000)](plots/correlations-1.png)](plots/correlations-1-hires.png)



##########################################################################################
##	 Running: rapport('correlations', data=ius2008, vars=c('age', 'edu', 'leisure'))
##########################################################################################


# Variable description


_3_ variables provided.






The highest correlation coefficient (_0.2273_) is between edu age and the lowest (_-0.03377_) is between leisure age. It seems that the strongest association (r=_0.2273_) is between edu age.




There are no highly correlated (r < -0.7 or r > 0.7) variables.




Uncorrelated (-0.2 < r < 0.2) variables:



  * _leisure_ and _age_ (-0.03)
  * _leisure_ and _edu_ (0.17)

<!-- end of list -->






## Correlation matrix



----------------------------------------------
       &nbsp;    age        edu      leisure  
------------- ---------- ---------- ----------
      **age**            0.2273 ★★★  -0.0338  

      **edu** 0.2273 ★★★            0.1732 ★★★

  **leisure**  -0.0338   0.1732 ★★★           
----------------------------------------------

Table: Correlation matrix



Where the stars represent the [significance levels](http://en.wikipedia.org/wiki/Statistical_significance) of the bivariate correlation coefficients: one star for `0.05`, two for `0.01` and three  for `0.001`.

[![Scatterplot matrix (based on a sample size of 1000)](plots/correlations-2.png)](plots/correlations-2-hires.png)



##############################################################################################################################################
##	 Running: rapport('correlations', data=mtcars, vars=c('mpg', 'cyl', 'disp', 'hp', 'drat', 'wt', 'qsec', 'vs', 'am', 'gear', 'carb'))
##############################################################################################################################################


# Variable description


_11_ variables provided.






The highest correlation coefficient (_0.902_) is between disp cyl and the lowest (_-0.8677_) is between wt mpg. It seems that the strongest association (r=_0.902_) is between disp cyl.




Highly correlated (r < -0.7 or r > 0.7) variables:



  * _cyl_ and _mpg_ (-0.85)
  * _disp_ and _mpg_ (-0.85)
  * _hp_ and _mpg_ (-0.78)
  * _wt_ and _mpg_ (-0.87)
  * _disp_ and _cyl_ (0.9)
  * _hp_ and _cyl_ (0.83)
  * _wt_ and _cyl_ (0.78)
  * _vs_ and _cyl_ (-0.81)
  * _hp_ and _disp_ (0.79)
  * _drat_ and _disp_ (-0.71)
  * _wt_ and _disp_ (0.89)
  * _vs_ and _disp_ (-0.71)
  * _qsec_ and _hp_ (-0.71)
  * _vs_ and _hp_ (-0.72)
  * _carb_ and _hp_ (0.75)
  * _wt_ and _drat_ (-0.71)
  * _am_ and _drat_ (0.71)
  * _vs_ and _qsec_ (0.74)
  * _gear_ and _am_ (0.79)

<!-- end of list -->







Uncorrelated (-0.2 < r < 0.2) variables:



  * _gear_ and _hp_ (-0.13)
  * _qsec_ and _drat_ (0.09)
  * _carb_ and _drat_ (-0.09)
  * _qsec_ and _wt_ (-0.17)
  * _am_ and _vs_ (0.17)
  * _carb_ and _am_ (0.06)

<!-- end of list -->






## Correlation matrix



----------------------------------------------------------
    &nbsp;         mpg         cyl        disp          hp
---------- ----------- ----------- ----------- -----------
   **mpg**             -0.8522 ★★★ -0.8476 ★★★ -0.7762 ★★★

   **cyl** -0.8522 ★★★               0.902 ★★★  0.8324 ★★★

  **disp** -0.8476 ★★★   0.902 ★★★              0.7909 ★★★

    **hp** -0.7762 ★★★  0.8324 ★★★  0.7909 ★★★            

  **drat**  0.6812 ★★★ -0.6999 ★★★ -0.7102 ★★★  -0.4488 ★★

    **wt** -0.8677 ★★★  0.7825 ★★★   0.888 ★★★  0.6587 ★★★

  **qsec**    0.4187 ★ -0.5912 ★★★   -0.4337 ★ -0.7082 ★★★

    **vs**   0.664 ★★★ -0.8108 ★★★ -0.7104 ★★★ -0.7231 ★★★

    **am**  0.5998 ★★★  -0.5226 ★★ -0.5912 ★★★     -0.2432

  **gear**   0.4803 ★★  -0.4927 ★★ -0.5556 ★★★     -0.1257

  **carb**  -0.5509 ★★    0.527 ★★     0.395 ★  0.7498 ★★★
----------------------------------------------------------

Table: Correlation matrix (continued below)

 
----------------------------------------------------------
  &nbsp;      drat         wt         qsec         vs     
---------- ----------- ----------- ----------- -----------
 **mpg**   0.6812 ★★★  -0.8677 ★★★  0.4187 ★    0.664 ★★★ 

 **cyl**   -0.6999 ★★★ 0.7825 ★★★  -0.5912 ★★★ -0.8108 ★★★

 **disp**  -0.7102 ★★★  0.888 ★★★   -0.4337 ★  -0.7104 ★★★

  **hp**   -0.4488 ★★  0.6587 ★★★  -0.7082 ★★★ -0.7231 ★★★

 **drat**              -0.7124 ★★★   0.0912     0.4403 ★  

  **wt**   -0.7124 ★★★               -0.1747   -0.5549 ★★★

 **qsec**    0.0912      -0.1747               0.7445 ★★★ 

  **vs**    0.4403 ★   -0.5549 ★★★ 0.7445 ★★★             

  **am**   0.7127 ★★★  -0.6925 ★★★   -0.2299     0.1683   

 **gear**  0.6996 ★★★  -0.5833 ★★★   -0.2127      0.206   

 **carb**    -0.0908    0.4276 ★   -0.6562 ★★★ -0.5696 ★★★
----------------------------------------------------------

 
----------------------------------------------
  &nbsp;       am         gear        carb    
---------- ----------- ----------- -----------
 **mpg**   0.5998 ★★★   0.4803 ★★  -0.5509 ★★ 

 **cyl**   -0.5226 ★★  -0.4927 ★★   0.527 ★★  

 **disp**  -0.5912 ★★★ -0.5556 ★★★   0.395 ★  

  **hp**     -0.2432     -0.1257   0.7498 ★★★ 

 **drat**  0.7127 ★★★  0.6996 ★★★    -0.0908  

  **wt**   -0.6925 ★★★ -0.5833 ★★★  0.4276 ★  

 **qsec**    -0.2299     -0.2127   -0.6562 ★★★

  **vs**     0.1683       0.206    -0.5696 ★★★

  **am**               0.7941 ★★★    0.0575   

 **gear**  0.7941 ★★★                0.2741   

 **carb**    0.0575      0.2741               
----------------------------------------------



Where the stars represent the [significance levels](http://en.wikipedia.org/wiki/Statistical_significance) of the bivariate correlation coefficients: one star for `0.05`, two for `0.01` and three  for `0.001`.

[![Scatterplot matrix (based on a sample size of 1000)](plots/correlations-3.png)](plots/correlations-3-hires.png)



{% endhighlight %}
</li>
	<li id="export-correlations"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport('correlations', data=ius2008, vars=c('age', 'edu'))
rapport('correlations', data=ius2008, vars=c('age', 'edu', 'leisure'))
rapport('correlations', data=mtcars, vars=c('mpg', 'cyl', 'disp', 'hp', 'drat', 'wt', 'qsec', 'vs', 'am', 'gear', 'carb'))

{% endhighlight %}
<h6>Popular formats:</h6>
<ul>
	<li><a href="demo/correlations.html" target="_blank">HTML</a></li>
	<li><a href="demo/correlations.pdf" target="_blank">pdf</a></li>
	<li><a href="demo/correlations.docx">docx (MS Word 2007 format)</a></li>
	<li><a href="demo/correlations.odt">odt (MS Word compatible)</a></li>
	<li><a href="demo/correlations.rtf">rtf (MS Word compatible)</a></li>
	<li><a href="demo/correlations.epub">epub</a></li>
</ul>
<h6>Other morkdown formats</h6>
<ul>
	<li><a href="demo/correlations.textile" target="_blank">textile</a></li>
	<li><a href="demo/correlations.docbook" target="_blank">docbook</a></li>
	<li><a href="demo/correlations.man" target="_blank">man</a></li>
	<li><a href="demo/correlations.md" target="_blank">markdown</a></li>
	<li><a href="demo/correlations.mediawiki" target="_blank">mediawiki</a></li>
	<li><a href="demo/correlations.wiki" target="_blank">wiki</a></li>
	<li><a href="demo/correlations.org" target="_blank">org</a></li>
	<li><a href="demo/correlations.pandoc" target="_blank">pandoc</a></li>
</ul>
</div></li>
	<li id="source-correlations"><div>
<h5>Source of `correlations.tpl`</h5>
{% highlight text %}

<!--head
Title:          Correlations
Author:         Daróczi Gergely
Email:          gergely@snowl.net
Description:    This template will return the correlation matrix of supplied numerical variables.
Data required:  TRUE
Example:        rapport('correlations', data=ius2008, vars=c('age', 'edu'))
		rapport('correlations', data=ius2008, vars=c('age', 'edu', 'leisure'))
		rapport('correlations', data=mtcars, vars=c('mpg', 'cyl', 'disp', 'hp', 'drat', 'wt', 'qsec', 'vs', 'am', 'gear', 'carb'))

vars            | *numeric[2,50]| Variable                      | Numerical variables
cor.matrix      | TRUE          | Correlation matrix            | Show correlation matrix (numbers)?
cor.plot        | TRUE          | Scatterplot matrix            | Show scatterplot matrix (image)?
quick.plot      | TRUE          | Using a sample for plotting   | If set to TRUE, the scatterplot matrix will be drawn on a sample size of max. 1000 cases not to render millions of points.
head-->

# Variable description

<%=length(vars)%> variables provided.

<%=
cm <- cor(vars, use = 'complete.obs')
diag(cm) <- NA
%>

<%if (length(vars) >2 ) { %>
The highest correlation coefficient (<%=max(cm, na.rm=T)%>) is between <%=row.names(which(cm == max(cm, na.rm=T), arr.ind=T))[1:2]%> and the lowest (<%=min(cm, na.rm=T)%>) is between <%=row.names(which(cm == min(cm, na.rm=T), arr.ind=T))[1:2]%>. It seems that the strongest association (r=<%=cm[which(abs(cm) == max(abs(cm), na.rm=T), arr.ind=T)][1]%>) is between <%=row.names(which(abs(cm) == max(abs(cm), na.rm=T), arr.ind=T))[1:2]%>.
<% } %>

<%
cm[upper.tri(cm)] <- NA
h <- which((cm > 0.7) | (cm < -0.7), arr.ind=T)
if (nrow(h) > 0) {
%>

Highly correlated (r < -0.7 or r > 0.7) variables:

<%=paste(pander.return(lapply(1:nrow(h), function(i) paste0(p(c(rownames(cm)[h[i,1]], colnames(cm)[h[i,2]])), ' (', round(cm[h[i, 1], h[i, 2]], 2), ')'))), collapse = '\n')%>

<%} else { %>

There are no highly correlated (r < -0.7 or r > 0.7) variables.
<% } %>

<%
h <- which((cm < 0.2)&(cm > -0.2), arr.ind=T)
if (nrow(h) > 0) {
%>

Uncorrelated (-0.2 < r < 0.2) variables:

<%=
if (nrow(h) > 0)
    paste(pander.return(lapply(1:nrow(h), function(i) paste0(p(c(rownames(cm)[h[i,1]], colnames(cm)[h[i,2]])), ' (', round(cm[h[i, 1], h[i, 2]], 2), ')'))), collapse = '\n')
%>

<%} else { %>

There are no uncorrelated correlated (r < -0.2 or r > 0.2) variables.
<% } %>

## <%=if (cor.matrix) 'Correlation matrix'%>

<%=
if (cor.matrix) {
    set.caption('Correlation matrix')
    cm <- round(cor(vars, use = 'complete.obs'), 4)
    d <- attributes(cm)
    for (row in attr(cm, 'dimnames')[[1]])
	for (col in attr(cm, 'dimnames')[[2]]) {
	    test.p <- cor.test(vars[, row], vars[, col])$p.value
	    cm[row, col] <- paste(cm[row, col], ' ', ifelse(test.p > 0.05, '', ifelse(test.p > 0.01, ' ★', ifelse(test.p > 0.001, ' ★★', ' ★★★'))), sep='')
	}
    diag(cm) <- ''
    set.alignment('centre', 'right')
    as.data.frame(cm)
}
%>

Where the stars represent the [significance levels](http://en.wikipedia.org/wiki/Statistical_significance) of the bivariate correlation coefficients: one star for `0.05`, two for `0.01` and three  for `0.001`.

<%=
if (cor.plot) {

    labels <- lapply(vars, rp.name)

    if (quick.plot)
        if (nrow(vars) > 1000)
            vars <- vars[sample(1:nrow(vars), size = 1000), ]

    ## custom panels
    panel.cor <- function(x, y, digits = 2, prefix = "", cex.cor, ...) {

        ## forked from ?pairs
        par(usr = c(0, 1, 0, 1))
        r   <- cor(x, y, use = 'complete.obs')
        txt <- format(c(r, 0.123456789), digits = digits)[1]
        txt <- paste(prefix, txt, sep = "")
        if(missing(cex.cor))
            cex <- 0.8/strwidth(txt)
        test <- cor.test(x,y)
        Signif <- symnum(test$p.value, corr = FALSE, na = FALSE,
                         cutpoints = c(0, 0.001, 0.01, 0.05, 0.1, 1),
                         symbols = c("***", "**", "*", ".", " "))
        text(0.5, 0.5, txt, cex = cex * abs(r) * 1.5)
        text(.8, .8, Signif, cex = cex, col = 2)
    }

    ## plot
    set.caption(sprintf('Scatterplot matrix%s', ifelse(quick.plot, ' (based on a sample size of 1000)', '')))
    pairs(vars, lower.panel = 'panel.smooth', upper.panel = 'panel.cor', labels = labels)

}
%>

{% endhighlight %}
</div></li>
</ul>

<a id="crosstable"> </a>
#### crosstable.tpl

 <ul class="tabs">
	<li><a class="active" href="#info-crosstable">Description</a></li>
	<li><a href="#inputs-crosstable">Inputs</a></li>
	<li><a href="#example-crosstable">Example</a></li>
	<li><a href="#export-crosstable">Export</a></li>
	<li><a href="#source-crosstable">Source</a></li>
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
<li><h6>annotation: <small><em>Annotation</em></small></h6>
<div class="options">    <div class="options-desc">Should textual annotations be added to the report?
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
	<li id="example-crosstable">
{% highlight text %}


##################################################################################
##	 Running: rapport('crosstable', data=ius2008, row='gender', col='dwell')
##################################################################################


# Variable description


Two variables specified:

 * "gender" ("Gender") with _673_ and
 * "dwell" ("Dwelling") with _662_ valid values.


# Counts








-----------------------------------------------------------
&nbsp;        city   small town   village   Missing   Sum  
------------- ------ ------------ --------- --------- -----
**male**      338    28           19        25        410  

**female**    234    3            9         17        263  

**Missing**   27     2            2         5         36   

**Sum**       599    33           30        47        709  
-----------------------------------------------------------

Table: Counted values



Most of the cases (338) can be found in "male-city" categories. Row-wise "male" holds the highest number of cases (410) while column-wise "city" has the utmost cases (599).



# Percentages





------------------------------------------------------------
&nbsp;        city   small town   village   Missing   Sum   
------------- ------ ------------ --------- --------- ------
**male**      47.67  3.95         2.68      3.53      57.83 

**female**    33.00  0.42         1.27      2.40      37.09 

**Missing**   3.81   0.28         0.28      0.71      5.08  

**Sum**       84.49  4.65         4.23      6.63      100.00
------------------------------------------------------------

Table: Total percentages






-----------------------------------------------------
&nbsp;        city   small town   village   Missing  
------------- ------ ------------ --------- ---------
**male**      82.44  6.83         4.63      6.10     

**female**    88.97  1.14         3.42      6.46     

**Missing**   75.00  5.56         5.56      13.89    

**Sum**       84.49  4.65         4.23      6.63     
-----------------------------------------------------

Table: Row percentages






-----------------------------------------------------------
&nbsp;        city   small town   village   Missing   Sum  
------------- ------ ------------ --------- --------- -----
**male**      56.43  84.85        63.33     53.19     57.83

**female**    39.07  9.09         30.00     36.17     37.09

**Missing**   4.51   6.06         6.67      10.64     5.08 
-----------------------------------------------------------

Table: Column percentages




# Chi-squared test






-------------------------------
 Test statistic   df   P value 
---------------- ---- ---------
     16.18        6    0.01282 
-------------------------------

Table: Pearson's Chi-squared test: `table`



It seems that a real association can be pointed out between *gender* and *dwell* by the *Pearson's Chi-squared test* (χ=_16.18_ at the degree of freedom being _6_) at the significance level of _0.01282_.
Based on Goodman and Kruskal's lambda it seems that *dwell* (λ=_0.6321_) has an effect on *gender* (λ=_0_) if we assume both variables to be nominal.
The association between the two variables seems to be weak based on Cramer's V (_0.08722_).








------------------------------------------
&nbsp;       city   small town   village  
------------ ------ ------------ ---------
**male**     -3.08  3.43         0.76     

**female**   3.08   -3.43        -0.76    
------------------------------------------

Table: Pearson's residuals



Based on Pearson's resuals the following cells seems interesting (with values higher then `2` or lower then `-2`):

 * "male - city"
 * "female - city"
 * "male - small town"
 * "female - small town"



# Charts



[![Mosaic chart](plots/crosstable-1.png)](plots/crosstable-1-hires.png)



#################################################################################
##	 Running: rapport('crosstable', data=ius2008, row='email', col='dwell')
#################################################################################


# Variable description


Two variables specified:

 * "email" ("Email usage") with _672_ and
 * "dwell" ("Dwelling") with _662_ valid values.


# Counts








-----------------------------------------------
&nbsp;            city   small town   village  
----------------- ------ ------------ ---------
**never**         12     0            0        

**very rarely**   30     1            3        

**rarely**        41     3            1        

**sometimes**     67     4            8        

**often**         101    10           5        

**very often**    88     5            5        

**always**        226    9            7        

**Missing**       34     1            1        

**Sum**           599    33           30       
-----------------------------------------------

Table: Counted values (continued below)

 
---------------------------------
&nbsp;            Missing   Sum  
----------------- --------- -----
**never**         1         13   

**very rarely**   2         36   

**rarely**        1         46   

**sometimes**     8         87   

**often**         7         123  

**very often**    10        108  

**always**        17        259  

**Missing**       1         37   

**Sum**           47        709  
---------------------------------



Most of the cases (226) can be found in "always-city" categories. Row-wise "always" holds the highest number of cases (259) while column-wise "city" has the utmost cases (599).



# Percentages





-----------------------------------------------
&nbsp;            city   small town   village  
----------------- ------ ------------ ---------
**never**         1.69   0.00         0.00     

**very rarely**   4.23   0.14         0.42     

**rarely**        5.78   0.42         0.14     

**sometimes**     9.45   0.56         1.13     

**often**         14.25  1.41         0.71     

**very often**    12.41  0.71         0.71     

**always**        31.88  1.27         0.99     

**Missing**       4.80   0.14         0.14     

**Sum**           84.49  4.65         4.23     
-----------------------------------------------

Table: Total percentages (continued below)

 
----------------------------------
&nbsp;            Missing   Sum   
----------------- --------- ------
**never**         0.14      1.83  

**very rarely**   0.28      5.08  

**rarely**        0.14      6.49  

**sometimes**     1.13      12.27 

**often**         0.99      17.35 

**very often**    1.41      15.23 

**always**        2.40      36.53 

**Missing**       0.14      5.22  

**Sum**           6.63      100.00
----------------------------------






---------------------------------------------------------
&nbsp;            city   small town   village   Missing  
----------------- ------ ------------ --------- ---------
**never**         92.31  0.00         0.00      7.69     

**very rarely**   83.33  2.78         8.33      5.56     

**rarely**        89.13  6.52         2.17      2.17     

**sometimes**     77.01  4.60         9.20      9.20     

**often**         82.11  8.13         4.07      5.69     

**very often**    81.48  4.63         4.63      9.26     

**always**        87.26  3.47         2.70      6.56     

**Missing**       91.89  2.70         2.70      2.70     

**Sum**           84.49  4.65         4.23      6.63     
---------------------------------------------------------

Table: Row percentages






-----------------------------------------------
&nbsp;            city   small town   village  
----------------- ------ ------------ ---------
**never**         2.00   0.00         0.00     

**very rarely**   5.01   3.03         10.00    

**rarely**        6.84   9.09         3.33     

**sometimes**     11.19  12.12        26.67    

**often**         16.86  30.30        16.67    

**very often**    14.69  15.15        16.67    

**always**        37.73  27.27        23.33    

**Missing**       5.68   3.03         3.33     
-----------------------------------------------

Table: Column percentages (continued below)

 
---------------------------------
&nbsp;            Missing   Sum  
----------------- --------- -----
**never**         2.13      1.83 

**very rarely**   4.26      5.08 

**rarely**        2.13      6.49 

**sometimes**     17.02     12.27

**often**         14.89     17.35

**very often**    21.28     15.23

**always**        36.17     36.53

**Missing**       2.13      5.22 
---------------------------------




# Chi-squared test






-------------------------------
 Test statistic   df   P value 
---------------- ---- ---------
     20.63        21   0.4818  
-------------------------------

Table: Pearson's Chi-squared test: `table`



It seems that no real association can be pointed out between *email* and *dwell* by the *Pearson's Chi-squared test* (χ=_20.63_ at the degree of freedom being _21_) at the significance level of _0.4818_.
For this end no other statistical tests were performed.








-----------------------------------------------
&nbsp;            city   small town   village  
----------------- ------ ------------ ---------
**never**         1.15   -0.81        -0.77    

**very rarely**   -0.41  -0.59        1.20     

**rarely**        0.20   0.49         -0.80    

**sometimes**     -1.75  -0.02        2.49     

**often**         -1.28  1.90         -0.18    

**very often**    -0.17  0.00         0.24     

**always**        2.10   -1.26        -1.64    
-----------------------------------------------

Table: Pearson's residuals



Based on Pearson's resuals the following cells seems interesting (with values higher then `2` or lower then `-2`):

 * "always - city"
 * "sometimes - village"



# Charts



[![Mosaic chart](plots/crosstable-2.png)](plots/crosstable-2-hires.png)



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
	<li><a href="demo/crosstable.pdf" target="_blank">pdf</a></li>
	<li><a href="demo/crosstable.docx">docx (MS Word 2007 format)</a></li>
	<li><a href="demo/crosstable.odt">odt (MS Word compatible)</a></li>
	<li><a href="demo/crosstable.rtf">rtf (MS Word compatible)</a></li>
	<li><a href="demo/crosstable.epub">epub</a></li>
</ul>
<h6>Other morkdown formats</h6>
<ul>
	<li><a href="demo/crosstable.textile" target="_blank">textile</a></li>
	<li><a href="demo/crosstable.docbook" target="_blank">docbook</a></li>
	<li><a href="demo/crosstable.man" target="_blank">man</a></li>
	<li><a href="demo/crosstable.md" target="_blank">markdown</a></li>
	<li><a href="demo/crosstable.mediawiki" target="_blank">mediawiki</a></li>
	<li><a href="demo/crosstable.wiki" target="_blank">wiki</a></li>
	<li><a href="demo/crosstable.org" target="_blank">org</a></li>
	<li><a href="demo/crosstable.pandoc" target="_blank">pandoc</a></li>
</ul>
</div></li>
	<li id="source-crosstable"><div>
<h5>Source of `crosstable.tpl`</h5>
{% highlight text %}

<!--head
Title:          Crosstable
Author:         Gergely Daróczi
Email:          gergely@snowl.net
Description:    Returning the Chi-squared test of two given variables with count, percentages and Pearson's residuals table.
Packages:       descr
Data required:  TRUE
Example:        rapport('crosstable', data=ius2008, row='gender', col='dwell')
		rapport('crosstable', data=ius2008, row='email', col='dwell')

row             | *factor | Row variable        | A categorical variable.
col             | *factor | Column variable     | A categorical variable.
annotation	| TRUE	  | Annotation		| Should textual annotations be added to the report?
head-->

# Variable description

Two variables specified:

 * "<%=rp.name(row)%>"<%=ifelse(rp.label(row)==rp.name(row), '', sprintf(' ("%s")', rp.label(row)))%> with <%=rp.valid(as.numeric(row))%> and
 * "<%=rp.name(col)%>"<%=ifelse(rp.label(col)==rp.name(col), '', sprintf(' ("%s")', rp.label(col)))%> with <%=rp.valid(as.numeric(col))%> valid values.

# Counts

<%=
table		<- table(row, col, deparse.level = 0, useNA = 'ifany')
if (length(which(is.na(rownames(table)))) > 0)
    rownames(table)[which(is.na(rownames(table)))] <- 'Missing'
if (length(which(is.na(colnames(table)))) > 0)
    colnames(table)[which(is.na(colnames(table)))] <- 'Missing'
fulltable	<- addmargins(table)
# fulltable.nrow  <- nrow(fulltable)
# fulltable.ncol  <- ncol(fulltable)
# fulltable[fulltable.nrow, ] <- paste0('**', fulltable[fulltable.nrow, ], '**')
# rownames(fulltable)[fulltable.nrow] <- paste0('**', rownames(fulltable)[fulltable.nrow], '**')
# fulltable[1:fulltable.nrow-1, fulltable.ncol] <- paste0('**', fulltable[1:fulltable.nrow-1, fulltable.ncol], '**')
set.caption('Counted values')
fulltable
%>

<%=
if (annotation) {
   table.max <- which(table == max(table), arr.ind = TRUE)
   sprintf('Most of the cases (%s) can be found in "%s" categories. Row-wise "%s" holds the highest number of cases (%s) while column-wise "%s" has the utmost cases (%s).', table[table.max], paste(rownames(table)[table.max[,1]], colnames(table)[table.max[,2]], sep = '-'), names(which.max(rowSums(table))), max(rowSums(table)), names(which.max(colSums(table))), max(colSums(table)))
}
%>

# Percentages

<%=
set.caption('Total percentages')
fulltable <- round(addmargins(prop.table(table)*100), 2)
# fulltable <- trim.space(fulltable, leading = TRUE)
# fulltable.nrow  <- nrow(fulltable)
# fulltable.ncol  <- ncol(fulltable)
# fulltable[fulltable.nrow, ] <- paste0('**', fulltable[fulltable.nrow, ], '**')
# rownames(fulltable)[fulltable.nrow] <- paste0('**', rownames(fulltable)[fulltable.nrow], '**')
# fulltable[1:fulltable.nrow-1, fulltable.ncol] <- paste0('**', fulltable[1:fulltable.nrow-1, fulltable.ncol], '**')
fulltable
%>

<%=
set.caption('Row percentages')
fulltable <- round(prop.table(addmargins(table, 1), 1)*100, 2)
# fulltable <- trim.space(fulltable, leading = TRUE)
# fulltable.nrow  <- nrow(fulltable)
# fulltable[fulltable.nrow, ] <- paste0('**', fulltable[fulltable.nrow, ], '**')
# rownames(fulltable)[fulltable.nrow] <- paste0('**', rownames(fulltable)[fulltable.nrow], '**')
fulltable
%>

<%=
set.caption('Column percentages')
fulltable <- round(prop.table(addmargins(table,2 ), 2)*100, 2)
# fulltable <- trim.space(fulltable, leading = TRUE)
# fulltable.ncol  <- ncol(fulltable)
# fulltable[, fulltable.ncol] <- paste0('**', fulltable[, fulltable.ncol], '**')
fulltable
%>

# Chi-squared test

<%=
t <- suppressWarnings(chisq.test(table))
lambda <- lambda.test(table)
cramer <- sqrt(as.numeric(t$statistic)/(sum(table)*min(dim(table))))
t
%>

<%=
ifelse(t$p.value < 0.05, sprintf('It seems that a real association can be pointed out between *%s* and *%s* by the *%s* (χ=%s at the degree of freedom being %s) at the significance level of %s.\nBased on Goodman and Kruskal\'s lambda it seems that *%s* (λ=%s) has an effect on *%s* (λ=%s) if we assume both variables to be nominal.\nThe association between the two variables seems to be %s based on Cramer\'s V (%s).', rp.name(row), rp.name(col), t$method, pander.return(as.numeric(t$statistic)), pander.return(as.numeric(t$parameter)), pander.return(t$p.value), c(rp.name(col),rp.name(row))[which.max(lambda)], pander.return(max(as.numeric(lambda))), c(rp.name(col),rp.name(row))[which.min(lambda)], pander.return(min(as.numeric(lambda))), ifelse(cramer < 0.5, "weak", "strong"), pander.return(cramer)), sprintf('It seems that no real association can be pointed out between *%s* and *%s* by the *%s* (χ=%s at the degree of freedom being %s) at the significance level of %s.\nFor this end no other statistical tests were performed.', rp.name(row), rp.name(col), t$method, pander.return(as.numeric(t$statistic)), pander.return(as.numeric(t$parameter)), pander.return(t$p.value)))
%>

<%=
set.caption('Pearson\'s residuals')
table		<- table(row, col, deparse.level = 0)
table.res <- suppressWarnings(CrossTable(table))$chisq$stdres
table.res <- round(table.res, 2)
table.res.highlow  <- which(table.res < -2 | table.res > 2, arr.ind = TRUE)
#table.res <- trim.space(round(table.res, 2), leading = TRUE)
#table.res[table.res.highlow] <- paste0('**', table.res[table.res.highlow], '**')
table.res
%>

<%=
if (annotation) {
   ## table.res.high     <- which(table.res >  2, arr.ind = TRUE)
   ## table.res.low      <- which(table.res < -2, arr.ind = TRUE)
   if (nrow(table.res.highlow) > 0)
      sprintf('Based on Pearson\'s resuals the following cells seems interesting (with values higher then `2` or lower then `-2`):\n%s', paste(sapply(1:nrow(table.res.highlow), function(i) sprintf('\n * "%s - %s"', rownames(table)[table.res.highlow[i, 1]], colnames(table)[table.res.highlow[i, 2]])), collapse = ''))
   else
      sprintf('No interesting (higher then `2` or lower then `-2`) values found based on Pearson\'s residuals.')

}
%>

# Charts

<%=
set.caption('Mosaic chart')
mosaicplot(table, shade=T, main=NULL)
%>

{% endhighlight %}
</div></li>
</ul>

<a id="descriptives"> </a>
#### descriptives.tpl

 <ul class="tabs">
	<li><a class="active" href="#info-descriptives">Description</a></li>
	<li><a href="#inputs-descriptives">Inputs</a></li>
	<li><a href="#example-descriptives">Example</a></li>
	<li><a href="#export-descriptives">Export</a></li>
	<li><a href="#source-descriptives">Source</a></li>
</ul>

 <ul class="tabs-content">
	<li class="active" id="info-descriptives"><div><h5>Descriptive statistics</h5> by <em>Gergely Daróczi</em>
<br><br>
 This template will return descriptive statistics of a numerical or frequency table of a categorical variable.
<br><br>
<em>Required packages:</em> 
<br>
<em>Example:</em> 
{% highlight text %}
rapport('descriptives', data=ius2008, var='gender')
rapport('descriptives', data=ius2008, var='age')
rapport('descriptives', data=mtcars, var='hp')
{% endhighlight %}
</div></li>
	<li id="inputs-descriptives"><div><h5>Input parameters</h5><em>descriptives.tpl</em> template has the following options to be (optionally) set while calling <em>rapport</em>:<ul>
	<li><h6>var: <small><em>Variable</em></small></h6>
<div class="options">    <div class="options-desc">Categorical or numerical variable. This template will determine the measurement level of the given variable.
</div>
    <em>Type:</em>	variable
<br>
    <em>Limits:</em>	exactly 1 variable
<br>

</div>
</li>
<br>
</ul></div></li>
	<li id="example-descriptives">
{% highlight text %}


#######################################################################
##	 Running: rapport('descriptives', data=ius2008, var='gender')
#######################################################################


# *gender* ("Gender")


The dataset has _709_ observations with _673_ valid values (missing: _36_).





-----------------------------------------
gender   N   %      Cumul. N   Cumul. %  
-------- --- ------ ---------- ----------
male     410 60.92  410        60.92     

female   263 39.08  673        100.00    

Total    673 100.00 673        100.00    
-----------------------------------------

Table: Frequency table: Gender



The most frequent value is *male*.


## Charts



[![Barplot: Gender](plots/descriptives-1.png)](plots/descriptives-1-hires.png)


It seems that the highest value is _2_ which is exactly _2_ times higher than the smallest value (_1_).




####################################################################
##	 Running: rapport('descriptives', data=ius2008, var='age')
####################################################################


# *age* ("Age")


The dataset has _709_ observations with _677_ valid values (missing: _32_).



## Base statistics




-----------------------------
Variable   mean   sd    var  
---------- ------ ----- -----
Age        24.57  6.849 46.91
-----------------------------

Table: Descriptives: Age



The standard deviation is _6.849_ (variance: _46.91_). The expected value is around _24.57_, somewhere between _24.06_ and _25.09_ with the standard error of _0.2632_.


## Charts



[![Histogram: Age](plots/descriptives-2.png)](plots/descriptives-2-hires.png)


It seems that the highest value is _58_ which is exactly _3.625_ times higher than the smallest value (_16_).

If we *suppose* that *Age* is not near to a normal distribution (skewness: _1.925_, kurtosis: _4.463_), checking the median (_23_) might be a better option instead of the mean. The interquartile range (_6_) measures the statistics dispersion of the variable (similar to standard deviation) based on median.




##################################################################
##	 Running: rapport('descriptives', data=mtcars, var='hp')
##################################################################


# *hp*


The dataset has _32_ observations with _32_ valid values (missing: _0_).



## Base statistics




-----------------------------
Variable   mean   sd    var  
---------- ------ ----- -----
hp         146.7  68.56 4701 
-----------------------------

Table: Descriptives: hp



The standard deviation is _68.56_ (variance: _4701_). The expected value is around _146.7_, somewhere between _122.9_ and _170.4_ with the standard error of _12.12_.


## Charts



[![Histogram: hp](plots/descriptives-3.png)](plots/descriptives-3-hires.png)


It seems that the highest value is _335_ which is exactly _6.442_ times higher than the smallest value (_52_).

If we *suppose* that *hp* is not near to a normal distribution (skewness: _0.726_, kurtosis: _-0.1356_), checking the median (_123_) might be a better option instead of the mean. The interquartile range (_83.5_) measures the statistics dispersion of the variable (similar to standard deviation) based on median.




{% endhighlight %}
</li>
	<li id="export-descriptives"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport('descriptives', data=ius2008, var='gender')
rapport('descriptives', data=ius2008, var='age')
rapport('descriptives', data=mtcars, var='hp')

{% endhighlight %}
<h6>Popular formats:</h6>
<ul>
	<li><a href="demo/descriptives.html" target="_blank">HTML</a></li>
	<li><a href="demo/descriptives.pdf" target="_blank">pdf</a></li>
	<li><a href="demo/descriptives.docx">docx (MS Word 2007 format)</a></li>
	<li><a href="demo/descriptives.odt">odt (MS Word compatible)</a></li>
	<li><a href="demo/descriptives.rtf">rtf (MS Word compatible)</a></li>
	<li><a href="demo/descriptives.epub">epub</a></li>
</ul>
<h6>Other morkdown formats</h6>
<ul>
	<li><a href="demo/descriptives.textile" target="_blank">textile</a></li>
	<li><a href="demo/descriptives.docbook" target="_blank">docbook</a></li>
	<li><a href="demo/descriptives.man" target="_blank">man</a></li>
	<li><a href="demo/descriptives.md" target="_blank">markdown</a></li>
	<li><a href="demo/descriptives.mediawiki" target="_blank">mediawiki</a></li>
	<li><a href="demo/descriptives.wiki" target="_blank">wiki</a></li>
	<li><a href="demo/descriptives.org" target="_blank">org</a></li>
	<li><a href="demo/descriptives.pandoc" target="_blank">pandoc</a></li>
</ul>
</div></li>
	<li id="source-descriptives"><div>
<h5>Source of `descriptives.tpl`</h5>
{% highlight text %}

<!--head
Title:          Descriptive statistics
Author:         Gergely Daróczi
Email:          gergely@snowl.net
Description:    This template will return descriptive statistics of a numerical or frequency table of a categorical variable.
Data required:  TRUE
Example:        rapport('descriptives', data=ius2008, var='gender')
                rapport('descriptives', data=ius2008, var='age')
                rapport('descriptives', data=mtcars, var='hp')

var            | *variable[1]| Variable         | Categorical or numerical variable. This template will determine the measurement level of the given variable.
head-->

# *<%=rp.name(var)%>*<%=ifelse(rp.label(var)==rp.name(var), '', sprintf(' ("%s")', rp.label(var)))%>

The dataset has <%=nvar<-as.numeric(var); length(nvar)%> observations with <%=rp.valid(nvar)%> valid values (missing: <%=rp.missing(nvar)%>).

<%if (is.numeric(var)) { %>
## Base statistics

<%=
set.caption(sprintf('Descriptives: %s', rp.label(var)))
rp.desc(rp.name(var), NULL, c('mean', 'sd', 'var'), rp.data)
%>

The standard deviation is <%=rp.sd(var)%> (variance: <%=rp.var(var)%>). The expected value is around <%=rp.mean(var)%>, somewhere between <%=rp.mean(var)-1.96*rp.se.mean(var)%> and <%=rp.mean(var)+1.96*rp.se.mean(var)%> with the standard error of <%=rp.se.mean(var)%>.

## Charts

<%=
set.caption(sprintf('Histogram: %s', rp.label(var)))
hist(var)
%>

It seems that the highest value is <%=rp.max(var)%> which is exactly <%=pander.return(rp.max(var)/rp.min(var))%> times higher than the smallest value (<%=rp.min(var)%>).

If we *suppose* that *<%=rp.label(var)%>* is not near to a normal distribution (skewness: <%=rp.skewness(var)%>, kurtosis: <%=rp.kurtosis(var)%>), checking the median (<%=rp.median(var)%>) might be a better option instead of the mean. The interquartile range (<%=rp.iqr(var)%>) measures the statistics dispersion of the variable (similar to standard deviation) based on median.

<%} else { %>

<%=
set.caption(sprintf('Frequency table: %s', rp.label(var)))
rp.freq(rp.name(var), rp.data, na.rm = FALSE, include.na = TRUE)
%>

The most frequent value is *<%=t <- table(var); names(t[t==max(t)])%>*.

## Charts

<%=
set.caption(sprintf('Barplot: %s', rp.label(var)))
rp.barplot(var)
%>

It seems that the highest value is <%=rp.max(nvar)%> which is exactly <%=pander.return(rp.max(nvar)/rp.min(nvar))%> times higher than the smallest value (<%=rp.min(nvar)%>).

<% } %>

{% endhighlight %}
</div></li>
</ul>

<a id="example"> </a>
#### example.tpl

 <ul class="tabs">
	<li><a class="active" href="#info-example">Description</a></li>
	<li><a href="#inputs-example">Inputs</a></li>
	<li><a href="#example-example">Example</a></li>
	<li><a href="#export-example">Export</a></li>
	<li><a href="#source-example">Source</a></li>
</ul>

 <ul class="tabs-content">
	<li class="active" id="info-example"><div><h5>Example template</h5> by <em>Gergely Daróczi</em>
<br><br>
 This template demonstrates the basic features of rapport. We all hope you will like it!
<br><br>
<em>Required packages:</em> NA
<br>
<em>Example:</em> 
{% highlight text %}
rapport("example", ius2008, var='leisure')
rapport("example", ius2008, var='leisure', desc=FALSE)
rapport("example", ius2008, var='leisure', desc=FALSE, histogram=T)
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
<li><h6>desc: <small><em>Descriptive</em></small></h6>
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
<li><h6>histogram: <small><em>Histogram</em></small></h6>
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
</ul></div></li>
	<li id="example-example">
{% highlight text %}


##############################################################
##	 Running: rapport("example", ius2008, var='leisure')
##############################################################


# Début


Hello, world!

I have just specified a *Variable* in this template named to **leisure**. The label of this variable is "Internet usage in leisure time (hours per day)".

And wow, the mean of *leisure* is _3.199_!




By checking out the [sources of this template](https://github.com/aL3xa/rapport/blob/master/inst/templates/example.tpl), you could see that we used all `BRCATCODE`s above from `brew` syntax. `BRCODE` tags are useful when you want to loop through something or optionally add or remove a part of the template. A really easy example of this: if `desc` input equals to `TRUE`, then the resulting report would have that chunk, if set to `FALSE`, it would be left our.




## Descriptive statistics



--------------------------------------------------------
Min.   1st Qu.   Median   Mean   3rd Qu.   Max.   NA's  
------ --------- -------- ------ --------- ------ ------
0.000  2.000     3.000    3.199  4.000     12.000 37    
--------------------------------------------------------



The 5 highest values are: _12_, _12_, _10_, _10_ and _10_.







##########################################################################
##	 Running: rapport("example", ius2008, var='leisure', desc=FALSE)
##########################################################################


# Début


Hello, world!

I have just specified a *Variable* in this template named to **leisure**. The label of this variable is "Internet usage in leisure time (hours per day)".

And wow, the mean of *leisure* is _3.199_!

**For more detailed statistics, you should have set `desc=TRUE`!**


By checking out the [sources of this template](https://github.com/aL3xa/rapport/blob/master/inst/templates/example.tpl), you could see that we used all `BRCATCODE`s above from `brew` syntax. `BRCODE` tags are useful when you want to loop through something or optionally add or remove a part of the template. A really easy example of this: if `desc` input equals to `TRUE`, then the resulting report would have that chunk, if set to `FALSE`, it would be left our.






#######################################################################################
##	 Running: rapport("example", ius2008, var='leisure', desc=FALSE, histogram=T)
#######################################################################################


# Début


Hello, world!

I have just specified a *Variable* in this template named to **leisure**. The label of this variable is "Internet usage in leisure time (hours per day)".

And wow, the mean of *leisure* is _3.199_!

**For more detailed statistics, you should have set `desc=TRUE`!**


By checking out the [sources of this template](https://github.com/aL3xa/rapport/blob/master/inst/templates/example.tpl), you could see that we used all `BRCATCODE`s above from `brew` syntax. `BRCODE` tags are useful when you want to loop through something or optionally add or remove a part of the template. A really easy example of this: if `desc` input equals to `TRUE`, then the resulting report would have that chunk, if set to `FALSE`, it would be left our.






## Histogram


For demonstartion purposes you can find a histogram below:


[![A nice histogram](plots/example-1.png)](plots/example-1-hires.png)





{% endhighlight %}
</li>
	<li id="export-example"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport("example", ius2008, var='leisure')
rapport("example", ius2008, var='leisure', desc=FALSE)
rapport("example", ius2008, var='leisure', desc=FALSE, histogram=T)

{% endhighlight %}
<h6>Popular formats:</h6>
<ul>
	<li><a href="demo/example.html" target="_blank">HTML</a></li>
	<li><a href="demo/example.pdf" target="_blank">pdf</a></li>
	<li><a href="demo/example.docx">docx (MS Word 2007 format)</a></li>
	<li><a href="demo/example.odt">odt (MS Word compatible)</a></li>
	<li><a href="demo/example.rtf">rtf (MS Word compatible)</a></li>
	<li><a href="demo/example.epub">epub</a></li>
</ul>
<h6>Other morkdown formats</h6>
<ul>
	<li><a href="demo/example.textile" target="_blank">textile</a></li>
	<li><a href="demo/example.docbook" target="_blank">docbook</a></li>
	<li><a href="demo/example.man" target="_blank">man</a></li>
	<li><a href="demo/example.md" target="_blank">markdown</a></li>
	<li><a href="demo/example.mediawiki" target="_blank">mediawiki</a></li>
	<li><a href="demo/example.wiki" target="_blank">wiki</a></li>
	<li><a href="demo/example.org" target="_blank">org</a></li>
	<li><a href="demo/example.pandoc" target="_blank">pandoc</a></li>
</ul>
</div></li>
	<li id="source-example"><div>
<h5>Source of `example.tpl`</h5>
{% highlight text %}

<!--head
Title:          Example template
Author:         Gergely Daróczi
Description:    This template demonstrates the basic features of rapport. We all hope you will like it!
Packages:       lattice
Data required:  TRUE
Example:        rapport("example", ius2008, var='leisure')
                rapport("example", ius2008, var='leisure', desc=FALSE)
                rapport("example", ius2008, var='leisure', desc=FALSE, histogram=T)

var         | *numeric           | Variable    | A numeric variable.
desc        | TRUE               | Descriptive | Show descriptive statistics of specified variable?
histogram   | FALSE              | Histogram   | Show histogram of specified variable?
head-->

# Début

Hello, world!

I have just specified a *Variable* in this template named to **<%=rp.name(var)%>**. The label of this variable is "<%=rp.label(var)%>".

And wow, the mean of *<%=rp.name(var)%>* is <%=rp.mean(var)%>!

<%=
if (!desc) '**For more detailed statistics, you should have set `desc=TRUE`!**'
%>

By checking out the [sources of this template](https://github.com/aL3xa/rapport/blob/master/inst/templates/example.tpl), you could see that we used all `BRCATCODE`s above from `brew` syntax. `BRCODE` tags are useful when you want to loop through something or optionally add or remove a part of the template. A really easy example of this: if `desc` input equals to `TRUE`, then the resulting report would have that chunk, if set to `FALSE`, it would be left our.

<%if (desc) { %>

## Descriptive statistics

<%=summary(var)%>

<%=
sprintf('The 5 highest values are: %s.', p(sort(var, decreasing = TRUE)[1:5]))
%>

<% } %>

<%if (histogram) { %>

## Histogram

For demonstartion purposes you can find a histogram below:

<%=
set.caption('A nice histogram')
rp.hist(var)
%>

<% } %>

{% endhighlight %}
</div></li>
</ul>

<a id="nortest"> </a>
#### nortest.tpl

 <ul class="tabs">
	<li><a class="active" href="#info-nortest">Description</a></li>
	<li><a href="#inputs-nortest">Inputs</a></li>
	<li><a href="#example-nortest">Example</a></li>
	<li><a href="#export-nortest">Export</a></li>
	<li><a href="#source-nortest">Source</a></li>
</ul>

 <ul class="tabs-content">
	<li class="active" id="info-nortest"><div><h5>Normality Tests</h5> by <em>Aleksandar Blagotić</em>
<br><br>
 Overview of several normality tests and diagnostic plots that can screen departures from normality.
<br><br>
<em>Required packages:</em> nortest
<br>
<em>Example:</em> 
{% highlight text %}
rapport("nortest", ius2008, var = "leisure")
rapport("nortest", ius2008, var = "leisure", nc.plot = FALSE)
rapport("nortest", ius2008, var = "leisure", qq.line = FALSE)
{% endhighlight %}
</div></li>
	<li id="inputs-nortest"><div><h5>Input parameters</h5><em>nortest.tpl</em> template has the following options to be (optionally) set while calling <em>rapport</em>:<ul>
	<li><h6>var: <small><em>Test variables</em></small></h6>
<div class="options">    <div class="options-desc">Variables to test for normality
</div>
    <em>Type:</em>	numeric
<br>
    <em>Limits:</em>	exactly 1 variable
<br>

</div>
</li>
<br>
<li><h6>nc.plot: <small><em>Normal curve plot</em></small></h6>
<div class="options">    <div class="options-desc">Plot normal curve?
</div>
    <em>Type:</em>	boolean
<br>
    <em>Limits:</em>	exactly 1 variable
<br>
    <em>Default value:</em>	TRUE
</div>
</li>
<br>
<li><h6>qq.line: <small><em>Q-Q plot line</em></small></h6>
<div class="options">    <div class="options-desc">Add line to Q-Q plot?
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
	<li id="example-nortest">
{% highlight text %}


################################################################
##	 Running: rapport("nortest", ius2008, var = "leisure")
################################################################


# Introduction


In statistics, _normality_ refers to an assumption that the distribution of a random variable follows _normal_ (_Gaussian_) distribution. Because of its bell-like shape, it's also known as the _"bell curve"_. The formula for _normal distribution_ is:

$$f(x) = \frac{1}{\sqrt{2\pi{}\sigma{}^2}} e^{-\frac{(x-\mu{})^2}{2\sigma{}^2}}$$

_Normal distribution_ belongs to a _location-scale family_ of distributions, as it's defined two parameters:

 - *&mu;* - _mean_ or _expectation_ (location parameter)
 - *&sigma;^2^* - _variance_ (scale parameter)

[![](plots/nortest-1.png)](plots/nortest-1-hires.png)



# Normality Tests



## Overview


Various hypothesis tests can be applied in order to test if the distribution of given random variable violates normality assumption. These procedures test the H~0~ that provided variable's distribution is _normal_. At this point only few such tests will be covered: the ones that are available in `stats` package (which comes bundled with default R installation) and `nortest` package that is [available](http://cran.r-project.org/web/packages/nortest/index.html) on CRAN.

 - **Shapiro-Wilk test** is a powerful normality test appropriate for small samples. In R, it's implemented in `shapiro.test` function available in `stats` package.
 - **Lilliefors test** is a modification of _Kolmogorov-Smirnov test_ appropriate for testing normality when parameters or normal distribution (_&mu;_, _&sigma;^2^_) are not known. `lillie.test` function is located in `nortest` package.
 - **Anderson-Darling test** is one of the most powerful normality tests as it will detect the most of departures from normality. You can find `ad.test` function in `nortest` package.
 - **Pearson &Chi;^2^ test** is another normality test which takes more "traditional" approach in normality testing. `pearson.test` is located in `nortest` package.


## Results


Here you can see the results of applied normality tests (_p-values_ less than 0.05 indicate significant discrepancies):




--------------------------------------------------
Method                       Statistic   p-value  
---------------------------- ----------- ---------
Shapiro-Wilk normality test  0.9001      1.617e-20

Lilliefors                   0.1680      3.000e-52
(Kolmogorov-Smirnov)                              
normality test                                    

Anderson-Darling normality   18.7530     7.261e-44
test                                              

Pearson chi-square normality 1791.2500   0.000e+00
test                                              
--------------------------------------------------

Table: A nice histogram



So, let's draw some conclusions based on applied normality test:

 - according to _Shapiro-Wilk test_, the distribution of _Internet usage in leisure time (hours per day)_ is  normal.
 - based on _Lilliefors test_, distribution of _Internet usage in leisure time (hours per day)_ is not normal
 - _Anderson-Darling test_ confirms  normality assumption
 - _Pearson's &Chi;^2^ test_ classifies the underlying distribution as non-normal


# Diagnostic Plots


There are various plots that can help you decide about the normality of the distribution. Only a few most commonly used plots will be shown: _histogram_, _Q-Q plot_ and _kernel density plot_.


## Histogram


_Histogram_ was first introduced by _Karl Pearson_ and it's probably the most popular plot for depicting the probability distribution of a random variable. However, the decision depends on number of bins, so it can sometimes be misleading. If the variable distribution is normal, bins should resemble the "bell-like" shape.

[![A nice histogram](plots/example-1.png)](plots/example-1-hires.png)



## Q-Q Plot


"Q" in _Q-Q plot_ stands for _quantile_, as this plot compares empirical and theoretical distribution (in this case, _normal_ distribution) by plotting their quantiles against each other. For normal distribution, plotted dots should approximate a "straight", `x = y` line.

[![](plots/nortest-2.png)](plots/nortest-2-hires.png)



## Kernel Density Plot


_Kernel density plot_ is a plot of smoothed _empirical distribution function_. As such, it provides good insight about the shape of the distribution. For normal distributions, it should resemble the well known "bell shape".

[![](plots/nortest-3.png)](plots/nortest-3-hires.png)



#################################################################################
##	 Running: rapport("nortest", ius2008, var = "leisure", nc.plot = FALSE)
#################################################################################


# Introduction


In statistics, _normality_ refers to an assumption that the distribution of a random variable follows _normal_ (_Gaussian_) distribution. Because of its bell-like shape, it's also known as the _"bell curve"_. The formula for _normal distribution_ is:

$$f(x) = \frac{1}{\sqrt{2\pi{}\sigma{}^2}} e^{-\frac{(x-\mu{})^2}{2\sigma{}^2}}$$

_Normal distribution_ belongs to a _location-scale family_ of distributions, as it's defined two parameters:

 - *&mu;* - _mean_ or _expectation_ (location parameter)
 - *&sigma;^2^* - _variance_ (scale parameter)





# Normality Tests



## Overview


Various hypothesis tests can be applied in order to test if the distribution of given random variable violates normality assumption. These procedures test the H~0~ that provided variable's distribution is _normal_. At this point only few such tests will be covered: the ones that are available in `stats` package (which comes bundled with default R installation) and `nortest` package that is [available](http://cran.r-project.org/web/packages/nortest/index.html) on CRAN.

 - **Shapiro-Wilk test** is a powerful normality test appropriate for small samples. In R, it's implemented in `shapiro.test` function available in `stats` package.
 - **Lilliefors test** is a modification of _Kolmogorov-Smirnov test_ appropriate for testing normality when parameters or normal distribution (_&mu;_, _&sigma;^2^_) are not known. `lillie.test` function is located in `nortest` package.
 - **Anderson-Darling test** is one of the most powerful normality tests as it will detect the most of departures from normality. You can find `ad.test` function in `nortest` package.
 - **Pearson &Chi;^2^ test** is another normality test which takes more "traditional" approach in normality testing. `pearson.test` is located in `nortest` package.


## Results


Here you can see the results of applied normality tests (_p-values_ less than 0.05 indicate significant discrepancies):




--------------------------------------------------
Method                       Statistic   p-value  
---------------------------- ----------- ---------
Shapiro-Wilk normality test  0.9001      1.617e-20

Lilliefors                   0.1680      3.000e-52
(Kolmogorov-Smirnov)                              
normality test                                    

Anderson-Darling normality   18.7530     7.261e-44
test                                              

Pearson chi-square normality 1791.2500   0.000e+00
test                                              
--------------------------------------------------



So, let's draw some conclusions based on applied normality test:

 - according to _Shapiro-Wilk test_, the distribution of _Internet usage in leisure time (hours per day)_ is  normal.
 - based on _Lilliefors test_, distribution of _Internet usage in leisure time (hours per day)_ is not normal
 - _Anderson-Darling test_ confirms  normality assumption
 - _Pearson's &Chi;^2^ test_ classifies the underlying distribution as non-normal


# Diagnostic Plots


There are various plots that can help you decide about the normality of the distribution. Only a few most commonly used plots will be shown: _histogram_, _Q-Q plot_ and _kernel density plot_.


## Histogram


_Histogram_ was first introduced by _Karl Pearson_ and it's probably the most popular plot for depicting the probability distribution of a random variable. However, the decision depends on number of bins, so it can sometimes be misleading. If the variable distribution is normal, bins should resemble the "bell-like" shape.

[![A nice histogram](plots/example-1.png)](plots/example-1-hires.png)



## Q-Q Plot


"Q" in _Q-Q plot_ stands for _quantile_, as this plot compares empirical and theoretical distribution (in this case, _normal_ distribution) by plotting their quantiles against each other. For normal distribution, plotted dots should approximate a "straight", `x = y` line.

[![](plots/nortest-4.png)](plots/nortest-4-hires.png)



## Kernel Density Plot


_Kernel density plot_ is a plot of smoothed _empirical distribution function_. As such, it provides good insight about the shape of the distribution. For normal distributions, it should resemble the well known "bell shape".

[![](plots/nortest-3.png)](plots/nortest-3-hires.png)



#################################################################################
##	 Running: rapport("nortest", ius2008, var = "leisure", qq.line = FALSE)
#################################################################################


# Introduction


In statistics, _normality_ refers to an assumption that the distribution of a random variable follows _normal_ (_Gaussian_) distribution. Because of its bell-like shape, it's also known as the _"bell curve"_. The formula for _normal distribution_ is:

$$f(x) = \frac{1}{\sqrt{2\pi{}\sigma{}^2}} e^{-\frac{(x-\mu{})^2}{2\sigma{}^2}}$$

_Normal distribution_ belongs to a _location-scale family_ of distributions, as it's defined two parameters:

 - *&mu;* - _mean_ or _expectation_ (location parameter)
 - *&sigma;^2^* - _variance_ (scale parameter)

[![](plots/nortest-1.png)](plots/nortest-1-hires.png)



# Normality Tests



## Overview


Various hypothesis tests can be applied in order to test if the distribution of given random variable violates normality assumption. These procedures test the H~0~ that provided variable's distribution is _normal_. At this point only few such tests will be covered: the ones that are available in `stats` package (which comes bundled with default R installation) and `nortest` package that is [available](http://cran.r-project.org/web/packages/nortest/index.html) on CRAN.

 - **Shapiro-Wilk test** is a powerful normality test appropriate for small samples. In R, it's implemented in `shapiro.test` function available in `stats` package.
 - **Lilliefors test** is a modification of _Kolmogorov-Smirnov test_ appropriate for testing normality when parameters or normal distribution (_&mu;_, _&sigma;^2^_) are not known. `lillie.test` function is located in `nortest` package.
 - **Anderson-Darling test** is one of the most powerful normality tests as it will detect the most of departures from normality. You can find `ad.test` function in `nortest` package.
 - **Pearson &Chi;^2^ test** is another normality test which takes more "traditional" approach in normality testing. `pearson.test` is located in `nortest` package.


## Results


Here you can see the results of applied normality tests (_p-values_ less than 0.05 indicate significant discrepancies):




--------------------------------------------------
Method                       Statistic   p-value  
---------------------------- ----------- ---------
Shapiro-Wilk normality test  0.9001      1.617e-20

Lilliefors                   0.1680      3.000e-52
(Kolmogorov-Smirnov)                              
normality test                                    

Anderson-Darling normality   18.7530     7.261e-44
test                                              

Pearson chi-square normality 1791.2500   0.000e+00
test                                              
--------------------------------------------------



So, let's draw some conclusions based on applied normality test:

 - according to _Shapiro-Wilk test_, the distribution of _Internet usage in leisure time (hours per day)_ is  normal.
 - based on _Lilliefors test_, distribution of _Internet usage in leisure time (hours per day)_ is not normal
 - _Anderson-Darling test_ confirms  normality assumption
 - _Pearson's &Chi;^2^ test_ classifies the underlying distribution as non-normal


# Diagnostic Plots


There are various plots that can help you decide about the normality of the distribution. Only a few most commonly used plots will be shown: _histogram_, _Q-Q plot_ and _kernel density plot_.


## Histogram


_Histogram_ was first introduced by _Karl Pearson_ and it's probably the most popular plot for depicting the probability distribution of a random variable. However, the decision depends on number of bins, so it can sometimes be misleading. If the variable distribution is normal, bins should resemble the "bell-like" shape.

[![A nice histogram](plots/example-1.png)](plots/example-1-hires.png)



## Q-Q Plot


"Q" in _Q-Q plot_ stands for _quantile_, as this plot compares empirical and theoretical distribution (in this case, _normal_ distribution) by plotting their quantiles against each other. For normal distribution, plotted dots should approximate a "straight", `x = y` line.

[![](plots/nortest-5.png)](plots/nortest-5-hires.png)



## Kernel Density Plot


_Kernel density plot_ is a plot of smoothed _empirical distribution function_. As such, it provides good insight about the shape of the distribution. For normal distributions, it should resemble the well known "bell shape".

[![](plots/nortest-3.png)](plots/nortest-3-hires.png)



{% endhighlight %}
</li>
	<li id="export-nortest"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport("nortest", ius2008, var = "leisure")
rapport("nortest", ius2008, var = "leisure", nc.plot = FALSE)
rapport("nortest", ius2008, var = "leisure", qq.line = FALSE)

{% endhighlight %}
<h6>Popular formats:</h6>
<ul>
	<li><a href="demo/nortest.html" target="_blank">HTML</a></li>
	<li><a href="demo/nortest.pdf" target="_blank">pdf</a></li>
	<li><a href="demo/nortest.docx">docx (MS Word 2007 format)</a></li>
	<li><a href="demo/nortest.odt">odt (MS Word compatible)</a></li>
	<li><a href="demo/nortest.rtf">rtf (MS Word compatible)</a></li>
	<li><a href="demo/nortest.epub">epub</a></li>
</ul>
<h6>Other morkdown formats</h6>
<ul>
	<li><a href="demo/nortest.textile" target="_blank">textile</a></li>
	<li><a href="demo/nortest.docbook" target="_blank">docbook</a></li>
	<li><a href="demo/nortest.man" target="_blank">man</a></li>
	<li><a href="demo/nortest.md" target="_blank">markdown</a></li>
	<li><a href="demo/nortest.mediawiki" target="_blank">mediawiki</a></li>
	<li><a href="demo/nortest.wiki" target="_blank">wiki</a></li>
	<li><a href="demo/nortest.org" target="_blank">org</a></li>
	<li><a href="demo/nortest.pandoc" target="_blank">pandoc</a></li>
</ul>
</div></li>
	<li id="source-nortest"><div>
<h5>Source of `nortest.tpl`</h5>
{% highlight text %}

<!--head
Title:          Normality Tests
Author:         Aleksandar Blagotić
Description:    Overview of several normality tests and diagnostic plots that can screen departures from normality.
Packages:       nortest
Data required:  TRUE
Example:        rapport("nortest", ius2008, var = "leisure")
                rapport("nortest", ius2008, var = "leisure", nc.plot = FALSE)
                rapport("nortest", ius2008, var = "leisure", qq.line = FALSE)

var       | *numeric  | Test variables     | Variables to test for normality
nc.plot   | TRUE      | Normal curve plot  | Plot normal curve?
qq.line   | TRUE      | Q-Q plot line      | Add line to Q-Q plot?
head-->

# Introduction

In statistics, _normality_ refers to an assumption that the distribution of a random variable follows _normal_ (_Gaussian_) distribution. Because of its bell-like shape, it's also known as the _"bell curve"_. The formula for _normal distribution_ is:

$$f(x) = \frac{1}{\sqrt{2\pi{}\sigma{}^2}} e^{-\frac{(x-\mu{})^2}{2\sigma{}^2}}$$

_Normal distribution_ belongs to a _location-scale family_ of distributions, as it's defined two parameters:

 - *&mu;* - _mean_ or _expectation_ (location parameter)
 - *&sigma;^2^* - _variance_ (scale parameter)

<%=
# generate normal curve plot
if (nc.plot){
   x <- seq(-3, 3, length.out = 1e3)
   plot(x, dnorm(x), type = "l", ylab = "p", xlab = "", main = "Normal distribution")
}
%>

# Normality Tests

## Overview

Various hypothesis tests can be applied in order to test if the distribution of given random variable violates normality assumption. These procedures test the H~0~ that provided variable's distribution is _normal_. At this point only few such tests will be covered: the ones that are available in `stats` package (which comes bundled with default R installation) and `nortest` package that is [available](http://cran.r-project.org/web/packages/nortest/index.html) on CRAN.

 - **Shapiro-Wilk test** is a powerful normality test appropriate for small samples. In R, it's implemented in `shapiro.test` function available in `stats` package.
 - **Lilliefors test** is a modification of _Kolmogorov-Smirnov test_ appropriate for testing normality when parameters or normal distribution (_&mu;_, _&sigma;^2^_) are not known. `lillie.test` function is located in `nortest` package.
 - **Anderson-Darling test** is one of the most powerful normality tests as it will detect the most of departures from normality. You can find `ad.test` function in `nortest` package.
 - **Pearson &Chi;^2^ test** is another normality test which takes more "traditional" approach in normality testing. `pearson.test` is located in `nortest` package.

## Results

Here you can see the results of applied normality tests (_p-values_ less than 0.05 indicate significant discrepancies):

<%=
if (length(var) > 5000) {
    h <- htest(var, lillie.test, ad.test, pearson.test)
} else {
    h <- htest(var, shapiro.test, lillie.test, ad.test, pearson.test)
}
p <- .05
h
%>

So, let's draw some conclusions based on applied normality test:

 - according to _Shapiro-Wilk test_, the distribution of _<%= var.label %>_ is <%= ifelse(h[1, 2] < p, "not", "") %> normal.
 - based on _Lilliefors test_, distribution of _<%= var.label %>_ is <%= ifelse(h[2, 2], "not normal", "normal") %>
 - _Anderson-Darling test_ confirms <%= ifelse(h[3, 2] < p, "violation of", "") %> normality assumption
 - _Pearson's &Chi;^2^ test_ classifies the underlying distribution as <%= ifelse(h[4, 2], "non-normal", "normal") %>

# Diagnostic Plots

There are various plots that can help you decide about the normality of the distribution. Only a few most commonly used plots will be shown: _histogram_, _Q-Q plot_ and _kernel density plot_.

## Histogram

_Histogram_ was first introduced by _Karl Pearson_ and it's probably the most popular plot for depicting the probability distribution of a random variable. However, the decision depends on number of bins, so it can sometimes be misleading. If the variable distribution is normal, bins should resemble the "bell-like" shape.

<%=
rp.hist(var)
%>

## Q-Q Plot

"Q" in _Q-Q plot_ stands for _quantile_, as this plot compares empirical and theoretical distribution (in this case, _normal_ distribution) by plotting their quantiles against each other. For normal distribution, plotted dots should approximate a "straight", `x = y` line.

<%=
if (qq.line){
   qqmath(var, panel=function(x){
               panel.qqmath(x)
               panel.qqmathline(x, distribution = qnorm)
   }, xlab = "Theoretical Quantiles", ylab = "Empirical Quantiles")
} else {
   rp.qqplot(var)
}
%>

## Kernel Density Plot

_Kernel density plot_ is a plot of smoothed _empirical distribution function_. As such, it provides good insight about the shape of the distribution. For normal distributions, it should resemble the well known "bell shape".

<%=
rp.densityplot(var)
%>

{% endhighlight %}
</div></li>
</ul>

<a id="outlier-test"> </a>
#### outlier-test.tpl

 <ul class="tabs">
	<li><a class="active" href="#info-outlier-test">Description</a></li>
	<li><a href="#inputs-outlier-test">Inputs</a></li>
	<li><a href="#example-outlier-test">Example</a></li>
	<li><a href="#export-outlier-test">Export</a></li>
	<li><a href="#source-outlier-test">Source</a></li>
</ul>

 <ul class="tabs-content">
	<li class="active" id="info-outlier-test"><div><h5>Outlier tests</h5> by <em>Gergely Daróczi</em>
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


# Charts



[![Boxplot: edu](plots/outlier-test-1.png)](plots/outlier-test-1-hires.png)



# Lund test


It seems that _4_ extreme values can be found in "Internet usage for educational purposes (hours per day)". These are: 10, 0.5, 1.5, 0.5.


## Explanation


The above test for outliers was based on *lm(1 ~ edu)*:



--------------------------------------------------------------
           &nbsp;  Estimate   Std. Error   t value   Pr(>|t|) 
----------------- ---------- ------------ --------- ----------
  **(Intercept)** 2.048e+00   7.797e-02   2.627e+01 7.939e-105
--------------------------------------------------------------

Table: Fitting linear model: var ~ 1








## References


  * Lund, R. E. 1975, "Tables for An Approximate Test for Outliers in Linear Models", Technometrics, vol. 17, no. 4, pp. 473-476.
 * Prescott, P. 1975, "An Approximate Test for Outliers in Linear Models", Technometrics, vol. 17, no. 1, pp. 129-132.






# Grubb's test


Grubbs test for one outlier shows that highest value 12 is an outlier (p=_0.0001964_).





## References


  * Grubbs, F.E. (1950). Sample Criteria for testing outlying observations. Ann. Math. Stat. 21, 1, 27-58.









# Dixon's test


chi-squared test for outlier shows that highest value 12 is an outlier (p=_7.441e-07_).





## References


  * Dixon, W.J. (1950). Analysis of extreme values. Ann. Math. Stat. 21, 4, 488-506.






####################################################################################
##	 Running: rapport('outlier-test', data=ius2008, var='edu', lund.res=FALSE)
####################################################################################


# Charts



[![Boxplot: edu](plots/outlier-test-1.png)](plots/outlier-test-1-hires.png)



# Lund test


It seems that _4_ extreme values can be found in "Internet usage for educational purposes (hours per day)". These are: 10, 0.5, 1.5, 0.5.


## Explanation


The above test for outliers was based on *lm(1 ~ edu)*:



--------------------------------------------------------------
           &nbsp;  Estimate   Std. Error   t value   Pr(>|t|) 
----------------- ---------- ------------ --------- ----------
  **(Intercept)** 2.048e+00   7.797e-02   2.627e+01 7.939e-105
--------------------------------------------------------------

Table: Fitting linear model: var ~ 1








## References


  * Lund, R. E. 1975, "Tables for An Approximate Test for Outliers in Linear Models", Technometrics, vol. 17, no. 4, pp. 473-476.
 * Prescott, P. 1975, "An Approximate Test for Outliers in Linear Models", Technometrics, vol. 17, no. 1, pp. 129-132.






# Grubb's test


Grubbs test for one outlier shows that highest value 12 is an outlier (p=_0.0001964_).





## References


  * Grubbs, F.E. (1950). Sample Criteria for testing outlying observations. Ann. Math. Stat. 21, 1, 27-58.









# Dixon's test


chi-squared test for outlier shows that highest value 12 is an outlier (p=_7.441e-07_).





## References


  * Dixon, W.J. (1950). Analysis of extreme values. Ann. Math. Stat. 21, 4, 488-506.






################################################################################################################################
##	 Running: rapport('outlier-test', data=ius2008, var='edu', lund.res=FALSE, references=FALSE, grubb=FALSE, dixon=FALSE)
################################################################################################################################


# Charts



[![Boxplot: edu](plots/outlier-test-1.png)](plots/outlier-test-1-hires.png)



# Lund test


It seems that _4_ extreme values can be found in "Internet usage for educational purposes (hours per day)". These are: 10, 0.5, 1.5, 0.5.


## Explanation


The above test for outliers was based on *lm(1 ~ edu)*:



--------------------------------------------------------------
           &nbsp;  Estimate   Std. Error   t value   Pr(>|t|) 
----------------- ---------- ------------ --------- ----------
  **(Intercept)** 2.048e+00   7.797e-02   2.627e+01 7.939e-105
--------------------------------------------------------------

Table: Fitting linear model: var ~ 1













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
	<li><a href="demo/outlier-test.pdf" target="_blank">pdf</a></li>
	<li><a href="demo/outlier-test.docx">docx (MS Word 2007 format)</a></li>
	<li><a href="demo/outlier-test.odt">odt (MS Word compatible)</a></li>
	<li><a href="demo/outlier-test.rtf">rtf (MS Word compatible)</a></li>
	<li><a href="demo/outlier-test.epub">epub</a></li>
</ul>
<h6>Other morkdown formats</h6>
<ul>
	<li><a href="demo/outlier-test.textile" target="_blank">textile</a></li>
	<li><a href="demo/outlier-test.docbook" target="_blank">docbook</a></li>
	<li><a href="demo/outlier-test.man" target="_blank">man</a></li>
	<li><a href="demo/outlier-test.md" target="_blank">markdown</a></li>
	<li><a href="demo/outlier-test.mediawiki" target="_blank">mediawiki</a></li>
	<li><a href="demo/outlier-test.wiki" target="_blank">wiki</a></li>
	<li><a href="demo/outlier-test.org" target="_blank">org</a></li>
	<li><a href="demo/outlier-test.pandoc" target="_blank">pandoc</a></li>
</ul>
</div></li>
	<li id="source-outlier-test"><div>
<h5>Source of `outlier-test.tpl`</h5>
{% highlight text %}

<!--head
Title:          Outlier tests
Author:         Gergely Daróczi 
Email:          gergely@snowl.net
Description:    This template will check if provided variable has any outliers. 
Packages:       outliers
Data required:  TRUE
Example:        rapport('outlier-test', data=ius2008, var='edu')
                rapport('outlier-test', data=ius2008, var='edu', lund.res=FALSE)
                rapport('outlier-test', data=ius2008, var='edu', lund.res=FALSE, references=FALSE, grubb=FALSE, dixon=FALSE)

var             | *numeric | Variable        | Numerical variable
lund.res        | FALSE    | Residuals       | Return Lund's residuals?
references      | TRUE     | References      | Print references?
grubb           | TRUE     | Grubb's test    | Show Grubb's test?
dixon           | TRUE     | Dixon's test    | Show Dixon's test?
head-->

# Charts

<%=
set.caption(sprintf('Boxplot: %s', rp.name(var)))
rp.boxplot(var)
%>

# Lund test

It seems that <%=length(rp.outlier(var))%> extreme values can be found in "<%=rp.label(var)%>". <%=ifelse(length(rp.outlier(var)) > 0, sprintf('These are: %s.', paste(rp.outlier(var), collapse=', ')), '')%>

## Explanation

The above test for outliers was based on *lm(1 ~ <%=rp.name(var)%>)*:

<%=
set.caption(sprintf('Linear model: 1 ~ %s', rp.name(var)))
lm(var ~ 1)
%>

<% if (lund.res) { %>

## The residuals returned:

<%=pander.return(rstandard(lm(var ~ 1)))%>

<% } %>

<%if (references) { %>

## References

  * Lund, R. E. 1975, "Tables for An Approximate Test for Outliers in Linear Models", Technometrics, vol. 17, no. 4, pp. 473-476.
 * Prescott, P. 1975, "An Approximate Test for Outliers in Linear Models", Technometrics, vol. 17, no. 1, pp. 129-132.

<% } %>

<%if (grubb & suppressMessages(suppressWarnings(require(outliers)))) { %>

# Grubb's test

<%=
if (grubb) if (suppressMessages(suppressWarnings(require(outliers)))) {
test <- grubbs.test(var)
sprintf('%s shows that %s (p=%s).', test$method, ifelse(test$p.value>0.05, 'there are no outliers', test$alternative), pander.return(test$p.value))   
} else 'Cannot run test, please install "outliers" package!'
%>

<%if (references) { %>

## References

  * Grubbs, F.E. (1950). Sample Criteria for testing outlying observations. Ann. Math. Stat. 21, 1, 27-58.

<% } %>

<% } %>


<% if (dixon & suppressMessages(suppressWarnings(require(outliers)))) { %>

# Dixon's test

<%=
if (dixon) if (suppressMessages(suppressWarnings(require(outliers)))) {
test <- chisq.out.test(var)
sprintf('%s shows that %s (p=%s).', test$method, ifelse(test$p.value>0.05, 'there are no outliers', test$alternative), pander.return(test$p.value))   
} else 'Cannot run test, please install "outliers" package!'
%>

<%if (references) { %>

## References

  * Dixon, W.J. (1950). Analysis of extreme values. Ann. Math. Stat. 21, 4, 488-506.

<% } %>

<% } %>

{% endhighlight %}
</div></li>
</ul>

<a id="t-test"> </a>
#### t-test.tpl

 <ul class="tabs">
	<li><a class="active" href="#info-t-test">Description</a></li>
	<li><a href="#inputs-t-test">Inputs</a></li>
	<li><a href="#example-t-test">Example</a></li>
	<li><a href="#export-t-test">Export</a></li>
	<li><a href="#source-t-test">Source</a></li>
</ul>

 <ul class="tabs-content">
	<li class="active" id="info-t-test"><div><h5>t-test Template</h5> by <em>Aleksandar Blagotić</em>
<br><br>
 A t-test report with table of descriptives, diagnostic tests and t-test specific statistics.
<br><br>
<em>Required packages:</em> nortest
<br>
<em>Example:</em> 
{% highlight text %}
rapport("t-test", ius2008, x = "leisure", y = "gender")
rapport("t-test", ius2008, x = "leisure", mu = 3.2)
{% endhighlight %}
</div></li>
	<li id="inputs-t-test"><div><h5>Input parameters</h5><em>t-test.tpl</em> template has the following options to be (optionally) set while calling <em>rapport</em>:<ul>
	<li><h6>x: <small><em>X variable</em></small></h6>
<div class="options">    <div class="options-desc">Dependent (response) variable
</div>
    <em>Type:</em>	numeric
<br>
    <em>Limits:</em>	exactly 1 variable
<br>

</div>
</li>
<br>
<li><h6>y: <small><em>Y variable</em></small></h6>
<div class="options">    <div class="options-desc">Independent variable (factor, or another numeric)
</div>
    <em>Type:</em>	variable
<br>
    <em>Limits:</em>	exactly 1 variable
<br>

</div>
</li>
<br>
<li><h6>alter: <small><em>Alternative hypothesis</em></small></h6>
<div class="options">    <div class="options-desc">Whether two-sided, greater or less variant will be applied
</div>
    <em>Type:</em>	option
<br>
    <em>Limits:</em>	exactly 1 variable
<br>
    <em>Default value:</em>	two.sided, less, greater
</div>
</li>
<br>
<li><h6>mu: <small><em>Mean value</em></small></h6>
<div class="options">    <div class="options-desc">Mean value for one-sample t-test
</div>
    <em>Type:</em>	number
<br>
    <em>Limits:</em>	from 1, up to 10 variables
<br>
    <em>Default value:</em>	NA
</div>
</li>
<br>
<li><h6>paired: <small><em>Paired t-test</em></small></h6>
<div class="options">    <div class="options-desc">Carry out paired t-test or not
</div>
    <em>Type:</em>	boolean
<br>
    <em>Limits:</em>	exactly 1 variable
<br>
    <em>Default value:</em>	FALSE
</div>
</li>
<br>
<li><h6>var.equal: <small><em>Variance equality</em></small></h6>
<div class="options">    <div class="options-desc">Equal variances assumed: choose automatically or not
</div>
    <em>Type:</em>	boolean
<br>
    <em>Limits:</em>	exactly 1 variable
<br>
    <em>Default value:</em>	FALSE
</div>
</li>
<br>
<li><h6>ci.level: <small><em>Confidence interval</em></small></h6>
<div class="options">    <div class="options-desc">Confidence interval level
</div>
    <em>Type:</em>	number
<br>
    <em>Limits:</em>	from 1, up to 10 variables
<br>
    <em>Default value:</em>	0.95
</div>
</li>
<br>
</ul></div></li>
	<li id="example-t-test">
{% highlight text %}


###########################################################################
##	 Running: rapport("t-test", ius2008, x = "leisure", y = "gender")
###########################################################################





# Introduction


In a nutshell, _t-test_ is a statistical test that assesses hypothesis of equality of two means. But in theory, any hypothesis test that yields statistic which follows [_t-distribution_](https://en.wikipedia.org/wiki/Student%27s_t-distribution) can be considered a _t-test_. The most common usage of _t-test_ is to:

 - compare the mean of a variable with given test mean value - **one-sample _t-test_**
 - compare means of two variables from independent samples - **independent samples _t-test_**
 - compare means of two variables from dependent samples - **paired-samples _t-test_**


# Overview


Independent samples _t-test_ is carried out with _Internet usage in leisure time (hours per day)_ as dependent variable, and _Gender_ as independent variable. Confidence interval is set to 95%. Equality of variances wasn't assumed.


# Descriptives


In order to get more insight on the underlying data, a table of basic descriptive statistics is displayed below.


------------------------------------------------------
Gender   min   max   mean   sd    var   median   IQR  
-------- ----- ----- ------ ----- ----- -------- -----
male     0     12    3.270  1.953 3.816 3        3    

female   0     12    3.064  2.355 5.544 2        3    
------------------------------------------------------

 
---------------------
skewness   kurtosis  
---------- ----------
0.9443     0.9858    

1.3979     1.8696    
---------------------




# Diagnostics


Since _t-test_ is a parametric technique, it sets some basic assumptions on distribution shape: it has to be _normal_ (or approximately normal). A few normality test are to be applied, in order to screen possible departures from normality.


## Normality Tests


We will use _Shapiro-Wilk_, _Lilliefors_ and _Anderson-Darling_ tests to screen departures from normality in the response variable (_Internet usage in leisure time (hours per day)_).


---------------------------------------------
N                           p       NA       
--------------------------- ------- ---------
Shapiro-Wilk normality test 0.9001  1.617e-20

Lilliefors                  0.1680  3.000e-52
(Kolmogorov-Smirnov)                         
normality test                               

Anderson-Darling normality  18.7530 7.261e-44
test                                         
---------------------------------------------



As you can see, applied tests yield different results on hypotheses of normality, so you may want to stick with one you find most appropriate or you trust the most..



# Results


Welch Two Sample t-test was applied, and significant differences were found.


--------------------------------------------------------
&nbsp;  statistic   df    p      CI(lower)   CI(upper)  
------- ----------- ----- ------ ----------- -----------
**t**   1.148       457.9 0.2514 -0.1463     0.5576     
--------------------------------------------------------




#######################################################################
##	 Running: rapport("t-test", ius2008, x = "leisure", mu = 3.2)
#######################################################################





# Introduction


In a nutshell, _t-test_ is a statistical test that assesses hypothesis of equality of two means. But in theory, any hypothesis test that yields statistic which follows [_t-distribution_](https://en.wikipedia.org/wiki/Student%27s_t-distribution) can be considered a _t-test_. The most common usage of _t-test_ is to:

 - compare the mean of a variable with given test mean value - **one-sample _t-test_**
 - compare means of two variables from independent samples - **independent samples _t-test_**
 - compare means of two variables from dependent samples - **paired-samples _t-test_**


# Overview


One-sample _t-test_ is carried out with _Internet usage in leisure time (hours per day)_ as dependent variable. Confidence interval is set to 95%. Equality of variances wasn't assumed.


# Descriptives


In order to get more insight on the underlying data, a table of basic descriptive statistics is displayed below.


--------------------------------------------------------------
Variable                                       NA   NA   NA   
---------------------------------------------- ---- ---- -----
Internet usage in leisure                      0    12   3.199
time (hours per day)                                          
--------------------------------------------------------------

 
----------------
NA    NA    NA  
----- ----- ----
2.144 4.595 3   
----------------

 
----------------
NA   NA    NA   
---- ----- -----
2    1.185 1.533
----------------




# Diagnostics


Since _t-test_ is a parametric technique, it sets some basic assumptions on distribution shape: it has to be _normal_ (or approximately normal). A few normality test are to be applied, in order to screen possible departures from normality.


## Normality Tests


We will use _Shapiro-Wilk_, _Lilliefors_ and _Anderson-Darling_ tests to screen departures from normality in the response variable (_Internet usage in leisure time (hours per day)_).


---------------------------------------------
N                           p       NA       
--------------------------- ------- ---------
Shapiro-Wilk normality test 0.9001  1.617e-20

Lilliefors                  0.1680  3.000e-52
(Kolmogorov-Smirnov)                         
normality test                               

Anderson-Darling normality  18.7530 7.261e-44
test                                         
---------------------------------------------



As you can see, applied tests yield different results on hypotheses of normality, so you may want to stick with one you find most appropriate or you trust the most..



# Results


One Sample t-test was applied, and significant differences were found.


-------------------------------------------------------
&nbsp;  statistic   df   p      CI(lower)   CI(upper)  
------- ----------- ---- ------ ----------- -----------
**t**   -0.007198   671  0.9943 3.037       3.362      
-------------------------------------------------------




{% endhighlight %}
</li>
	<li id="export-t-test"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport("t-test", ius2008, x = "leisure", y = "gender")
rapport("t-test", ius2008, x = "leisure", mu = 3.2)

{% endhighlight %}
<h6>Popular formats:</h6>
<ul>
	<li><a href="demo/t-test.html" target="_blank">HTML</a></li>
	<li><a href="demo/t-test.pdf" target="_blank">pdf</a></li>
	<li><a href="demo/t-test.docx">docx (MS Word 2007 format)</a></li>
	<li><a href="demo/t-test.odt">odt (MS Word compatible)</a></li>
	<li><a href="demo/t-test.rtf">rtf (MS Word compatible)</a></li>
	<li><a href="demo/t-test.epub">epub</a></li>
</ul>
<h6>Other morkdown formats</h6>
<ul>
	<li><a href="demo/t-test.textile" target="_blank">textile</a></li>
	<li><a href="demo/t-test.docbook" target="_blank">docbook</a></li>
	<li><a href="demo/t-test.man" target="_blank">man</a></li>
	<li><a href="demo/t-test.md" target="_blank">markdown</a></li>
	<li><a href="demo/t-test.mediawiki" target="_blank">mediawiki</a></li>
	<li><a href="demo/t-test.wiki" target="_blank">wiki</a></li>
	<li><a href="demo/t-test.org" target="_blank">org</a></li>
	<li><a href="demo/t-test.pandoc" target="_blank">pandoc</a></li>
</ul>
</div></li>
	<li id="source-t-test"><div>
<h5>Source of `t-test.tpl`</h5>
{% highlight text %}

<!--head
Title:          t-test Template
Author:         Aleksandar Blagotić
Description:    A t-test report with table of descriptives, diagnostic tests and t-test specific statistics.
Packages:       nortest
Data required:  TRUE
Example:        rapport("t-test", ius2008, x = "leisure", y = "gender")
                rapport("t-test", ius2008, x = "leisure", mu = 3.2)

x         | *numeric          | X variable          | Dependent (response) variable
y         | variable          | Y variable          | Independent variable (factor, or another numeric)
alter     | two.sided,less,greater | Alternative hypothesis | Whether two-sided, greater or less variant will be applied
mu        | number[1,10]      | Mean value          | Mean value for one-sample t-test
paired    | FALSE             | Paired t-test       | Carry out paired t-test or not
var.equal | FALSE             | Variance equality   | Equal variances assumed: choose automatically or not
ci.level  | number[1,10]=0.95 | Confidence interval | Confidence interval level
head-->
<%=

if (is.null(y)){

    ## if y is NULL, you're stuck with one-sample t-test
    arg.list <- list(x = x, mu = mu, alternative = alter, conf.level = ci.level)
    test <- stats:::t.test

    variant <- "one-sample"

} else {

    ## "y" is specified, so it's either independent samples or paired samples
    if (!inherits(y, c('factor', 'numeric')))
        stop('"y" has to be either a factor or a numeric vector')

    arg.list <- list(alternative = alter, paired = paired, var.equal = var.equal, conf.level = ci.level)

    if (is.factor(y)){
       test <- stats:::t.test.formula
       arg.list$formula <- x ~ y
    }

    if (is.numeric(y)){
        test <- stats:::t.test
        arg.list$x <- x
        arg.list$y <- y
    }

    variant <- ifelse(paired, "paired-samples", "independent samples")

}

tt <- do.call(test, arg.list)

%>

# Introduction

In a nutshell, _t-test_ is a statistical test that assesses hypothesis of equality of two means. But in theory, any hypothesis test that yields statistic which follows [_t-distribution_](https://en.wikipedia.org/wiki/Student%27s_t-distribution) can be considered a _t-test_. The most common usage of _t-test_ is to:

 - compare the mean of a variable with given test mean value - **one-sample _t-test_**
 - compare means of two variables from independent samples - **independent samples _t-test_**
 - compare means of two variables from dependent samples - **paired-samples _t-test_**

# Overview

<%= capitalise(variant) %> _t-test_ is carried out with <%= p(x.label) %> as dependent variable<%= if (!is.null(y)) sprintf(", and %s as independent variable", p(y.label)) else ""%>. Confidence interval is set to <%= pct(ci.level * 100, 0) %>. <%= if (!is.null(variant)) sprintf("Equality of variances %s assumed.", ifelse(var.equal, "was", "wasn't")) else "" %>

# Descriptives

In order to get more insight on the underlying data, a table of basic descriptive statistics is displayed below.

<%=
rp.desc(x, y, c(min, max, mean, sd, var, median, IQR, skewness, kurtosis))
%>

# Diagnostics

Since _t-test_ is a parametric technique, it sets some basic assumptions on distribution shape: it has to be _normal_ (or approximately normal). A few normality test are to be applied, in order to screen possible departures from normality.

## Normality Tests

We will use _Shapiro-Wilk_, _Lilliefors_ and _Anderson-Darling_ tests to screen departures from normality in the response variable (<%= p(x.label) %>).

<%=
(ntest <- htest(x, shapiro.test, lillie.test, ad.test, colnames = c("N", "p")))
%>

As you can see, applied tests <%= ifelse(all(ntest$p < .05), "confirm departures from normality", "yield different results on hypotheses of normality, so you may want to stick with one you find most appropriate or you trust the most.") %>.


# Results

<%= tt$method %> was applied, and significant differences <%= ifelse(tt$p.value < 1 - ci.level, "weren't", "were") %> found.

<%=
with(tt, data.frame(statistic, df = parameter, p = p.value, `CI(lower)` = conf.int[1], `CI(upper)` = conf.int[2], check.names = FALSE))
%>

{% endhighlight %}
</div></li>
</ul>

