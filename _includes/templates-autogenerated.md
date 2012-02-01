<ul>
 	<li><a href="#anova">anova.tpl</a></li>
 	<li><a href="#correlations">correlations.tpl</a></li>
 	<li><a href="#crosstable">crosstable.tpl</a></li>
 	<li><a href="#descriptives-multivar">descriptives-multivar.tpl</a></li>
 	<li><a href="#descriptives-univar-factor">descriptives-univar-factor.tpl</a></li>
 	<li><a href="#descriptives-univar-numeric">descriptives-univar-numeric.tpl</a></li>
 	<li><a href="#descriptives-univar">descriptives-univar.tpl</a></li>
 	<li><a href="#example">example.tpl</a></li>
 	<li><a href="#nortest">nortest.tpl</a></li>
 	<li><a href="#outlier-test">outlier-test.tpl</a></li>
 	<li><a href="#t-test">t-test.tpl</a></li>
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



# Introduction

**Analysis of Variance** or **ANOVA** is a statistical procedure that tests equality of means for several samples. It was first introduced in 1921. by famous English statistician Sir Ronald Aylmer Fisher.

# Model Overview

One-Way ANOVA was carried out, with _Gender_ as independent variable, and _Internet usage in leisure time (hours per day)_ as a response variable. Factor interaction was taken into account.

# Descriptives

In order to get more insight on the model data, a table of frequencies for ANOVA factors is displayed, as well as a table of descriptives.

## Frequency Table

Below lies a frequency table for factors in ANOVA model. Note that the missing values are removed from the summary.


**gender**   **N**   **%**     **Cumul. N**   **Cumul. %**  
------------ ------- --------- -------------- --------------
male         410     60.9212   410            60.9212       
female       263     39.0788   673            100           
Total        673     100       673            100           
------------ ------- --------- -------------- --------------


## Descriptive Statistics

The following table displays the descriptive statistics of ANOVA model. Factor levels and/or their combinations lie on the left hand side, while the corresponding statistics for response variable are given on the right-hand side.


**Gender**   **Min**   **Max**   **Mean**   **Std.Dev.**   **Median**   **IQR**   **Skewness**   **Kurtosis**  
------------ --------- --------- ---------- -------------- ------------ --------- -------------- --------------
male         0         12        3.2699     1.9535         3            3         0.9479         4.0064        
female       0         12        3.0643     2.3546         2            3         1.4064         4.9089        
------------ --------- --------- ---------- -------------- ------------ --------- -------------- --------------


# Diagnostics

Before we carry out ANOVA, we'd like to check some basic assumptions. For those purposes, normality and homoscedascity tests are carried out alongside several graphs that may help you with your decision on model's main assumptions.

## Diagnostics

### Univariate Normality

We will use _Shapiro-Wilk_, _Lilliefors_ and _Anderson-Darling_ tests to screen departures from normality in the response variable (_Internet usage in leisure time (hours per day)_).

<!-- endlist -->

                                                 **Statistic**   **p-value**  
------------------------------------------------ --------------- -------------
Shapiro-Wilk normality test                      0.9001          0            
Lilliefors (Kolmogorov-Smirnov) normality test   0.168           0            
Anderson-Darling normality test                  18.753          0            
------------------------------------------------ --------------- -------------


As you can see, applied tests confirm departures from normality.

### Homoscedascity

In order to test homoscedascity, _Bartlett_ and _Fligner-Kileen_ tests are applied.

<!-- endlist -->

                                                   **Statistic**   **p-value**  
-------------------------------------------------- --------------- -------------
Fligner-Killeen test of homogeneity of variances   0.4629          0.4963       
Bartlett test of homogeneity of variances          10.7698         0.001        
-------------------------------------------------- --------------- -------------


When it comes to equality of variances, applied tests yield inconsistent results. While _Fligner-Kileen test_ confirmed the hypotheses of homoscedascity, _Bartlett's test_ rejected it.

## Diagnostic Plots

Here you can see several diagnostic plots for ANOVA model:

 - residuals against fitted values
 - scale-location plot of square root of residuals against fitted values
 - normal Q-Q plot
 - residuals against leverages

/tmp/RtmpeIwHkw/file20ba7193.png

# ANOVA Summary

## ANOVA Table

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

s

# Introduction

**Analysis of Variance** or **ANOVA** is a statistical procedure that tests equality of means for several samples. It was first introduced in 1921. by famous English statistician Sir Ronald Aylmer Fisher.

# Model Overview

Two-Way ANOVA was carried out, with _Gender_ and _Relationship status_ as independent variables, and _Internet usage in leisure time (hours per day)_ as a response variable. Factor interaction was taken into account.

# Descriptives

In order to get more insight on the model data, a table of frequencies for ANOVA factors is displayed, as well as a table of descriptives.

## Frequency Table

Below lies a frequency table for factors in ANOVA model. Note that the missing values are removed from the summary.


**gender**   **partner**         **N**   **%**     **Cumul. N**   **Cumul. %**  
------------ ------------------- ------- --------- -------------- --------------
male         in a relationship   150     23.6967   150            23.6967       
female       in a relationship   120     18.9573   270            42.654        
male         married             33      5.2133    303            47.8673       
female       married             29      4.5814    332            52.4487       
male         single              204     32.2275   536            84.6761       
female       single              97      15.3239   633            100           
Total        Total               633     100       633            100           
------------ ------------------- ------- --------- -------------- --------------


## Descriptive Statistics

The following table displays the descriptive statistics of ANOVA model. Factor levels and/or their combinations lie on the left hand side, while the corresponding statistics for response variable are given on the right-hand side.

<!-- endlist -->

    **Gender**   **Relationship status**   **Min**   **Max**   **Mean**   **Std.Dev.**   **Median**   **IQR**   **Skewness**   **Kurtosis**  
--- ------------ ------------------------- --------- --------- ---------- -------------- ------------ --------- -------------- --------------
1   male         in a relationship         0.5       12        3.0582     1.9692         2.5          2         1.3376         5.727         
2   male         married                   0         8         2.9848     2.029          3            2         0.9027         3.351         
3   male         single                    0         10        3.5027     1.9361         3            3         0.7636         3.1208        
5   female       in a relationship         0.5       10        3.0439     2.2158         3            3         1.4017         4.9165        
6   female       married                   0         10        2.4808     1.9671         2            1.75      2.1875         9.2864        
7   female       single                    0         12        3.3226     2.6791         3            3.5       1.2045         4.0139        
--- ------------ ------------------------- --------- --------- ---------- -------------- ------------ --------- -------------- --------------


# Diagnostics

Before we carry out ANOVA, we'd like to check some basic assumptions. For those purposes, normality and homoscedascity tests are carried out alongside several graphs that may help you with your decision on model's main assumptions.

## Diagnostics

### Univariate Normality

We will use _Shapiro-Wilk_, _Lilliefors_ and _Anderson-Darling_ tests to screen departures from normality in the response variable (_Internet usage in leisure time (hours per day)_).

<!-- endlist -->

                                                 **Statistic**   **p-value**  
------------------------------------------------ --------------- -------------
Shapiro-Wilk normality test                      0.9001          0            
Lilliefors (Kolmogorov-Smirnov) normality test   0.168           0            
Anderson-Darling normality test                  18.753          0            
------------------------------------------------ --------------- -------------


As you can see, applied tests confirm departures from normality.

### Homoscedascity

In order to test homoscedascity, _Bartlett_ and _Fligner-Kileen_ tests are applied.

<!-- endlist -->

                                                   **Statistic**   **p-value**  
-------------------------------------------------- --------------- -------------
Fligner-Killeen test of homogeneity of variances   1.1234          0.2892       
Bartlett test of homogeneity of variances          11.1267         0.0009       
-------------------------------------------------- --------------- -------------


When it comes to equality of variances, applied tests yield inconsistent results. While _Fligner-Kileen test_ confirmed the hypotheses of homoscedascity, _Bartlett's test_ rejected it.

## Diagnostic Plots

Here you can see several diagnostic plots for ANOVA model:

 - residuals against fitted values
 - scale-location plot of square root of residuals against fitted values
 - normal Q-Q plot
 - residuals against leverages

/tmp/RtmpeIwHkw/filecc858b1.png

# ANOVA Summary

## ANOVA Table

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
	<li><a href="demo/anova.docx">docx (MS Word 2007 format)</a></li>
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
Data required: TRUE
Strict:        TRUE
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
(desc <- rp.desc(resp, fac, c(Min = min, Max = max, Mean = mean, Std.Dev. = sd, Median = median, IQR, Skewness = skewness, Kurtosis = kurtosis)))
%>

# Diagnostics

Before we carry out ANOVA, we'd like to check some basic assumptions. For those purposes, normality and homoscedascity tests are carried out alongside several graphs that may help you with your decision on model's main assumptions.

## Diagnostics

### Univariate Normality

We will use _Shapiro-Wilk_, _Lilliefors_ and _Anderson-Darling_ tests to screen departures from normality in the response variable (<% p(resp.label) %>).

<%
(ntest <- htest(resp, shapiro.test, lillie.test, ad.test))
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
<em>Required packages:</em> 
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
    <em>Limits:</em>	from 1, up to 50 variables
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

# Variable description

_3_ variables provided.

The highest correlation coefficient (0.2273) is between _edu_ and _age_ and the lowest (-0.0338) is between _leisure_ and _age_. It seems that the strongest association (r=0.2273) is between _edu_ and _age_.

Higly correlated (r < 0.7 or r > 0.7) variables: -


Uncorrelated (-0.2 < r < 0.2) variables: 

 * _age_ and _leisure_
 * _edu_ and _leisure_

## Correlation matrix

<!-- endlist -->

          **age**         **edu**         **leisure**    
--------- --------------- --------------- ---------------
age                       0.2273  * * *   -0.0338        
edu       0.2273  * * *                   0.1732  * * *  
leisure   -0.0338         0.1732  * * *                  
--------- --------------- --------------- ---------------


/tmp/RtmpeIwHkw/file25ce6bd0.png


##############################################################################################################################################
##	 Running: rapport('correlations', data=mtcars, vars=c('mpg', 'cyl', 'disp', 'hp', 'drat', 'wt', 'qsec', 'vs', 'am', 'gear', 'carb'))
##############################################################################################################################################

# Variable description

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

## Correlation matrix

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


/tmp/RtmpeIwHkw/file1001bb88.png


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
	<li><a href="demo/correlations.docx">docx (MS Word 2007 format)</a></li>
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
Title:          Correlations
Author:         Daróczi Gergely 
Email:          gergely@snowl.net
Description:    This template will return the correlation matrix of supplied numerical variables. 
Data required:  TRUE
Strict:         TRUE
Example:        rapport('correlations', data=ius2008, vars=c('age', 'edu', 'leisure'))
                rapport('correlations', data=mtcars, vars=c('mpg', 'cyl', 'disp', 'hp', 'drat', 'wt', 'qsec', 'vs', 'am', 'gear', 'carb'))

