<ul>
 	<li><a href="#anova">anova.tpl</a></li>
 	<li><a href="#correlations">correlations.tpl</a></li>
 	<li><a href="#crosstable">crosstable.tpl</a></li>
 	<li><a href="#example">example.tpl</a></li>
 	<li><a href="#multivar-descriptive">multivar-descriptive.tpl</a></li>
 	<li><a href="#nortest">nortest.tpl</a></li>
 	<li><a href="#outlier-test">outlier-test.tpl</a></li>
 	<li><a href="#t-test">t-test.tpl</a></li>
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

 == Introduction  

**Analysis of Variance** or **ANOVA** is a statistical procedure that tests equality of means for several samples. It was first introduced in 1921. by famous English statistician Sir Ronald Aylmer Fisher.

 == Model Overview  

One-Way ANOVA was carried out, with _Gender_ as independent variable, and _Internet usage in leisure time (hours per day)_ as a response variable. Factor interaction was taken into account.

 == Descriptives  

In order to get more insight on the model data, a table of frequencies for ANOVA factors is displayed, as well as a table of descriptives.

 === Frequency Table  

Below lies a frequency table for factors in ANOVA model. Note that the missing values are removed from the summary.

<!-- endlist -->

        **gender**   **N**   **pct**   **cumul.count**   **cumul.pct**  
------- ------------ ------- --------- ----------------- ---------------
1       male         410     60.9212   410               60.9212        
2       female       263     39.0788   673               100            
Total                673     100       673               100            
------- ------------ ------- --------- ----------------- ---------------


 === Descriptive Statistics  

The following table displays the descriptive statistics of ANOVA model. Factor levels and/or their combinations lie on the left hand side, while the corresponding statistics for response variable are given on the right-hand side.


**fac**   **min(resp)**   **max(resp)**   **mean(resp)**   **SD(resp)**   **median(resp)**   **IQR(resp)**   **skewness(resp)**   **kurtosis(resp)**  
--------- --------------- --------------- ---------------- -------------- ------------------ --------------- -------------------- --------------------
male      0               12              3.2699           1.9535         3                  3               0.9479               4.0064              
female    0               12              3.0643           2.3546         2                  3               1.4064               4.9089              
          0               10              3.3824           2.5822         3                  2               1.2197               3.8058              
--------- --------------- --------------- ---------------- -------------- ------------------ --------------- -------------------- --------------------


 == Diagnostics  

Before we carry out ANOVA, we'd like to check some basic assumptions. For those purposes, normality and homoscedascity tests are carried out alongside several graphs that may help you with your decision on model's main assumptions.

 === Diagnostics  

 ==== Univariate Normality  

We will use _Shapiro-Wilk_, _Lilliefors_ and _Anderson-Darling_ tests to screen departures from normality in the response variable (_Internet usage in leisure time (hours per day)_). 

<!-- endlist -->

               **W**    **p**  
-------------- -------- -------
shapiro.test   0.9001   0      
lillie.test    0.168    0      
ad.test        18.753   0      
-------------- -------- -------


As you can see, applied tests confirm departures from normality.

 ==== Homoscedascity  

In order to test homoscedascity, _Bartlett_ and _Fligner-Kileen_ tests are applied.

<!-- endlist -->

                **H**     **p**   
--------------- --------- --------
fligner.test    0.4629    0.4963  
bartlett.test   10.7698   0.001   
--------------- --------- --------


When it comes to equality of variances, applied tests yield inconsistent results. While _Fligner-Kileen test_ confirmed the hypotheses of homoscedascity, _Bartlett's test_ rejected it.

 === Diagnostic Plots  

Here you can see several diagnostic plots for ANOVA model:

 - residuals against fitted values
 - scale-location plot of square root of residuals against fitted values
 - normal Q-Q plot
 - residuals against leverages

/tmp/RtmpPer367/file1c44d631.png

 == ANOVA Summary  

 === ANOVA Table  

<!-- endlist -->

            **Df**   **Sum.Sq**   **Mean.Sq**   **F.value**   **Pr..F.**  
----------- -------- ------------ ------------- ------------- ------------
gender      1        6.4217       6.4217        1.4302        0.2322      
Residuals   636      2855.63      4.49                                    
----------- -------- ------------ ------------- ------------- ------------


_F-test_ for _Gender_ is not statistically significant, which implies that there is no Gender effect on response variable. 


#######################################################################################################
##	 Running: rapport("anova", ius2008, resp = "leisure", fac = c("gender", "partner")) # two-way
#######################################################################################################

 == Introduction  

**Analysis of Variance** or **ANOVA** is a statistical procedure that tests equality of means for several samples. It was first introduced in 1921. by famous English statistician Sir Ronald Aylmer Fisher.

 == Model Overview  

Two-Way ANOVA was carried out, with _Gender_ and _Relationship status_ as independent variables, and _Internet usage in leisure time (hours per day)_ as a response variable. Factor interaction was taken into account.

 == Descriptives  

In order to get more insight on the model data, a table of frequencies for ANOVA factors is displayed, as well as a table of descriptives.

 === Frequency Table  

Below lies a frequency table for factors in ANOVA model. Note that the missing values are removed from the summary.

<!-- endlist -->

        **gender**   **partner**         **N**   **pct**   **cumul.count**   **cumul.pct**  
------- ------------ ------------------- ------- --------- ----------------- ---------------
1       male         in a relationship   150     23.6967   150               23.6967        
2       female       in a relationship   120     18.9573   270               42.654         
3       male         married             33      5.2133    303               47.8673        
4       female       married             29      4.5814    332               52.4487        
5       male         single              204     32.2275   536               84.6761        
6       female       single              97      15.3239   633               100            
Total                                    633     100       633               100            
------- ------------ ------------------- ------- --------- ----------------- ---------------


 === Descriptive Statistics  

The following table displays the descriptive statistics of ANOVA model. Factor levels and/or their combinations lie on the left hand side, while the corresponding statistics for response variable are given on the right-hand side.


**gender**   **partner**         **min(resp)**   **max(resp)**   **mean(resp)**   **SD(resp)**   **median(resp)**   **IQR(resp)**   **skewness(resp)**   **kurtosis(resp)**  
------------ ------------------- --------------- --------------- ---------------- -------------- ------------------ --------------- -------------------- --------------------
male         in a relationship   0.5             12              3.0582           1.9692         2.5                2               1.3376               5.727               
male         married             0               8               2.9848           2.029          3                  2               0.9027               3.351               
male         single              0               10              3.5027           1.9361         3                  3               0.7636               3.1208              
male                             0.5             6.5             3.1304           1.7788         3                  2.75            0.0719               1.9965              
female       in a relationship   0.5             10              3.0439           2.2158         3                  3               1.4017               4.9165              
female       married             0               10              2.4808           1.9671         2                  1.75            2.1875               9.2864              
female       single              0               12              3.3226           2.6791         3                  3.5             1.2045               4.0139              
female                           0.5             6               2.6562           1.739          2                  3               0.6914               2.4285              
             in a relationship   0               8               3.3333           2.4398         3                  2.5             0.7897               2.5973              
             married             2               7               3.8              1.9235         3                  1               1.018                2.6519              
             single              0               10              3.5833           3.2039         3                  1.5             1.279                3.4365              
                                 1               2               1.5              0.7071         1.5                0.5             0                    1                   
------------ ------------------- --------------- --------------- ---------------- -------------- ------------------ --------------- -------------------- --------------------


 == Diagnostics  

Before we carry out ANOVA, we'd like to check some basic assumptions. For those purposes, normality and homoscedascity tests are carried out alongside several graphs that may help you with your decision on model's main assumptions.

 === Diagnostics  

 ==== Univariate Normality  

We will use _Shapiro-Wilk_, _Lilliefors_ and _Anderson-Darling_ tests to screen departures from normality in the response variable (_Internet usage in leisure time (hours per day)_). 

<!-- endlist -->

               **W**    **p**  
-------------- -------- -------
shapiro.test   0.9001   0      
lillie.test    0.168    0      
ad.test        18.753   0      
-------------- -------- -------


As you can see, applied tests confirm departures from normality.

 ==== Homoscedascity  

In order to test homoscedascity, _Bartlett_ and _Fligner-Kileen_ tests are applied.

<!-- endlist -->

                **H**     **p**   
--------------- --------- --------
fligner.test    1.1234    0.2892  
bartlett.test   11.1267   0.0009  
--------------- --------- --------


When it comes to equality of variances, applied tests yield inconsistent results. While _Fligner-Kileen test_ confirmed the hypotheses of homoscedascity, _Bartlett's test_ rejected it.

 === Diagnostic Plots  

Here you can see several diagnostic plots for ANOVA model:

 - residuals against fitted values
 - scale-location plot of square root of residuals against fitted values
 - normal Q-Q plot
 - residuals against leverages

/tmp/RtmpPer367/file7938e69b.png

 == ANOVA Summary  

 === ANOVA Table  

<!-- endlist -->

                 **Df**   **Sum.Sq**   **Mean.Sq**   **F.value**   **Pr..F.**  
---------------- -------- ------------ ------------- ------------- ------------
gender           1        4.9473       4.9473        1.0853        0.2979      
partner          2        31.2124      15.6062       3.4237        0.0332      
gender:partner   2        3.0375       1.5188        0.3332        0.7168      
Residuals        593      2703.0899    4.5583                                  
---------------- -------- ------------ ------------- ------------- ------------


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
	<li id="source-anova"><div>
<h5>Source of `anova.tpl`</h5>
{% highlight text %}

<!--head
Title:        ANOVA Template
Author:       Aleksandar Blagotić
Description:  An ANOVA report with table of descriptives, diagnostic tests and ANOVA-specific statistics.
Packages:     nortest
Example:      rapport("anova", ius2008, resp = "leisure", fac = "gender")  # one-way
              rapport("anova", ius2008, resp = "leisure", fac = c("gender", "partner")) # two-way

resp     | numeric     | Response variable  | Dependent (response) variable
fac      | factor[1,2] | Factor variables   | Independent variables (factors)
fac.intr | TRUE        | Factor interaction | Include factor interaction
head-->
<%
d <- structure(data.frame(resp, fac), .Names = c(resp.iname, fac.name))
f.int <- fml(resp.iname, fac.name, join.right = "*")
f.nonint <- fml(resp.iname, fac.name, join.right = "+")
fit <- lm(ifelse(fac.intr, f.int, f.nonint), data = d)
fac.plu <- switch(fac.ilen, '', 's')
%>

# Introduction

**Analysis of Variance** or **ANOVA** is a statistical procedure that tests equality of means for several samples. It was first introduced in 1921. by famous English statistician Sir Ronald Aylmer Fisher.

# Model Overview

<% switch(fac.ilen, 'One', 'Two') %>-Way ANOVA was carried out, with <% p(fac.label) %> as independent variable<% fac.plu %>, and <% p(resp.label) %> as a response variable. Factor interaction was<% ifelse(fac.intr, "", "n't")%> taken into account.

# Descriptives

In order to get more insight on the model data, a table of frequencies for ANOVA factors is displayed, as well as a table of descriptives.

## Frequency Table

Below lies a frequency table for factors in ANOVA model. Note that the missing values are removed from the summary.

<%
(freq <- rp.freq(fac.name, rp.data))
%>

## Descriptive Statistics

The following table displays the descriptive statistics of ANOVA model. Factor levels and/or their combinations lie on the left hand side, while the corresponding statistics for response variable are given on the right-hand side.

<%
(desc <- rp.desc(fac, resp, c(min, max, mean, SD = sd, median, IQR, skewness, kurtosis)))
%>

# Diagnostics

Before we carry out ANOVA, we'd like to check some basic assumptions. For those purposes, normality and homoscedascity tests are carried out alongside several graphs that may help you with your decision on model's main assumptions.

## Diagnostics

### Univariate Normality

We will use _Shapiro-Wilk_, _Lilliefors_ and _Anderson-Darling_ tests to screen departures from normality in the response variable (<% p(resp.label) %>). 

<%
(ntest <- htest(resp, shapiro.test, lillie.test, ad.test, colnames = c("N", "p")))
%>