vars            | *numeric[1,50]| Variable              | Numerical variables
info            | TRUE          | Stat. theory          | Show information about background theory?
cor.matrix      | TRUE          | Correlation matrix    | Show correlation matrix (numbers)?
cor.plot        | TRUE          | Scatterplot matrix    | Show scatterplot matrix (image)?
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

# Variable description

Two variables specified:

 * "gender" ("Gender") with _673_ and
 * "dwell" ("Dwelling") with _662_ valid values.

# Counts

<!-- endlist -->

         **city**   **small town**   **village**  
-------- ---------- ---------------- -------------
male     338        28               19           
female   234        3                9            
-------- ---------- ---------------- -------------


# Percentages

<!-- endlist -->

         **city**   **small town**   **village**  
-------- ---------- ---------------- -------------
male     0.5357     0.0444           0.0301       
female   0.3708     0.0048           0.0143       
-------- ---------- ---------------- -------------


## Row percentages

<!-- endlist -->

         **city**   **small town**   **village**  
-------- ---------- ---------------- -------------
male     0.8779     0.0727           0.0494       
female   0.9512     0.0122           0.0366       
-------- ---------- ---------------- -------------


## Column percentages

<!-- endlist -->

         **city**   **small town**   **village**  
-------- ---------- ---------------- -------------
male     0.5909     0.9032           0.6786       
female   0.4091     0.0968           0.3214       
-------- ---------- ---------------- -------------


# Chi-squared test


            **X-squared**   **df**   **p-value**  
----------- --------------- -------- -------------
X-squared   12.6353         2        0.0018       
----------- --------------- -------- -------------


It seems that a real association can be pointed out between *gender* and *dwell* by the *Pearson's Chi-squared test* (χ=12.6353 at the degree of freedom being 2) at the significance level of 0.0018.
Based on Goodman and Kruskal's lambda it seems that *dwell* (λ=0.7602) has an effect on *gender* (λ=0) if we assume both variables to be nominal.
The association between the two variables seems to be weak based on Cramer's V (0.1001).

## Pearson's residuals

<!-- endlist -->

         **city**   **small town**   **village**  
-------- ---------- ---------------- -------------
male     -3.0844    3.4312           0.7595       
female   3.0844     -3.4312          -0.7595      
-------- ---------- ---------------- -------------


## Mosaic chart

/tmp/RtmpeIwHkw/file38878de7.png


#################################################################################
##	 Running: rapport('crosstable', data=ius2008, row='email', col='dwell')
#################################################################################

# Variable description

Two variables specified:

 * "email" ("Email usage") with _672_ and
 * "dwell" ("Dwelling") with _662_ valid values.

# Counts

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


# Percentages

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


## Row percentages

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


## Column percentages

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


# Chi-squared test


            **X-squared**   **df**   **p-value**  
----------- --------------- -------- -------------
X-squared   14.864          12       0.249        
----------- --------------- -------- -------------


It seems that no real association can be pointed out between *email* and *dwell* by the *Pearson's Chi-squared test* (χ=14.864 at the degree of freedom being 12) at the significance level of 0.249.
For this end no other statistical tests were performed.

## Pearson's residuals

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


## Mosaic chart

/tmp/RtmpeIwHkw/file2235fc6f.png


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
	<li><a href="demo/crosstable.docx">docx (MS Word 2007 format)</a></li>
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
Title:          Crosstable
Author:         Gergely Daróczi 
Email:          gergely@snowl.net
Description:    Returning the Chi-squared test of two given variables with count, percentages and Pearson's residuals table. 
Packages:       descr
Data required:  TRUE
Strict:         TRUE
Example:        rapport('crosstable', data=ius2008, row='gender', col='dwell')
                rapport('crosstable', data=ius2008, row='email', col='dwell')

row             | *factor | Row variable        | A categorical variable.
col             | *factor | Column variable     | A categorical variable. 
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

<a id="descriptives-multivar"> </a>
#### descriptives-multivar.tpl

 <ul class="tabs">
	<li><a class="active" href="#info-descriptives-multivar">Description</a></li>
	<li><a href="#inputs-descriptives-multivar">Inputs</a></li>
	<li><a href="#example-descriptives-multivar">Example</a></li>
	<li><a href="#export-descriptives-multivar">Export</a></li>
	<li><a href="#source-descriptives-multivar">Source</a></li>
</ul>

 <ul class="tabs-content">
	<li class="active" id="info-descriptives-multivar"><div><h5>Descriptive statistics</h5> by <em>Gergely Daróczi</em>
<br><br>
 This template will return descriptive statistics of numerical or frequency tables of categorical variables.
<br><br>
<em>Required packages:</em> 
<br>
<em>Example:</em> 
{% highlight text %}
rapport('descriptives-multivar', data=ius2008, vars=c("gender", 'age'))
rapport('descriptives-multivar', data=ius2008, vars=c("chatim", "game", "surf", "email", "download", "forum", "socnet", "xxx"))
rapport('descriptives-multivar', data=mtcars, vars=c('hp','wt'))
{% endhighlight %}
</div></li>
	<li id="inputs-descriptives-multivar"><div><h5>Input parameters</h5><em>descriptives-multivar.tpl</em> template has the following options to be (optionally) set while calling <em>rapport</em>:<ul>
	<li><h6>vars: <small><em>Variables</em></small></h6>
<div class="options">    <div class="options-desc">Categorical or numerical variables. The template will determine the measurement level of the given variable and will return detailed frequency tables or appropriate descriptive statistics for numerics.
</div>
    <em>Type:</em>	variable
<br>
    <em>Limits:</em>	from 1, up to 50 variables
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
	<li id="example-descriptives-multivar">
{% highlight text %}


###########################################################################################
##	 Running: rapport('descriptives-multivar', data=ius2008, vars=c("gender", 'age'))
###########################################################################################

# *gender* ("Gender")

The dataset has _709_ observations with _673_ valid values (missing: _36_) in *gender* ("Gender"), which seems to be a qualitative variable.

## Base statistics


**gender**   **N**   **%**     **Cumul. N**   **Cumul. %**  
------------ ------- --------- -------------- --------------
male         410     60.9212   410            60.9212       
female       263     39.0788   673            100           
Total        673     100       673            100           
------------ ------- --------- -------------- --------------


## Barplot

/tmp/RtmpeIwHkw/file6b2b7dc1.png

It seems that the highest value is _2_ which is exactly 2 times higher than the smallest value (_1_).

The most frequent value is *male*.



# *age* ("Age")

The dataset has _709_ observations with _677_ valid values (missing: _32_) in *age* ("Age"), which seems to be a quantitative variable.

## Base statistics


**Variable**   **mean**   **sd**   **var**  
-------------- ---------- -------- ---------
Age            24.5731    6.8491   46.9107  
-------------- ---------- -------- ---------


## Histogram

/tmp/RtmpeIwHkw/file9f0c262.png

It seems that the highest value is _58_ which is exactly 3.625 times higher than the smallest value (_16_).

The standard deviation is _6.8491_ (variance: _46.9107_). The expected value is around _24.5731_, somewhere between _24.0572_ and _25.0891_ with the standard error of _0.2632_.

If we suppose that *Age* is not near to a normal distribution (test: see below, skewness: _1.9296_, kurtosis: _7.4851_), checking the median (_23_) might be a better option instead of the mean. The interquartile range (_6_) measures the statistics dispersion of the variable (similar to standard deviation) based on median.

## Normality tests

### Introduction

In statistics, _normality_ refers to an assumption that the distribution of a random variable follows _normal_ (_Gaussian_) distribution. Because of its bell-like shape, it's also known as the _"bell curve"_. The formula for _normal distribution_ is:

$$f(x) = \frac{1}{\sqrt{2\pi{}\sigma{}^2}} e^{-\frac{(x-\mu{})^2}{2\sigma{}^2}}$$

_Normal distribution_ belongs to a _location-scale family_ of distributions, as it's defined two parameters:

 - *&mu;* - _mean_ or _expectation_ (location parameter)
 - *&sigma;^2^* - _variance_ (scale parameter)

/tmp/RtmpeIwHkw/file626292a0.png

### Normality Tests

#### Overview

Various hypothesis tests can be applied in order to test if the distribution of given random variable violates normality assumption. These procedures test the H~0~ that provided variable's distribution is _normal_. At this point only few such tests will be covered: the ones that are available in `stats` package (which comes bundled with default R installation) and `nortest` package that is [available](http://cran.r-project.org/web/packages/nortest/index.html) on CRAN.

 - **Shapiro-Wilk test** is a powerful normality test appropriate for small samples. In R, it's implemented in `shapiro.test` function available in `stats` package.
 - **Lilliefors test** is a modification of _Kolmogorov-Smirnov test_ appropriate for testing normality when parameters or normal distribution (_&mu;_, _&sigma;^2^_) are not known. `lillie.test` function is located in `nortest` package.
 - **Anderson-Darling test** is one of the most powerful normality tests as it will detect the most of departures from normality. You can find `ad.test` function in `nortest` package.
 - **Pearson &Chi;^2^ test** is another normality test which takes more "traditional" approach in normality testing. `pearson.test` is located in `nortest` package.

#### Results

Here you can see the results of applied normality tests (_p-values_ less than 0.05 indicate significant discrepancies):

_0.05_

So, let's draw some conclusions based on applied normality test:

 - according to _Shapiro-Wilk test_, the distribution of _Age_ is not normal.
 - based on _Lilliefors test_, distribution of _Age_ is not normal
 - _Anderson-Darling test_ confirms violation of normality assumption
 - _Pearson's &Chi;^2^ test_ classifies the underlying distribution as non-normal

### Diagnostic Plots

There are various plots that can help you decide about the normality of the distribution. Only a few most commonly used plots will be shown: _histogram_, _Q-Q plot_ and _kernel density plot_.

#### Histogram

_Histogram_ was first introduced by _Karl Pearson_ and it's probably the most popular plot for depicting the probability distribution of a random variable. However, the decision depends on number of bins, so it can sometimes be misleading. If the variable distribution is normal, bins should resemble the "bell-like" shape.

/tmp/RtmpeIwHkw/file1aea2087.png

#### Q-Q Plot

"Q" in _Q-Q plot_ stands for _quantile_, as this plot compares empirical and theoretical distribution (in this case, _normal_ distribution) by plotting their quantiles against each other. For normal distribution, plotted dots should approximate a "straight", `x = y` line.

/tmp/RtmpeIwHkw/file34c07c0.png

#### Kernel Density Plot

_Kernel density plot_ is a plot of smoothed _empirical distribution function_. As such, it provides good insight about the shape of the distribution. For normal distributions, it should resemble the well known "bell shape".

/tmp/RtmpeIwHkw/file18dc4103.png