As you can see, applied tests <% ifelse(all(ntest$p < .05), "confirm departures from normality", "yield different results on hypotheses of normality, so you may want to stick with one you find most appropriate or you trust the most.") %>.

### Homoscedascity

In order to test homoscedascity, _Bartlett_ and _Fligner-Kileen_ tests are applied.

<%
hsced <- with(d, htest(as.formula(f.nonint), fligner.test, bartlett.test))
hp <- hsced$p
hcons <- all(hp < .05) | all(hp > .05)
hp.all <- all(hp < .05)
hsced
%>


When it comes to equality of variances, applied tests yield <% ifelse(hcons, "consistent", "inconsistent") %> results. <% if (hcons) sprintf("Homoscedascity assumption is %s.", ifelse(hp.all, "rejected", "confirmed")) else sprintf("While _Fligner-Kileen test_ %s the hypotheses of homoscedascity, _Bartlett's test_ %s it.", ifelse(hp[1] < .05, "rejected", "confirmed"), ifelse(hp[2] < .05, "rejected", "confirmed")) %>

## Diagnostic Plots

Here you can see several diagnostic plots for ANOVA model:

 - residuals against fitted values
 - scale-location plot of square root of residuals against fitted values
 - normal Q-Q plot
 - residuals against leverages

<%
par(mfrow = c(2, 2))
plot(fit)
%>

# ANOVA Summary

## ANOVA Table

<%
a <- anova(fit)
a.f <- a$F
a.p <- a$Pr
a.fp <- a.p < .05
data.frame(a)
%>

_F-test_ for <% p(fac.label[1]) %> is <% ifelse(a.fp[1], "", "not") %> statistically significant, which implies that there is <% ifelse(a.fp[1], "an", "no") %> <% fac.label[1] %> effect on response variable. <% if (fac.ilen == 2) sprintf("Effect of %s on response variable is %s significant. ", p(fac.label[2]), ifelse(a.fp[2], "", "not")) else "" %><% if (fac.ilen == 2 & fac.intr) sprintf("Interaction between levels of %s %s found significant (p = %.3f).", p(fac.label), ifelse(a.fp[3], "was", "wasn't"), a.p[3]) else "" %>


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
<em>Required packages:</em> NA
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
<li><h6>info: <small><em>Stat. theory</em></small></h6>
<div class="options">    <div class="options-desc">Show information about background theory?
</div>
    <em>Type:</em>	boolean
<br>
    <em>Limits:</em>	exactly 1 variable
<br>
    <em>Default value:</em>	TRUE
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

_3_ variables provided.

The highest correlation coefficient (0.2273) is between _edu_ and _age_ and the lowest (-0.0338) is between _leisure_ and _age_. It seems that the strongest association (r=0.2273) is between _edu_ and _age_.

Higly correlated (r < 0.7 or r > 0.7) variables: -


Uncorrelated (-0.2 < r < 0.2) variables: 

 * _age_ and _leisure_
 * _edu_ and _leisure_

 === Correlation matrix  

<!-- endlist -->

          **age**         **edu**         **leisure**    
--------- --------------- --------------- ---------------
age                       0.2273  * * *   -0.0338        
edu       0.2273  * * *                   0.1732  * * *  
leisure   -0.0338         0.1732  * * *                  
--------- --------------- --------------- ---------------


/tmp/RtmpPer367/file5bb1de78.png


##############################################################################################################################################
##	 Running: rapport('correlations', data=mtcars, vars=c('mpg', 'cyl', 'disp', 'hp', 'drat', 'wt', 'qsec', 'vs', 'am', 'gear', 'carb'))
##############################################################################################################################################

 == Variable description  

_11_ variables provided.

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

<!-- endlist -->

       **mpg**          **cyl**          **disp**         **hp**           **drat**         **wt**           **qsec**         **vs**           **am**           **gear**         **carb**        
------ ---------------- ---------------- ---------------- ---------------- ---------------- ---------------- ---------------- ---------------- ---------------- ---------------- ----------------
mpg                     -0.8522  * * *   -0.8476  * * *   -0.7762  * * *   0.6812  * * *    -0.8677  * * *   0.4187  *        0.6640  * * *    0.5998  * * *    0.4803  * *      -0.5509  * *    
cyl    -0.8522  * * *                    0.9020  * * *    0.8324  * * *    -0.6999  * * *   0.7825  * * *    -0.5912  * * *   -0.8108  * * *   -0.5226  * *     -0.4927  * *     0.5270  * *     
disp   -0.8476  * * *   0.9020  * * *                     0.7909  * * *    -0.7102  * * *   0.8880  * * *    -0.4337  *       -0.7104  * * *   -0.5912  * * *   -0.5556  * * *   0.3950  *       
hp     -0.7762  * * *   0.8324  * * *    0.7909  * * *                     -0.4488  * *     0.6587  * * *    -0.7082  * * *   -0.7231  * * *   -0.2432          -0.1257          0.7498  * * *   
drat   0.6812  * * *    -0.6999  * * *   -0.7102  * * *   -0.4488  * *                      -0.7124  * * *   0.0912           0.4403  *        0.7127  * * *    0.6996  * * *    -0.0908         
wt     -0.8677  * * *   0.7825  * * *    0.8880  * * *    0.6587  * * *    -0.7124  * * *                    -0.1747          -0.5549  * * *   -0.6925  * * *   -0.5833  * * *   0.4276  *       
qsec   0.4187  *        -0.5912  * * *   -0.4337  *       -0.7082  * * *   0.0912           -0.1747                           0.7445  * * *    -0.2299          -0.2127          -0.6562  * * *  
vs     0.6640  * * *    -0.8108  * * *   -0.7104  * * *   -0.7231  * * *   0.4403  *        -0.5549  * * *   0.7445  * * *                     0.1683           0.2060           -0.5696  * * *  
am     0.5998  * * *    -0.5226  * *     -0.5912  * * *   -0.2432          0.7127  * * *    -0.6925  * * *   -0.2299          0.1683                            0.7941  * * *    0.0575          
gear   0.4803  * *      -0.4927  * *     -0.5556  * * *   -0.1257          0.6996  * * *    -0.5833  * * *   -0.2127          0.2060           0.7941  * * *                     0.2741          
carb   -0.5509  * *     0.5270  * *      0.3950  *        0.7498  * * *    -0.0908          0.4276  *        -0.6562  * * *   -0.5696  * * *   0.0575           0.2741                           
------ ---------------- ---------------- ---------------- ---------------- ---------------- ---------------- ---------------- ---------------- ---------------- ---------------- ----------------


/tmp/RtmpPer367/file471a07f9.png


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
	<li id="source-correlations"><div>
<h5>Source of `correlations.tpl`</h5>
{% highlight text %}

<!--head
Title: Correlations
Author: Daróczi Gergely 
Email: gergely@snowl.net
Description: This template will return the correlation matrix of supplied numerical variables. 
Packages: ascii
Example: rapport('correlations', data=ius2008, vars=c('age', 'edu', 'leisure'))
         rapport('correlations', data=mtcars, vars=c('mpg', 'cyl', 'disp', 'hp', 'drat', 'wt', 'qsec', 'vs', 'am', 'gear', 'carb'))
vars        | *numeric[1,10]| Variable              | Numerical variables
info        | TRUE          | Stat. theory          | Show information about background theory?
cor.matrix  | TRUE          | Correlation matrix    | Show correlation matrix (numbers)?
cor.plot    | TRUE          | Scatterplot matrix    | Show scatterplot matrix (image)?
head-->

# Variable description

<%length(vars)%> variables provided.

The highest correlation coefficient (<%cm <- cor(vars, use = 'complete.obs');diag(cm) <- NA; rp.round(max(cm, na.rm=T))%>) is between <%p(row.names(which(cm == max(cm, na.rm=T), arr.ind=T))[1:2])%> and the lowest (<%rp.round(min(cm, na.rm=T))%>) is between <%p(row.names(which(cm == min(cm, na.rm=T), arr.ind=T))[1:2])%>. It seems that the strongest association (r=<%rp.round(cm[which(abs(cm) == max(abs(cm), na.rm=T), arr.ind=T)][1])%>) is between <%p(row.names(which(abs(cm) == max(abs(cm), na.rm=T), arr.ind=T))[1:2])%>.

Higly correlated (r < 0.7 or r > 0.7) variables: <%cm[lower.tri(cm)] <- NA; l <- row.names(cm)[which((cm > 0.7) | (cm < -0.7), arr.ind=T)]; ifelse(length(l) == 0, '-', '')%>
<%ifelse(length(l) > 0, paste('\n *', lapply(split(l, 1:(length(l)/2)), p), collapse=''), '')%>

Uncorrelated (-0.2 < r < 0.2) variables: <%l <- row.names(cm)[which((cm < 0.2)&(cm > -0.2), arr.ind=T)]; ifelse(length(l) == 0, '-', '')%>
<%ifelse(length(l) > 0, paste('\n *', lapply(split(l, 1:(length(l)/2)), p), collapse=''), '')%>

## <%if (cor.matrix) 'Correlation matrix'%>

<%
if (cor.matrix) {
    cm <- rp.round(cor(vars, use = 'complete.obs'))
    d <- attributes(cm)
    for (row in attr(cm, 'dimnames')[[1]])
        for (col in attr(cm, 'dimnames')[[2]]) {
            test.p <- cor.test(vars[, row], vars[, col])$p.value 
            cm[row, col] <- paste(cm[row, col], ' ', ifelse(test.p > 0.05, '', ifelse(test.p > 0.01, ' *', ifelse(test.p > 0.001, ' * *', ' * * *'))), sep='')
        }
    diag(cm) <- ''
    as.data.frame(cm)
}
%>

<%
if (cor.plot) rp.cor.plot(vars)
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
</ul></div></li>
	<li id="example-crosstable">
{% highlight text %}


##################################################################################
##	 Running: rapport('crosstable', data=ius2008, row='gender', col='dwell')
##################################################################################

 == Variable description  

Two variables specified:

 * "gender" ("Gender") with _673_ and
 * "dwell" ("Dwelling") with _662_ valid values.

 == Counts  

<!-- endlist -->

         **city**   **small town**   **village**  
-------- ---------- ---------------- -------------
male     338        28               19           
female   234        3                9            
-------- ---------- ---------------- -------------


 == Percentages  

<!-- endlist -->

         **city**   **small town**   **village**  
-------- ---------- ---------------- -------------
male     0.5357     0.0444           0.0301       
female   0.3708     0.0048           0.0143       
-------- ---------- ---------------- -------------


 === Row percentages  

<!-- endlist -->

         **city**   **small town**   **village**  
-------- ---------- ---------------- -------------
male     0.8779     0.0727           0.0494       
female   0.9512     0.0122           0.0366       
-------- ---------- ---------------- -------------


 === Column percentages  

<!-- endlist -->

         **city**   **small town**   **village**  
-------- ---------- ---------------- -------------
male     0.5909     0.9032           0.6786       
female   0.4091     0.0968           0.3214       
-------- ---------- ---------------- -------------


 == Chi-squared test  


            **X-squared**   **df**   **p-value**  
----------- --------------- -------- -------------
X-squared   12.6353         2        0.0018       
----------- --------------- -------- -------------


It seems that a real association can be pointed out between *gender* and *dwell* by the *Pearson's Chi-squared test* (χ=12.6353 at the degree of freedom being 2) at the significance level of 0.0018.
Based on Goodman and Kruskal's lambda it seems that *dwell* (λ=0.7602) has an effect on *gender* (λ=0) if we assume both variables to be nominal.
The association between the two variables seems to be weak based on Cramer's V (0.1001).

 === Pearson's residuals  

<!-- endlist -->

         **city**   **small town**   **village**  
-------- ---------- ---------------- -------------
male     -3.0844    3.4312           0.7595       
female   3.0844     -3.4312          -0.7595      
-------- ---------- ---------------- -------------


 === Mosaic chart  

/tmp/RtmpPer367/file15ed3c4d.png


#################################################################################
##	 Running: rapport('crosstable', data=ius2008, row='email', col='dwell')
#################################################################################

 == Variable description  

Two variables specified:

 * "email" ("Email usage") with _672_ and
 * "dwell" ("Dwelling") with _662_ valid values.

 == Counts  

<!-- endlist -->

              **city**   **small town**   **village**  