###################################################################################################################################################
##	 Running: rapport('descriptives-multivar', data=ius2008, vars=c("chatim", "game", "surf", "email", "download", "forum", "socnet", "xxx"))
###################################################################################################################################################

# *chatim* ("Chat & IM usage")

The dataset has _709_ observations with _669_ valid values (missing: _40_) in *chatim* ("Chat & IM usage"), which seems to be a qualitative variable.

## Base statistics


**chatim**    **N**   **%**     **Cumul. N**   **Cumul. %**  
------------- ------- --------- -------------- --------------
never         60      8.9686    60             8.9686        
very rarely   73      10.9118   133            19.8804       
rarely        58      8.6697    191            28.5501       
sometimes     113     16.8909   304            45.441        
often         136     20.3288   440            65.7698       
very often    88      13.154    528            78.9238       
always        141     21.0762   669            100           
Total         669     100       669            100           
------------- ------- --------- -------------- --------------


## Barplot

/tmp/RtmpeIwHkw/file69159f7b.png

It seems that the highest value is _7_ which is exactly 7 times higher than the smallest value (_1_).

The most frequent value is *always*.



# *game* ("On-line games usage")

The dataset has _709_ observations with _677_ valid values (missing: _32_) in *game* ("On-line games usage"), which seems to be a qualitative variable.

## Base statistics


**game**      **N**   **%**     **Cumul. N**   **Cumul. %**  
------------- ------- --------- -------------- --------------
never         352     51.9941   352            51.9941       
very rarely   128     18.9069   480            70.901        
rarely        32      4.7267    512            75.6278       
sometimes     60      8.8626    572            84.4904       
often         37      5.4653    609            89.9557       
very often    35      5.1699    644            95.1256       
always        33      4.8744    677            100           
Total         677     100       677            100           
------------- ------- --------- -------------- --------------


## Barplot

/tmp/RtmpeIwHkw/file9f761b.png

It seems that the highest value is _7_ which is exactly 7 times higher than the smallest value (_1_).

The most frequent value is *never*.



# *surf* ("Web surfing usage")

The dataset has _709_ observations with _678_ valid values (missing: _31_) in *surf* ("Web surfing usage"), which seems to be a qualitative variable.

## Base statistics


**surf**      **N**   **%**     **Cumul. N**   **Cumul. %**  
------------- ------- --------- -------------- --------------
never         17      2.5074    17             2.5074        
very rarely   26      3.8348    43             6.3422        
rarely        33      4.8673    76             11.2094       
sometimes     107     15.7817   183            26.9912       
often         158     23.3038   341            50.295        
very often    142     20.944    483            71.2389       
always        195     28.7611   678            100           
Total         678     100       678            100           
------------- ------- --------- -------------- --------------


## Barplot

/tmp/RtmpeIwHkw/file3fd8011b.png

It seems that the highest value is _7_ which is exactly 7 times higher than the smallest value (_1_).

The most frequent value is *always*.



# *email* ("Email usage")

The dataset has _709_ observations with _672_ valid values (missing: _37_) in *email* ("Email usage"), which seems to be a qualitative variable.

## Base statistics


**email**     **N**   **%**     **Cumul. N**   **Cumul. %**  
------------- ------- --------- -------------- --------------
never         13      1.9345    13             1.9345        
very rarely   36      5.3571    49             7.2917        
rarely        46      6.8452    95             14.1369       
sometimes     87      12.9464   182            27.0833       
often         123     18.3036   305            45.3869       
very often    108     16.0714   413            61.4583       
always        259     38.5417   672            100           
Total         672     100       672            100           
------------- ------- --------- -------------- --------------


## Barplot

/tmp/RtmpeIwHkw/file22555c92.png

It seems that the highest value is _7_ which is exactly 7 times higher than the smallest value (_1_).

The most frequent value is *always*.



# *download* ("Download usage")

The dataset has _709_ observations with _677_ valid values (missing: _32_) in *download* ("Download usage"), which seems to be a qualitative variable.

## Base statistics


**download**   **N**   **%**     **Cumul. N**   **Cumul. %**  
-------------- ------- --------- -------------- --------------
never          11      1.6248    11             1.6248        
very rarely    28      4.1359    39             5.7607        
rarely         29      4.2836    68             10.0443       
sometimes      80      11.8168   148            21.8612       
often          124     18.3161   272            40.1773       
very often     160     23.6337   432            63.8109       
always         245     36.1891   677            100           
Total          677     100       677            100           
-------------- ------- --------- -------------- --------------


## Barplot

/tmp/RtmpeIwHkw/file1647fd35.png

It seems that the highest value is _7_ which is exactly 7 times higher than the smallest value (_1_).

The most frequent value is *always*.



# *forum* ("Web forums usage")

The dataset has _709_ observations with _673_ valid values (missing: _36_) in *forum* ("Web forums usage"), which seems to be a qualitative variable.

## Base statistics


**forum**     **N**   **%**     **Cumul. N**   **Cumul. %**  
------------- ------- --------- -------------- --------------
never         76      11.2927   76             11.2927       
very rarely   80      11.8871   156            23.1798       
rarely        72      10.6984   228            33.8782       
sometimes     111     16.4933   339            50.3715       
often         109     16.1961   448            66.5676       
very often    119     17.682    567            84.2496       
always        106     15.7504   673            100           
Total         673     100       673            100           
------------- ------- --------- -------------- --------------


## Barplot

/tmp/RtmpeIwHkw/file693ec567.png

It seems that the highest value is _7_ which is exactly 7 times higher than the smallest value (_1_).

The most frequent value is *very often*.



# *socnet* ("Social networks usage")

The dataset has _709_ observations with _678_ valid values (missing: _31_) in *socnet* ("Social networks usage"), which seems to be a qualitative variable.

## Base statistics


**socnet**    **N**   **%**     **Cumul. N**   **Cumul. %**  
------------- ------- --------- -------------- --------------
never         208     30.6785   208            30.6785       
very rarely   102     15.0442   310            45.7227       
rarely        57      8.4071    367            54.1298       
sometimes     87      12.8319   454            66.9617       
often         79      11.6519   533            78.6136       
very often    80      11.7994   613            90.413        
always        65      9.587     678            100           
Total         678     100       678            100           
------------- ------- --------- -------------- --------------


## Barplot

/tmp/RtmpeIwHkw/file1f5fe624.png

It seems that the highest value is _7_ which is exactly 7 times higher than the smallest value (_1_).

The most frequent value is *never*.



# *xxx* ("Adult sites usage")

The dataset has _709_ observations with _674_ valid values (missing: _35_) in *xxx* ("Adult sites usage"), which seems to be a qualitative variable.

## Base statistics


**xxx**       **N**   **%**     **Cumul. N**   **Cumul. %**  
------------- ------- --------- -------------- --------------
never         274     40.6528   274            40.6528       
very rarely   124     18.3976   398            59.0504       
rarely        52      7.7151    450            66.7656       
sometimes     131     19.4362   581            86.2018       
often         46      6.8249    627            93.0267       
very often    28      4.1543    655            97.181        
always        19      2.819     674            100           
Total         674     100       674            100           
------------- ------- --------- -------------- --------------


## Barplot

/tmp/RtmpeIwHkw/file1b9b138f.png

It seems that the highest value is _7_ which is exactly 7 times higher than the smallest value (_1_).

The most frequent value is *never*.






####################################################################################
##	 Running: rapport('descriptives-multivar', data=mtcars, vars=c('hp','wt'))
####################################################################################

# *hp*

The dataset has _32_ observations with _32_ valid values (missing: _0_) in *hp*, which seems to be a quantitative variable.

## Base statistics


**Variable**   **mean**   **sd**    **var**    
-------------- ---------- --------- -----------
hp             146.6875   68.5629   4700.8669  
-------------- ---------- --------- -----------


## Histogram

/tmp/RtmpeIwHkw/file448fb78.png

It seems that the highest value is _335_ which is exactly 6.4423 times higher than the smallest value (_52_).

The standard deviation is _68.5629_ (variance: _4700.8669_). The expected value is around _146.6875_, somewhere between _122.9317_ and _170.4433_ with the standard error of _12.1203_.

If we suppose that *hp* is not near to a normal distribution (test: see below, skewness: _0.7614_, kurtosis: _3.0522_), checking the median (_123_) might be a better option instead of the mean. The interquartile range (_83.5_) measures the statistics dispersion of the variable (similar to standard deviation) based on median.

## Normality tests

### Introduction

In statistics, _normality_ refers to an assumption that the distribution of a random variable follows _normal_ (_Gaussian_) distribution. Because of its bell-like shape, it's also known as the _"bell curve"_. The formula for _normal distribution_ is:

$$f(x) = \frac{1}{\sqrt{2\pi{}\sigma{}^2}} e^{-\frac{(x-\mu{})^2}{2\sigma{}^2}}$$

_Normal distribution_ belongs to a _location-scale family_ of distributions, as it's defined two parameters:

 - *&mu;* - _mean_ or _expectation_ (location parameter)
 - *&sigma;^2^* - _variance_ (scale parameter)

/tmp/RtmpeIwHkw/file5bc7af28.png

### Normality Tests

#### Overview

Various hypothesis tests can be applied in order to test if the distribution of given random variable violates normality assumption. These procedures test the H~0~ that provided variable's distribution is _normal_. At this point only few such tests will be covered: the ones that are available in `stats` package (which comes bundled with default R installation) and `nortest` package that is [available](http://cran.r-project.org/web/packages/nortest/index.html) on CRAN.

 - **Shapiro-Wilk test** is a powerful normality test appropriate for small samples. In R, it's implemented in `shapiro.test` function available in `stats` package.
 - **Lilliefors test** is a modification of _Kolmogorov-Smirnov test_ appropriate for testing normality when parameters or normal distribution (_&mu;_, _&sigma;^2^_) are not known. `lillie.test` function is located in `nortest` package.
 - **Anderson-Darling test** is one of the most powerful normality tests as it will detect the most of departures from normality. You can find `ad.test` function in `nortest` package.
 - **Pearson &Chi;^2^ test** is another normality test which takes more "traditional" approach in normality testing. `pearson.test` is located in `nortest` package.

#### Results

Here you can see the results of applied normality tests (_p-values_ less than 0.05 indicate significant discrepancies):

_0.05_

So, let's draw some conclusions based on applied normality test:

 - according to _Shapiro-Wilk test_, the distribution of _hp_ is not normal.
 - based on _Lilliefors test_, distribution of _hp_ is not normal
 - _Anderson-Darling test_ confirms  normality assumption
 - _Pearson's &Chi;^2^ test_ classifies the underlying distribution as non-normal

### Diagnostic Plots

There are various plots that can help you decide about the normality of the distribution. Only a few most commonly used plots will be shown: _histogram_, _Q-Q plot_ and _kernel density plot_.

#### Histogram

_Histogram_ was first introduced by _Karl Pearson_ and it's probably the most popular plot for depicting the probability distribution of a random variable. However, the decision depends on number of bins, so it can sometimes be misleading. If the variable distribution is normal, bins should resemble the "bell-like" shape.

/tmp/RtmpeIwHkw/file4506748f.png

#### Q-Q Plot

"Q" in _Q-Q plot_ stands for _quantile_, as this plot compares empirical and theoretical distribution (in this case, _normal_ distribution) by plotting their quantiles against each other. For normal distribution, plotted dots should approximate a "straight", `x = y` line.

/tmp/RtmpeIwHkw/file483d11b4.png

#### Kernel Density Plot

_Kernel density plot_ is a plot of smoothed _empirical distribution function_. As such, it provides good insight about the shape of the distribution. For normal distributions, it should resemble the well known "bell shape".

/tmp/RtmpeIwHkw/file1594fe66.png



# *wt*

The dataset has _32_ observations with _32_ valid values (missing: _0_) in *wt*, which seems to be a quantitative variable.

## Base statistics


**Variable**   **mean**   **sd**   **var**  
-------------- ---------- -------- ---------
wt             3.2172     0.9785   0.9574   
-------------- ---------- -------- ---------


## Histogram

/tmp/RtmpeIwHkw/file51159f43.png

It seems that the highest value is _5.424_ which is exactly 3.5849 times higher than the smallest value (_1.513_).

The standard deviation is _0.9785_ (variance: _0.9574_). The expected value is around _3.2172_, somewhere between _2.8782_ and _3.5563_ with the standard error of _0.173_.

If we suppose that *wt* is not near to a normal distribution (test: see below, skewness: _0.4438_, kurtosis: _3.1725_), checking the median (_3.325_) might be a better option instead of the mean. The interquartile range (_1.0288_) measures the statistics dispersion of the variable (similar to standard deviation) based on median.

## Normality tests

### Introduction

In statistics, _normality_ refers to an assumption that the distribution of a random variable follows _normal_ (_Gaussian_) distribution. Because of its bell-like shape, it's also known as the _"bell curve"_. The formula for _normal distribution_ is:

$$f(x) = \frac{1}{\sqrt{2\pi{}\sigma{}^2}} e^{-\frac{(x-\mu{})^2}{2\sigma{}^2}}$$

_Normal distribution_ belongs to a _location-scale family_ of distributions, as it's defined two parameters:

 - *&mu;* - _mean_ or _expectation_ (location parameter)
 - *&sigma;^2^* - _variance_ (scale parameter)

/tmp/RtmpeIwHkw/filea0a5e5a.png

### Normality Tests

#### Overview

Various hypothesis tests can be applied in order to test if the distribution of given random variable violates normality assumption. These procedures test the H~0~ that provided variable's distribution is _normal_. At this point only few such tests will be covered: the ones that are available in `stats` package (which comes bundled with default R installation) and `nortest` package that is [available](http://cran.r-project.org/web/packages/nortest/index.html) on CRAN.

 - **Shapiro-Wilk test** is a powerful normality test appropriate for small samples. In R, it's implemented in `shapiro.test` function available in `stats` package.
 - **Lilliefors test** is a modification of _Kolmogorov-Smirnov test_ appropriate for testing normality when parameters or normal distribution (_&mu;_, _&sigma;^2^_) are not known. `lillie.test` function is located in `nortest` package.
 - **Anderson-Darling test** is one of the most powerful normality tests as it will detect the most of departures from normality. You can find `ad.test` function in `nortest` package.
 - **Pearson &Chi;^2^ test** is another normality test which takes more "traditional" approach in normality testing. `pearson.test` is located in `nortest` package.

#### Results

Here you can see the results of applied normality tests (_p-values_ less than 0.05 indicate significant discrepancies):

_0.05_

So, let's draw some conclusions based on applied normality test:

 - according to _Shapiro-Wilk test_, the distribution of _wt_ is  normal.
 - based on _Lilliefors test_, distribution of _wt_ is not normal
 - _Anderson-Darling test_ confirms  normality assumption
 - _Pearson's &Chi;^2^ test_ classifies the underlying distribution as non-normal

### Diagnostic Plots

There are various plots that can help you decide about the normality of the distribution. Only a few most commonly used plots will be shown: _histogram_, _Q-Q plot_ and _kernel density plot_.

#### Histogram

_Histogram_ was first introduced by _Karl Pearson_ and it's probably the most popular plot for depicting the probability distribution of a random variable. However, the decision depends on number of bins, so it can sometimes be misleading. If the variable distribution is normal, bins should resemble the "bell-like" shape.

/tmp/RtmpeIwHkw/file40aeb96b.png

#### Q-Q Plot

"Q" in _Q-Q plot_ stands for _quantile_, as this plot compares empirical and theoretical distribution (in this case, _normal_ distribution) by plotting their quantiles against each other. For normal distribution, plotted dots should approximate a "straight", `x = y` line.

/tmp/RtmpeIwHkw/file16235e6e.png

#### Kernel Density Plot

_Kernel density plot_ is a plot of smoothed _empirical distribution function_. As such, it provides good insight about the shape of the distribution. For normal distributions, it should resemble the well known "bell shape".

/tmp/RtmpeIwHkw/file4848bb3.png






{% endhighlight %}
</li>
	<li id="export-descriptives-multivar"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport('descriptives-multivar', data=ius2008, vars=c("gender", 'age'))
rapport('descriptives-multivar', data=ius2008, vars=c("chatim", "game", "surf", "email", "download", "forum", "socnet", "xxx"))
rapport('descriptives-multivar', data=mtcars, vars=c('hp','wt'))

{% endhighlight %}
<h6>Popular formats:</h6>
<ul>
	<li><a href="demo/descriptives-multivar.html" target="_blank">HTML</a></li>
	<li><a href="demo/descriptives-multivar.docx">docx (MS Word 2007 format)</a></li>
	<li><a href="demo/descriptives-multivar.odt">odt (MS Word compatibile)</a></li>
	<li><a href="demo/descriptives-multivar.rtf">rtf (MS Word compatibile)</a></li>
	<li><a href="demo/descriptives-multivar.epub">epub</a></li>
	<li><a href="demo/descriptives-multivar.tex" target="_blank">latex</a></li>
	<li><a href="demo/descriptives-multivar-slidy.html" target="_blank">HTML slidy</a></li>
</ul>
<h6>Other morkdown formats</h6>
<ul>
	<li><a href="demo/descriptives-multivar.plain" target="_blank">plain text</a></li>
	<li><a href="demo/descriptives-multivar.textile" target="_blank">textile</a></li>
	<li><a href="demo/descriptives-multivar.xml" target="_blank">docbook</a></li>
	<li><a href="demo/descriptives-multivar.man" target="_blank">man</a></li>
	<li><a href="demo/descriptives-multivar.md" target="_blank">markdown</a></li>
	<li><a href="demo/descriptives-multivar.mediawiki" target="_blank">mediawiki</a></li>
	<li><a href="demo/descriptives-multivar.wiki" target="_blank">wiki</a></li>
	<li><a href="demo/descriptives-multivar.org" target="_blank">org</a></li>
	<li><a href="demo/descriptives-multivar.pandoc" target="_blank">pandoc</a></li>
</ul>
</div></li>
	<li id="source-descriptives-multivar"><div>
<h5>Source of `descriptives-multivar.tpl`</h5>
{% highlight text %}

<!--head
Title:          Descriptive statistics
Author:         Gergely Daróczi 
Email:          gergely@snowl.net
Description:    This template will return descriptive statistics of numerical or frequency tables of categorical variables. 
Data required:  TRUE
Strict:         TRUE
Example:        rapport('descriptives-multivar', data=ius2008, vars=c("gender", 'age'))
                rapport('descriptives-multivar', data=ius2008, vars=c("chatim", "game", "surf", "email", "download", "forum", "socnet", "xxx"))
                rapport('descriptives-multivar', data=mtcars, vars=c('hp','wt'))

vars            | *variable[1,50]| Variables         | Categorical or numerical variables. The template will determine the measurement level of the given variable and will return detailed frequency tables or appropriate descriptive statistics for numerics.
nortest         | TRUE          | Normality tests   | Should normality tests be performed on numerical variables?  
head-->

<%
if (vars.ilen == 1) {
    rapport('descriptives-univar', data=rp.data, var=rp.name(vars), nortest=nortest)
} else {
    lapply(lapply(vars, rp.name), function(x){
        rapport('descriptives-univar', data=rp.data, var=x, nortest=nortest)
    })
}
%>

{% endhighlight %}
</div></li>
</ul>

<a id="descriptives-univar-factor"> </a>
#### descriptives-univar-factor.tpl

 <ul class="tabs">
	<li><a class="active" href="#info-descriptives-univar-factor">Description</a></li>
	<li><a href="#inputs-descriptives-univar-factor">Inputs</a></li>
	<li><a href="#example-descriptives-univar-factor">Example</a></li>
	<li><a href="#export-descriptives-univar-factor">Export</a></li>
	<li><a href="#source-descriptives-univar-factor">Source</a></li>
</ul>

 <ul class="tabs-content">
	<li class="active" id="info-descriptives-univar-factor"><div><h5>Descriptive statistics</h5> by <em>Gergely Daróczi</em>
<br><br>
 This template will return descriptive statistics and frequency table of a categorical variable.
<br><br>
<em>Required packages:</em> 
<br>
<em>Example:</em> 
{% highlight text %}
rapport('descriptives-univar-factor', data=ius2008, var='gender')
rapport('descriptives-univar-factor', data=ius2008, var='dwell')
{% endhighlight %}
</div></li>
	<li id="inputs-descriptives-univar-factor"><div><h5>Input parameters</h5><em>descriptives-univar-factor.tpl</em> template has the following options to be (optionally) set while calling <em>rapport</em>:<ul>
	<li><h6>var: <small><em>Variable</em></small></h6>
<div class="options">    <div class="options-desc">A categorical variable
</div>
    <em>Type:</em>	factor
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
	<li id="example-descriptives-univar-factor">
{% highlight text %}


#####################################################################################
##	 Running: rapport('descriptives-univar-factor', data=ius2008, var='gender')
#####################################################################################

# *gender* ("Gender")

The dataset has _709_ observations with _673_ valid values (missing: _36_) in *gender* ("Gender"), which seems to be a qualitative variable.

## Base statistics


**gender**   **N**   **%**     **Cumul. N**   **Cumul. %**  
------------ ------- --------- -------------- --------------
male         410     60.9212   410            60.9212       
female       263     39.0788   673            100           
Total        673     100       673            100           
------------ ------- --------- -------------- --------------


## Barplot

/tmp/RtmpeIwHkw/file736db3b3.png

It seems that the highest value is _2_ which is exactly 2 times higher than the smallest value (_1_).

The most frequent value is *male*.


####################################################################################
##	 Running: rapport('descriptives-univar-factor', data=ius2008, var='dwell')
####################################################################################