------------- ---------- ---------------- -------------
never         12         0                0            
very rarely   30         1                3            
rarely        41         3                1            
sometimes     67         4                8            
often         101        10               5            
very often    88         5                5            
always        226        9                7            
------------- ---------- ---------------- -------------


 == Percentages  

<!-- endlist -->

              **city**   **small town**   **village**  
------------- ---------- ---------------- -------------
never         0.0192     0.0000           0.0000       
very rarely   0.0479     0.0016           0.0048       
rarely        0.0655     0.0048           0.0016       
sometimes     0.1070     0.0064           0.0128       
often         0.1613     0.0160           0.0080       
very often    0.1406     0.0080           0.0080       
always        0.3610     0.0144           0.0112       
------------- ---------- ---------------- -------------


 === Row percentages  

<!-- endlist -->

              **city**   **small town**   **village**  
------------- ---------- ---------------- -------------
never         1.0000     0.0000           0.0000       
very rarely   0.8824     0.0294           0.0882       
rarely        0.9111     0.0667           0.0222       
sometimes     0.8481     0.0506           0.1013       
often         0.8707     0.0862           0.0431       
very often    0.8980     0.0510           0.0510       
always        0.9339     0.0372           0.0289       
------------- ---------- ---------------- -------------


 === Column percentages  

<!-- endlist -->

              **city**   **small town**   **village**  
------------- ---------- ---------------- -------------
never         0.0212     0.0000           0.0000       
very rarely   0.0531     0.0312           0.1034       
rarely        0.0726     0.0938           0.0345       
sometimes     0.1186     0.1250           0.2759       
often         0.1788     0.3125           0.1724       
very often    0.1558     0.1562           0.1724       
always        0.4000     0.2812           0.2414       
------------- ---------- ---------------- -------------


 == Chi-squared test  


            **X-squared**   **df**   **p-value**  
----------- --------------- -------- -------------
X-squared   14.864          12       0.249        
----------- --------------- -------- -------------


It seems that no real association can be pointed out between *email* and *dwell* by the *Pearson's Chi-squared test* (χ=14.864 at the degree of freedom being 12) at the significance level of 0.249.
For this end no other statistical tests were performed.

 === Pearson's residuals  

<!-- endlist -->

              **city**   **small town**   **village**  
------------- ---------- ---------------- -------------
never         1.1493     -0.8118          -0.7709      
very rarely   -0.4085    -0.5910          1.1955       
rarely        0.2009     0.4916           -0.7985      
sometimes     -1.7459    -0.0210          2.4853       
often         -1.2822    1.9011           -0.1829      
very often    -0.1671    -0.0048          0.2407       
always        2.0982     -1.2561          -1.6443      
------------- ---------- ---------------- -------------


 === Mosaic chart  

/tmp/RtmpPer367/file5c97e1b5.png


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
	<li id="source-crosstable"><div>
<h5>Source of `crosstable.tpl`</h5>
{% highlight text %}

<!--head
Title:        Crosstable
Author:       Gergely Daróczi 
Email:        gergely@snowl.net
Description:  Returning the Chi-squared test of two given variables with count, percentages and Pearson's residuals table. 
Packages:     descr
Example:      rapport('crosstable', data=ius2008, row='gender', col='dwell')
              rapport('crosstable', data=ius2008, row='email', col='dwell')
row           | *factor | Row variable        | A categorical variable.
col           | *factor | Column variable     | A categorical variable. 
head-->

# Variable description

Two variables specified:

 * "<%=rp.name(row)%>"<%ifelse(rp.label(row)==rp.name(row), '', sprintf(' ("%s")', rp.label(row)))%> with <%rp.valid(as.numeric(row))%> and
 * "<%=rp.name(col)%>"<%ifelse(rp.label(col)==rp.name(col), '', sprintf(' ("%s")', rp.label(col)))%> with <%rp.valid(as.numeric(col))%> valid values.

# Counts

<%
table <- table(row, col, deparse.level = 0)
table
%>

# Percentages

<%
prop.table(table)
%>

## Row percentages

<%
prop.table(table, 1)
%>

## Column percentages

<%
prop.table(table, 2)
%>

# Chi-squared test

<%
t <- suppressWarnings(chisq.test(table))
lambda <- lambda.test(table)
cramer <- sqrt(as.numeric(t$statistic)/(sum(table)*min(dim(table))))
t
%>

<%
ifelse(t$p.value < 0.05, sprintf('It seems that a real association can be pointed out between *%s* and *%s* by the *%s* (χ=%s at the degree of freedom being %s) at the significance level of %s.\nBased on Goodman and Kruskal\'s lambda it seems that *%s* (λ=%s) has an effect on *%s* (λ=%s) if we assume both variables to be nominal.\nThe association between the two variables seems to be %s based on Cramer\'s V (%s).', rp.name(row), rp.name(col), t$method, rp.round(as.numeric(t$statistic)), rp.round(as.numeric(t$parameter)), rp.round(t$p.value), c(rp.name(col),rp.name(row))[which.max(lambda)], rp.round(max(as.numeric(lambda))), c(rp.name(col),rp.name(row))[which.min(lambda)], rp.round(min(as.numeric(lambda))), ifelse(cramer < 0.5, "weak", "strong"), rp.round(cramer)), sprintf('It seems that no real association can be pointed out between *%s* and *%s* by the *%s* (χ=%s at the degree of freedom being %s) at the significance level of %s.\nFor this end no other statistical tests were performed.', rp.name(row), rp.name(col), t$method, rp.round(as.numeric(t$statistic)), rp.round(as.numeric(t$parameter)), rp.round(t$p.value)))
%>

## Pearson's residuals

<%
suppressWarnings(CrossTable(table))$chisq$stdres
%>

## Mosaic chart

<%
mosaicplot(table, shade=T, main=NULL)
%>

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

And wow, the mean of *leisure* is _3.1994_!

 === Descriptive statistics  


**Min.**   **1st Qu.**   **Median**   **Mean**   **3rd Qu.**   **Max.**   **NA's**  
---------- ------------- ------------ ---------- ------------- ---------- ----------
0.0        2.0           3.0          3.2        4.0           12.0       37.0      
---------- ------------- ------------ ---------- ------------- ---------- ----------


The 5 highest values are: _12_, _12_, _10_, _10_ and _10_.


##########################################################################
##	 Running: rapport("example", ius2008, var='leisure', desc=FALSE)
##########################################################################

 == Début  

Hello, world!

I have just specified a *Variable* in this template named to **leisure**. The label of this variable is "Internet usage in leisure time (hours per day)".

And wow, the mean of *leisure* is _3.1994_!

**For more detailed statistics, you should have set `desc=TRUE`!**


##################################################################################
##	 Running: rapport("example", ius2008, var='leisure', desc=FALSE, hist=T)
##################################################################################

 == Début  

Hello, world!

I have just specified a *Variable* in this template named to **leisure**. The label of this variable is "Internet usage in leisure time (hours per day)".

And wow, the mean of *leisure* is _3.1994_!

**For more detailed statistics, you should have set `desc=TRUE`!**

 === Histogram  

/tmp/RtmpPer367/file2ca179f1.png


################################################################################################
##	 Running: rapport("example", ius2008, var='leisure', desc=FALSE, hist=T, theme='Set2')
################################################################################################

 == Début  

Hello, world!

I have just specified a *Variable* in this template named to **leisure**. The label of this variable is "Internet usage in leisure time (hours per day)".

And wow, the mean of *leisure* is _3.1994_!

**For more detailed statistics, you should have set `desc=TRUE`!**

 === Histogram  

/tmp/RtmpPer367/file72228e8b.png


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
	<li id="source-example"><div>
<h5>Source of `example.tpl`</h5>
{% highlight text %}

<!--head
Title:        Example template
Author:       Gergely Daróczi 
Description:  This template demonstrates the basic features of rapport. We all hope you will like it!
Packages:     lattice
Example:      rapport("example", ius2008, var='leisure')
              rapport("example", ius2008, var='leisure', desc=FALSE)
              rapport("example", ius2008, var='leisure', desc=FALSE, hist=T)
              rapport("example", ius2008, var='leisure', desc=FALSE, hist=T, theme='Set2')             
var    | *numeric   | Variable| A numeric variable.
desc   | TRUE      | Boolean | Show descriptive statistics of specified variable?
hist   | FALSE     | Boolean | Show histogram of specified variable?
theme  | Set1, Set2, Set3   | Color theme  | Color theme of the diagram
head-->

# Début

Hello, world!

I have just specified a *Variable* in this template named to **<%rp.name(var)%>**. The label of this variable is "<%rp.label(var)%>".

And wow, the mean of *<%rp.name(var)%>* is <%rp.mean(var)%>!

<%
if (!desc) '**For more detailed statistics, you should have set `desc=TRUE`!**'
%>


## <%if (desc) 'Descriptive statistics'%>

<%
if (desc) summary(var)
%>

<%
if (desc) sprintf('The 5 highest values are: %s.', p(sort(var, decreasing = TRUE)[1:5]))
%>

## <%if (hist) 'Histogram'%>

<%
if (hist)
    rp.hist(var, theme=theme)
%>

{% endhighlight %}
</div></li>
</ul>

<a id="multivar-descriptive"> </a>
#### multivar-descriptive.tpl

 <ul class="tabs">
	<li><a class="active" href="#info-multivar-descriptive">Description</a></li>
	<li><a href="#inputs-multivar-descriptive">Inputs</a></li>
	<li><a href="#example-multivar-descriptive">Example</a></li>
	<li><a href="#export-multivar-descriptive">Export</a></li>
	<li><a href="#source-multivar-descriptive">Source</a></li>
</ul>

 <ul class="tabs-content">
	<li class="active" id="info-multivar-descriptive"><div><h5>Descriptive statistics</h5> by <em>Gergely Daróczi</em>
<br><br>
 This template will return descriptive statistics of numerical or frequency tables of categorical variables.
<br><br>
<em>Required packages:</em> 
<br>
<em>Example:</em> 
{% highlight text %}
rapport('multivar-descriptive', data=ius2008, vars=c("gender", 'age'))
rapport('multivar-descriptive', data=ius2008, vars=c("chatim", "game", "surf", "email", "download", "forum", "socnet", "xxx"))
rapport('multivar-descriptive', data=mtcars, vars=c('hp','wt'))
{% endhighlight %}
</div></li>
	<li id="inputs-multivar-descriptive"><div><h5>Input parameters</h5><em>multivar-descriptive.tpl</em> template has the following options to be (optionally) set while calling <em>rapport</em>:<ul>
	<li><h6>vars: <small><em>Variables</em></small></h6>
<div class="options">    <div class="options-desc">Categorical or numerical variables. The template will determine the measurement level of the given variable and will return detailed frequency tables or appropriate descriptive statistics for numerics.
</div>
    <em>Type:</em>	variable
<br>
    <em>Limits:</em>	exactly 1 variable
<br>

</div>
</li>
<br>
<li><h6>nortest: <small><em>Normality tests</em></small></h6>
<div class="options">    <div class="options-desc">Should normality tests be performed on numerical variables?
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
	<li id="example-multivar-descriptive">
{% highlight text %}


##########################################################################################
##	 Running: rapport('multivar-descriptive', data=ius2008, vars=c("gender", 'age'))
##########################################################################################

 === *gender* ("Gender")  

The dataset has _709_ observations with _673_ valid values (missing: _36_) in *gender* ("Gender").
This variable seems to be a factor.

 ==== Base statistics  

<!-- endlist -->

        **gender**   **N**   **pct**   **cumul.count**   **cumul.pct**  
------- ------------ ------- --------- ----------------- ---------------
1       male         410     60.9212   410               60.9212        
2       female       263     39.0788   673               100            
Total                673     100       673               100            
------- ------------ ------- --------- ----------------- ---------------


 ==== Barplot  

/tmp/RtmpPer367/file3c24160d.png

It seems that the highest value is _2_ which is exactly 2 times higher than the smallest value (_1_).

 === *age* ("Age")  

The dataset has _709_ observations with _677_ valid values (missing: _32_) in *age* ("Age").
This variable seems to be numeric.

 ==== Base statistics  