# *dwell* ("Dwelling")

The dataset has _709_ observations with _662_ valid values (missing: _47_) in *dwell* ("Dwelling"), which seems to be a qualitative variable.

## Base statistics


**dwell**    **N**   **%**     **Cumul. N**   **Cumul. %**  
------------ ------- --------- -------------- --------------
city         599     90.4834   599            90.4834       
small town   33      4.9849    632            95.4683       
village      30      4.5317    662            100           
Total        662     100       662            100           
------------ ------- --------- -------------- --------------


## Barplot

/tmp/RtmpeIwHkw/file573244f6.png

It seems that the highest value is _3_ which is exactly 3 times higher than the smallest value (_1_).

The most frequent value is *city*.


{% endhighlight %}
</li>
	<li id="export-descriptives-univar-factor"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport('descriptives-univar-factor', data=ius2008, var='gender')
rapport('descriptives-univar-factor', data=ius2008, var='dwell')

{% endhighlight %}
<h6>Popular formats:</h6>
<ul>
	<li><a href="demo/descriptives-univar-factor.html" target="_blank">HTML</a></li>
	<li><a href="demo/descriptives-univar-factor.docx">docx (MS Word 2007 format)</a></li>
	<li><a href="demo/descriptives-univar-factor.odt">odt (MS Word compatibile)</a></li>
	<li><a href="demo/descriptives-univar-factor.rtf">rtf (MS Word compatibile)</a></li>
	<li><a href="demo/descriptives-univar-factor.epub">epub</a></li>
	<li><a href="demo/descriptives-univar-factor.tex" target="_blank">latex</a></li>
	<li><a href="demo/descriptives-univar-factor-slidy.html" target="_blank">HTML slidy</a></li>
</ul>
<h6>Other morkdown formats</h6>
<ul>
	<li><a href="demo/descriptives-univar-factor.plain" target="_blank">plain text</a></li>
	<li><a href="demo/descriptives-univar-factor.textile" target="_blank">textile</a></li>
	<li><a href="demo/descriptives-univar-factor.xml" target="_blank">docbook</a></li>
	<li><a href="demo/descriptives-univar-factor.man" target="_blank">man</a></li>
	<li><a href="demo/descriptives-univar-factor.md" target="_blank">markdown</a></li>
	<li><a href="demo/descriptives-univar-factor.mediawiki" target="_blank">mediawiki</a></li>
	<li><a href="demo/descriptives-univar-factor.wiki" target="_blank">wiki</a></li>
	<li><a href="demo/descriptives-univar-factor.org" target="_blank">org</a></li>
	<li><a href="demo/descriptives-univar-factor.pandoc" target="_blank">pandoc</a></li>
</ul>
</div></li>
	<li id="source-descriptives-univar-factor"><div>
<h5>Source of `descriptives-univar-factor.tpl`</h5>
{% highlight text %}

<!--head
Title:          Descriptive statistics
Author:         Gergely Daróczi 
Email:          gergely@snowl.net
Description:    This template will return descriptive statistics and frequency table of a categorical variable.
Data required:  TRUE
Strict:         TRUE
Example:        rapport('descriptives-univar-factor', data=ius2008, var='gender')
                rapport('descriptives-univar-factor', data=ius2008, var='dwell')

var             | factor    | Variable          | A categorical variable
nortest         | TRUE      | Normality test    | If normality tests should be performed 
head-->

# *<%=rp.name(var)%>*<%ifelse(rp.label(var)==rp.name(var), '', sprintf(' ("%s")', rp.label(var)))%>

The dataset has <%nvar<-as.numeric(var); length(nvar)%> observations with <%=rp.valid(nvar)%> valid values (missing: <%=rp.missing(nvar)%>) in *<%=rp.name(var)%>*<%ifelse(rp.label(var)==rp.name(var), '', sprintf(' ("%s")', rp.label(var)))%>, which seems to be a qualitative variable.

## Base statistics

<%
rp.freq(rp.name(var), rp.data)
%>

## Barplot

<%
print(rp.barplot(var))
%>

It seems that the highest value is <%=rp.max(nvar)%> which is exactly <%=rp.round(rp.max(nvar)/rp.min(nvar))%> times higher than the smallest value (<%rp.min(nvar)%>).

The most frequent value is *<%t <- table(var); names(t[t==max(t)])%>*.

{% endhighlight %}
</div></li>
</ul>

<a id="descriptives-univar-numeric"> </a>
#### descriptives-univar-numeric.tpl

 <ul class="tabs">
	<li><a class="active" href="#info-descriptives-univar-numeric">Description</a></li>
	<li><a href="#inputs-descriptives-univar-numeric">Inputs</a></li>
	<li><a href="#example-descriptives-univar-numeric">Example</a></li>
	<li><a href="#export-descriptives-univar-numeric">Export</a></li>
	<li><a href="#source-descriptives-univar-numeric">Source</a></li>
</ul>

 <ul class="tabs-content">
	<li class="active" id="info-descriptives-univar-numeric"><div><h5>Descriptive statistics</h5> by <em>Gergely Daróczi</em>
<br><br>
 This template will return descriptive statistics of a numerical variable.
<br><br>
<em>Required packages:</em> 
<br>
<em>Example:</em> 
{% highlight text %}
rapport('descriptives-univar-numeric', data=ius2008, var='age')
{% endhighlight %}
</div></li>
	<li id="inputs-descriptives-univar-numeric"><div><h5>Input parameters</h5><em>descriptives-univar-numeric.tpl</em> template has the following options to be (optionally) set while calling <em>rapport</em>:<ul>
	<li><h6>var: <small><em>Variable</em></small></h6>
<div class="options">    <div class="options-desc">A numerical variable
</div>
    <em>Type:</em>	numeric
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
	<li id="example-descriptives-univar-numeric">
{% highlight text %}


###################################################################################
##	 Running: rapport('descriptives-univar-numeric', data=ius2008, var='age')
###################################################################################

# *age* ("Age")

The dataset has _709_ observations with _677_ valid values (missing: _32_) in *age* ("Age"), which seems to be a quantitative variable.

## Base statistics


**Variable**   **mean**   **sd**   **var**  
-------------- ---------- -------- ---------
Age            24.5731    6.8491   46.9107  
-------------- ---------- -------- ---------


## Histogram

/tmp/RtmpeIwHkw/file4b1d6998.png

It seems that the highest value is _58_ which is exactly 3.625 times higher than the smallest value (_16_).

The standard deviation is _6.8491_ (variance: _46.9107_). The expected value is around _24.5731_, somewhere between _24.0572_ and _25.0891_ with the standard error of _0.2632_.

If we suppose that *Age* is not near to a normal distribution (test: see below, skewness: _1.9296_, kurtosis: _7.4851_), checking the median (_23_) might be a better option instead of the mean. The interquartile range (_6_) measures the statistics dispersion of the variable (similar to standard deviation) based on median.

## Normality tests

### Introduction

In statistics, _normality_ refers to an assumption that the distribution of a random variable follows _normal_ (_Gaussian_) distribution. Because of its bell-like shape, it's also known as the _"bell curve"_. The formula for _normal distribution_ is:

$$f(x) = \frac{1}{\sqrt{2\pi{}\sigma{}^2}} e^{-\frac{(x-\mu{})^2}{2\sigma{}^2}}$$

_Normal distribution_ belongs to a _location-scale family_ of distributions, as it's defined two parameters:

 - *&mu;* - _mean_ or _expectation_ (location parameter)
 - *&sigma;^2^* - _variance_ (scale parameter)

/tmp/RtmpeIwHkw/file6b8ad1c5.png

### Normality Tests

#### Overview

Various hypothesis tests can be applied in order to test if the distribution of given random variable violates normality assumption. These procedures test the H~0~ that provided variable's distribution is _normal_. At this point only few such tests will be covered: the ones that are available in `stats` package (which comes bundled with default R installation) and `nortest` package that is [available](http://cran.r-project.org/web/packages/nortest/index.html) on CRAN.

 - **Shapiro-Wilk test** is a powerful normality test appropriate for small samples. In R, it's implemented in `shapiro.test` function available in `stats` package.
 - **Lilliefors test** is a modification of _Kolmogorov-Smirnov test_ appropriate for testing normality when parameters or normal distribution (_&mu;_, _&sigma;^2^_) are not known. `lillie.test` function is located in `nortest` package.
 - **Anderson-Darling test** is one of the most powerful normality tests as it will detect the most of departures from normality. You can find `ad.test` function in `nortest` package.
 - **Pearson &Chi;^2^ test** is another normality test which takes more "traditional" approach in normality testing. `pearson.test` is located in `nortest` package.

#### Results

Here you can see the results of applied normality tests (_p-values_ less than 0.05 indicate significant discrepancies):

_0.05_

So, let's draw some conclusions based on applied normality test:

 - according to _Shapiro-Wilk test_, the distribution of _Age_ is not normal.
 - based on _Lilliefors test_, distribution of _Age_ is not normal
 - _Anderson-Darling test_ confirms violation of normality assumption
 - _Pearson's &Chi;^2^ test_ classifies the underlying distribution as non-normal

### Diagnostic Plots

There are various plots that can help you decide about the normality of the distribution. Only a few most commonly used plots will be shown: _histogram_, _Q-Q plot_ and _kernel density plot_.

#### Histogram

_Histogram_ was first introduced by _Karl Pearson_ and it's probably the most popular plot for depicting the probability distribution of a random variable. However, the decision depends on number of bins, so it can sometimes be misleading. If the variable distribution is normal, bins should resemble the "bell-like" shape.

/tmp/RtmpeIwHkw/file18227734.png

#### Q-Q Plot

"Q" in _Q-Q plot_ stands for _quantile_, as this plot compares empirical and theoretical distribution (in this case, _normal_ distribution) by plotting their quantiles against each other. For normal distribution, plotted dots should approximate a "straight", `x = y` line.

/tmp/RtmpeIwHkw/file7014e56b.png

#### Kernel Density Plot

_Kernel density plot_ is a plot of smoothed _empirical distribution function_. As such, it provides good insight about the shape of the distribution. For normal distributions, it should resemble the well known "bell shape".

/tmp/RtmpeIwHkw/file8611649.png


{% endhighlight %}
</li>
	<li id="export-descriptives-univar-numeric"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport('descriptives-univar-numeric', data=ius2008, var='age')

{% endhighlight %}
<h6>Popular formats:</h6>
<ul>
	<li><a href="demo/descriptives-univar-numeric.html" target="_blank">HTML</a></li>
	<li><a href="demo/descriptives-univar-numeric.docx">docx (MS Word 2007 format)</a></li>
	<li><a href="demo/descriptives-univar-numeric.odt">odt (MS Word compatibile)</a></li>
	<li><a href="demo/descriptives-univar-numeric.rtf">rtf (MS Word compatibile)</a></li>
	<li><a href="demo/descriptives-univar-numeric.epub">epub</a></li>
	<li><a href="demo/descriptives-univar-numeric.tex" target="_blank">latex</a></li>
	<li><a href="demo/descriptives-univar-numeric-slidy.html" target="_blank">HTML slidy</a></li>
</ul>
<h6>Other morkdown formats</h6>
<ul>
	<li><a href="demo/descriptives-univar-numeric.plain" target="_blank">plain text</a></li>
	<li><a href="demo/descriptives-univar-numeric.textile" target="_blank">textile</a></li>
	<li><a href="demo/descriptives-univar-numeric.xml" target="_blank">docbook</a></li>
	<li><a href="demo/descriptives-univar-numeric.man" target="_blank">man</a></li>
	<li><a href="demo/descriptives-univar-numeric.md" target="_blank">markdown</a></li>
	<li><a href="demo/descriptives-univar-numeric.mediawiki" target="_blank">mediawiki</a></li>
	<li><a href="demo/descriptives-univar-numeric.wiki" target="_blank">wiki</a></li>
	<li><a href="demo/descriptives-univar-numeric.org" target="_blank">org</a></li>
	<li><a href="demo/descriptives-univar-numeric.pandoc" target="_blank">pandoc</a></li>
</ul>
</div></li>
	<li id="source-descriptives-univar-numeric"><div>
<h5>Source of `descriptives-univar-numeric.tpl`</h5>
{% highlight text %}

<!--head
Title:          Descriptive statistics
Author:         Gergely Daróczi 
Email:          gergely@snowl.net
Description:    This template will return descriptive statistics of a numerical variable.
Data required:  TRUE
Strict:         TRUE
Example:        rapport('descriptives-univar-numeric', data=ius2008, var='age')

var             | numeric   | Variable          | A numerical variable
nortest         | TRUE      | Normality test    | If normality tests should be performed 
head-->

# *<%=rp.name(var)%>*<%ifelse(rp.label(var)==rp.name(var), '', sprintf(' ("%s")', rp.label(var)))%>

The dataset has <%length(var)%> observations with <%=rp.valid(var)%> valid values (missing: <%=rp.missing(var)%>) in *<%=rp.name(var)%>*<%ifelse(rp.label(var)==rp.name(var), '', sprintf(' ("%s")', rp.label(var)))%>, which seems to be a quantitative variable.

## Base statistics

<%
rp.desc(rp.name(var), NULL, c('mean', 'sd', 'var'), rp.data)
%>

## Histogram

<%
print(rp.hist(var))
%>

It seems that the highest value is <%=rp.max(var)%> which is exactly <%=rp.round(rp.max(var)/rp.min(var))%> times higher than the smallest value (<%rp.min(var)%>).

The standard deviation is <%rp.sd(var)%> (variance: <%rp.var(var)%>). The expected value is around <%rp.mean(var)%>, somewhere between <%rp.mean(var)-1.96*rp.se.mean(var)%> and <%rp.mean(var)+1.96*rp.se.mean(var)%> with the standard error of <%rp.se.mean(var)%>.

If we suppose that *<%rp.label(var)%>* is not near to a normal distribution (test: <%ifelse(nortest & is.numeric(var), 'see below', 'not run')%>, skewness: <%rp.skewness(var)%>, kurtosis: <%rp.kurtosis(var)%>), checking the median (<%rp.median(var)%>) might be a better option instead of the mean. The interquartile range (<%rp.iqr(var)%>) measures the statistics dispersion of the variable (similar to standard deviation) based on median.

## <%if (nortest) 'Normality tests'%>

<%
if (nortest) rapport('nortest', data=rp.data, var=rp.name(var), header.levels.offset = 2)
%>

{% endhighlight %}
</div></li>
</ul>

<a id="descriptives-univar"> </a>
#### descriptives-univar.tpl

 <ul class="tabs">
	<li><a class="active" href="#info-descriptives-univar">Description</a></li>
	<li><a href="#inputs-descriptives-univar">Inputs</a></li>
	<li><a href="#example-descriptives-univar">Example</a></li>
	<li><a href="#export-descriptives-univar">Export</a></li>
	<li><a href="#source-descriptives-univar">Source</a></li>
</ul>

 <ul class="tabs-content">
	<li class="active" id="info-descriptives-univar"><div><h5>Descriptive statistics</h5> by <em>Gergely Daróczi</em>
<br><br>
 This template will return descriptive statistics of a numerical, or a frequency table of a categorical variable.
<br><br>
<em>Required packages:</em> 
<br>
<em>Example:</em> 
{% highlight text %}
rapport('descriptives-univar', data=ius2008, var='gender')
rapport('descriptives-univar', data=ius2008, var='age')
{% endhighlight %}
</div></li>
	<li id="inputs-descriptives-univar"><div><h5>Input parameters</h5><em>descriptives-univar.tpl</em> template has the following options to be (optionally) set while calling <em>rapport</em>:<ul>
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
<div class="options">    <div class="options-desc">If normality tests should be performed fot numerical variable
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
	<li id="example-descriptives-univar">
{% highlight text %}


##############################################################################
##	 Running: rapport('descriptives-univar', data=ius2008, var='gender')
##############################################################################

# *gender* ("Gender")

The dataset has _709_ observations with _673_ valid values (missing: _36_) in *gender* ("Gender"), which seems to be a qualitative variable.

## Base statistics


**gender**   **N**   **%**     **Cumul. N**   **Cumul. %**  
------------ ------- --------- -------------- --------------
male         410     60.9212   410            60.9212       
female       263     39.0788   673            100           
Total        673     100       673            100           
------------ ------- --------- -------------- --------------


## Barplot

/tmp/RtmpeIwHkw/file1fe85711.png

It seems that the highest value is _2_ which is exactly 2 times higher than the smallest value (_1_).

The most frequent value is *male*.




###########################################################################
##	 Running: rapport('descriptives-univar', data=ius2008, var='age')
###########################################################################

# *age* ("Age")

The dataset has _709_ observations with _677_ valid values (missing: _32_) in *age* ("Age"), which seems to be a quantitative variable.

## Base statistics


**Variable**   **mean**   **sd**   **var**  
-------------- ---------- -------- ---------
Age            24.5731    6.8491   46.9107  
-------------- ---------- -------- ---------


## Histogram

/tmp/RtmpeIwHkw/file4c80b3c4.png

It seems that the highest value is _58_ which is exactly 3.625 times higher than the smallest value (_16_).

The standard deviation is _6.8491_ (variance: _46.9107_). The expected value is around _24.5731_, somewhere between _24.0572_ and _25.0891_ with the standard error of _0.2632_.

If we suppose that *Age* is not near to a normal distribution (test: see below, skewness: _1.9296_, kurtosis: _7.4851_), checking the median (_23_) might be a better option instead of the mean. The interquartile range (_6_) measures the statistics dispersion of the variable (similar to standard deviation) based on median.

## Normality tests

### Introduction

In statistics, _normality_ refers to an assumption that the distribution of a random variable follows _normal_ (_Gaussian_) distribution. Because of its bell-like shape, it's also known as the _"bell curve"_. The formula for _normal distribution_ is:

$$f(x) = \frac{1}{\sqrt{2\pi{}\sigma{}^2}} e^{-\frac{(x-\mu{})^2}{2\sigma{}^2}}$$

_Normal distribution_ belongs to a _location-scale family_ of distributions, as it's defined two parameters:

 - *&mu;* - _mean_ or _expectation_ (location parameter)
 - *&sigma;^2^* - _variance_ (scale parameter)

/tmp/RtmpeIwHkw/file6a26f268.png

### Normality Tests

#### Overview

Various hypothesis tests can be applied in order to test if the distribution of given random variable violates normality assumption. These procedures test the H~0~ that provided variable's distribution is _normal_. At this point only few such tests will be covered: the ones that are available in `stats` package (which comes bundled with default R installation) and `nortest` package that is [available](http://cran.r-project.org/web/packages/nortest/index.html) on CRAN.

 - **Shapiro-Wilk test** is a powerful normality test appropriate for small samples. In R, it's implemented in `shapiro.test` function available in `stats` package.
 - **Lilliefors test** is a modification of _Kolmogorov-Smirnov test_ appropriate for testing normality when parameters or normal distribution (_&mu;_, _&sigma;^2^_) are not known. `lillie.test` function is located in `nortest` package.
 - **Anderson-Darling test** is one of the most powerful normality tests as it will detect the most of departures from normality. You can find `ad.test` function in `nortest` package.
 - **Pearson &Chi;^2^ test** is another normality test which takes more "traditional" approach in normality testing. `pearson.test` is located in `nortest` package.

#### Results

Here you can see the results of applied normality tests (_p-values_ less than 0.05 indicate significant discrepancies):

_0.05_

So, let's draw some conclusions based on applied normality test:

 - according to _Shapiro-Wilk test_, the distribution of _Age_ is not normal.
 - based on _Lilliefors test_, distribution of _Age_ is not normal
 - _Anderson-Darling test_ confirms violation of normality assumption
 - _Pearson's &Chi;^2^ test_ classifies the underlying distribution as non-normal

### Diagnostic Plots

There are various plots that can help you decide about the normality of the distribution. Only a few most commonly used plots will be shown: _histogram_, _Q-Q plot_ and _kernel density plot_.

#### Histogram

_Histogram_ was first introduced by _Karl Pearson_ and it's probably the most popular plot for depicting the probability distribution of a random variable. However, the decision depends on number of bins, so it can sometimes be misleading. If the variable distribution is normal, bins should resemble the "bell-like" shape.

/tmp/RtmpeIwHkw/file4ece53b3.png

#### Q-Q Plot

"Q" in _Q-Q plot_ stands for _quantile_, as this plot compares empirical and theoretical distribution (in this case, _normal_ distribution) by plotting their quantiles against each other. For normal distribution, plotted dots should approximate a "straight", `x = y` line.

/tmp/RtmpeIwHkw/file29414658.png

#### Kernel Density Plot

_Kernel density plot_ is a plot of smoothed _empirical distribution function_. As such, it provides good insight about the shape of the distribution. For normal distributions, it should resemble the well known "bell shape".

/tmp/RtmpeIwHkw/file2d10b315.png




{% endhighlight %}
</li>
	<li id="export-descriptives-univar"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport('descriptives-univar', data=ius2008, var='gender')
rapport('descriptives-univar', data=ius2008, var='age')

{% endhighlight %}
<h6>Popular formats:</h6>
<ul>
	<li><a href="demo/descriptives-univar.html" target="_blank">HTML</a></li>
	<li><a href="demo/descriptives-univar.docx">docx (MS Word 2007 format)</a></li>
	<li><a href="demo/descriptives-univar.odt">odt (MS Word compatibile)</a></li>
	<li><a href="demo/descriptives-univar.rtf">rtf (MS Word compatibile)</a></li>
	<li><a href="demo/descriptives-univar.epub">epub</a></li>
	<li><a href="demo/descriptives-univar.tex" target="_blank">latex</a></li>
	<li><a href="demo/descriptives-univar-slidy.html" target="_blank">HTML slidy</a></li>