**value**   **mean(age)**   **sd(age)**   **var(age)**  
----------- --------------- ------------- --------------
(all)       24.5731         6.8491        46.9107       
----------- --------------- ------------- --------------


 ==== Histogram  

/tmp/RtmpPer367/file60c8829.png

It seems that the highest value is _58_ which is exactly 3.625 times higher than the smallest value (_16_).

The standard deviation is 6.8491 (variance: 46.9107). The expected value is around 24.5731, somewhere between 24.0572 and 25.0891 (SE: 0.2632).

If we suppose that *Age* is not near to a normal distribution (test: see below, skewness: 1.9296, kurtosis: 7.4851), checking the median (23) might be a better option instead of the mean. The interquartile range (6) measures the statistics dispersion of the variable (similar to standard deviation) based on median.

 ==== Normality tests  

 === Introduction  

In statistics, _normality_ refers to an assumption that the distribution of a random variable follows _normal_ (_Gaussian_) distribution. Because of its bell-like shape, it's also known as the _"bell curve"_. The formula for _normal distribution_ is:

$$f(x) = \frac{1}{\sqrt{2\pi{}\sigma{}^2}} e^{-\frac{(x-\mu{})^2}{2\sigma{}^2}}$$

_Normal distribution_ belongs to a _location-scale family_ of distributions, as it's defined two parameters:

 - *&mu;* - _mean_ or _expectation_ (location parameter)
 - *&sigma;^2^* - _variance_ (scale parameter)

/tmp/RtmpPer367/file2db4a51.png

 === Normality Tests  

 ==== Overview  

Various hypothesis tests can be applied in order to test if the distribution of given random variable violates normality assumption. These procedures test the H~0~ that provided variable's distribution is _normal_. At this point only few such tests will be covered: the ones that are available in `stats` package (which comes bundled with default R installation) and `nortest` package that is [available](http://cran.r-project.org/web/packages/nortest/index.html) on CRAN.

 - **Shapiro-Wilk test** is a powerful normality test appropriate for small samples. In R, it's implemented in `shapiro.test` function available in `stats` package.
 - **Lilliefors test** is a modification of _Kolmogorov-Smirnov test_ appropriate for testing normality when parameters or normal distribution (_&mu;_, _&sigma;^2^_) are not known. `lillie.test` function is located in `nortest` package.
 - **Anderson-Darling test** is one of the most powerful normality tests as it will detect the most of departures from normality. You can find `ad.test` function in `nortest` package.
 - **Pearson &Chi;^2^ test** is another normality test which takes more "traditional" approach in normality testing. `pearson.test` is located in `nortest` package.

 ==== Results  

Here you can see the results of applied normality tests (_p-values_ less than 0.05 indicate significant discrepancies):

<!-- endlist -->

               **H**      **p**  
-------------- ---------- -------
shapiro.test   0.8216     0      
lillie.test    0.17       0      
ad.test        32.1645    0      
pearson.test   625.8479   0      
-------------- ---------- -------


So, let's draw some conclusions based on applied normality test:

 - according to _Shapiro-Wilk test_, the distribution of _Age_ is not normal.
 - based on _Lilliefors test_, distribution of _Age_ is not normal
 - _Anderson-Darling test_ confirms violation of normality assumption
 - _Pearson's &Chi;^2^ test_ classifies the underlying distribution as non-normal

 === Diagnostic Plots  

There are various plots that can help you decide about the normality of the distribution. Only a few most commonly used plots will be shown: _histogram_, _Q-Q plot_ and _kernel density plot_.

 ==== Histogram  

_Histogram_ was first introduced by _Karl Pearson_ and it's probably the most popular plot for depicting the probability distribution of a random variable. However, the decision depends on number of bins, so it can sometimes be misleading. If the variable distribution is normal, bins should resemble the "bell-like" shape.

/tmp/RtmpPer367/file6bf43218.png

 ==== Q-Q Plot  

"Q" in _Q-Q plot_ stands for _quantile_, as this plot compares empirical and theoretical distribution (in this case, _normal_ distribution) by plotting their quantiles against each other. For normal distribution, plotted dots should approximate a "straight", `x = y` line.

/tmp/RtmpPer367/file70e5fa84.png

 ==== Kernel Density Plot  

_Kernel density plot_ is a plot of smoothed _empirical distribution function_. As such, it provides good insight about the shape of the distribution. For normal distributions, it should resemble the well known "bell shape".

/tmp/RtmpPer367/file1021b270.png




##################################################################################################################################################
##	 Running: rapport('multivar-descriptive', data=ius2008, vars=c("chatim", "game", "surf", "email", "download", "forum", "socnet", "xxx"))
##################################################################################################################################################

 === *chatim* ("Chat & IM usage")  

The dataset has _709_ observations with _669_ valid values (missing: _40_) in *chatim* ("Chat & IM usage").
This variable seems to be a factor.

 ==== Base statistics  

<!-- endlist -->

        **chatim**    **N**   **pct**   **cumul.count**   **cumul.pct**  
------- ------------- ------- --------- ----------------- ---------------
1       never         60      8.9686    60                8.9686         
2       very rarely   73      10.9118   133               19.8804        
3       rarely        58      8.6697    191               28.5501        
4       sometimes     113     16.8909   304               45.441         
5       often         136     20.3288   440               65.7698        
6       very often    88      13.154    528               78.9238        
7       always        141     21.0762   669               100            
Total                 669     100       669               100            
------- ------------- ------- --------- ----------------- ---------------


 ==== Barplot  

/tmp/RtmpPer367/file6dea4c8.png

It seems that the highest value is _7_ which is exactly 7 times higher than the smallest value (_1_).

 === *game* ("On-line games usage")  

The dataset has _709_ observations with _677_ valid values (missing: _32_) in *game* ("On-line games usage").
This variable seems to be a factor.

 ==== Base statistics  

<!-- endlist -->

        **game**      **N**   **pct**   **cumul.count**   **cumul.pct**  
------- ------------- ------- --------- ----------------- ---------------
1       never         352     51.9941   352               51.9941        
2       very rarely   128     18.9069   480               70.901         
3       rarely        32      4.7267    512               75.6278        
4       sometimes     60      8.8626    572               84.4904        
5       often         37      5.4653    609               89.9557        
6       very often    35      5.1699    644               95.1256        
7       always        33      4.8744    677               100            
Total                 677     100       677               100            
------- ------------- ------- --------- ----------------- ---------------


 ==== Barplot  

/tmp/RtmpPer367/filef7d2066.png

It seems that the highest value is _7_ which is exactly 7 times higher than the smallest value (_1_).

 === *surf* ("Web surfing usage")  

The dataset has _709_ observations with _678_ valid values (missing: _31_) in *surf* ("Web surfing usage").
This variable seems to be a factor.

 ==== Base statistics  

<!-- endlist -->

        **surf**      **N**   **pct**   **cumul.count**   **cumul.pct**  
------- ------------- ------- --------- ----------------- ---------------
1       never         17      2.5074    17                2.5074         
2       very rarely   26      3.8348    43                6.3422         
3       rarely        33      4.8673    76                11.2094        
4       sometimes     107     15.7817   183               26.9912        
5       often         158     23.3038   341               50.295         
6       very often    142     20.944    483               71.2389        
7       always        195     28.7611   678               100            
Total                 678     100       678               100            
------- ------------- ------- --------- ----------------- ---------------


 ==== Barplot  

/tmp/RtmpPer367/file3536201e.png

It seems that the highest value is _7_ which is exactly 7 times higher than the smallest value (_1_).

 === *email* ("Email usage")  

The dataset has _709_ observations with _672_ valid values (missing: _37_) in *email* ("Email usage").
This variable seems to be a factor.

 ==== Base statistics  

<!-- endlist -->

        **email**     **N**   **pct**   **cumul.count**   **cumul.pct**  
------- ------------- ------- --------- ----------------- ---------------
1       never         13      1.9345    13                1.9345         
2       very rarely   36      5.3571    49                7.2917         
3       rarely        46      6.8452    95                14.1369        
4       sometimes     87      12.9464   182               27.0833        
5       often         123     18.3036   305               45.3869        
6       very often    108     16.0714   413               61.4583        
7       always        259     38.5417   672               100            
Total                 672     100       672               100            
------- ------------- ------- --------- ----------------- ---------------


 ==== Barplot  

/tmp/RtmpPer367/file3a5ed51c.png

It seems that the highest value is _7_ which is exactly 7 times higher than the smallest value (_1_).

 === *download* ("Download usage")  

The dataset has _709_ observations with _677_ valid values (missing: _32_) in *download* ("Download usage").
This variable seems to be a factor.

 ==== Base statistics  

<!-- endlist -->

        **download**   **N**   **pct**   **cumul.count**   **cumul.pct**  
------- -------------- ------- --------- ----------------- ---------------
1       never          11      1.6248    11                1.6248         
2       very rarely    28      4.1359    39                5.7607         
3       rarely         29      4.2836    68                10.0443        
4       sometimes      80      11.8168   148               21.8612        
5       often          124     18.3161   272               40.1773        
6       very often     160     23.6337   432               63.8109        
7       always         245     36.1891   677               100            
Total                  677     100       677               100            
------- -------------- ------- --------- ----------------- ---------------


 ==== Barplot  

/tmp/RtmpPer367/file33e954ab.png

It seems that the highest value is _7_ which is exactly 7 times higher than the smallest value (_1_).

 === *forum* ("Web forums usage")  

The dataset has _709_ observations with _673_ valid values (missing: _36_) in *forum* ("Web forums usage").
This variable seems to be a factor.

 ==== Base statistics  

<!-- endlist -->

        **forum**     **N**   **pct**   **cumul.count**   **cumul.pct**  
------- ------------- ------- --------- ----------------- ---------------
1       never         76      11.2927   76                11.2927        
2       very rarely   80      11.8871   156               23.1798        
3       rarely        72      10.6984   228               33.8782        
4       sometimes     111     16.4933   339               50.3715        
5       often         109     16.1961   448               66.5676        
6       very often    119     17.682    567               84.2496        
7       always        106     15.7504   673               100            
Total                 673     100       673               100            
------- ------------- ------- --------- ----------------- ---------------


 ==== Barplot  

/tmp/RtmpPer367/file4db088a7.png

It seems that the highest value is _7_ which is exactly 7 times higher than the smallest value (_1_).

 === *socnet* ("Social networks usage")  

The dataset has _709_ observations with _678_ valid values (missing: _31_) in *socnet* ("Social networks usage").
This variable seems to be a factor.

 ==== Base statistics  

<!-- endlist -->

        **socnet**    **N**   **pct**   **cumul.count**   **cumul.pct**  
------- ------------- ------- --------- ----------------- ---------------
1       never         208     30.6785   208               30.6785        
2       very rarely   102     15.0442   310               45.7227        
3       rarely        57      8.4071    367               54.1298        
4       sometimes     87      12.8319   454               66.9617        
5       often         79      11.6519   533               78.6136        
6       very often    80      11.7994   613               90.413         
7       always        65      9.587     678               100            
Total                 678     100       678               100            
------- ------------- ------- --------- ----------------- ---------------


 ==== Barplot  

/tmp/RtmpPer367/file7b3180a9.png

It seems that the highest value is _7_ which is exactly 7 times higher than the smallest value (_1_).

 === *xxx* ("Adult sites usage")  

The dataset has _709_ observations with _674_ valid values (missing: _35_) in *xxx* ("Adult sites usage").
This variable seems to be a factor.

 ==== Base statistics  

<!-- endlist -->

        **xxx**       **N**   **pct**   **cumul.count**   **cumul.pct**  
------- ------------- ------- --------- ----------------- ---------------
1       never         274     40.6528   274               40.6528        
2       very rarely   124     18.3976   398               59.0504        
3       rarely        52      7.7151    450               66.7656        
4       sometimes     131     19.4362   581               86.2018        
5       often         46      6.8249    627               93.0267        
6       very often    28      4.1543    655               97.181         
7       always        19      2.819     674               100            
Total                 674     100       674               100            
------- ------------- ------- --------- ----------------- ---------------


 ==== Barplot  

/tmp/RtmpPer367/file4c336dab.png

It seems that the highest value is _7_ which is exactly 7 times higher than the smallest value (_1_).




###################################################################################
##	 Running: rapport('multivar-descriptive', data=mtcars, vars=c('hp','wt'))
###################################################################################

 === *hp*  

The dataset has _32_ observations with _32_ valid values (missing: _0_) in *hp*.
This variable seems to be numeric.

 ==== Base statistics  


**value**   **mean(hp)**   **sd(hp)**   **var(hp)**  
----------- -------------- ------------ -------------
(all)       146.6875       68.5629      4700.8669    
----------- -------------- ------------ -------------


 ==== Histogram  

/tmp/RtmpPer367/file549a9077.png

It seems that the highest value is _335_ which is exactly 6.4423 times higher than the smallest value (_52_).

The standard deviation is 68.5629 (variance: 4700.8669). The expected value is around 146.6875, somewhere between 122.9317 and 170.4433 (SE: 12.1203).

If we suppose that *hp* is not near to a normal distribution (test: see below, skewness: 0.7614, kurtosis: 3.0522), checking the median (123) might be a better option instead of the mean. The interquartile range (83.5) measures the statistics dispersion of the variable (similar to standard deviation) based on median.

 ==== Normality tests  

 === Introduction  

In statistics, _normality_ refers to an assumption that the distribution of a random variable follows _normal_ (_Gaussian_) distribution. Because of its bell-like shape, it's also known as the _"bell curve"_. The formula for _normal distribution_ is:

$$f(x) = \frac{1}{\sqrt{2\pi{}\sigma{}^2}} e^{-\frac{(x-\mu{})^2}{2\sigma{}^2}}$$

_Normal distribution_ belongs to a _location-scale family_ of distributions, as it's defined two parameters:

 - *&mu;* - _mean_ or _expectation_ (location parameter)
 - *&sigma;^2^* - _variance_ (scale parameter)

/tmp/RtmpPer367/file6f2027e.png

 === Normality Tests  

 ==== Overview  

Various hypothesis tests can be applied in order to test if the distribution of given random variable violates normality assumption. These procedures test the H~0~ that provided variable's distribution is _normal_. At this point only few such tests will be covered: the ones that are available in `stats` package (which comes bundled with default R installation) and `nortest` package that is [available](http://cran.r-project.org/web/packages/nortest/index.html) on CRAN.

 - **Shapiro-Wilk test** is a powerful normality test appropriate for small samples. In R, it's implemented in `shapiro.test` function available in `stats` package.
 - **Lilliefors test** is a modification of _Kolmogorov-Smirnov test_ appropriate for testing normality when parameters or normal distribution (_&mu;_, _&sigma;^2^_) are not known. `lillie.test` function is located in `nortest` package.
 - **Anderson-Darling test** is one of the most powerful normality tests as it will detect the most of departures from normality. You can find `ad.test` function in `nortest` package.
 - **Pearson &Chi;^2^ test** is another normality test which takes more "traditional" approach in normality testing. `pearson.test` is located in `nortest` package.

 ==== Results  

Here you can see the results of applied normality tests (_p-values_ less than 0.05 indicate significant discrepancies):

<!-- endlist -->

               **H**    **p**   
-------------- -------- --------
shapiro.test   0.9334   0.0488  
lillie.test    0.1664   0.0245  
ad.test        0.7077   0.0584  
pearson.test   11.5     0.0423  
-------------- -------- --------


So, let's draw some conclusions based on applied normality test:

 - according to _Shapiro-Wilk test_, the distribution of _hp_ is not normal.
 - based on _Lilliefors test_, distribution of _hp_ is not normal
 - _Anderson-Darling test_ confirms  normality assumption
 - _Pearson's &Chi;^2^ test_ classifies the underlying distribution as non-normal

 === Diagnostic Plots  

There are various plots that can help you decide about the normality of the distribution. Only a few most commonly used plots will be shown: _histogram_, _Q-Q plot_ and _kernel density plot_.

 ==== Histogram  

_Histogram_ was first introduced by _Karl Pearson_ and it's probably the most popular plot for depicting the probability distribution of a random variable. However, the decision depends on number of bins, so it can sometimes be misleading. If the variable distribution is normal, bins should resemble the "bell-like" shape.

/tmp/RtmpPer367/file65ceb908.png

 ==== Q-Q Plot  

"Q" in _Q-Q plot_ stands for _quantile_, as this plot compares empirical and theoretical distribution (in this case, _normal_ distribution) by plotting their quantiles against each other. For normal distribution, plotted dots should approximate a "straight", `x = y` line.

/tmp/RtmpPer367/file33b65a54.png

 ==== Kernel Density Plot  

_Kernel density plot_ is a plot of smoothed _empirical distribution function_. As such, it provides good insight about the shape of the distribution. For normal distributions, it should resemble the well known "bell shape".

/tmp/RtmpPer367/file56d28cf9.png

 === *wt*  

The dataset has _32_ observations with _32_ valid values (missing: _0_) in *wt*.
This variable seems to be numeric.

 ==== Base statistics  


**value**   **mean(wt)**   **sd(wt)**   **var(wt)**  
----------- -------------- ------------ -------------
(all)       3.2172         0.9785       0.9574       
----------- -------------- ------------ -------------


 ==== Histogram  

/tmp/RtmpPer367/file736622b5.png

It seems that the highest value is _5.424_ which is exactly 3.5849 times higher than the smallest value (_1.513_).

The standard deviation is 0.9785 (variance: 0.9574). The expected value is around 3.2172, somewhere between 2.8782 and 3.5563 (SE: 0.173).

If we suppose that *wt* is not near to a normal distribution (test: see below, skewness: 0.4438, kurtosis: 3.1725), checking the median (3.325) might be a better option instead of the mean. The interquartile range (1.0288) measures the statistics dispersion of the variable (similar to standard deviation) based on median.

 ==== Normality tests  

 === Introduction  

In statistics, _normality_ refers to an assumption that the distribution of a random variable follows _normal_ (_Gaussian_) distribution. Because of its bell-like shape, it's also known as the _"bell curve"_. The formula for _normal distribution_ is:

$$f(x) = \frac{1}{\sqrt{2\pi{}\sigma{}^2}} e^{-\frac{(x-\mu{})^2}{2\sigma{}^2}}$$

_Normal distribution_ belongs to a _location-scale family_ of distributions, as it's defined two parameters:

 - *&mu;* - _mean_ or _expectation_ (location parameter)
 - *&sigma;^2^* - _variance_ (scale parameter)

/tmp/RtmpPer367/file180e8801.png

 === Normality Tests  

 ==== Overview  

Various hypothesis tests can be applied in order to test if the distribution of given random variable violates normality assumption. These procedures test the H~0~ that provided variable's distribution is _normal_. At this point only few such tests will be covered: the ones that are available in `stats` package (which comes bundled with default R installation) and `nortest` package that is [available](http://cran.r-project.org/web/packages/nortest/index.html) on CRAN.

 - **Shapiro-Wilk test** is a powerful normality test appropriate for small samples. In R, it's implemented in `shapiro.test` function available in `stats` package.
 - **Lilliefors test** is a modification of _Kolmogorov-Smirnov test_ appropriate for testing normality when parameters or normal distribution (_&mu;_, _&sigma;^2^_) are not known. `lillie.test` function is located in `nortest` package.
 - **Anderson-Darling test** is one of the most powerful normality tests as it will detect the most of departures from normality. You can find `ad.test` function in `nortest` package.
 - **Pearson &Chi;^2^ test** is another normality test which takes more "traditional" approach in normality testing. `pearson.test` is located in `nortest` package.

 ==== Results  

Here you can see the results of applied normality tests (_p-values_ less than 0.05 indicate significant discrepancies):

<!-- endlist -->

               **H**    **p**   
-------------- -------- --------
shapiro.test   0.9433   0.0927  
lillie.test    0.1356   0.1412  
ad.test        0.6091   0.1038  
pearson.test   4.5      0.4799  
-------------- -------- --------


So, let's draw some conclusions based on applied normality test:

 - according to _Shapiro-Wilk test_, the distribution of _wt_ is  normal.
 - based on _Lilliefors test_, distribution of _wt_ is not normal
 - _Anderson-Darling test_ confirms  normality assumption
 - _Pearson's &Chi;^2^ test_ classifies the underlying distribution as non-normal

 === Diagnostic Plots  

There are various plots that can help you decide about the normality of the distribution. Only a few most commonly used plots will be shown: _histogram_, _Q-Q plot_ and _kernel density plot_.

 ==== Histogram  

_Histogram_ was first introduced by _Karl Pearson_ and it's probably the most popular plot for depicting the probability distribution of a random variable. However, the decision depends on number of bins, so it can sometimes be misleading. If the variable distribution is normal, bins should resemble the "bell-like" shape.

/tmp/RtmpPer367/file72a05107.png

 ==== Q-Q Plot  

"Q" in _Q-Q plot_ stands for _quantile_, as this plot compares empirical and theoretical distribution (in this case, _normal_ distribution) by plotting their quantiles against each other. For normal distribution, plotted dots should approximate a "straight", `x = y` line.

/tmp/RtmpPer367/filec752775.png

 ==== Kernel Density Plot  

_Kernel density plot_ is a plot of smoothed _empirical distribution function_. As such, it provides good insight about the shape of the distribution. For normal distributions, it should resemble the well known "bell shape".

/tmp/RtmpPer367/file2ab85fbe.png




{% endhighlight %}
</li>
	<li id="export-multivar-descriptive"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport('multivar-descriptive', data=ius2008, vars=c("gender", 'age'))
rapport('multivar-descriptive', data=ius2008, vars=c("chatim", "game", "surf", "email", "download", "forum", "socnet", "xxx"))
rapport('multivar-descriptive', data=mtcars, vars=c('hp','wt'))

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
	<li id="source-multivar-descriptive"><div>
<h5>Source of `multivar-descriptive.tpl`</h5>
{% highlight text %}

<!--head
Title: Descriptive statistics
Author: Gergely Daróczi 
Email: gergely@snowl.net
Description: This template will return descriptive statistics of numerical or frequency tables of categorical variables. 
Packages: 
Example:    rapport('multivar-descriptive', data=ius2008, vars=c("gender", 'age'))
            rapport('multivar-descriptive', data=ius2008, vars=c("chatim", "game", "surf", "email", "download", "forum", "socnet", "xxx"))
            rapport('multivar-descriptive', data=mtcars, vars=c('hp','wt'))
vars        | *variable[1]| Variables         | Categorical or numerical variables. The template will determine the measurement level of the given variable and will return detailed frequency tables or appropriate descriptive statistics for numerics.
nortest     | TRUE          | Normality tests   | Should normality tests be performed on numerical variables?  
head-->

<%
lapply(lapply(vars, rp.name), function(x) rapport('univar-descriptive', data=rp.data, var=x, nortest=nortest, nested.levels.offset=0))
%>

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

 == Introduction  

In statistics, _normality_ refers to an assumption that the distribution of a random variable follows _normal_ (_Gaussian_) distribution. Because of its bell-like shape, it's also known as the _"bell curve"_. The formula for _normal distribution_ is:

$$f(x) = \frac{1}{\sqrt{2\pi{}\sigma{}^2}} e^{-\frac{(x-\mu{})^2}{2\sigma{}^2}}$$

_Normal distribution_ belongs to a _location-scale family_ of distributions, as it's defined two parameters:

 - *&mu;* - _mean_ or _expectation_ (location parameter)
 - *&sigma;^2^* - _variance_ (scale parameter)

/tmp/RtmpPer367/file147c5aeb.png

 == Normality Tests  

 === Overview  

Various hypothesis tests can be applied in order to test if the distribution of given random variable violates normality assumption. These procedures test the H~0~ that provided variable's distribution is _normal_. At this point only few such tests will be covered: the ones that are available in `stats` package (which comes bundled with default R installation) and `nortest` package that is [available](http://cran.r-project.org/web/packages/nortest/index.html) on CRAN.

 - **Shapiro-Wilk test** is a powerful normality test appropriate for small samples. In R, it's implemented in `shapiro.test` function available in `stats` package.
 - **Lilliefors test** is a modification of _Kolmogorov-Smirnov test_ appropriate for testing normality when parameters or normal distribution (_&mu;_, _&sigma;^2^_) are not known. `lillie.test` function is located in `nortest` package.
 - **Anderson-Darling test** is one of the most powerful normality tests as it will detect the most of departures from normality. You can find `ad.test` function in `nortest` package.
 - **Pearson &Chi;^2^ test** is another normality test which takes more "traditional" approach in normality testing. `pearson.test` is located in `nortest` package.

 === Results  