</ul>
<h6>Other morkdown formats</h6>
<ul>
	<li><a href="demo/descriptives-univar.plain" target="_blank">plain text</a></li>
	<li><a href="demo/descriptives-univar.textile" target="_blank">textile</a></li>
	<li><a href="demo/descriptives-univar.xml" target="_blank">docbook</a></li>
	<li><a href="demo/descriptives-univar.man" target="_blank">man</a></li>
	<li><a href="demo/descriptives-univar.md" target="_blank">markdown</a></li>
	<li><a href="demo/descriptives-univar.mediawiki" target="_blank">mediawiki</a></li>
	<li><a href="demo/descriptives-univar.wiki" target="_blank">wiki</a></li>
	<li><a href="demo/descriptives-univar.org" target="_blank">org</a></li>
	<li><a href="demo/descriptives-univar.pandoc" target="_blank">pandoc</a></li>
</ul>
</div></li>
	<li id="source-descriptives-univar"><div>
<h5>Source of `descriptives-univar.tpl`</h5>
{% highlight text %}

<!--head
Title:          Descriptive statistics
Author:         Gergely Daróczi 
Email:          gergely@snowl.net
Description:    This template will return descriptive statistics of a numerical, or a frequency table of a categorical variable.
Data required:  TRUE
Strict:         TRUE
Example:        rapport('descriptives-univar', data=ius2008, var='gender')
                rapport('descriptives-univar', data=ius2008, var='age')

var             | variable  | Variable          | A categorical or numerical variable. The template will determine the measurement level of the given variable and will return a detailed frequency table or appropriate descriptive statistics for numerics.
nortest         | TRUE      | Normality test    | If normality tests should be performed fot numerical variable
head-->

<%
if (is.numeric(var)) {
        rapport('descriptives-univar-numeric', data=rp.data, var=rp.name(var))
    } else {
        rapport('descriptives-univar-factor', data=rp.data, var=rp.name(var))
    }
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

# Début

Hello, world!

I have just specified a *Variable* in this template named to **leisure**. The label of this variable is "Internet usage in leisure time (hours per day)".

And wow, the mean of *leisure* is _3.1994_!

## Descriptive statistics


**Min.**   **1st Qu.**   **Median**   **Mean**   **3rd Qu.**   **Max.**   **NA's**  
---------- ------------- ------------ ---------- ------------- ---------- ----------
0.000      2.000         3.000        3.199      4.000         12.000     37.000    
---------- ------------- ------------ ---------- ------------- ---------- ----------


The 5 highest values are: _12_, _12_, _10_, _10_ and _10_.


##########################################################################
##	 Running: rapport("example", ius2008, var='leisure', desc=FALSE)
##########################################################################

# Début

Hello, world!

I have just specified a *Variable* in this template named to **leisure**. The label of this variable is "Internet usage in leisure time (hours per day)".

And wow, the mean of *leisure* is _3.1994_!

**For more detailed statistics, you should have set `desc=TRUE`!**


##################################################################################
##	 Running: rapport("example", ius2008, var='leisure', desc=FALSE, hist=T)
##################################################################################

# Début

Hello, world!

I have just specified a *Variable* in this template named to **leisure**. The label of this variable is "Internet usage in leisure time (hours per day)".

And wow, the mean of *leisure* is _3.1994_!

**For more detailed statistics, you should have set `desc=TRUE`!**

## Histogram

/tmp/RtmpeIwHkw/file48feadaf.png


################################################################################################
##	 Running: rapport("example", ius2008, var='leisure', desc=FALSE, hist=T, theme='Set2')
################################################################################################

# Début

Hello, world!

I have just specified a *Variable* in this template named to **leisure**. The label of this variable is "Internet usage in leisure time (hours per day)".

And wow, the mean of *leisure* is _3.1994_!

**For more detailed statistics, you should have set `desc=TRUE`!**

## Histogram

/tmp/RtmpeIwHkw/file49e44603.png


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
	<li><a href="demo/example.docx">docx (MS Word 2007 format)</a></li>
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
Title:          Example template
Author:         Gergely Daróczi 
Description:    This template demonstrates the basic features of rapport. We all hope you will like it!
Packages:       lattice
Data required:  TRUE
Strict:         TRUE
Example:        rapport("example", ius2008, var='leisure')
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
if (hist) {
    options('style.color.palette' = theme) 
    print(rp.hist(var))
}
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

# Introduction

In statistics, _normality_ refers to an assumption that the distribution of a random variable follows _normal_ (_Gaussian_) distribution. Because of its bell-like shape, it's also known as the _"bell curve"_. The formula for _normal distribution_ is:

$$f(x) = \frac{1}{\sqrt{2\pi{}\sigma{}^2}} e^{-\frac{(x-\mu{})^2}{2\sigma{}^2}}$$

_Normal distribution_ belongs to a _location-scale family_ of distributions, as it's defined two parameters:

 - *&mu;* - _mean_ or _expectation_ (location parameter)
 - *&sigma;^2^* - _variance_ (scale parameter)

/tmp/RtmpeIwHkw/file1d52e978.png

# Normality Tests

## Overview

Various hypothesis tests can be applied in order to test if the distribution of given random variable violates normality assumption. These procedures test the H~0~ that provided variable's distribution is _normal_. At this point only few such tests will be covered: the ones that are available in `stats` package (which comes bundled with default R installation) and `nortest` package that is [available](http://cran.r-project.org/web/packages/nortest/index.html) on CRAN.

 - **Shapiro-Wilk test** is a powerful normality test appropriate for small samples. In R, it's implemented in `shapiro.test` function available in `stats` package.
 - **Lilliefors test** is a modification of _Kolmogorov-Smirnov test_ appropriate for testing normality when parameters or normal distribution (_&mu;_, _&sigma;^2^_) are not known. `lillie.test` function is located in `nortest` package.
 - **Anderson-Darling test** is one of the most powerful normality tests as it will detect the most of departures from normality. You can find `ad.test` function in `nortest` package.
 - **Pearson &Chi;^2^ test** is another normality test which takes more "traditional" approach in normality testing. `pearson.test` is located in `nortest` package.

## Results

Here you can see the results of applied normality tests (_p-values_ less than 0.05 indicate significant discrepancies):

_0.05_

So, let's draw some conclusions based on applied normality test:

 - according to _Shapiro-Wilk test_, the distribution of _Internet usage in leisure time (hours per day)_ is not normal.
 - based on _Lilliefors test_, distribution of _Internet usage in leisure time (hours per day)_ is not normal
 - _Anderson-Darling test_ confirms violation of normality assumption
 - _Pearson's &Chi;^2^ test_ classifies the underlying distribution as normal

# Diagnostic Plots

There are various plots that can help you decide about the normality of the distribution. Only a few most commonly used plots will be shown: _histogram_, _Q-Q plot_ and _kernel density plot_.

## Histogram

_Histogram_ was first introduced by _Karl Pearson_ and it's probably the most popular plot for depicting the probability distribution of a random variable. However, the decision depends on number of bins, so it can sometimes be misleading. If the variable distribution is normal, bins should resemble the "bell-like" shape.

/tmp/RtmpeIwHkw/file6a58a50d.png

## Q-Q Plot

"Q" in _Q-Q plot_ stands for _quantile_, as this plot compares empirical and theoretical distribution (in this case, _normal_ distribution) by plotting their quantiles against each other. For normal distribution, plotted dots should approximate a "straight", `x = y` line.

/tmp/RtmpeIwHkw/file793f2334.png

## Kernel Density Plot

_Kernel density plot_ is a plot of smoothed _empirical distribution function_. As such, it provides good insight about the shape of the distribution. For normal distributions, it should resemble the well known "bell shape".

/tmp/RtmpeIwHkw/filef24e211.png


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

_0.05_

So, let's draw some conclusions based on applied normality test:

 - according to _Shapiro-Wilk test_, the distribution of _Internet usage in leisure time (hours per day)_ is not normal.
 - based on _Lilliefors test_, distribution of _Internet usage in leisure time (hours per day)_ is not normal
 - _Anderson-Darling test_ confirms violation of normality assumption
 - _Pearson's &Chi;^2^ test_ classifies the underlying distribution as normal

# Diagnostic Plots

There are various plots that can help you decide about the normality of the distribution. Only a few most commonly used plots will be shown: _histogram_, _Q-Q plot_ and _kernel density plot_.

## Histogram

_Histogram_ was first introduced by _Karl Pearson_ and it's probably the most popular plot for depicting the probability distribution of a random variable. However, the decision depends on number of bins, so it can sometimes be misleading. If the variable distribution is normal, bins should resemble the "bell-like" shape.

/tmp/RtmpeIwHkw/file33aabd82.png

## Q-Q Plot

"Q" in _Q-Q plot_ stands for _quantile_, as this plot compares empirical and theoretical distribution (in this case, _normal_ distribution) by plotting their quantiles against each other. For normal distribution, plotted dots should approximate a "straight", `x = y` line.

/tmp/RtmpeIwHkw/file60eeead0.png

## Kernel Density Plot

_Kernel density plot_ is a plot of smoothed _empirical distribution function_. As such, it provides good insight about the shape of the distribution. For normal distributions, it should resemble the well known "bell shape".

/tmp/RtmpeIwHkw/file45e9f847.png


#################################################################################
##	 Running: rapport("nortest", ius2008, var = "leisure", qq.line = FALSE)
#################################################################################

# Introduction

In statistics, _normality_ refers to an assumption that the distribution of a random variable follows _normal_ (_Gaussian_) distribution. Because of its bell-like shape, it's also known as the _"bell curve"_. The formula for _normal distribution_ is:

$$f(x) = \frac{1}{\sqrt{2\pi{}\sigma{}^2}} e^{-\frac{(x-\mu{})^2}{2\sigma{}^2}}$$

_Normal distribution_ belongs to a _location-scale family_ of distributions, as it's defined two parameters:

 - *&mu;* - _mean_ or _expectation_ (location parameter)
 - *&sigma;^2^* - _variance_ (scale parameter)

/tmp/RtmpeIwHkw/file3fcfabb2.png

# Normality Tests

## Overview

Various hypothesis tests can be applied in order to test if the distribution of given random variable violates normality assumption. These procedures test the H~0~ that provided variable's distribution is _normal_. At this point only few such tests will be covered: the ones that are available in `stats` package (which comes bundled with default R installation) and `nortest` package that is [available](http://cran.r-project.org/web/packages/nortest/index.html) on CRAN.

 - **Shapiro-Wilk test** is a powerful normality test appropriate for small samples. In R, it's implemented in `shapiro.test` function available in `stats` package.
 - **Lilliefors test** is a modification of _Kolmogorov-Smirnov test_ appropriate for testing normality when parameters or normal distribution (_&mu;_, _&sigma;^2^_) are not known. `lillie.test` function is located in `nortest` package.
 - **Anderson-Darling test** is one of the most powerful normality tests as it will detect the most of departures from normality. You can find `ad.test` function in `nortest` package.
 - **Pearson &Chi;^2^ test** is another normality test which takes more "traditional" approach in normality testing. `pearson.test` is located in `nortest` package.