Here you can see the results of applied normality tests (_p-values_ less than 0.05 indicate significant discrepancies):

<!-- endlist -->

               **H**     **p**  
-------------- --------- -------
shapiro.test   0.9001    0      
lillie.test    0.168     0      
ad.test        18.753    0      
pearson.test   1791.25   0      
-------------- --------- -------


So, let's draw some conclusions based on applied normality test:

 - according to _Shapiro-Wilk test_, the distribution of _Internet usage in leisure time (hours per day)_ is not normal.
 - based on _Lilliefors test_, distribution of _Internet usage in leisure time (hours per day)_ is not normal
 - _Anderson-Darling test_ confirms violation of normality assumption
 - _Pearson's &Chi;^2^ test_ classifies the underlying distribution as normal

 == Diagnostic Plots  

There are various plots that can help you decide about the normality of the distribution. Only a few most commonly used plots will be shown: _histogram_, _Q-Q plot_ and _kernel density plot_.

 === Histogram  

_Histogram_ was first introduced by _Karl Pearson_ and it's probably the most popular plot for depicting the probability distribution of a random variable. However, the decision depends on number of bins, so it can sometimes be misleading. If the variable distribution is normal, bins should resemble the "bell-like" shape.

/tmp/RtmpPer367/file57dfeb3f.png

 === Q-Q Plot  

"Q" in _Q-Q plot_ stands for _quantile_, as this plot compares empirical and theoretical distribution (in this case, _normal_ distribution) by plotting their quantiles against each other. For normal distribution, plotted dots should approximate a "straight", `x = y` line.

/tmp/RtmpPer367/file39e76d1c.png

 === Kernel Density Plot  

_Kernel density plot_ is a plot of smoothed _empirical distribution function_. As such, it provides good insight about the shape of the distribution. For normal distributions, it should resemble the well known "bell shape".

/tmp/RtmpPer367/file31abd8c5.png


#################################################################################
##	 Running: rapport("nortest", ius2008, var = "leisure", nc.plot = FALSE)
#################################################################################

 == Introduction  

In statistics, _normality_ refers to an assumption that the distribution of a random variable follows _normal_ (_Gaussian_) distribution. Because of its bell-like shape, it's also known as the _"bell curve"_. The formula for _normal distribution_ is:

$$f(x) = \frac{1}{\sqrt{2\pi{}\sigma{}^2}} e^{-\frac{(x-\mu{})^2}{2\sigma{}^2}}$$

_Normal distribution_ belongs to a _location-scale family_ of distributions, as it's defined two parameters:

 - *&mu;* - _mean_ or _expectation_ (location parameter)
 - *&sigma;^2^* - _variance_ (scale parameter)

 == Normality Tests  

 === Overview  

Various hypothesis tests can be applied in order to test if the distribution of given random variable violates normality assumption. These procedures test the H~0~ that provided variable's distribution is _normal_. At this point only few such tests will be covered: the ones that are available in `stats` package (which comes bundled with default R installation) and `nortest` package that is [available](http://cran.r-project.org/web/packages/nortest/index.html) on CRAN.

 - **Shapiro-Wilk test** is a powerful normality test appropriate for small samples. In R, it's implemented in `shapiro.test` function available in `stats` package.
 - **Lilliefors test** is a modification of _Kolmogorov-Smirnov test_ appropriate for testing normality when parameters or normal distribution (_&mu;_, _&sigma;^2^_) are not known. `lillie.test` function is located in `nortest` package.
 - **Anderson-Darling test** is one of the most powerful normality tests as it will detect the most of departures from normality. You can find `ad.test` function in `nortest` package.
 - **Pearson &Chi;^2^ test** is another normality test which takes more "traditional" approach in normality testing. `pearson.test` is located in `nortest` package.

 === Results  

Here you can see the results of applied normality tests (_p-values_ less than 0.05 indicate significant discrepancies):

<!-- endlist -->

               **H**     **p**  
-------------- --------- -------
shapiro.test   0.9001    0      
lillie.test    0.168     0      
ad.test        18.753    0      
pearson.test   1791.25   0      
-------------- --------- -------


So, let's draw some conclusions based on applied normality test:

 - according to _Shapiro-Wilk test_, the distribution of _Internet usage in leisure time (hours per day)_ is not normal.
 - based on _Lilliefors test_, distribution of _Internet usage in leisure time (hours per day)_ is not normal
 - _Anderson-Darling test_ confirms violation of normality assumption
 - _Pearson's &Chi;^2^ test_ classifies the underlying distribution as normal

 == Diagnostic Plots  

There are various plots that can help you decide about the normality of the distribution. Only a few most commonly used plots will be shown: _histogram_, _Q-Q plot_ and _kernel density plot_.

 === Histogram  

_Histogram_ was first introduced by _Karl Pearson_ and it's probably the most popular plot for depicting the probability distribution of a random variable. However, the decision depends on number of bins, so it can sometimes be misleading. If the variable distribution is normal, bins should resemble the "bell-like" shape.

/tmp/RtmpPer367/file5c1824e1.png

 === Q-Q Plot  

"Q" in _Q-Q plot_ stands for _quantile_, as this plot compares empirical and theoretical distribution (in this case, _normal_ distribution) by plotting their quantiles against each other. For normal distribution, plotted dots should approximate a "straight", `x = y` line.

/tmp/RtmpPer367/file3fe131bc.png

 === Kernel Density Plot  

_Kernel density plot_ is a plot of smoothed _empirical distribution function_. As such, it provides good insight about the shape of the distribution. For normal distributions, it should resemble the well known "bell shape".

/tmp/RtmpPer367/file21ed03f0.png


#################################################################################
##	 Running: rapport("nortest", ius2008, var = "leisure", qq.line = FALSE)
#################################################################################

 == Introduction  

In statistics, _normality_ refers to an assumption that the distribution of a random variable follows _normal_ (_Gaussian_) distribution. Because of its bell-like shape, it's also known as the _"bell curve"_. The formula for _normal distribution_ is:

$$f(x) = \frac{1}{\sqrt{2\pi{}\sigma{}^2}} e^{-\frac{(x-\mu{})^2}{2\sigma{}^2}}$$

_Normal distribution_ belongs to a _location-scale family_ of distributions, as it's defined two parameters:

 - *&mu;* - _mean_ or _expectation_ (location parameter)
 - *&sigma;^2^* - _variance_ (scale parameter)

/tmp/RtmpPer367/file1a566a90.png

 == Normality Tests  

 === Overview  

Various hypothesis tests can be applied in order to test if the distribution of given random variable violates normality assumption. These procedures test the H~0~ that provided variable's distribution is _normal_. At this point only few such tests will be covered: the ones that are available in `stats` package (which comes bundled with default R installation) and `nortest` package that is [available](http://cran.r-project.org/web/packages/nortest/index.html) on CRAN.

 - **Shapiro-Wilk test** is a powerful normality test appropriate for small samples. In R, it's implemented in `shapiro.test` function available in `stats` package.
 - **Lilliefors test** is a modification of _Kolmogorov-Smirnov test_ appropriate for testing normality when parameters or normal distribution (_&mu;_, _&sigma;^2^_) are not known. `lillie.test` function is located in `nortest` package.
 - **Anderson-Darling test** is one of the most powerful normality tests as it will detect the most of departures from normality. You can find `ad.test` function in `nortest` package.
 - **Pearson &Chi;^2^ test** is another normality test which takes more "traditional" approach in normality testing. `pearson.test` is located in `nortest` package.

 === Results  

Here you can see the results of applied normality tests (_p-values_ less than 0.05 indicate significant discrepancies):

<!-- endlist -->

               **H**     **p**  
-------------- --------- -------
shapiro.test   0.9001    0      
lillie.test    0.168     0      
ad.test        18.753    0      
pearson.test   1791.25   0      
-------------- --------- -------


So, let's draw some conclusions based on applied normality test:

 - according to _Shapiro-Wilk test_, the distribution of _Internet usage in leisure time (hours per day)_ is not normal.
 - based on _Lilliefors test_, distribution of _Internet usage in leisure time (hours per day)_ is not normal
 - _Anderson-Darling test_ confirms violation of normality assumption
 - _Pearson's &Chi;^2^ test_ classifies the underlying distribution as normal

 == Diagnostic Plots  

There are various plots that can help you decide about the normality of the distribution. Only a few most commonly used plots will be shown: _histogram_, _Q-Q plot_ and _kernel density plot_.

 === Histogram  

_Histogram_ was first introduced by _Karl Pearson_ and it's probably the most popular plot for depicting the probability distribution of a random variable. However, the decision depends on number of bins, so it can sometimes be misleading. If the variable distribution is normal, bins should resemble the "bell-like" shape.

/tmp/RtmpPer367/file2e9eecda.png

 === Q-Q Plot  

"Q" in _Q-Q plot_ stands for _quantile_, as this plot compares empirical and theoretical distribution (in this case, _normal_ distribution) by plotting their quantiles against each other. For normal distribution, plotted dots should approximate a "straight", `x = y` line.

/tmp/RtmpPer367/file79debf17.png

 === Kernel Density Plot  

_Kernel density plot_ is a plot of smoothed _empirical distribution function_. As such, it provides good insight about the shape of the distribution. For normal distributions, it should resemble the well known "bell shape".

/tmp/RtmpPer367/file7db513db.png


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
	<li><a href="demo/nortest.odt">odt (MS Word compatibile)</a></li>
	<li><a href="demo/nortest.rtf">rtf (MS Word compatibile)</a></li>
	<li><a href="demo/nortest.epub">epub</a></li>
	<li><a href="demo/nortest.tex" target="_blank">latex</a></li>
	<li><a href="demo/nortest-slidy.html" target="_blank">HTML slidy</a></li>
</ul>
<h6>Other morkdown formats</h6>
<ul>
	<li><a href="demo/nortest.plain" target="_blank">plain text</a></li>
	<li><a href="demo/nortest.textile" target="_blank">textile</a></li>
	<li><a href="demo/nortest.xml" target="_blank">docbook</a></li>
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
Title:        Normality Tests
Author:       Aleksandar Blagotić
Description:  Overview of several normality tests and diagnostic plots that can screen departures from normality.
Packages:     nortest
Example:      rapport("nortest", ius2008, var = "leisure")
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

<%
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

<%
(h <- htest(var, shapiro.test, lillie.test, ad.test, pearson.test))
p <- .05
%>

So, let's draw some conclusions based on applied normality test:

 - according to _Shapiro-Wilk test_, the distribution of _<% var.label %>_ is <% ifelse(h[1, 2] < p, "not", "") %> normal.
 - based on _Lilliefors test_, distribution of _<% var.label %>_ is <% ifelse(h[2, 2], "not normal", "normal") %>
 - _Anderson-Darling test_ confirms <% ifelse(h[3, 2] < p, "violation of", "") %> normality assumption
 - _Pearson's &Chi;^2^ test_ classifies the underlying distribution as <% ifelse(h[4, 2], "non-normal", "normal") %>

# Diagnostic Plots

There are various plots that can help you decide about the normality of the distribution. Only a few most commonly used plots will be shown: _histogram_, _Q-Q plot_ and _kernel density plot_.

## Histogram

_Histogram_ was first introduced by _Karl Pearson_ and it's probably the most popular plot for depicting the probability distribution of a random variable. However, the decision depends on number of bins, so it can sometimes be misleading. If the variable distribution is normal, bins should resemble the "bell-like" shape.
 
<%
rp.hist(var)
%>

## Q-Q Plot
 
"Q" in _Q-Q plot_ stands for _quantile_, as this plot compares empirical and theoretical distribution (in this case, _normal_ distribution) by plotting their quantiles against each other. For normal distribution, plotted dots should approximate a "straight", `x = y` line.

<%
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

<%
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

 == Boxplot  

/tmp/RtmpPer367/file255a9914.png

 == Lund test  

It seems that _4_ extreme values can be found in "Internet usage for educational purposes (hours per day)". These are: 10, 0.5, 1.5, 0.5.

 === Explanation  

The above test for outliers was based on *lm(1 ~ edu)*:


              **Estimate**   **Std. Error**   **t value**   **Pr(>|t|)**  
------------- -------------- ---------------- ------------- --------------
(Intercept)   2.0481         0.078            26.2677       0             
------------- -------------- ---------------- ------------- --------------


 === References  

 * Lund, R. E. 1975, "Tables for An Approximate Test for Outliers in Linear Models", Technometrics, vol. 17, no. 4, pp. 473-476.
 * Prescott, P. 1975, "An Approximate Test for Outliers in Linear Models", Technometrics, vol. 17, no. 1, pp. 129-132.

 == Grubb's test  

Grubbs test for one outlier shows that highest value 12 is an outlier (p=0.0002).

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

/tmp/RtmpPer367/file5f1ab4d8.png

 == Lund test  

It seems that _4_ extreme values can be found in "Internet usage for educational purposes (hours per day)". These are: 10, 0.5, 1.5, 0.5.

 === Explanation  

The above test for outliers was based on *lm(1 ~ edu)*:


              **Estimate**   **Std. Error**   **t value**   **Pr(>|t|)**  
------------- -------------- ---------------- ------------- --------------
(Intercept)   2.0481         0.078            26.2677       0             
------------- -------------- ---------------- ------------- --------------


 === References  

 * Lund, R. E. 1975, "Tables for An Approximate Test for Outliers in Linear Models", Technometrics, vol. 17, no. 4, pp. 473-476.
 * Prescott, P. 1975, "An Approximate Test for Outliers in Linear Models", Technometrics, vol. 17, no. 1, pp. 129-132.

 == Grubb's test  

Grubbs test for one outlier shows that highest value 12 is an outlier (p=0.0002).

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

/tmp/RtmpPer367/file2b41a1b3.png

 == Lund test  

It seems that _4_ extreme values can be found in "Internet usage for educational purposes (hours per day)". These are: 10, 0.5, 1.5, 0.5.

 === Explanation  

The above test for outliers was based on *lm(1 ~ edu)*:


              **Estimate**   **Std. Error**   **t value**   **Pr(>|t|)**  
------------- -------------- ---------------- ------------- --------------
(Intercept)   2.0481         0.078            26.2677       0             
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
	<li id="source-outlier-test"><div>
<h5>Source of `outlier-test.tpl`</h5>
{% highlight text %}

<!--head
Title:          Outlier tests
Author:         Gergely Daróczi 
Email:          gergely@snowl.net
Description:    This template will check if provided variable has any outliers. 
Packages:       outliers
Example:        rapport('outlier-test', data=ius2008, var='edu')
                rapport('outlier-test', data=ius2008, var='edu', lund.res=FALSE)
                rapport('outlier-test', data=ius2008, var='edu', lund.res=FALSE, references=FALSE, grubb=FALSE, dixon=FALSE)
var             | *numeric | Variable        | Numerical variable
lund.res        | FALSE   | Residuals       | Return Lund's residuals?
references      | TRUE    | References      | Print references?
grubb           | TRUE    | Grubb's test    | Show Grubb's test?
dixon           | TRUE    | Dixon's test    | Show Dixon's test?
head-->

# Boxplot

<%
rp.boxplot(var)
%>

# Lund test

It seems that <%length(rp.outlier(var))%> extreme values can be found in "<%rp.label(var)%>". <%ifelse(length(rp.outlier(var)) > 0, sprintf('These are: %s.', paste(rp.outlier(var), collapse=', ')), '')%>

## Explanation

The above test for outliers was based on *lm(1 ~ <%rp.name(var)%>)*:

<%
lm(var ~ 1)
%>

## <% if (lund.res) 'The residuals returned:'%>

<%
if (lund.res) p(rp.round(rstandard(lm(var ~ 1))), limit=Inf)
%>

## <%if (references) 'References'%>

<%
if (references) ' * Lund, R. E. 1975, "Tables for An Approximate Test for Outliers in Linear Models", Technometrics, vol. 17, no. 4, pp. 473-476.
 * Prescott, P. 1975, "An Approximate Test for Outliers in Linear Models", Technometrics, vol. 17, no. 1, pp. 129-132.'
%>

# <% if (grubb & suppressMessages(suppressWarnings(require(outliers)))) 'Grubb\'s test'%>

<%
if (grubb) if (suppressMessages(suppressWarnings(require(outliers)))) {
test <- grubbs.test(var)
sprintf('%s shows that %s (p=%s).', test$method, ifelse(test$p.value>0.05, 'there are no outliers', test$alternative), rp.round(test$p.value))   
} else 'Cannot run test, please install "outliers" package!'
%>

## <%if (grubb & references) 'References'%>

<%
if (references) ' * Grubbs, F.E. (1950). Sample Criteria for testing outlying observations. Ann. Math. Stat. 21, 1, 27-58.'
%>

# <% if (dixon & suppressMessages(suppressWarnings(require(outliers)))) 'Dixon\'s test'%>

<%
if (dixon) if (suppressMessages(suppressWarnings(require(outliers)))) {
test <- chisq.out.test(var)
sprintf('%s shows that %s (p=%s).', test$method, ifelse(test$p.value>0.05, 'there are no outliers', test$alternative), rp.round(test$p.value))   
} else 'Cannot run test, please install "outliers" package!'
%>

## <%if (dixon & references) 'References'%>

<%
if (references) ' * Dixon, W.J. (1950). Analysis of extreme values. Ann. Math. Stat. 21, 4, 488-506.'
%>

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
    <em>Limits:</em>	exactly 1 variable
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
    <em>Limits:</em>	exactly 1 variable
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

 == Introduction  