## Results

Here you can see the results of applied normality tests (_p-values_ less than 0.05 indicate significant discrepancies):

_0.05_

So, let's draw some conclusions based on applied normality test:

 - according to _Shapiro-Wilk test_, the distribution of _Internet usage in leisure time (hours per day)_ is not normal.
 - based on _Lilliefors test_, distribution of _Internet usage in leisure time (hours per day)_ is not normal
 - _Anderson-Darling test_ confirms violation of normality assumption
 - _Pearson's &Chi;^2^ test_ classifies the underlying distribution as normal

# Diagnostic Plots

There are various plots that can help you decide about the normality of the distribution. Only a few most commonly used plots will be shown: _histogram_, _Q-Q plot_ and _kernel density plot_.

## Histogram

_Histogram_ was first introduced by _Karl Pearson_ and it's probably the most popular plot for depicting the probability distribution of a random variable. However, the decision depends on number of bins, so it can sometimes be misleading. If the variable distribution is normal, bins should resemble the "bell-like" shape.

/tmp/RtmpeIwHkw/file487d5958.png

## Q-Q Plot

"Q" in _Q-Q plot_ stands for _quantile_, as this plot compares empirical and theoretical distribution (in this case, _normal_ distribution) by plotting their quantiles against each other. For normal distribution, plotted dots should approximate a "straight", `x = y` line.

/tmp/RtmpeIwHkw/file44a905e7.png

## Kernel Density Plot

_Kernel density plot_ is a plot of smoothed _empirical distribution function_. As such, it provides good insight about the shape of the distribution. For normal distributions, it should resemble the well known "bell shape".

/tmp/RtmpeIwHkw/file52041ba8.png


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
	<li><a href="demo/nortest.docx">docx (MS Word 2007 format)</a></li>
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
Title:          Normality Tests
Author:         Aleksandar Blagotić
Description:    Overview of several normality tests and diagnostic plots that can screen departures from normality.
Packages:       nortest
Data required:  TRUE
Strict:         TRUE
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
print(rp.hist(var))
%>

## Q-Q Plot
 
"Q" in _Q-Q plot_ stands for _quantile_, as this plot compares empirical and theoretical distribution (in this case, _normal_ distribution) by plotting their quantiles against each other. For normal distribution, plotted dots should approximate a "straight", `x = y` line.

<%
if (qq.line){
   print(qqmath(var, panel=function(x){
               panel.qqmath(x)
               panel.qqmathline(x, distribution = qnorm)
   }, xlab = "Theoretical Quantiles", ylab = "Empirical Quantiles"))
} else {
   print(rp.qqplot(var))
}
%>

## Kernel Density Plot

_Kernel density plot_ is a plot of smoothed _empirical distribution function_. As such, it provides good insight about the shape of the distribution. For normal distributions, it should resemble the well known "bell shape".

<%
print(rp.densityplot(var))
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

# Boxplot

/tmp/RtmpeIwHkw/file1dabbac3.png

# Lund test

It seems that _4_ extreme values can be found in "Internet usage for educational purposes (hours per day)". These are: 10, 0.5, 1.5, 0.5.

## Explanation

The above test for outliers was based on *lm(1 ~ edu)*:


              **Estimate**   **Std. Error**   **t value**   **Pr(>|t|)**  
------------- -------------- ---------------- ------------- --------------
(Intercept)   2.0481         0.078            26.2677       0             
------------- -------------- ---------------- ------------- --------------


## References

 * Lund, R. E. 1975, "Tables for An Approximate Test for Outliers in Linear Models", Technometrics, vol. 17, no. 4, pp. 473-476.
 * Prescott, P. 1975, "An Approximate Test for Outliers in Linear Models", Technometrics, vol. 17, no. 1, pp. 129-132.

# Grubb's test

Grubbs test for one outlier shows that highest value 12 is an outlier (p=0.0002).

## References

 * Grubbs, F.E. (1950). Sample Criteria for testing outlying observations. Ann. Math. Stat. 21, 1, 27-58.

# Dixon's test

chi-squared test for outlier shows that highest value 12 is an outlier (p=0).

## References

 * Dixon, W.J. (1950). Analysis of extreme values. Ann. Math. Stat. 21, 4, 488-506.


####################################################################################
##	 Running: rapport('outlier-test', data=ius2008, var='edu', lund.res=FALSE)
####################################################################################

# Boxplot

/tmp/RtmpeIwHkw/file24fe57a8.png

# Lund test

It seems that _4_ extreme values can be found in "Internet usage for educational purposes (hours per day)". These are: 10, 0.5, 1.5, 0.5.

## Explanation

The above test for outliers was based on *lm(1 ~ edu)*:


              **Estimate**   **Std. Error**   **t value**   **Pr(>|t|)**  
------------- -------------- ---------------- ------------- --------------
(Intercept)   2.0481         0.078            26.2677       0             
------------- -------------- ---------------- ------------- --------------


## References

 * Lund, R. E. 1975, "Tables for An Approximate Test for Outliers in Linear Models", Technometrics, vol. 17, no. 4, pp. 473-476.
 * Prescott, P. 1975, "An Approximate Test for Outliers in Linear Models", Technometrics, vol. 17, no. 1, pp. 129-132.

# Grubb's test

Grubbs test for one outlier shows that highest value 12 is an outlier (p=0.0002).

## References

 * Grubbs, F.E. (1950). Sample Criteria for testing outlying observations. Ann. Math. Stat. 21, 1, 27-58.

# Dixon's test

chi-squared test for outlier shows that highest value 12 is an outlier (p=0).

## References

 * Dixon, W.J. (1950). Analysis of extreme values. Ann. Math. Stat. 21, 4, 488-506.


################################################################################################################################
##	 Running: rapport('outlier-test', data=ius2008, var='edu', lund.res=FALSE, references=FALSE, grubb=FALSE, dixon=FALSE)
################################################################################################################################

# Boxplot

/tmp/RtmpeIwHkw/file7a2ef99.png

# Lund test

It seems that _4_ extreme values can be found in "Internet usage for educational purposes (hours per day)". These are: 10, 0.5, 1.5, 0.5.

## Explanation

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
	<li><a href="demo/outlier-test.docx">docx (MS Word 2007 format)</a></li>
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
Data required:  TRUE
Strict:         TRUE
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
print(rp.boxplot(var))
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

# Introduction

In a nutshell, _t-test_ is a statistical test that assesses hypothesis of equality of two means. But in theory, any hypothesis test that yields statistic which follows [_t-distribution_](https://en.wikipedia.org/wiki/Student%27s_t-distribution) can be considered a _t-test_. The most common usage of _t-test_ is to:

 - compare the mean of a variable with given test mean value - **one-sample _t-test_**
 - compare means of two variables from independent samples - **independent samples _t-test_**
 - compare means of two variables from dependent samples - **paired-samples _t-test_**

# Overview

Independent samples _t-test_ is carried out with _Internet usage in leisure time (hours per day)_ as dependent variable, and _Gender_ as independent variable. Confidence interval is set to 95%. Equality of variances wasn't assumed.

# Descriptives

In order to get more insight on the underlying data, a table of basic descriptive statistics is displayed below.


**Gender**   **min**   **max**   **mean**   **sd**   **var**   **median**   **IQR**   **skewness**   **kurtosis**  
------------ --------- --------- ---------- -------- --------- ------------ --------- -------------- --------------
male         0         12        3.2699     1.9535   3.8161    3            3         0.9479         4.0064        
female       0         12        3.0643     2.3546   5.5442    2            3         1.4064         4.9089        
------------ --------- --------- ---------- -------- --------- ------------ --------- -------------- --------------


# Diagnostics

Since _t-test_ is a parametric technique, it sets some basic assumptions on distribution shape: it has to be _normal_ (or appoximately normal). A few normality test are to be applied, in order to screen possible departures from normality. 

## Normality Tests

We will use _Shapiro-Wilk_, _Lilliefors_ and _Anderson-Darling_ tests to screen departures from normality in the response variable (_Internet usage in leisure time (hours per day)_). 

<!-- endlist -->

                                                 **N**    **p**  
------------------------------------------------ -------- -------
Shapiro-Wilk normality test                      0.9001   0      
Lilliefors (Kolmogorov-Smirnov) normality test   0.168    0      
Anderson-Darling normality test                  18.753   0      
------------------------------------------------ -------- -------


As you can see, applied tests confirm departures from normality.

# Results

Welch Two Sample t-test was applied, and significant differences were found.

<!-- endlist -->

    **statistic**   **df**     **p**    **CI(lower)**   **CI(upper)**  
--- --------------- ---------- -------- --------------- ---------------
t   1.1483          457.8625   0.2514   -0.1463         0.5576         
--- --------------- ---------- -------- --------------- ---------------



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


**Variable**                                     **NA**   **NA**   **NA**   **NA**   **NA**   **NA**   **NA**   **NA**   **NA**  
------------------------------------------------ -------- -------- -------- -------- -------- -------- -------- -------- --------
Internet usage in leisure time (hours per day)   0        12       3.1994   2.1436   4.5951   3        2        1.1873   4.547   
------------------------------------------------ -------- -------- -------- -------- -------- -------- -------- -------- --------


# Diagnostics

Since _t-test_ is a parametric technique, it sets some basic assumptions on distribution shape: it has to be _normal_ (or appoximately normal). A few normality test are to be applied, in order to screen possible departures from normality. 

## Normality Tests

We will use _Shapiro-Wilk_, _Lilliefors_ and _Anderson-Darling_ tests to screen departures from normality in the response variable (_Internet usage in leisure time (hours per day)_). 

<!-- endlist -->

                                                 **N**    **p**  
------------------------------------------------ -------- -------
Shapiro-Wilk normality test                      0.9001   0      
Lilliefors (Kolmogorov-Smirnov) normality test   0.168    0      
Anderson-Darling normality test                  18.753   0      
------------------------------------------------ -------- -------


As you can see, applied tests confirm departures from normality.

# Results

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
	<li><a href="demo/t-test.docx">docx (MS Word 2007 format)</a></li>
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
Title:          t-test Template
Author:         Aleksandar Blagotić
Description:    A t-test report with table of descriptives, diagnostic tests and t-test specific statistics.
Packages:       nortest
Data required:  TRUE
Example:        rapport("t-test", ius2008, x = "leisure", y = "gender")
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
rp.desc(x, y, c(min, max, mean, sd, var, median, IQR, skewness, kurtosis))
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