In a nutshell, _t-test_ is a statistical test that assesses hypothesis of equality of two means. But in theory, any hypothesis test that yields statistic which follows [_t-distribution_](https://en.wikipedia.org/wiki/Student%27s_t-distribution) can be considered a _t-test_. The most common usage of _t-test_ is to:

 - compare the mean of a variable with given test mean value - **one-sample _t-test_**
 - compare means of two variables from independent samples - **independent samples _t-test_**
 - compare means of two variables from dependent samples - **paired-samples _t-test_**

 == Overview  

Independent samples _t-test_ is carried out with _Internet usage in leisure time (hours per day)_ as dependent variable, and _Gender_ as independent variable. Confidence interval is set to 95%. Equality of variances wasn't assumed.

 == Descriptives  

In order to get more insight on the underlying data, a table of basic descriptive statistics is displayed below.


**y**    **min(x)**   **max(x)**   **mean(x)**   **sd(x)**   **var(x)**   **median(x)**   **IQR(x)**   **skewness(x)**   **kurtosis(x)**  
-------- ------------ ------------ ------------- ----------- ------------ --------------- ------------ ----------------- -----------------
male     0            12           3.2699        1.9535      3.8161       3               3            0.9479            4.0064           
female   0            12           3.0643        2.3546      5.5442       2               3            1.4064            4.9089           
         0            10           3.3824        2.5822      6.6676       3               2            1.2197            3.8058           
-------- ------------ ------------ ------------- ----------- ------------ --------------- ------------ ----------------- -----------------


 == Diagnostics  

Since _t-test_ is a parametric technique, it sets some basic assumptions on distribution shape: it has to be _normal_ (or appoximately normal). A few normality test are to be applied, in order to screen possible departures from normality. 

 === Normality Tests  

We will use _Shapiro-Wilk_, _Lilliefors_ and _Anderson-Darling_ tests to screen departures from normality in the response variable (_Internet usage in leisure time (hours per day)_). 

<!-- endlist -->

               **W**    **p**  
-------------- -------- -------
shapiro.test   0.9001   0      
lillie.test    0.168    0      
ad.test        18.753   0      
-------------- -------- -------


As you can see, applied tests confirm departures from normality.

 == Results  

Welch Two Sample t-test was applied, and significant differences were found.

<!-- endlist -->

    **statistic**   **df**     **p**    **CI(lower)**   **CI(upper)**  
--- --------------- ---------- -------- --------------- ---------------
t   1.1483          457.8625   0.2514   -0.1463         0.5576         
--- --------------- ---------- -------- --------------- ---------------



#######################################################################
##	 Running: rapport("t-test", ius2008, x = "leisure", mu = 3.2)
#######################################################################

 == Introduction  

In a nutshell, _t-test_ is a statistical test that assesses hypothesis of equality of two means. But in theory, any hypothesis test that yields statistic which follows [_t-distribution_](https://en.wikipedia.org/wiki/Student%27s_t-distribution) can be considered a _t-test_. The most common usage of _t-test_ is to:

 - compare the mean of a variable with given test mean value - **one-sample _t-test_**
 - compare means of two variables from independent samples - **independent samples _t-test_**
 - compare means of two variables from dependent samples - **paired-samples _t-test_**

 == Overview  

One-sample _t-test_ is carried out with _Internet usage in leisure time (hours per day)_ as dependent variable. Confidence interval is set to 95%. Equality of variances wasn't assumed.

 == Descriptives  

In order to get more insight on the underlying data, a table of basic descriptive statistics is displayed below.

<ERROR>

 == Diagnostics  

Since _t-test_ is a parametric technique, it sets some basic assumptions on distribution shape: it has to be _normal_ (or appoximately normal). A few normality test are to be applied, in order to screen possible departures from normality. 

 === Normality Tests  

We will use _Shapiro-Wilk_, _Lilliefors_ and _Anderson-Darling_ tests to screen departures from normality in the response variable (_Internet usage in leisure time (hours per day)_). 

<!-- endlist -->

               **W**    **p**  
-------------- -------- -------
shapiro.test   0.9001   0      
lillie.test    0.168    0      
ad.test        18.753   0      
-------------- -------- -------


As you can see, applied tests confirm departures from normality.

 == Results  

One Sample t-test was applied, and significant differences were found.

<!-- endlist -->

    **statistic**   **df**   **p**    **CI(lower)**   **CI(upper)**  
--- --------------- -------- -------- --------------- ---------------
t   -0.0072         671      0.9943   3.037           3.3618         
--- --------------- -------- -------- --------------- ---------------



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
	<li><a href="demo/t-test.odt">odt (MS Word compatibile)</a></li>
	<li><a href="demo/t-test.rtf">rtf (MS Word compatibile)</a></li>
	<li><a href="demo/t-test.epub">epub</a></li>
	<li><a href="demo/t-test.tex" target="_blank">latex</a></li>
	<li><a href="demo/t-test-slidy.html" target="_blank">HTML slidy</a></li>
</ul>
<h6>Other morkdown formats</h6>
<ul>
	<li><a href="demo/t-test.plain" target="_blank">plain text</a></li>
	<li><a href="demo/t-test.textile" target="_blank">textile</a></li>
	<li><a href="demo/t-test.xml" target="_blank">docbook</a></li>
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
Title:        t-test Template
Author:       Aleksandar Blagotić
Description:  A t-test report with table of descriptives, diagnostic tests and t-test specific statistics.
Packages:     nortest
Example:      rapport("t-test", ius2008, x = "leisure", y = "gender")
              rapport("t-test", ius2008, x = "leisure", mu = 3.2)

x         | *numeric    | X variable          | Dependent (response) variable
y         | variable    | Y variable          | Independent variable (factor, or another numeric)
alter     | two.sided,less,greater | Alternative hypothesis | Whether two-sided, greater or less variant will be applied
mu        | number      | Mean value          | Mean value for one-sample t-test
paired    | FALSE       | Paired t-test       | Carry out paired t-test or not
var.equal | FALSE       | Variance equality   | Equal variances assumed: choose automatically or not
ci.level  | number=0.95 | Confidence interval | Confidence interval level
head-->
<%

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

<% capitalise(variant) %> _t-test_ is carried out with <% p(x.label) %> as dependent variable<% if (!is.null(y)) sprintf(", and %s as independent variable", p(y.label)) else ""%>. Confidence interval is set to <% pct(ci.level * 100, 0) %>. <% if (!is.null(variant)) sprintf("Equality of variances %s assumed.", ifelse(var.equal, "was", "wasn't")) else "" %>

# Descriptives

In order to get more insight on the underlying data, a table of basic descriptive statistics is displayed below.

<%
rp.desc(y, x, c(min, max, mean, sd, var, median, IQR, skewness, kurtosis))
%>

# Diagnostics

Since _t-test_ is a parametric technique, it sets some basic assumptions on distribution shape: it has to be _normal_ (or appoximately normal). A few normality test are to be applied, in order to screen possible departures from normality. 

## Normality Tests

We will use _Shapiro-Wilk_, _Lilliefors_ and _Anderson-Darling_ tests to screen departures from normality in the response variable (<% p(x.label) %>). 

<%
(ntest <- htest(x, shapiro.test, lillie.test, ad.test, colnames = c("N", "p")))
%>

As you can see, applied tests <% ifelse(all(ntest$p < .05), "confirm departures from normality", "yield different results on hypotheses of normality, so you may want to stick with one you find most appropriate or you trust the most.") %>.


# Results

<% tt$method %> was applied, and significant differences <% ifelse(tt$p.value < 1 - ci.level, "weren't", "were") %> found.

<%
with(tt, data.frame(statistic, df = parameter, p = p.value, `CI(lower)` = conf.int[1], `CI(upper)` = conf.int[2], check.names = FALSE))
%>

{% endhighlight %}
</div></li>
</ul>

<a id="type_demo"> </a>
#### type_demo.tpl

 <ul class="tabs">
	<li><a class="active" href="#info-type_demo">Description</a></li>
	<li><a href="#inputs-type_demo">Inputs</a></li>
	<li><a href="#example-type_demo">Example</a></li>
	<li><a href="#export-type_demo">Export</a></li>
	<li><a href="#source-type_demo">Source</a></li>
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
	<li id="source-type_demo"><div>
<h5>Source of `type_demo.tpl`</h5>
{% highlight text %}

<!--head
Title:        Rapport types demo
Author:       Aleksandar Blagotić
Description:  A sample template that describes the basic rapport types
Packages:     wordcloud
a    | character[1,6]  | variable A | var A - from 1 up to 6 character variables
b    | complex         | variable B | var B - length-one complex
c    | factor          | variable C | var C - length-one factor
d    | logical         | variable D | var D - length-one logical, defaults to FALSE
e    | numeric[2,10]   | variable E | var E - 2-10 numeric vectors
f    | variable        | variable F | var F - a variable (atomic vector of any type)
g    | foo, bar, blah  | variable G | var G - it's an option list
h    | TRUE            | variable H | var H - a boolean var
head-->

# Input types

## Character

Now I need to do something useful with character vectors.

## Complex

## Factor

## Logical

## Numeric

## Variable

## CSV list

{% endhighlight %}
</div></li>
</ul>

<a id="univar-descriptive"> </a>
#### univar-descriptive.tpl

 <ul class="tabs">
	<li><a class="active" href="#info-univar-descriptive">Description</a></li>
	<li><a href="#inputs-univar-descriptive">Inputs</a></li>
	<li><a href="#example-univar-descriptive">Example</a></li>
	<li><a href="#export-univar-descriptive">Export</a></li>
	<li><a href="#source-univar-descriptive">Source</a></li>
</ul>

 <ul class="tabs-content">
	<li class="active" id="info-univar-descriptive"><div><h5>Descriptive statistics</h5> by <em>Gergely Daróczi</em>
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
<li><h6>nortest: <small><em>Normality test</em></small></h6>
<div class="options">    <div class="options-desc">If normality tests should be performed
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
	<li id="example-univar-descriptive">
{% highlight text %}


#############################################################################
##	 Running: rapport('univar-descriptive', data=ius2008, var='gender')
#############################################################################

 == *gender* ("Gender")  

The dataset has _709_ observations with _673_ valid values (missing: _36_) in *gender* ("Gender").
This variable seems to be a factor.

 === Base statistics  

<!-- endlist -->

        **gender**   **N**   **pct**   **cumul.count**   **cumul.pct**  
------- ------------ ------- --------- ----------------- ---------------
1       male         410     60.9212   410               60.9212        
2       female       263     39.0788   673               100            
Total                673     100       673               100            
------- ------------ ------- --------- ----------------- ---------------


 === Barplot  

/tmp/RtmpPer367/file2885aeca.png

It seems that the highest value is _2_ which is exactly 2 times higher than the smallest value (_1_).


##########################################################################
##	 Running: rapport('univar-descriptive', data=ius2008, var='age')
##########################################################################

 == *age* ("Age")  

The dataset has _709_ observations with _677_ valid values (missing: _32_) in *age* ("Age").
This variable seems to be numeric.

 === Base statistics  


**value**   **mean(age)**   **sd(age)**   **var(age)**  
----------- --------------- ------------- --------------
(all)       24.5731         6.8491        46.9107       
----------- --------------- ------------- --------------


 === Histogram  

/tmp/RtmpPer367/file7aff8757.png

It seems that the highest value is _58_ which is exactly 3.625 times higher than the smallest value (_16_).

The standard deviation is 6.8491 (variance: 46.9107). The expected value is around 24.5731, somewhere between 24.0572 and 25.0891 (SE: 0.2632).

If we suppose that *Age* is not near to a normal distribution (test: see below, skewness: 1.9296, kurtosis: 7.4851), checking the median (23) might be a better option instead of the mean. The interquartile range (6) measures the statistics dispersion of the variable (similar to standard deviation) based on median.

 === Normality tests  

 === Introduction  

In statistics, _normality_ refers to an assumption that the distribution of a random variable follows _normal_ (_Gaussian_) distribution. Because of its bell-like shape, it's also known as the _"bell curve"_. The formula for _normal distribution_ is:

$$f(x) = \frac{1}{\sqrt{2\pi{}\sigma{}^2}} e^{-\frac{(x-\mu{})^2}{2\sigma{}^2}}$$

_Normal distribution_ belongs to a _location-scale family_ of distributions, as it's defined two parameters:

 - *&mu;* - _mean_ or _expectation_ (location parameter)
 - *&sigma;^2^* - _variance_ (scale parameter)

/tmp/RtmpPer367/file472a371b.png

 === Normality Tests  

 ==== Overview  

Various hypothesis tests can be applied in order to test if the distribution of given random variable violates normality assumption. These procedures test the H~0~ that provided variable's distribution is _normal_. At this point only few such tests will be covered: the ones that are available in `stats` package (which comes bundled with default R installation) and `nortest` package that is [available](http://cran.r-project.org/web/packages/nortest/index.html) on CRAN.

 - **Shapiro-Wilk test** is a powerful normality test appropriate for small samples. In R, it's implemented in `shapiro.test` function available in `stats` package.
 - **Lilliefors test** is a modification of _Kolmogorov-Smirnov test_ appropriate for testing normality when parameters or normal distribution (_&mu;_, _&sigma;^2^_) are not known. `lillie.test` function is located in `nortest` package.
 - **Anderson-Darling test** is one of the most powerful normality tests as it will detect the most of departures from normality. You can find `ad.test` function in `nortest` package.
 - **Pearson &Chi;^2^ test** is another normality test which takes more "traditional" approach in normality testing. `pearson.test` is located in `nortest` package.

 ==== Results  

Here you can see the results of applied normality tests (_p-values_ less than 0.05 indicate significant discrepancies):

<!-- endlist -->

               **H**      **p**  
-------------- ---------- -------
shapiro.test   0.8216     0      
lillie.test    0.17       0      
ad.test        32.1645    0      
pearson.test   625.8479   0      
-------------- ---------- -------


So, let's draw some conclusions based on applied normality test:

 - according to _Shapiro-Wilk test_, the distribution of _Age_ is not normal.
 - based on _Lilliefors test_, distribution of _Age_ is not normal
 - _Anderson-Darling test_ confirms violation of normality assumption
 - _Pearson's &Chi;^2^ test_ classifies the underlying distribution as non-normal

 === Diagnostic Plots  

There are various plots that can help you decide about the normality of the distribution. Only a few most commonly used plots will be shown: _histogram_, _Q-Q plot_ and _kernel density plot_.

 ==== Histogram  

_Histogram_ was first introduced by _Karl Pearson_ and it's probably the most popular plot for depicting the probability distribution of a random variable. However, the decision depends on number of bins, so it can sometimes be misleading. If the variable distribution is normal, bins should resemble the "bell-like" shape.

/tmp/RtmpPer367/file2101f2cf.png

 ==== Q-Q Plot  

"Q" in _Q-Q plot_ stands for _quantile_, as this plot compares empirical and theoretical distribution (in this case, _normal_ distribution) by plotting their quantiles against each other. For normal distribution, plotted dots should approximate a "straight", `x = y` line.

/tmp/RtmpPer367/file61c3b908.png

 ==== Kernel Density Plot  

_Kernel density plot_ is a plot of smoothed _empirical distribution function_. As such, it provides good insight about the shape of the distribution. For normal distributions, it should resemble the well known "bell shape".

/tmp/RtmpPer367/file78fcf0cc.png


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
	<li id="source-univar-descriptive"><div>
<h5>Source of `univar-descriptive.tpl`</h5>
{% highlight text %}

<!--head
Title: Descriptive statistics
Author: Gergely Daróczi 
Email: gergely@snowl.net
Description: This template will return descriptive statistics of a numerical, or a frequency table of a categorical variable. 
Packages: 
Example:    rapport('univar-descriptive', data=ius2008, var='gender')
            rapport('univar-descriptive', data=ius2008, var='age')
var         | variable  | Variable          | A categorical or numerical variable. The template will determine the measurement level of the given variable and will return a detailed frequency table or appropriate descriptive statistics for numerics.
nortest     | TRUE      | Normality test    | If normality tests should be performed 
head-->

# *<%=rp.name(var)%>*<%ifelse(rp.label(var)==rp.name(var), '', sprintf(' ("%s")', rp.label(var)))%>

The dataset has <%nvar<-as.numeric(var);rp.n(nvar)%> observations with <%=rp.valid(nvar)%> valid values (missing: <%=rp.missing(nvar)%>) in *<%=rp.name(var)%>*<%ifelse(rp.label(var)==rp.name(var), '', sprintf(' ("%s")', rp.label(var)))%>.
This variable seems to be <%=ifelse(is.numeric(var), 'numeric', 'a factor')%>.

## Base statistics

<%
if (is.numeric(var)) {
        rp.desc(NULL, rp.name(var), c('mean', 'sd', 'var'), rp.data)
    } else {
        rp.freq(rp.name(var), rp.data)
    }
%>

## <%ifelse(is.numeric(var), 'Histogram', 'Barplot')%>

<%
if (is.numeric(var)) {
        rp.hist(var)
    } else {
        rp.barplot(var)
    }
%>

It seems that the highest value is <%=rp.max(nvar)%> which is exactly <%=rp.round(rp.max(nvar)/rp.min(nvar))%> times higher than the smallest value (<%rp.min(nvar)%>).

<%
if (is.numeric(var))
    sprintf('The standard deviation is %s (variance: %s). The expected value is around %s, somewhere between %s and %s (SE: %s).', rp.round(rp.sd(var)), rp.round(rp.var(var)), rp.round(rp.mean(var)), rp.round(rp.mean(var)-1.96*rp.se.mean(var)), rp.round(rp.mean(var)+1.96*rp.se.mean(var)), rp.round(rp.se.mean(var)))
%>

<%
if (is.numeric(var))
    sprintf('If we suppose that *%s* is not near to a normal distribution (test: %s, skewness: %s, kurtosis: %s), checking the median (%s) might be a better option instead of the mean. The interquartile range (%s) measures the statistics dispersion of the variable (similar to standard deviation) based on median.', rp.label(var), ifelse(nortest & is.numeric(var), 'see below', 'not run'), rp.round(rp.skewness(var)), rp.round(rp.kurtosis(var)), rp.round(rp.median(var)), rp.round(rp.iqr(var)))
%>

## <%if (nortest & is.numeric(var)) 'Normality tests'%>

<%
if (nortest & is.numeric(var)) rapport('nortest', data=rp.data, var=rp.name(var), nested.levels.offset=2)
%>

{% endhighlight %}
</div></li>
</ul>

