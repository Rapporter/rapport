<ul>
 	<li><a href="#ANOVA">ANOVA.tpl</a></li>
 	<li><a href="#BartlettsTest">BartlettsTest.tpl</a></li>
 	<li><a href="#BrownForsythTest">BrownForsythTest.tpl</a></li>
 	<li><a href="#Correlation">Correlation.tpl</a></li>
 	<li><a href="#Crosstable">Crosstable.tpl</a></li>
 	<li><a href="#Descriptives">Descriptives.tpl</a></li>
 	<li><a href="#FactorAnalysis">FactorAnalysis.tpl</a></li>
 	<li><a href="#FTest">FTest.tpl</a></li>
 	<li><a href="#GenerateBeta">GenerateBeta.tpl</a></li>
 	<li><a href="#GLM">GLM.tpl</a></li>
 	<li><a href="#HierarchicalClusterAnalysis">HierarchicalClusterAnalysis.tpl</a></li>
 	<li><a href="#HomogeneityCrosstable">HomogeneityCrosstable.tpl</a></li>
 	<li><a href="#KMeansCluster">KMeansCluster.tpl</a></li>
 	<li><a href="#KolmogorovSmirnovTest">KolmogorovSmirnovTest.tpl</a></li>
 	<li><a href="#KruskalWallisTest">KruskalWallisTest.tpl</a></li>
 	<li><a href="#LinearRegression">LinearRegression.tpl</a></li>
 	<li><a href="#MDS">MDS.tpl</a></li>
 	<li><a href="#NormalityTest">NormalityTest.tpl</a></li>
 	<li><a href="#OutlierTest">OutlierTest.tpl</a></li>
 	<li><a href="#PCA">PCA.tpl</a></li>
 	<li><a href="#TTest">TTest.tpl</a></li>
 	<li><a href="#WilcoxonTest">WilcoxonTest.tpl</a></li>
 </ul>

Please find below a detailed description about each with sample outputs of those in R console, HTML, odt and pdf too.

<a id="ANOVA"> </a>
#### ANOVA.tpl

 <ul class="tabs">
	<li><a class="active" href="#info-ANOVA">Description</a></li>
	<li><a href="#inputs-ANOVA">Inputs</a></li>
	<li><a href="#example-ANOVA">Example</a></li>
	<li><a href="#export-ANOVA">Export</a></li>
	<li><a href="#source-ANOVA">Source</a></li>
</ul>

 <ul class="tabs-content">
	<li class="active" id="info-ANOVA"><div><h5>ANOVA Template</h5> by <em>Aleksandar Blagotić, Dániel Nagy</em>
<br><br>
 An ANOVA report with table of descriptives, diagnostic tests and ANOVA-specific statistics.
<br><br>
<em>Required packages:</em> nortest
<br>
<em>Example:</em> 
{% highlight text %}
rapport("ANOVA", ius2008, resp = "leisure", fac = "gender")  # one-way
rapport("ANOVA", ius2008, resp = "leisure", fac = c("gender", "partner")) # two-way
{% endhighlight %}
</div></li>
	<li id="inputs-ANOVA"><div><h5>Input parameters</h5><em>ANOVA.tpl</em> template has the following options to be (optionally) set while calling <em>rapport</em>:<ul>
	
 Inputs
 
 "resp" (Response variable)  *required
 Dependent (response) variable
   - class:		numeric
   - standalone:	no
   - length:		exactly 1 vector
 
 "fac" (Factor variables)  *required
 Independent variables (factors)
   - class:		factor
   - standalone:	no
   - length:		from 1 to 2 vectors
 
 "fac.intr" (Factor interaction)
 Include factor interaction
   - class:		logical
   - standalone:	yes
   - length:		exactly 1 value
   - value:		TRUE
 </ul></div></li>
	<li id="example-ANOVA">
{% highlight text %}


##########################################################################################
##	 Running: rapport("ANOVA", ius2008, resp = "leisure", fac = "gender")  # one-way
##########################################################################################

# Introduction


**Analysis of Variance** or **ANOVA** is a statistical procedure that tests equality of means for several samples. It was first introduced in 1921 by famous English statistician Sir Ronald Aylmer Fisher.


# Model Overview

One-Way ANOVA was carried out, with _Gender_ as independent variable, and _Internet usage in leisure time (hours per day)_ as a response variable. Factor interaction was taken into account.


# Descriptives


In order to get more insight on the model data, a table of frequencies for ANOVA factors is displayed, as well as a table of descriptives.


## Frequency Table


Below lies a frequency table for factors in ANOVA model. Note that the missing values are removed from the summary.


----------------------------------------
 gender   N    %    Cumul. N   Cumul. % 
-------- --- ----- ---------- ----------
  male   410 60.92    410       60.92   

 female  263 39.08    673        100    

 Total   673  100     673        100    
----------------------------------------


## Descriptive Statistics


The following table displays the descriptive statistics of ANOVA model. Factor levels  lie on the left-hand side, while the corresponding statistics for response variable are given on the right-hand side.


---------------------------------------------------------------------------
 Gender   Min   Max   Mean   Std.Dev.   Median   IQR   Skewness   Kurtosis 
-------- ----- ----- ------ ---------- -------- ----- ---------- ----------
  male     0    12    3.27    1.953       3       3     0.9443     0.9858  

 female    0    12   3.064    2.355       2       3     1.398       1.87   
---------------------------------------------------------------------------


# Diagnostics


Before we carry out ANOVA, we'd like to check some basic assumptions. For those purposes, normality and homoscedascity tests are carried out alongside several graphs that may help you with your decision on model's main assumptions.


## Diagnostics


### Univariate Normality


-------------------------------------------------
          Method             Statistic   p-value 
--------------------------- ----------- ---------
        Lilliefors             0.168      3e-52  
   (Kolmogorov-Smirnov)                          
      normality test                             

Anderson-Darling normality     18.75    7.261e-44
           test                                  

Shapiro-Wilk normality test   0.9001    1.618e-20
-------------------------------------------------


So, the conclusions we can draw with the help of test statistics: 
   
 - based on _Lilliefors test_, distribution of _Internet usage in leisure time (hours per day)_ is not normal
   
 - _Anderson-Darling test_ confirms violation of normality assumption

 - according to _Shapiro-Wilk test_, the distribution of _Internet usage in leisure time (hours per day)_ is not normal
 


As you can see, the applied tests confirm departures from normality of the Internet usage in leisure time (hours per day).

### Homoscedascity


In order to test homoscedascity, _Bartlett_ and _Fligner-Kileen_ tests are applied.


--------------------------------------------------
           Method             Statistic   p-value 
---------------------------- ----------- ---------
  Fligner-Killeen test of      0.4629     0.4963  
  homogeneity of variances                        

Bartlett test of homogeneity    10.77    0.001032 
        of variances                              
--------------------------------------------------




When it comes to equality of variances, applied tests yield inconsistent results. While _Fligner-Kileen test_ confirmed the hypotheses of homoscedascity, _Bartlett's test_ rejected it.


## Diagnostic Plots


Here you can see several diagnostic plots for ANOVA model:

 - residuals against fitted values
 - scale-location plot of square root of residuals against fitted values
 - normal Q-Q plot
 - residuals against leverages

[![](plots/ANOVA-9.png)](plots/ANOVA-9-hires.png)

# ANOVA Summary


## ANOVA Table


----------------------------------------------------------
    &nbsp;       Df   Sum.Sq   Mean.Sq   F.value   Pr..F. 
--------------- ---- -------- --------- --------- --------
  **gender**     1    6.422     6.422     1.43     0.2322 

 **Residuals**  636    2856     4.49                      
----------------------------------------------------------



_F-test_ for _Gender_ is not statistically significant, which implies that there is no Gender effect on response variable. 


## Post Hoc test


### Results


After getting the results of the ANOVA, usually it is advisable to run a [post hoc test](http://en.wikipedia.org/wiki/Post-hoc_analysis) to explore patterns that were not specified a priori. Now we are presenting [Tukey's HSD test](http://en.wikipedia.org/wiki/Tukey%27s_range_test).


#### gender


--------------------------------------------------------------------
     &nbsp;        Difference   Lower Bound   Upper Bound   P value 
----------------- ------------ ------------- ------------- ---------
 **female-male**     -0.206       -0.543         0.132      _0.232_ 
--------------------------------------------------------------------




There are no categories which differ significantly here.


### Plot


Below you can see the result of the post hoc test on a plot.

[![](plots/ANOVA-10.png)](plots/ANOVA-10-hires.png)


#######################################################################################################
##	 Running: rapport("ANOVA", ius2008, resp = "leisure", fac = c("gender", "partner")) # two-way
#######################################################################################################

# Introduction


**Analysis of Variance** or **ANOVA** is a statistical procedure that tests equality of means for several samples. It was first introduced in 1921 by famous English statistician Sir Ronald Aylmer Fisher.


# Model Overview

Two-Way ANOVA was carried out, with _Gender_ and _Relationship status_ as independent variables, and _Internet usage in leisure time (hours per day)_ as a response variable. Factor interaction was taken into account.


# Descriptives


In order to get more insight on the model data, a table of frequencies for ANOVA factors is displayed, as well as a table of descriptives.


## Frequency Table


Below lies a frequency table for factors in ANOVA model. Note that the missing values are removed from the summary.


----------------------------------------------------------
 gender       partner       N    %    Cumul. N   Cumul. % 
-------- ----------------- --- ----- ---------- ----------
  male   in a relationship 150 23.7     150        23.7   

 female  in a relationship 120 18.96    270       42.65   

  male        married      33  5.213    303       47.87   

 female       married      29  4.581    332       52.45   

  male        single       204 32.23    536       84.68   

 female       single       97  15.32    633        100    

 Total         Total       633  100     633        100    
----------------------------------------------------------


## Descriptive Statistics


The following table displays the descriptive statistics of ANOVA model. Factor levels and their combinations lie on the left-hand side, while the corresponding statistics for response variable are given on the right-hand side.


-------------------------------------------------------------------------------------------------
 Gender   Relationship status   Min   Max   Mean   Std.Dev.   Median   IQR   Skewness   Kurtosis 
-------- --------------------- ----- ----- ------ ---------- -------- ----- ---------- ----------
  male     in a relationship    0.5   12   3.058    1.969      2.5      2     1.324      2.649   

  male          married          0     8   2.985    2.029       3       2     0.862      0.1509  

  male          single           0    10   3.503    1.936       3       3     0.7574    0.08749  

 female    in a relationship    0.5   10   3.044    2.216       3       3     1.383      1.831   

 female         married          0    10   2.481    1.967       2     1.75    2.063      5.586   

 female         single           0    12   3.323    2.679       3      3.5    1.185      0.9281  
-------------------------------------------------------------------------------------------------


# Diagnostics


Before we carry out ANOVA, we'd like to check some basic assumptions. For those purposes, normality and homoscedascity tests are carried out alongside several graphs that may help you with your decision on model's main assumptions.


## Diagnostics


### Univariate Normality


-------------------------------------------------
          Method             Statistic   p-value 
--------------------------- ----------- ---------
        Lilliefors             0.168      3e-52  
   (Kolmogorov-Smirnov)                          
      normality test                             

Anderson-Darling normality     18.75    7.261e-44
           test                                  

Shapiro-Wilk normality test   0.9001    1.618e-20
-------------------------------------------------


So, the conclusions we can draw with the help of test statistics: 
   
 - based on _Lilliefors test_, distribution of _Internet usage in leisure time (hours per day)_ is not normal
   
 - _Anderson-Darling test_ confirms violation of normality assumption

 - according to _Shapiro-Wilk test_, the distribution of _Internet usage in leisure time (hours per day)_ is not normal
 


As you can see, the applied tests confirm departures from normality of the Internet usage in leisure time (hours per day).

### Homoscedascity


In order to test homoscedascity, _Bartlett_ and _Fligner-Kileen_ tests are applied.


--------------------------------------------------
           Method             Statistic   p-value 
---------------------------- ----------- ---------
  Fligner-Killeen test of       1.123     0.2892  
  homogeneity of variances                        

Bartlett test of homogeneity    11.13    0.0008509
        of variances                              
--------------------------------------------------




When it comes to equality of variances, applied tests yield inconsistent results. While _Fligner-Kileen test_ confirmed the hypotheses of homoscedascity, _Bartlett's test_ rejected it.


## Diagnostic Plots


Here you can see several diagnostic plots for ANOVA model:

 - residuals against fitted values
 - scale-location plot of square root of residuals against fitted values
 - normal Q-Q plot
 - residuals against leverages

[![](plots/ANOVA-11.png)](plots/ANOVA-11-hires.png)

# ANOVA Summary


## ANOVA Table


---------------------------------------------------------------
       &nbsp;         Df   Sum.Sq   Mean.Sq   F.value   Pr..F. 
-------------------- ---- -------- --------- --------- --------
     **gender**       1    4.947     4.947     1.085    0.2979 

    **partner**       2    31.21     15.61     3.424   0.03324 

 **gender:partner**   2    3.038     1.519    0.3332    0.7168 

   **Residuals**     593    2703     4.558                     
---------------------------------------------------------------



_F-test_ for _Gender_ is not statistically significant, which implies that there is no Gender effect on response variable. Effect of _Relationship status_ on response variable is  significant. Interaction between levels of _Gender_ and _Relationship status_ wasn't found significant (p = 0.717).


## Post Hoc test


### Results


After getting the results of the ANOVA, usually it is advisable to run a [post hoc test](http://en.wikipedia.org/wiki/Post-hoc_analysis) to explore patterns that were not specified a priori. Now we are presenting [Tukey's HSD test](http://en.wikipedia.org/wiki/Tukey%27s_range_test).


#### gender


--------------------------------------------------------------------
     &nbsp;        Difference   Lower Bound   Upper Bound   P value 
----------------- ------------ ------------- ------------- ---------
 **female-male**     -0.186       -0.538         0.165      _0.298_ 
--------------------------------------------------------------------




There are no categories which differ significantly here.


#### partner


----------------------------------------------------------------------------------
            &nbsp;               Difference   Lower Bound   Upper Bound   P value 
------------------------------- ------------ ------------- ------------- ---------
 **married-in a relationship**     -0.289       -1.012         0.435      _0.616_ 

 **single-in a relationship**      0.371        -0.061         0.803      _0.109_ 

      **single-married**            0.66        -0.059         1.379      _0.079_ 
----------------------------------------------------------------------------------




There are no categories which differ significantly here.


#### gender:partner


-------------------------------------------------------------------------------------
              &nbsp;                Difference   Lower Bound   Upper Bound   P value 
---------------------------------- ------------ ------------- ------------- ---------
          **female:in a               -0.014       -0.777         0.749        _1_   
      relationship-male:in a                                                         
          relationship**                                                             

     **male:married-male:in a         -0.073        -1.25         1.103        _1_   
          relationship**                                                             

    **female:married-male:in a        -0.577       -1.877         0.722      _0.801_ 
          relationship**                                                             

     **male:single-male:in a          0.444         -0.23         1.119      _0.412_ 
          relationship**                                                             

    **female:single-male:in a         0.264        -0.545         1.074      _0.938_ 
          relationship**                                                             

    **male:married-female:in a        -0.059       -1.266         1.148        _1_   
          relationship**                                                             

   **female:married-female:in a       -0.563        -1.89         0.764      _0.83_  
          relationship**                                                             

    **male:single-female:in a         0.459        -0.267         1.184      _0.461_ 
          relationship**                                                             

   **female:single-female:in a        0.279        -0.574         1.132      _0.938_ 
          relationship**                                                             

 **female:married-male:married**      -0.504       -2.105         1.097      _0.946_ 

   **male:single-male:married**       0.518        -0.635         1.67       _0.794_ 

  **female:single-male:married**      0.338        -0.899         1.575      _0.971_ 

  **male:single-female:married**      1.022        -0.256          2.3       _0.201_ 

 **female:single-female:married**     0.842        -0.512         2.196      _0.481_ 

  **female:single-male:single**       -0.18        -0.955         0.594      _0.986_ 
-------------------------------------------------------------------------------------




There are no categories which differ significantly here.


### Plot


Below you can see the result of the post hoc test on a plot.

[![](plots/ANOVA-12.png)](plots/ANOVA-12-hires.png)


{% endhighlight %}
</li>
	<li id="export-ANOVA"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport("ANOVA", ius2008, resp = "leisure", fac = "gender")  # one-way
rapport("ANOVA", ius2008, resp = "leisure", fac = c("gender", "partner")) # two-way

{% endhighlight %}
<h6>Popular formats:</h6>
<ul>
	<li><a href="demo/ANOVA.html" target="_blank">HTML</a></li>
	<li><a href="demo/ANOVA.pdf" target="_blank">pdf</a></li>
	<li><a href="demo/ANOVA.docx">docx (MS Word 2007 format)</a></li>
	<li><a href="demo/ANOVA.odt">odt (MS Word compatible)</a></li>
	<li><a href="demo/ANOVA.rtf">rtf (MS Word compatible)</a></li>
	<li><a href="demo/ANOVA.epub">epub</a></li>
</ul>
<h6>Other morkdown formats</h6>
<ul>
	<li><a href="demo/ANOVA.textile" target="_blank">textile</a></li>
	<li><a href="demo/ANOVA.docbook" target="_blank">docbook</a></li>
	<li><a href="demo/ANOVA.man" target="_blank">man</a></li>
	<li><a href="demo/ANOVA.md" target="_blank">markdown</a></li>
	<li><a href="demo/ANOVA.mediawiki" target="_blank">mediawiki</a></li>
	<li><a href="demo/ANOVA.wiki" target="_blank">wiki</a></li>
	<li><a href="demo/ANOVA.org" target="_blank">org</a></li>
	<li><a href="demo/ANOVA.pandoc" target="_blank">pandoc</a></li>
</ul>
</div></li>
	<li id="source-ANOVA"><div>
<h5>Source of `ANOVA.tpl`</h5>
{% highlight text %}

<!--head
meta:
  title: ANOVA Template
  author: Aleksandar Blagotić, Dániel Nagy
  description: An ANOVA report with table of descriptives, diagnostic tests and ANOVA-specific
    statistics.
  email: ~
  packages: nortest
  example:
  - 'rapport("ANOVA", ius2008, resp = "leisure", fac = "gender")  # one-way'
  - 'rapport("ANOVA", ius2008, resp = "leisure", fac = c("gender", "partner")) # two-way'
inputs:
- name: resp
  label: Response variable
  description: Dependent (response) variable
  class: numeric
  length:
    min: 1.0
    max: 1.0
  value: ~
  required: yes
  standalone: no
- name: fac
  label: Factor variables
  description: Independent variables (factors)
  class: factor
  length:
    min: 1.0
    max: 2.0
  value: ~
  required: yes
  standalone: no
- name: fac.intr
  label: Factor interaction
  description: Include factor interaction
  class: logical
  length:
    min: 1.0
    max: 1.0
  value: yes
  required: no
  standalone: yes
head-->

<%=
panderOptions('table.split.table', Inf)
d <- structure(data.frame(resp, fac), .Names = c(resp.iname, fac.name))
f.int <- fml(resp.iname, fac.name, join.right = "*")
f.nonint <- fml(resp.iname, fac.name, join.right = "+")
fit <- lm(ifelse(isTRUE(fac.intr), f.int, f.nonint), data = d)
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

The following table displays the descriptive statistics of ANOVA model. Factor levels <%=ifelse(ncol(fac) > 1, "and their combinations", "")%> lie on the left-hand side, while the corresponding statistics for response variable are given on the right-hand side.

<%=
(desc <- rp.desc(resp, fac, c(Min = min, Max = max, Mean = mean, Std.Dev. = sd, Median = median, IQR, Skewness = skewness, Kurtosis = kurtosis)))
%>

# Diagnostics

Before we carry out ANOVA, we'd like to check some basic assumptions. For those purposes, normality and homoscedascity tests are carried out alongside several graphs that may help you with your decision on model's main assumptions.

## Diagnostics

### Univariate Normality

<% if (length(resp) < 5000) { %>

<%= ntest <- htest(resp, lillie.test, ad.test, shapiro.test)
k <- 0
l <- 0
m <- 0
n <- 0
p <- 0.05
if (ntest$p[1] < 0.05) {l <- k + 1}
if (ntest$p[2] < 0.05) {m <- l + 1}
if (ntest$p[3] < 0.05) {n <- m + 1}
ntest
%>
So, the conclusions we can draw with the help of test statistics: 
   
 - based on _Lilliefors test_, distribution of _<%= resp.label %>_ is <%= ifelse(ntest[1, 3] < p, "not normal", "normal") %>
   
 - _Anderson-Darling test_ confirms<%= ifelse(ntest[2, 3] < p, " violation of", "") %> normality assumption

 - according to _Shapiro-Wilk test_, the distribution of _<%= resp.label %>_ is<%= ifelse(ntest[3, 3] < p, " not", "") %> normal
 
<% } else { %>
<%= ntest <- htest(resp, lillie.test, ad.test)
k <- 0
l <- 0
m <- 0
n <- 0
p <- 0.05
if (ntest$p[1] < 0.05) {l <- k + 1}
if (ntest$p[2] < 0.05) {n <- l + 1}
ntest
%>

So, the conclusions we can draw with the help of test statistics: 
   
 - based on _Lilliefors test_, distribution of _<%= resp.label %>_ is <%= ifelse(ntest[1, 3] < p, "not normal", "normal") %>
   
 - _Anderson-Darling test_ confirms<%= ifelse(ntest[2, 3] < p, " violation of", "") %> normality assumption
<% } %>

<%= if (n > 0) {
sprintf("As you can see, the applied tests %s of the %s.", ifelse(n > 1, "confirm departures from normality", "yield different results on hypotheses of normality, so you may want to stick with one you find most appropriate or you trust the most in the case"), resp.label) 
} else { 
sprintf("reject departures from normality") 
} 
%>


### Homoscedascity

In order to test homoscedascity, _Bartlett_ and _Fligner-Kileen_ tests are applied.

<%=
hsced <- with(d, htest(as.formula(f.nonint), fligner.test, bartlett.test))
hp <- hsced$p
hcons <- all(hp < .05) | all(hp > .05)
hp.all <- all(hp < .05)
hsced
%>


When it comes to equality of variances, applied tests yield <%= ifelse(hcons, "consistent", "inconsistent") %> results. <%= if (hcons) { sprintf("Homoscedascity assumption is %s.", ifelse(hp.all, "rejected", "confirmed")) } else { sprintf("While _Fligner-Kileen test_ %s the hypotheses of homoscedascity, _Bartlett's test_ %s it.", ifelse(hp[1] < .05, "rejected", "confirmed"), ifelse(hp[2] < .05, "rejected", "confirmed")) } %>

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

_F-test_ for <%= p(fac.label[1]) %> is <%= ifelse(a.fp[1], "", "not") %> statistically significant, which implies that there is <%= ifelse(a.fp[1], "an", "no") %> <%= fac.label[1] %> effect on response variable. <%= if (fac.ilen == 2) { sprintf("Effect of %s on response variable is %s significant. ", p(fac.label[2]), ifelse(a.fp[2], "", "not")) } else { "" } %><%= if (fac.ilen == 2 & fac.intr) { sprintf("Interaction between levels of %s %s found significant (p = %.3f).", p(fac.label), ifelse(a.fp[3], "was", "wasn't"), a.p[3]) } else { "" } %>

## Post Hoc test

### Results

After getting the results of the ANOVA, usually it is advisable to run a [post hoc test](http://en.wikipedia.org/wiki/Post-hoc_analysis) to explore patterns that were not specified a priori. Now we are presenting [Tukey's HSD test](http://en.wikipedia.org/wiki/Tukey%27s_range_test).

<%= 
aovfit <- aov(fit)
Tukey <- TukeyHSD(aovfit) 
%>

<% for (v in names(Tukey)) { %>

#### <%= v %>

<%=  posthoc <- round(Tukey[[v]],3)
colnames(posthoc) <- c("Difference", "Lower Bound", "Upper Bound", "P value") 
is.signif <- length(posthoc[,4][which(abs(posthoc[,4]) < 0.05)]) > 0
length.signif <- length(posthoc[,4][which(abs(posthoc[,4]) < 0.05)])
if (is.signif) {
post.signif <- paste(pander.return(lapply(1:length.signif, function(i) paste0(p(c(rownames(posthoc)[which(abs(posthoc[,4]) < 0.05)][i])), ' (', round(posthoc[,4][which(abs(posthoc[,4]) < 0.05)][i], 3), ')'))), collapse = '\n')
} else {
post.signif <- NULL
}

posthoc[,4] <- add.significance.stars(posthoc[,4])
posthoc
%>

<% if (is.signif) { %>
The following categories differ significantly (in the brackets you can see the p-value):
<% } else { %>
There are no categories which differ significantly here.
<% } %>
<%=
post.signif
%>

<% } %>

### Plot

Below you can see the result of the post hoc test on a plot.

<%= Tukey_plot <- plot(TukeyHSD(aovfit)) %>




{% endhighlight %}
</div></li>
</ul>

<a id="BartlettsTest"> </a>
#### BartlettsTest.tpl

 <ul class="tabs">
	<li><a class="active" href="#info-BartlettsTest">Description</a></li>
	<li><a href="#inputs-BartlettsTest">Inputs</a></li>
	<li><a href="#example-BartlettsTest">Example</a></li>
	<li><a href="#export-BartlettsTest">Export</a></li>
	<li><a href="#source-BartlettsTest">Source</a></li>
</ul>

 <ul class="tabs-content">
	<li class="active" id="info-BartlettsTest"><div><h5>Bartlett's test</h5> by <em>Gergely Daróczi, Daniel Nagy</em>
<br><br>
 This template will run the Bartlett's test to check the equality of variances between groups.
<br><br>
<em>Required packages:</em> nortest
<br>
<em>Example:</em> 
{% highlight text %}
rapport('BartlettsTest.tpl', data=ius2008, resp='age', group='gender')
rapport('BartlettsTest.tpl', data=ius2008, resp='edu', group='student')
rapport('BartlettsTest.tpl', data=ius2008, resp='age', group='net.required')
{% endhighlight %}
</div></li>
	<li id="inputs-BartlettsTest"><div><h5>Input parameters</h5><em>BartlettsTest.tpl</em> template has the following options to be (optionally) set while calling <em>rapport</em>:<ul>
	
 Inputs
 
 "resp" (Response Variable)  *required
 This is the depend variables which will be used here
   - class:		numeric
   - standalone:	no
   - length:		exactly 1 vector
 
 "group" (Grouping Variable)  *required
 This is the grouping variable which will be used here
   - class:		factor
   - standalone:	no
   - length:		exactly 1 vector
 </ul></div></li>
	<li id="example-BartlettsTest">
{% highlight text %}


##########################################################################################
##	 Running: rapport('BartlettsTest.tpl', data=ius2008, resp='age', group='gender')
##########################################################################################

# Introduction


Bartlett's test is used to test the homogeneity of the variances, in other words the equality of the tested variable's variances across the groups. With checking that we want to find if the two groups are coming from the same population.

Homogeneity is useful to being tested, because that is an assumption of the One-Way ANOVA.


## References


  * Snedecor, George W. and Cochran, William G. (1989). _Statistical Methods_. Iowa State University Press


# Normality assumption


The Bartlett's test has an assumption of normality, thus one should obtain the information if the distribution of the tested variable had a normal distribution.

We will use _Shapiro-Wilk_, _Lilliefors_ and _Anderson-Darling_ tests to screen departures from normality in the response variable.




-------------------------------------------------
          Method             Statistic   p-value 
--------------------------- ----------- ---------
        Lilliefors             0.17     6.193e-54
   (Kolmogorov-Smirnov)                          
      normality test                             

Anderson-Darling normality     32.16    1.26e-71 
           test                                  

Shapiro-Wilk normality test   0.8216    9.445e-27
-------------------------------------------------


So, the conclusions we can draw with the help of test statistics: 
   
 - based on _Lilliefors test_, distribution of _Age_ is not normal
   
 - _Anderson-Darling test_ confirms violation of normality assumption

 - according to _Shapiro-Wilk test_, the distribution of _Age_ is not normal
 


As you can see, the applied tests confirm departures from normality.

# Test results


After checking the assumptions let's see what the test shows us!


--------------------------------------------------
           Method             Statistic   p-value 
---------------------------- ----------- ---------
Bartlett test of homogeneity    0.233     0.6293  
        of variances                              
--------------------------------------------------



According to the _Bartlett's test_, the variance of the _Age_ across the groups of _Gender_ does not differs significantly.

We can conclude that, because the p-value is higher than 0.05.



###########################################################################################
##	 Running: rapport('BartlettsTest.tpl', data=ius2008, resp='edu', group='student')
###########################################################################################

# Introduction


Bartlett's test is used to test the homogeneity of the variances, in other words the equality of the tested variable's variances across the groups. With checking that we want to find if the two groups are coming from the same population.

Homogeneity is useful to being tested, because that is an assumption of the One-Way ANOVA.


## References


  * Snedecor, George W. and Cochran, William G. (1989). _Statistical Methods_. Iowa State University Press


# Normality assumption


The Bartlett's test has an assumption of normality, thus one should obtain the information if the distribution of the tested variable had a normal distribution.

We will use _Shapiro-Wilk_, _Lilliefors_ and _Anderson-Darling_ tests to screen departures from normality in the response variable.




-------------------------------------------------
          Method             Statistic   p-value 
--------------------------- ----------- ---------
        Lilliefors            0.2223    2.243e-92
   (Kolmogorov-Smirnov)                          
      normality test                             

Anderson-Darling normality     42.04    3.31e-90 
           test                                  

Shapiro-Wilk normality test   0.7985    6.366e-28
-------------------------------------------------


So, the conclusions we can draw with the help of test statistics: 
   
 - based on _Lilliefors test_, distribution of _Internet usage for educational purposes (hours per day)_ is not normal
   
 - _Anderson-Darling test_ confirms violation of normality assumption

 - according to _Shapiro-Wilk test_, the distribution of _Internet usage for educational purposes (hours per day)_ is not normal
 


As you can see, the applied tests confirm departures from normality.

# Test results


After checking the assumptions let's see what the test shows us!


--------------------------------------------------
           Method             Statistic   p-value 
---------------------------- ----------- ---------
Bartlett test of homogeneity    36.11    1.863e-09
        of variances                              
--------------------------------------------------



According to the _Bartlett's test_, the variance of the _Internet usage for educational purposes (hours per day)_ across the groups of _Student_ significantly differs.

We can conclude that, because the p-value is smaller than 0.05.



################################################################################################
##	 Running: rapport('BartlettsTest.tpl', data=ius2008, resp='age', group='net.required')
################################################################################################

# Introduction


Bartlett's test is used to test the homogeneity of the variances, in other words the equality of the tested variable's variances across the groups. With checking that we want to find if the two groups are coming from the same population.

Homogeneity is useful to being tested, because that is an assumption of the One-Way ANOVA.


## References


  * Snedecor, George W. and Cochran, William G. (1989). _Statistical Methods_. Iowa State University Press


# Normality assumption


The Bartlett's test has an assumption of normality, thus one should obtain the information if the distribution of the tested variable had a normal distribution.

We will use _Shapiro-Wilk_, _Lilliefors_ and _Anderson-Darling_ tests to screen departures from normality in the response variable.




-------------------------------------------------
          Method             Statistic   p-value 
--------------------------- ----------- ---------
        Lilliefors             0.17     6.193e-54
   (Kolmogorov-Smirnov)                          
      normality test                             

Anderson-Darling normality     32.16    1.26e-71 
           test                                  

Shapiro-Wilk normality test   0.8216    9.445e-27
-------------------------------------------------


So, the conclusions we can draw with the help of test statistics: 
   
 - based on _Lilliefors test_, distribution of _Age_ is not normal
   
 - _Anderson-Darling test_ confirms violation of normality assumption

 - according to _Shapiro-Wilk test_, the distribution of _Age_ is not normal
 


As you can see, the applied tests confirm departures from normality.

# Test results


After checking the assumptions let's see what the test shows us!


--------------------------------------------------
           Method             Statistic   p-value 
---------------------------- ----------- ---------
Bartlett test of homogeneity    23.26    0.0001123
        of variances                              
--------------------------------------------------



According to the _Bartlett's test_, the variance of the _Age_ across the groups of _How often does your profession require Internet access?_ significantly differs.

We can conclude that, because the p-value is smaller than 0.05.



{% endhighlight %}
</li>
	<li id="export-BartlettsTest"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport('BartlettsTest.tpl', data=ius2008, resp='age', group='gender')
rapport('BartlettsTest.tpl', data=ius2008, resp='edu', group='student')
rapport('BartlettsTest.tpl', data=ius2008, resp='age', group='net.required')

{% endhighlight %}
<h6>Popular formats:</h6>
<ul>
	<li><a href="demo/BartlettsTest.html" target="_blank">HTML</a></li>
	<li><a href="demo/BartlettsTest.pdf" target="_blank">pdf</a></li>
	<li><a href="demo/BartlettsTest.docx">docx (MS Word 2007 format)</a></li>
	<li><a href="demo/BartlettsTest.odt">odt (MS Word compatible)</a></li>
	<li><a href="demo/BartlettsTest.rtf">rtf (MS Word compatible)</a></li>
	<li><a href="demo/BartlettsTest.epub">epub</a></li>
</ul>
<h6>Other morkdown formats</h6>
<ul>
	<li><a href="demo/BartlettsTest.textile" target="_blank">textile</a></li>
	<li><a href="demo/BartlettsTest.docbook" target="_blank">docbook</a></li>
	<li><a href="demo/BartlettsTest.man" target="_blank">man</a></li>
	<li><a href="demo/BartlettsTest.md" target="_blank">markdown</a></li>
	<li><a href="demo/BartlettsTest.mediawiki" target="_blank">mediawiki</a></li>
	<li><a href="demo/BartlettsTest.wiki" target="_blank">wiki</a></li>
	<li><a href="demo/BartlettsTest.org" target="_blank">org</a></li>
	<li><a href="demo/BartlettsTest.pandoc" target="_blank">pandoc</a></li>
</ul>
</div></li>
	<li id="source-BartlettsTest"><div>
<h5>Source of `BartlettsTest.tpl`</h5>
{% highlight text %}

<!--head
meta:
  title: Bartlett's test
  author: Gergely Daróczi, Daniel Nagy
  description: This template will run the Bartlett's test to check the equality of variances between groups.
  email: ~
  packages:
  - nortest
  example:
  - rapport('BartlettsTest.tpl', data=ius2008, resp='age', group='gender')
  - rapport('BartlettsTest.tpl', data=ius2008, resp='edu', group='student')
  - rapport('BartlettsTest.tpl', data=ius2008, resp='age', group='net.required')
inputs:
- name: resp
  label: Response Variable
  description: This is the depend variables which will be used here
  class: numeric
  length:
    min: 1.0
    max: 1.0
  required: yes
  standalone: no
- name: group
  label: Grouping Variable
  description: This is the grouping variable which will be used here
  class: factor
  length:
    min: 1.0
    max: 1.0
  required: yes
  standalone: no
head-->


# Introduction

Bartlett's test is used to test the homogeneity of the variances, in other words the equality of the tested variable's variances across the groups. With checking that we want to find if the two groups are coming from the same population.

Homogeneity is useful to being tested, because that is an assumption of the One-Way ANOVA.

## References

  * Snedecor, George W. and Cochran, William G. (1989). _Statistical Methods_. Iowa State University Press

# Normality assumption

The Bartlett's test has an assumption of normality, thus one should obtain the information if the distribution of the tested variable had a normal distribution.

We will use <%=ifelse(length(resp) < 5000, "_Shapiro-Wilk_, ", "")%>_Lilliefors_ and _Anderson-Darling_ tests to screen departures from normality in the response variable.

<% if (length(resp) < 5000) { %>

<%= ntest <- htest(resp, lillie.test, ad.test, shapiro.test)
k <- 0
l <- 0
m <- 0
n <- 0
p <- 0.05
if (ntest$p[1] < 0.05) {l <- k + 1}
if (ntest$p[2] < 0.05) {m <- l + 1}
if (ntest$p[3] < 0.05) {n <- m + 1}
ntest
%>
So, the conclusions we can draw with the help of test statistics: 
   
 - based on _Lilliefors test_, distribution of _<%= resp.label %>_ is <%= ifelse(ntest[1, 3] < p, "not normal", "normal") %>
   
 - _Anderson-Darling test_ confirms<%= ifelse(ntest[2, 3] < p, " violation of", "") %> normality assumption

 - according to _Shapiro-Wilk test_, the distribution of _<%= resp.label %>_ is<%= ifelse(ntest[3, 3] < p, " not", "") %> normal
 
<% } else { %>
<%= ntest <- htest(resp, lillie.test, ad.test)
k <- 0
l <- 0
m <- 0
n <- 0
p <- 0.05
if (ntest$p[1] < 0.05) {l <- k + 1}
if (ntest$p[2] < 0.05) {n <- l + 1}
ntest
%>

So, the conclusions we can draw with the help of test statistics: 
   
 - based on _Lilliefors test_, distribution of _<%= resp.label %>_ is <%= ifelse(ntest[1, 3] < p, "not normal", "normal") %>
   
 - _Anderson-Darling test_ confirms<%= ifelse(ntest[2, 3] < p, " violation of", "") %> normality assumption
<% } %>

<%= if (n > 0) {
sprintf("As you can see, the applied tests %s.", ifelse(n > 1, "confirm departures from normality", "yield different results on hypotheses of normality, so you may want to stick with one you find most appropriate or you trust the most.")) 
} else { 
sprintf("reject departures from normality") 
} 
%>

# Test results

After checking the assumptions let's see what the test shows us!

<%=
bartlett <- function(resp) bartlett.test(resp, group)
h <- htest(resp, bartlett)
h
p <- .05
%>

According to the _Bartlett's test_, the variance of the _<%= resp.label %>_ across the groups of _<%= group.label %>_ <%= ifelse(h[1, 3] < p, "significantly differs", "does not differs significantly") %>.

We can conclude that, because <%= ifelse(h[1, 3] < p,"the p-value is smaller than 0.05.","the p-value is higher than 0.05.")%>


{% endhighlight %}
</div></li>
</ul>

<a id="BrownForsythTest"> </a>
#### BrownForsythTest.tpl

 <ul class="tabs">
	<li><a class="active" href="#info-BrownForsythTest">Description</a></li>
	<li><a href="#inputs-BrownForsythTest">Inputs</a></li>
	<li><a href="#example-BrownForsythTest">Example</a></li>
	<li><a href="#export-BrownForsythTest">Export</a></li>
	<li><a href="#source-BrownForsythTest">Source</a></li>
</ul>

 <ul class="tabs-content">
	<li class="active" id="info-BrownForsythTest"><div><h5>Brown-Forsyth test</h5> by <em>Gergely Daróczi, Daniel Nagy</em>
<br><br>
 This template will run a Brown-Forsyth test to check the equality of variances among groups.
<br><br>
<em>Required packages:</em> HH
<br>
<em>Example:</em> 
{% highlight text %}
rapport('BrownForsythTest.tpl', data=ius2008, resp='age', group='gender')
rapport('BrownForsythTest.tpl', data=ius2008, resp='edu', group='gender')
rapport('BrownForsythTest.tpl', data=ius2008, resp='edu', group='net.required')
{% endhighlight %}
</div></li>
	<li id="inputs-BrownForsythTest"><div><h5>Input parameters</h5><em>BrownForsythTest.tpl</em> template has the following options to be (optionally) set while calling <em>rapport</em>:<ul>
	
 Inputs
 
 "resp" (Response Variable)  *required
 This is the depend variables which will be used here
   - class:		numeric
   - standalone:	no
   - length:		exactly 1 vector
 
 "group" (Grouping Variable)  *required
 This is the grouping variable which will be used here
   - class:		factor
   - standalone:	no
   - length:		exactly 1 vector
 </ul></div></li>
	<li id="example-BrownForsythTest">
{% highlight text %}


#############################################################################################
##	 Running: rapport('BrownForsythTest.tpl', data=ius2008, resp='age', group='gender')
#############################################################################################

# Introduction


The Brown-Forsyth test is used for checking the equality of the variances among the groups of one variable, in other words it tests the homogeneity of the variances. Equality of group variances is an assumption of the one-way ANOVA test.

The base of the test is really similar to the Levene's test, but the Brown-Forsyth test uses the deviations from the group medians instead of the mean (what the Levene's does), thus the Brown-Forsyth test is called more robust.

This test has the advantage over the other tests, which are also being used to check the homogeneity (F-test and Bartlett's test), that it does not have a normality assumption, so the variable we investigate do not have to follow a normal distribution.


## References


  * Brown, M.~B. and Forsyth, A.~B. (1974). Robust tests for equality of variances. _Journal of the American Statistical Association_, 69:364-367.


# Result


----------------------------------------
      Method        Statistic   p-value 
------------------ ----------- ---------
hov: Brown-Forsyth   0.3847     0.5353  
----------------------------------------



According to the _Brown-Forsyth test_, the variances of the _Age_ across the groups of _Gender_ does not differs significantly.

We can conclude that, because the p-value is higher than 0.05


## References


  * Heiberger, Richard M. and Holland, Burt (2004b). _Statistical Analysis and Data Display: An Intermediate Course with Examples in S-Plus, R, and SAS_.




#############################################################################################
##	 Running: rapport('BrownForsythTest.tpl', data=ius2008, resp='edu', group='gender')
#############################################################################################

# Introduction


The Brown-Forsyth test is used for checking the equality of the variances among the groups of one variable, in other words it tests the homogeneity of the variances. Equality of group variances is an assumption of the one-way ANOVA test.

The base of the test is really similar to the Levene's test, but the Brown-Forsyth test uses the deviations from the group medians instead of the mean (what the Levene's does), thus the Brown-Forsyth test is called more robust.

This test has the advantage over the other tests, which are also being used to check the homogeneity (F-test and Bartlett's test), that it does not have a normality assumption, so the variable we investigate do not have to follow a normal distribution.


## References


  * Brown, M.~B. and Forsyth, A.~B. (1974). Robust tests for equality of variances. _Journal of the American Statistical Association_, 69:364-367.


# Result


----------------------------------------
      Method        Statistic   p-value 
------------------ ----------- ---------
hov: Brown-Forsyth    4.681     0.03087 
----------------------------------------



According to the _Brown-Forsyth test_, the variances of the _Internet usage for educational purposes (hours per day)_ across the groups of _Gender_ significantly differs.

We can conclude that, because the p-value is smaller than 0.05


## References


  * Heiberger, Richard M. and Holland, Burt (2004b). _Statistical Analysis and Data Display: An Intermediate Course with Examples in S-Plus, R, and SAS_.




###################################################################################################
##	 Running: rapport('BrownForsythTest.tpl', data=ius2008, resp='edu', group='net.required')
###################################################################################################

# Introduction


The Brown-Forsyth test is used for checking the equality of the variances among the groups of one variable, in other words it tests the homogeneity of the variances. Equality of group variances is an assumption of the one-way ANOVA test.

The base of the test is really similar to the Levene's test, but the Brown-Forsyth test uses the deviations from the group medians instead of the mean (what the Levene's does), thus the Brown-Forsyth test is called more robust.

This test has the advantage over the other tests, which are also being used to check the homogeneity (F-test and Bartlett's test), that it does not have a normality assumption, so the variable we investigate do not have to follow a normal distribution.


## References


  * Brown, M.~B. and Forsyth, A.~B. (1974). Robust tests for equality of variances. _Journal of the American Statistical Association_, 69:364-367.


# Result


----------------------------------------
      Method        Statistic   p-value 
------------------ ----------- ---------
hov: Brown-Forsyth    15.89    2.131e-12
----------------------------------------



According to the _Brown-Forsyth test_, the variances of the _Internet usage for educational purposes (hours per day)_ across the groups of _How often does your profession require Internet access?_ significantly differs.

We can conclude that, because the p-value is smaller than 0.05


## References


  * Heiberger, Richard M. and Holland, Burt (2004b). _Statistical Analysis and Data Display: An Intermediate Course with Examples in S-Plus, R, and SAS_.




{% endhighlight %}
</li>
	<li id="export-BrownForsythTest"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport('BrownForsythTest.tpl', data=ius2008, resp='age', group='gender')
rapport('BrownForsythTest.tpl', data=ius2008, resp='edu', group='gender')
rapport('BrownForsythTest.tpl', data=ius2008, resp='edu', group='net.required')

{% endhighlight %}
<h6>Popular formats:</h6>
<ul>
	<li><a href="demo/BrownForsythTest.html" target="_blank">HTML</a></li>
	<li><a href="demo/BrownForsythTest.pdf" target="_blank">pdf</a></li>
	<li><a href="demo/BrownForsythTest.docx">docx (MS Word 2007 format)</a></li>
	<li><a href="demo/BrownForsythTest.odt">odt (MS Word compatible)</a></li>
	<li><a href="demo/BrownForsythTest.rtf">rtf (MS Word compatible)</a></li>
	<li><a href="demo/BrownForsythTest.epub">epub</a></li>
</ul>
<h6>Other morkdown formats</h6>
<ul>
	<li><a href="demo/BrownForsythTest.textile" target="_blank">textile</a></li>
	<li><a href="demo/BrownForsythTest.docbook" target="_blank">docbook</a></li>
	<li><a href="demo/BrownForsythTest.man" target="_blank">man</a></li>
	<li><a href="demo/BrownForsythTest.md" target="_blank">markdown</a></li>
	<li><a href="demo/BrownForsythTest.mediawiki" target="_blank">mediawiki</a></li>
	<li><a href="demo/BrownForsythTest.wiki" target="_blank">wiki</a></li>
	<li><a href="demo/BrownForsythTest.org" target="_blank">org</a></li>
	<li><a href="demo/BrownForsythTest.pandoc" target="_blank">pandoc</a></li>
</ul>
</div></li>
	<li id="source-BrownForsythTest"><div>
<h5>Source of `BrownForsythTest.tpl`</h5>
{% highlight text %}

<!--head
meta:
  title: Brown-Forsyth test
  author: Gergely Daróczi, Daniel Nagy
  description: This template will run a Brown-Forsyth test to check the equality of variances among groups.
  email: ~
  packages:
  - HH
  example:
  - rapport('BrownForsythTest.tpl', data=ius2008, resp='age', group='gender')
  - rapport('BrownForsythTest.tpl', data=ius2008, resp='edu', group='gender')
  - rapport('BrownForsythTest.tpl', data=ius2008, resp='edu', group='net.required')
inputs:
- name: resp
  label: Response Variable
  description: This is the depend variables which will be used here
  class: numeric
  length:
    min: 1.0
    max: 1.0
  required: yes
  standalone: no
- name: group
  label: Grouping Variable
  description: This is the grouping variable which will be used here
  class: factor
  length:
    min: 1.0
    max: 1.0
  required: yes
  standalone: no
head-->

# Introduction

The Brown-Forsyth test is used for checking the equality of the variances among the groups of one variable, in other words it tests the homogeneity of the variances. Equality of group variances is an assumption of the one-way ANOVA test.

The base of the test is really similar to the Levene's test, but the Brown-Forsyth test uses the deviations from the group medians instead of the mean (what the Levene's does), thus the Brown-Forsyth test is called more robust.

This test has the advantage over the other tests, which are also being used to check the homogeneity (F-test and Bartlett's test), that it does not have a normality assumption, so the variable we investigate do not have to follow a normal distribution.

## References

  * Brown, M.~B. and Forsyth, A.~B. (1974). Robust tests for equality of variances. _Journal of the American Statistical Association_, 69:364-367.

# Result

<%=
df     <- na.omit(data.frame(resp = as.numeric(resp), group = as.factor(group)))
BFtest <- function(x) hov(resp ~ group, data = df)
h      <- htest(resp, BFtest)
h
p <- .05
%>

According to the _Brown-Forsyth test_, the variances of the _<%= resp.label %>_ across the groups of _<%= group.label %>_ <%= ifelse(h[1, 3] < p, "significantly differs", "does not differs significantly") %>.

We can conclude that, because <%= ifelse(h[1, 3] < p,"the p-value is smaller than 0.05","the p-value is higher than 0.05")%>

## References

  * Heiberger, Richard M. and Holland, Burt (2004b). _Statistical Analysis and Data Display: An Intermediate Course with Examples in S-Plus, R, and SAS_.



{% endhighlight %}
</div></li>
</ul>

<a id="Correlation"> </a>
#### Correlation.tpl

 <ul class="tabs">
	<li><a class="active" href="#info-Correlation">Description</a></li>
	<li><a href="#inputs-Correlation">Inputs</a></li>
	<li><a href="#example-Correlation">Example</a></li>
	<li><a href="#export-Correlation">Export</a></li>
	<li><a href="#source-Correlation">Source</a></li>
</ul>

 <ul class="tabs-content">
	<li class="active" id="info-Correlation"><div><h5>Correlations</h5> by <em>Daróczi Gergely, Nagy Dániel</em>
<br><br>
 This template will return the correlation matrix of supplied numerical variables.
<br><br>
<em>Required packages:</em> 
<br>
<em>Example:</em> 
{% highlight text %}
rapport('Correlation', data=ius2008, vars=c('age', 'edu'))
rapport('Correlation', data=ius2008, vars=c('age', 'edu', 'leisure'))
rapport('Correlation', data=mtcars, vars=c('mpg', 'cyl', 'disp', 'hp', 'drat', 'wt', 'qsec', 'vs', 'am', 'gear', 'carb'))
{% endhighlight %}
</div></li>
	<li id="inputs-Correlation"><div><h5>Input parameters</h5><em>Correlation.tpl</em> template has the following options to be (optionally) set while calling <em>rapport</em>:<ul>
	
 Inputs
 
 "vars" (Variable)  *required
 Numerical variables
   - class:		numeric
   - standalone:	no
   - length:		from 2 to 50 vectors
 </ul></div></li>
	<li id="example-Correlation">
{% highlight text %}


##############################################################################
##	 Running: rapport('Correlation', data=ius2008, vars=c('age', 'edu'))
##############################################################################

# Introduction


[Correlation](http://en.wikipedia.org/wiki/Correlation_and_dependence) is one of the most commonly used statistical tool. With the help of that we can get information about a possible [linear relation](http://en.wikipedia.org/wiki/Linear_independence) between two variables. According to the definition of the correlation, one can call it also as the standardized [covariance](http://en.wikipedia.org/wiki/Covariance).

The maximum possible value of the correlation (the so-called [correlation coefficient](http://en.wikipedia.org/wiki/Correlation_coefficient)) could be 1, the minimum could be -1. In the first case there is a perfect positive (thus in the second case there is a perfect negative) linear relationship between the two variables, though perfect relationships, especially in the social sciences, are quite rare. If two variables are independent from each other, the correlation between them is 0, but 0 correlation coefficient only means certainly a [linear independency](http://en.wikipedia.org/wiki/Correlation_and_dependence#Correlation_and_linearity).

Because extreme values occur seldom we have rule of thumbs for the coefficients, like other fields of statistics:

  * we call two variables highly correlated if the absolute value of the correlation coefficient between them is higher than 0.7 and
  * we call them uncorrelated if that is smaller than 0.2.

Please note that [correlation has nothing to do with causal models](http://en.wikipedia.org/wiki/Correlation_does_not_imply_causation), it only shows association but not effects.


# Variable description

_709_ variables with _2_ cases provided.







There are no highly correlated (r < -0.7 or r > 0.7) variables.




There are no uncorrelated correlated (r < -0.2 or r > 0.2) variables.



# Correlation matrix


-----------------------------------
   &nbsp;     age          edu     
--------- ------------ ------------
  **age**              0.2185 * * *

  **edu** 0.2185 * * *             
-----------------------------------

Table: Correlation matrix



Where the stars represent the [significance levels](http://en.wikipedia.org/wiki/Statistical_significance) of the bivariate correlation coefficients: one star for a [p value](http://en.wikipedia.org/wiki/P-value) below `0.05`, two for below `0.01` and three for below `0.001`.

On the plot one can see the correlation in two forms: below the [diagonal](http://en.wikipedia.org/wiki/Main_diagonal) visually, above that one can find the coefficient(s).

[![Scatterplot matrix](plots/Correlation-1.png)](plots/Correlation-1-hires.png)


#########################################################################################
##	 Running: rapport('Correlation', data=ius2008, vars=c('age', 'edu', 'leisure'))
#########################################################################################

# Introduction


[Correlation](http://en.wikipedia.org/wiki/Correlation_and_dependence) is one of the most commonly used statistical tool. With the help of that we can get information about a possible [linear relation](http://en.wikipedia.org/wiki/Linear_independence) between two variables. According to the definition of the correlation, one can call it also as the standardized [covariance](http://en.wikipedia.org/wiki/Covariance).

The maximum possible value of the correlation (the so-called [correlation coefficient](http://en.wikipedia.org/wiki/Correlation_coefficient)) could be 1, the minimum could be -1. In the first case there is a perfect positive (thus in the second case there is a perfect negative) linear relationship between the two variables, though perfect relationships, especially in the social sciences, are quite rare. If two variables are independent from each other, the correlation between them is 0, but 0 correlation coefficient only means certainly a [linear independency](http://en.wikipedia.org/wiki/Correlation_and_dependence#Correlation_and_linearity).

Because extreme values occur seldom we have rule of thumbs for the coefficients, like other fields of statistics:

  * we call two variables highly correlated if the absolute value of the correlation coefficient between them is higher than 0.7 and
  * we call them uncorrelated if that is smaller than 0.2.

Please note that [correlation has nothing to do with causal models](http://en.wikipedia.org/wiki/Correlation_does_not_imply_causation), it only shows association but not effects.


# Variable description

_709_ variables with _3_ cases provided.




The highest correlation coefficient (_0.2273_) is between _edu_ and _age_ and the lowest (_-0.03377_) is between _leisure_ and _age_. It seems that the strongest association (r=_0.2273_) is between _edu_ and _age_.




There are no highly correlated (r < -0.7 or r > 0.7) variables.




Uncorrelated (-0.2 < r < 0.2) variables:



  * _leisure_ and _age_ (-0.03)
  * _leisure_ and _edu_ (0.17)

<!-- end of list -->


# Correlation matrix


----------------------------------------------------
       &nbsp;     age          edu        leisure   
------------- ------------ ------------ ------------
      **age**              0.2273 * * *   -0.0338   

      **edu** 0.2273 * * *              0.1732 * * *

  **leisure**   -0.0338    0.1732 * * *             
----------------------------------------------------

Table: Correlation matrix



Where the stars represent the [significance levels](http://en.wikipedia.org/wiki/Statistical_significance) of the bivariate correlation coefficients: one star for a [p value](http://en.wikipedia.org/wiki/P-value) below `0.05`, two for below `0.01` and three for below `0.001`.

On the plot one can see the correlation in two forms: below the [diagonal](http://en.wikipedia.org/wiki/Main_diagonal) visually, above that one can find the coefficient(s).

[![Scatterplot matrix](plots/Correlation-2.png)](plots/Correlation-2-hires.png)


#############################################################################################################################################
##	 Running: rapport('Correlation', data=mtcars, vars=c('mpg', 'cyl', 'disp', 'hp', 'drat', 'wt', 'qsec', 'vs', 'am', 'gear', 'carb'))
#############################################################################################################################################

# Introduction


[Correlation](http://en.wikipedia.org/wiki/Correlation_and_dependence) is one of the most commonly used statistical tool. With the help of that we can get information about a possible [linear relation](http://en.wikipedia.org/wiki/Linear_independence) between two variables. According to the definition of the correlation, one can call it also as the standardized [covariance](http://en.wikipedia.org/wiki/Covariance).

The maximum possible value of the correlation (the so-called [correlation coefficient](http://en.wikipedia.org/wiki/Correlation_coefficient)) could be 1, the minimum could be -1. In the first case there is a perfect positive (thus in the second case there is a perfect negative) linear relationship between the two variables, though perfect relationships, especially in the social sciences, are quite rare. If two variables are independent from each other, the correlation between them is 0, but 0 correlation coefficient only means certainly a [linear independency](http://en.wikipedia.org/wiki/Correlation_and_dependence#Correlation_and_linearity).

Because extreme values occur seldom we have rule of thumbs for the coefficients, like other fields of statistics:

  * we call two variables highly correlated if the absolute value of the correlation coefficient between them is higher than 0.7 and
  * we call them uncorrelated if that is smaller than 0.2.

Please note that [correlation has nothing to do with causal models](http://en.wikipedia.org/wiki/Correlation_does_not_imply_causation), it only shows association but not effects.


# Variable description

_32_ variables with _11_ cases provided.




The highest correlation coefficient (_0.902_) is between _disp_ and _cyl_ and the lowest (_-0.8677_) is between _wt_ and _mpg_. It seems that the strongest association (r=_0.902_) is between _disp_ and _cyl_.




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


# Correlation matrix


----------------------------------------------------
    &nbsp;      mpg           cyl          disp     
---------- ------------- ------------- -------------
   **mpg**               -0.8522 * * * -0.8476 * * *

   **cyl** -0.8522 * * *               0.9020 * * * 

  **disp** -0.8476 * * * 0.9020 * * *               

    **hp** -0.7762 * * * 0.8324 * * *  0.7909 * * * 

  **drat** 0.6812 * * *  -0.6999 * * * -0.7102 * * *

    **wt** -0.8677 * * * 0.7825 * * *  0.8880 * * * 

  **qsec**   0.4187 *    -0.5912 * * *   -0.4337 *  

    **vs** 0.6640 * * *  -0.8108 * * * -0.7104 * * *

    **am** 0.5998 * * *   -0.5226 * *  -0.5912 * * *

  **gear**  0.4803 * *    -0.4927 * *  -0.5556 * * *

  **carb**  -0.5509 * *   0.5270 * *     0.3950 *   
----------------------------------------------------

Table: Correlation matrix (continued below)

 
----------------------------------------------------
    &nbsp;      hp           drat           wt      
---------- ------------- ------------- -------------
   **mpg** -0.7762 * * * 0.6812 * * *  -0.8677 * * *

   **cyl** 0.8324 * * *  -0.6999 * * * 0.7825 * * * 

  **disp** 0.7909 * * *  -0.7102 * * * 0.8880 * * * 

    **hp**                -0.4488 * *  0.6587 * * * 

  **drat**  -0.4488 * *                -0.7124 * * *

    **wt** 0.6587 * * *  -0.7124 * * *              

  **qsec** -0.7082 * * *    0.0912        -0.1747   

    **vs** -0.7231 * * *   0.4403 *    -0.5549 * * *

    **am**    -0.2432    0.7127 * * *  -0.6925 * * *

  **gear**    -0.1257    0.6996 * * *  -0.5833 * * *

  **carb** 0.7498 * * *     -0.0908      0.4276 *   
----------------------------------------------------

Table: Table continues below

 
----------------------------------------------------
    &nbsp;     qsec           vs            am      
---------- ------------- ------------- -------------
   **mpg**   0.4187 *    0.6640 * * *  0.5998 * * * 

   **cyl** -0.5912 * * * -0.8108 * * *  -0.5226 * * 

  **disp**   -0.4337 *   -0.7104 * * * -0.5912 * * *

    **hp** -0.7082 * * * -0.7231 * * *    -0.2432   

  **drat**    0.0912       0.4403 *    0.7127 * * * 

    **wt**    -0.1747    -0.5549 * * * -0.6925 * * *

  **qsec**               0.7445 * * *     -0.2299   

    **vs** 0.7445 * * *                   0.1683    

    **am**    -0.2299       0.1683                  

  **gear**    -0.2127       0.2060     0.7941 * * * 

  **carb** -0.6562 * * * -0.5696 * * *    0.0575    
----------------------------------------------------

Table: Table continues below

 
--------------------------------------
    &nbsp;     gear          carb     
---------- ------------- -------------
   **mpg**  0.4803 * *    -0.5509 * * 

   **cyl**  -0.4927 * *   0.5270 * *  

  **disp** -0.5556 * * *   0.3950 *   

    **hp**    -0.1257    0.7498 * * * 

  **drat** 0.6996 * * *     -0.0908   

    **wt** -0.5833 * * *   0.4276 *   

  **qsec**    -0.2127    -0.6562 * * *

    **vs**    0.2060     -0.5696 * * *

    **am** 0.7941 * * *     0.0575    

  **gear**                  0.2741    

  **carb**    0.2741                  
--------------------------------------



Where the stars represent the [significance levels](http://en.wikipedia.org/wiki/Statistical_significance) of the bivariate correlation coefficients: one star for a [p value](http://en.wikipedia.org/wiki/P-value) below `0.05`, two for below `0.01` and three for below `0.001`.

On the plot one can see the correlation in two forms: below the [diagonal](http://en.wikipedia.org/wiki/Main_diagonal) visually, above that one can find the coefficient(s).

[![Scatterplot matrix](plots/Correlation-3.png)](plots/Correlation-3-hires.png)


{% endhighlight %}
</li>
	<li id="export-Correlation"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport('Correlation', data=ius2008, vars=c('age', 'edu'))
rapport('Correlation', data=ius2008, vars=c('age', 'edu', 'leisure'))
rapport('Correlation', data=mtcars, vars=c('mpg', 'cyl', 'disp', 'hp', 'drat', 'wt', 'qsec', 'vs', 'am', 'gear', 'carb'))

{% endhighlight %}
<h6>Popular formats:</h6>
<ul>
	<li><a href="demo/Correlation.html" target="_blank">HTML</a></li>
	<li><a href="demo/Correlation.pdf" target="_blank">pdf</a></li>
	<li><a href="demo/Correlation.docx">docx (MS Word 2007 format)</a></li>
	<li><a href="demo/Correlation.odt">odt (MS Word compatible)</a></li>
	<li><a href="demo/Correlation.rtf">rtf (MS Word compatible)</a></li>
	<li><a href="demo/Correlation.epub">epub</a></li>
</ul>
<h6>Other morkdown formats</h6>
<ul>
	<li><a href="demo/Correlation.textile" target="_blank">textile</a></li>
	<li><a href="demo/Correlation.docbook" target="_blank">docbook</a></li>
	<li><a href="demo/Correlation.man" target="_blank">man</a></li>
	<li><a href="demo/Correlation.md" target="_blank">markdown</a></li>
	<li><a href="demo/Correlation.mediawiki" target="_blank">mediawiki</a></li>
	<li><a href="demo/Correlation.wiki" target="_blank">wiki</a></li>
	<li><a href="demo/Correlation.org" target="_blank">org</a></li>
	<li><a href="demo/Correlation.pandoc" target="_blank">pandoc</a></li>
</ul>
</div></li>
	<li id="source-Correlation"><div>
<h5>Source of `Correlation.tpl`</h5>
{% highlight text %}

<!--head
meta:
  title: Correlations
  author: Daróczi Gergely, Nagy Dániel
  description: This template will return the correlation matrix of supplied numerical variables.
  email: gergely@snowl.net
  packages: ~
  example:
  - rapport('Correlation', data=ius2008, vars=c('age', 'edu'))
  - rapport('Correlation', data=ius2008, vars=c('age', 'edu', 'leisure'))
  - rapport('Correlation', data=mtcars, vars=c('mpg', 'cyl', 'disp', 'hp', 'drat', 'wt', 'qsec', 'vs', 'am', 'gear', 'carb'))
inputs:
- name: vars
  label: Variable
  description: Numerical variables
  class: numeric
  length:
    min: 2.0
    max: 50.0
  value: ~
  required: yes
  standalone: no
head-->

# Introduction

[Correlation](http://en.wikipedia.org/wiki/Correlation_and_dependence) is one of the most commonly used statistical tool. With the help of that we can get information about a possible [linear relation](http://en.wikipedia.org/wiki/Linear_independence) between two variables. According to the definition of the correlation, one can call it also as the standardized [covariance](http://en.wikipedia.org/wiki/Covariance).

The maximum possible value of the correlation (the so-called [correlation coefficient](http://en.wikipedia.org/wiki/Correlation_coefficient)) could be 1, the minimum could be -1. In the first case there is a perfect positive (thus in the second case there is a perfect negative) linear relationship between the two variables, though perfect relationships, especially in the social sciences, are quite rare. If two variables are independent from each other, the correlation between them is 0, but 0 correlation coefficient only means certainly a [linear independency](http://en.wikipedia.org/wiki/Correlation_and_dependence#Correlation_and_linearity).

Because extreme values occur seldom we have rule of thumbs for the coefficients, like other fields of statistics:

  * we call two variables highly correlated if the absolute value of the correlation coefficient between them is higher than 0.7 and
  * we call them uncorrelated if that is smaller than 0.2.

Please note that [correlation has nothing to do with causal models](http://en.wikipedia.org/wiki/Correlation_does_not_imply_causation), it only shows association but not effects.

# Variable description

<%=dim(vars)[1]%> variables with <%=dim(vars)[2]%> cases provided.

<%=
cm <- cor(vars, use = 'complete.obs')
diag(cm) <- NA
%>

<% if (length(vars) > 2) { %>
The highest correlation coefficient (<%=max(cm, na.rm = T)%>) is between <%=row.names(which(cm == max(cm, na.rm = T), arr.ind = T))[1:2]%> and the lowest (<%=min(cm, na.rm = T)%>) is between <%=row.names(which(cm == min(cm, na.rm = T), arr.ind = T))[1:2]%>. It seems that the strongest association (r=<%=cm[which(abs(cm) == max(abs(cm), na.rm = T), arr.ind = T)][1]%>) is between <%=row.names(which(abs(cm) == max(abs(cm), na.rm = T), arr.ind = T))[1:2]%>.
<% } %>

<%
cm[upper.tri(cm)] <- NA
h <- which((cm > 0.7) | (cm < -0.7), arr.ind = T)
if (nrow(h) > 0) {
%>

Highly correlated (r < -0.7 or r > 0.7) variables:

<%=paste(pander.return(lapply(1:nrow(h), function(i) paste0(p(c(rownames(cm)[h[i, 1]], colnames(cm)[h[i, 2]])), ' (', round(cm[h[i, 1], h[i, 2]], 2), ')'))), collapse = '\n')%>

<%} else {%>

There are no highly correlated (r < -0.7 or r > 0.7) variables.
<%}%>

<%
h <- which((cm < 0.2)&(cm > -0.2), arr.ind = T)
if (nrow(h) > 0) {
%>

Uncorrelated (-0.2 < r < 0.2) variables:

<%=
if (nrow(h) > 0) {
    paste(pander.return(lapply(1:nrow(h), function(i) paste0(p(c(rownames(cm)[h[i, 1]], colnames(cm)[h[i, 2]])), ' (', round(cm[h[i, 1], h[i, 2]], 2), ')'))), collapse = '\n')
}
%>

<%} else {%>

There are no uncorrelated correlated (r < -0.2 or r > 0.2) variables.
<%}%>

# Correlation matrix

<%=
set.caption('Correlation matrix')
cm <- format(round(cor(vars, use = 'complete.obs'), 4), decimal.mark = panderOptions('decimal.mark'))
d <- attributes(cm)
for (row in attr(cm, 'dimnames')[[1]])
    for (col in attr(cm, 'dimnames')[[2]]) {
        test.p <- cor.test(vars[, row], vars[, col])$p.value
        cm[row, col] <- paste(cm[row, col], ' ', ifelse(test.p > 0.05, '', ifelse(test.p > 0.01, ' *', ifelse(test.p > 0.001, ' * *', ' * * *'))), sep='')
    }
diag(cm) <- ''
set.alignment('centre', 'right')
as.data.frame(cm)
%>

Where the stars represent the [significance levels](http://en.wikipedia.org/wiki/Statistical_significance) of the bivariate correlation coefficients: one star for a [p value](http://en.wikipedia.org/wiki/P-value) below `0.05`, two for below `0.01` and three for below `0.001`.

On the plot one can see the correlation in two forms: below the [diagonal](http://en.wikipedia.org/wiki/Main_diagonal) visually, above that one can find the coefficient(s).

<%=
labels <- lapply(vars, rp.name)
quick.plot <- FALSE
if (nrow(vars) > 1000) {
    quick.plot <- TRUE
    vars <- vars[sample(1:nrow(vars), size = 1000), ]
}

## custom panels
panel.cor <- function(x, y, digits = 2, prefix = "", cex.cor, ...) {

    ## forked from ?pairs
    par(usr = c(0, 1, 0, 1))
    r   <- cor(x, y, use = 'complete.obs')
    txt <- format(c(r, 0.123456789), digits = digits, decimal.mark = panderOptions('decimal.mark'))[1]
    txt <- paste(prefix, txt, sep = "")
    if(missing(cex.cor)) { cex <- 0.8/strwidth(txt) }
    test <- cor.test(x, y)
    Signif <- symnum(test$p.value, corr = FALSE, na = FALSE,
        cutpoints = c(0, 0.001, 0.01, 0.05, 0.1, 1),
        symbols = c("***", "**", "*", ".", " "))
    text(0.5, 0.5, txt, cex = cex * abs(r) * 1.5)
    text(.8, .8, Signif, cex = cex, col = 2)
}

## plot
set.caption(sprintf('Scatterplot matrix%s', ifelse(quick.plot, ' (based on a sample size of 1000)', '')))
pairs(vars, lower.panel = 'panel.smooth', upper.panel = 'panel.cor', labels = labels)
%>

{% endhighlight %}
</div></li>
</ul>

<a id="Crosstable"> </a>
#### Crosstable.tpl

 <ul class="tabs">
	<li><a class="active" href="#info-Crosstable">Description</a></li>
	<li><a href="#inputs-Crosstable">Inputs</a></li>
	<li><a href="#example-Crosstable">Example</a></li>
	<li><a href="#export-Crosstable">Export</a></li>
	<li><a href="#source-Crosstable">Source</a></li>
</ul>

 <ul class="tabs-content">
	<li class="active" id="info-Crosstable"><div><h5>Crosstable</h5> by <em>Gergely Daróczi, Daniel Nagy</em>
<br><br>
 Returning the Chi-squared test of two given variables with count, percentages and Pearson's residuals table.
<br><br>
<em>Required packages:</em> descr
<br>
<em>Example:</em> 
{% highlight text %}
rapport('Crosstable', data=ius2008, row='gender', col='dwell')
rapport('Crosstable', data=ius2008, row='email', col='dwell')
{% endhighlight %}
</div></li>
	<li id="inputs-Crosstable"><div><h5>Input parameters</h5><em>Crosstable.tpl</em> template has the following options to be (optionally) set while calling <em>rapport</em>:<ul>
	
 Inputs
 
 "row" (Row variable)  *required
 A categorical variable.
   - class:		factor
   - standalone:	no
   - length:		exactly 1 vector
 
 "col" (Column variable)  *required
 A categorical variable.
   - class:		factor
   - standalone:	no
   - length:		exactly 1 vector
 </ul></div></li>
	<li id="example-Crosstable">
{% highlight text %}


##################################################################################
##	 Running: rapport('Crosstable', data=ius2008, row='gender', col='dwell')
##################################################################################

# Variable description


Two variables specified:

 * "gender" ("Gender") with _673_ valid values and
 * "dwell" ("Dwelling") with _662_ valid values.


## Introduction


[Crosstables](http://en.wikipedia.org/wiki/Cross_tabulation) are applicable to show the frequencies of categorical variables in a matrix form, with a table view.

We will present four types of these crosstables. The first of them shows the *exact numbers of the observations*, ergo the number of the observations each of the variables' categories commonly have.

The second also shows the possessions each of these cells have, but not the exact numbers of the observations, rather the *percentages* of them from the total data.

The last two type of the crosstabs contain the so-called *row and column percentages* which demonstrate us the distribution of the frequencies if we concentrate only on one variable.

After that we present the *tests* with which we can investigate the possible relationships, associations between the variables, like Chi-squared test, Fisher Exact Test, Goodman and Kruskal's lambda.

In the last part there are some *charts* presented, with that one can visually observe the distribution of the frequencies.


# Counts


-----------------------------------------------------------
       &nbsp;  city   small town   village   Missing   Sum 
------------- ------ ------------ --------- --------- -----
     **male**  338        28         19        25      410 

   **female**  234        3           9        17      263 

  **Missing**   27        2           2         5      36  

      **Sum**  599        33         30        47      709 
-----------------------------------------------------------

Table: Counted values: "gender" and "dwell"



Most of the cases (_338_) can be found in "male-city" categories. Row-wise "male" holds the highest number of cases (_410_) while column-wise "city" has the utmost cases (_599_).


# Percentages


-----------------------------------------------------------
       &nbsp;  city   small town   village   Missing   Sum 
------------- ------ ------------ --------- --------- -----
     **male** 47.67      3.95       2.68      3.53    57.83

   **female**   33       0.42       1.27       2.4    37.09

  **Missing**  3.81      0.28       0.28      0.71    5.08 

      **Sum** 84.49      4.65       4.23      6.63     100 
-----------------------------------------------------------

Table: Total percentages: "gender" and "dwell"


-----------------------------------------------------
       &nbsp;  city   small town   village   Missing 
------------- ------ ------------ --------- ---------
     **male** 82.44      6.83       4.63       6.1   

   **female** 88.97      1.14       3.42      6.46   

  **Missing**   75       5.56       5.56      13.89  

      **Sum** 84.49      4.65       4.23      6.63   
-----------------------------------------------------

Table: Row percentages: "gender" and "dwell"


-----------------------------------------------------------
       &nbsp;  city   small town   village   Missing   Sum 
------------- ------ ------------ --------- --------- -----
     **male** 56.43     84.85       63.33     53.19   57.83

   **female** 39.07      9.09        30       36.17   37.09

  **Missing**  4.51      6.06       6.67      10.64   5.08 
-----------------------------------------------------------

Table: Column percentages: "gender" and "dwell"


# Tests of Independence


In the below tests for [independece](http://en.wikipedia.org/wiki/Independence_(probability_theory)) we assume that the row and column variables are independent of each other. If this [null hypothesis](http://en.wikipedia.org/wiki/Null_hypothesis) would be rejected by the tests, then we can say that the assumption must have been wrong, so there is a good chance that the variables are associated.


## Chi-squared test


One of the most widespread independence test is the [Chi-squared test](http://en.wikipedia.org/wiki/Pearson%27s_chi-squared_test). While using that we have the alternative hypothesis, that two variables have an association between each other, in opposite of the null hypothesis that the variables are independent.

We use the cell frequencies from the crosstables to calculate the test statistic for that. The test statistic is based on the difference between this distribution  and a theoretical distribution where the variables are independent of each other. The distribution of this test statistic follows a [Chi-square distribution](http://en.wikipedia.org/wiki/Chi-squared_distribution).

The test was invented by Karl Pearson in 1900. It should be noted that the Chi-squared test has the disadvantage that it is sensitive to the sample size.


### Criteria


Before analyzing the result of the Chi-squared test, we have to check if our data meets some requirements. There are two widely used criteria which have to take into consideration, both of them are related to the so-called expected counts. These expected counts are calculated from the marginal distributions and show how the crosstabs would look like if there were complete independency between the variables. The Chi-squared test calculates how different are the observed cells from the expected ones.

The two criteria are:

  - none of the expected cells could be lower than 1
  - 80% of the expected cells have to be at least 5


Let's look at on expected values then:

------------------------------------------
   &nbsp;     city   small town   village 
------------ ------ ------------ ---------
  **male**    349      18.91       17.08  

 **female**   223      12.09       10.92  
------------------------------------------

We can see that the Chi-squared test met the requirements.


So now check the result of the test:


------------------------------------
 Test statistic   df     P value    
---------------- ---- --------------
     12.64        2   _0.001804_ * *
------------------------------------

Table: Pearson's Chi-squared test: `table`



To decide if the null or the alternative hypothesis could be accepted we need to calculate the number of degrees of freedom. The degrees of freedom is easy to calculate, we substract one from the number of the categories of both the row and the coloumn variables and multiply them with each other.

To each degrees of freedom there is denoted a [critical value](http://en.wikipedia.org/wiki/Critical_value#Statistics). The result of the Chi-square test have to be lower than that value to be able to accept the nullhypothesis.






It seems that a real association can be pointed out between *gender* and *dwell* by the *Pearson's Chi-squared test* ($\chi$=_12.64_) at the [degree of freedom](http://en.wikipedia.org/wiki/Degrees_of_freedom_(statistics)) being _2_ at the [significance level](http://en.wikipedia.org/wiki/Statistical_significance) of _0.001804_ * *.

The association between the two variables seems to be weak based on [Cramer's V](http://en.wikipedia.org/wiki/Cram%C3%A9r%27s_V) (_0.1001_).




### References


  * Fisher, R. A. (1922): On the interpretation of chi-square from contingency tables, and the calculation of P. _Journal of the Royal Statistical Society_ 85 (1): 87-94.
  * Fisher, R.A. (1954): _Statistical Methods for Research Workers_. Oliver and Boyd.


### Adjusted standardized residuals


The residuals show the contribution to reject the null hypothesis at a cell level. An extremely high or low value indicates that the given cell had a major effect on the resulting chi-square, so thus helps understanding the association in the crosstable.


------------------------------------------
      &nbsp;  city   small town   village 
------------ ------ ------------ ---------
    **male** -3.08      3.43       0.76   

  **female**  3.08     -3.43       -0.76  
------------------------------------------

Table: Residuals: "gender" and "dwell"

Based on Pearson's residuals the following cells seems interesting (with values higher than `2` or lower than `-2`):

 * "male - city"
 * "female - city"
 * "male - small town"
 * "female - small town"

### References


  * Snedecor, George W. and Cochran, William G. (1989): _Statistical Methods_. Iowa State University Press.
  * Karl Pearson (1900): _Philosophical Magazine_, Series 5 50 (302): 157-175.


## Fisher Exact Test


An other test to check the possible association/independence between two variables, is the [Fisher exact test](http://en.wikipedia.org/wiki/Fisher%27_exact_test). This test is especially useful with small samples, but could be used with bigger datasets as well.

We have the advantage while using the Fisher's over the Chi-square test, that we could get an exact significance value not just a level of it, thus we can have an impression about the power of the test and the association.

The test was invented by, thus named after R.A. Fisher.





The variables seems to be dependent based on Fisher's exact test at the [significance level](http://en.wikipedia.org/wiki/P-value) of _0.0008061_ * * *.






# Direction of relationship


## Goodman and Kruskal's lambda


With the help of the [Goodman and Kruskal's lambda](http://en.wikipedia.org/wiki/Goodman_and_Kruskal%27s_lambda) we can look for not only relationship on its own, which have directions if we set one variable as a predictor and the other as a criterion variable.



The computed value for [Goodman and Kruskal's lambda](http://en.wikipedia.org/wiki/Goodman_and_Kruskal%27s_lambda) is the same for both directions: _0_. For this end, we do not know the direction of the relationship.




# Charts


If one would like to investigate the relationships rather visually than in a crosstable form, there are several possibilities to do that.


#### Heat map


At first we can have a look at on the so-called [heat map](http://en.wikipedia.org/wiki/Heat_map). This kind of chart uses the same amount of cells and a similar form as the crosstable does, but instead of the numbers there are colours to show which cell contains the most counts (or likewise the highest total percentages).

The darker colour is one cell painted, the most counts/the higher total percentage it has.

[![Heatmap](plots/Crosstable-1.png)](plots/Crosstable-1-hires.png)


There can be also shown the standardized adjusted residual of each cells:

[![Heatmap of residuals](plots/Crosstable-2.png)](plots/Crosstable-2-hires.png)

#### Mosaic chart


In front of the heat map, on the *mosaic charts*, not only the colours are important. The size of the cells shows the amount of the counts one cell has.

The width on the axis of gender determinate one side and the height on the axis of the dwell gives the final shape of the box. The box which demonstrates a cell from the hypothetic crosstable. We can see on the top of the chart which category from the dwell draw the boxes what kind of colour.

[![Mosaic chart](plots/Crosstable-3.png)](plots/Crosstable-3-hires.png)

#### Fluctuation diagram


At last but not least have a glance on the *fluctuation diagram*. Unlike the above two charts, here the colours does not have influence on the chart, but the sizes of the boxes, which obviously demonstrates here as well the cells of the crosstable.

The bigger are the boxes the higher are the numbers of the counts/the total percentages, which that boxes denote.


[![Fluctuation diagram](plots/Crosstable-4.png)](plots/Crosstable-4-hires.png)


#################################################################################
##	 Running: rapport('Crosstable', data=ius2008, row='email', col='dwell')
#################################################################################

# Variable description


Two variables specified:

 * "email" ("Email usage") with _672_ valid values and
 * "dwell" ("Dwelling") with _662_ valid values.


## Introduction


[Crosstables](http://en.wikipedia.org/wiki/Cross_tabulation) are applicable to show the frequencies of categorical variables in a matrix form, with a table view.

We will present four types of these crosstables. The first of them shows the *exact numbers of the observations*, ergo the number of the observations each of the variables' categories commonly have.

The second also shows the possessions each of these cells have, but not the exact numbers of the observations, rather the *percentages* of them from the total data.

The last two type of the crosstabs contain the so-called *row and column percentages* which demonstrate us the distribution of the frequencies if we concentrate only on one variable.

After that we present the *tests* with which we can investigate the possible relationships, associations between the variables, like Chi-squared test, Fisher Exact Test, Goodman and Kruskal's lambda.

In the last part there are some *charts* presented, with that one can visually observe the distribution of the frequencies.


# Counts


---------------------------------------------------------
           &nbsp;  city   small town   village   Missing 
----------------- ------ ------------ --------- ---------
        **never**   12        0           0         1    

  **very rarely**   30        1           3         2    

       **rarely**   41        3           1         1    

    **sometimes**   67        4           8         8    

        **often**  101        10          5         7    

   **very often**   88        5           5        10    

       **always**  226        9           7        17    

      **Missing**   34        1           1         1    

          **Sum**  599        33         30        47    
---------------------------------------------------------

Table: Counted values: "email" and "dwell" (continued below)

 
-----------------------
           &nbsp;  Sum 
----------------- -----
        **never**  13  

  **very rarely**  36  

       **rarely**  46  

    **sometimes**  87  

        **often**  123 

   **very often**  108 

       **always**  259 

      **Missing**  37  

          **Sum**  709 
-----------------------



Most of the cases (_226_) can be found in "always-city" categories. Row-wise "always" holds the highest number of cases (_259_) while column-wise "city" has the utmost cases (_599_).


# Percentages


---------------------------------------------------------
           &nbsp;  city   small town   village   Missing 
----------------- ------ ------------ --------- ---------
        **never**  1.69       0           0       0.14   

  **very rarely**  4.23      0.14       0.42      0.28   

       **rarely**  5.78      0.42       0.14      0.14   

    **sometimes**  9.45      0.56       1.13      1.13   

        **often** 14.25      1.41       0.71      0.99   

   **very often** 12.41      0.71       0.71      1.41   

       **always** 31.88      1.27       0.99       2.4   

      **Missing**  4.8       0.14       0.14      0.14   

          **Sum** 84.49      4.65       4.23      6.63   
---------------------------------------------------------

Table: Total percentages: "email" and "dwell" (continued below)

 
-----------------------
           &nbsp;  Sum 
----------------- -----
        **never** 1.83 

  **very rarely** 5.08 

       **rarely** 6.49 

    **sometimes** 12.27

        **often** 17.35

   **very often** 15.23

       **always** 36.53

      **Missing** 5.22 

          **Sum**  100 
-----------------------


---------------------------------------------------------
           &nbsp;  city   small town   village   Missing 
----------------- ------ ------------ --------- ---------
        **never** 92.31       0           0       7.69   

  **very rarely** 83.33      2.78       8.33      5.56   

       **rarely** 89.13      6.52       2.17      2.17   

    **sometimes** 77.01      4.6         9.2       9.2   

        **often** 82.11      8.13       4.07      5.69   

   **very often** 81.48      4.63       4.63      9.26   

       **always** 87.26      3.47        2.7      6.56   

      **Missing** 91.89      2.7         2.7       2.7   

          **Sum** 84.49      4.65       4.23      6.63   
---------------------------------------------------------

Table: Row percentages: "email" and "dwell"


---------------------------------------------------------
           &nbsp;  city   small town   village   Missing 
----------------- ------ ------------ --------- ---------
        **never**   2         0           0       2.13   

  **very rarely**  5.01      3.03        10       4.26   

       **rarely**  6.84      9.09       3.33      2.13   

    **sometimes** 11.19     12.12       26.67     17.02  

        **often** 16.86      30.3       16.67     14.89  

   **very often** 14.69     15.15       16.67     21.28  

       **always** 37.73     27.27       23.33     36.17  

      **Missing**  5.68      3.03       3.33      2.13   
---------------------------------------------------------

Table: Column percentages: "email" and "dwell" (continued below)

 
-----------------------
           &nbsp;  Sum 
----------------- -----
        **never** 1.83 

  **very rarely** 5.08 

       **rarely** 6.49 

    **sometimes** 12.27

        **often** 17.35

   **very often** 15.23

       **always** 36.53

      **Missing** 5.22 
-----------------------


# Tests of Independence


In the below tests for [independece](http://en.wikipedia.org/wiki/Independence_(probability_theory)) we assume that the row and column variables are independent of each other. If this [null hypothesis](http://en.wikipedia.org/wiki/Null_hypothesis) would be rejected by the tests, then we can say that the assumption must have been wrong, so there is a good chance that the variables are associated.


## Chi-squared test


One of the most widespread independence test is the [Chi-squared test](http://en.wikipedia.org/wiki/Pearson%27s_chi-squared_test). While using that we have the alternative hypothesis, that two variables have an association between each other, in opposite of the null hypothesis that the variables are independent.

We use the cell frequencies from the crosstables to calculate the test statistic for that. The test statistic is based on the difference between this distribution  and a theoretical distribution where the variables are independent of each other. The distribution of this test statistic follows a [Chi-square distribution](http://en.wikipedia.org/wiki/Chi-squared_distribution).

The test was invented by Karl Pearson in 1900. It should be noted that the Chi-squared test has the disadvantage that it is sensitive to the sample size.


### Criteria


Before analyzing the result of the Chi-squared test, we have to check if our data meets some requirements. There are two widely used criteria which have to take into consideration, both of them are related to the so-called expected counts. These expected counts are calculated from the marginal distributions and show how the crosstabs would look like if there were complete independency between the variables. The Chi-squared test calculates how different are the observed cells from the expected ones.

The two criteria are:

  - none of the expected cells could be lower than 1
  - 80% of the expected cells have to be at least 5


Let's look at on expected values then:

-----------------------------------------------
     &nbsp;        city   small town   village 
----------------- ------ ------------ ---------
    **never**     10.83     0.6134     0.5559  

 **very rarely**  30.69     1.738       1.575  

   **rarely**     40.62      2.3        2.085  

  **sometimes**    71.3     4.038       3.66   

    **often**     104.7      5.93       5.374  

 **very often**   88.45      5.01       4.54   

   **always**     218.4     12.37       11.21  
-----------------------------------------------

We can see that the Chi-squared test met the requirements.


So now check the result of the test:


-------------------------------
 Test statistic   df   P value 
---------------- ---- ---------
     14.86        12   _0.249_ 
-------------------------------

Table: Pearson's Chi-squared test: `table`



To decide if the null or the alternative hypothesis could be accepted we need to calculate the number of degrees of freedom. The degrees of freedom is easy to calculate, we substract one from the number of the categories of both the row and the coloumn variables and multiply them with each other.

To each degrees of freedom there is denoted a [critical value](http://en.wikipedia.org/wiki/Critical_value#Statistics). The result of the Chi-square test have to be lower than that value to be able to accept the nullhypothesis.


The requirements of the chi-squared test was not met, so [Yates's correction for continuity](http://en.wikipedia.org/wiki/Yates%27s_correction_for_continuity) applied. The approximation may be incorrect.





It seems that no real association can be pointed out between *email* and *dwell* by the *Pearson's Chi-squared test* ($\chi$=_14.86_ at the degree of freedom being _12_) at the significance level of _0.249_.




### References


  * Fisher, R. A. (1922): On the interpretation of chi-square from contingency tables, and the calculation of P. _Journal of the Royal Statistical Society_ 85 (1): 87-94.
  * Fisher, R.A. (1954): _Statistical Methods for Research Workers_. Oliver and Boyd.


### Adjusted standardized residuals


The residuals show the contribution to reject the null hypothesis at a cell level. An extremely high or low value indicates that the given cell had a major effect on the resulting chi-square, so thus helps understanding the association in the crosstable.


-----------------------------------------------
           &nbsp;  city   small town   village 
----------------- ------ ------------ ---------
        **never**  1.15     -0.81       -0.77  

  **very rarely** -0.41     -0.59        1.2   

       **rarely**  0.2       0.49       -0.8   

    **sometimes** -1.75     -0.02       2.49   

        **often** -1.28      1.9        -0.18  

   **very often** -0.17       0         0.24   

       **always**  2.1      -1.26       -1.64  
-----------------------------------------------

Table: Residuals: "email" and "dwell"

Based on Pearson's residuals the following cells seems interesting (with values higher than `2` or lower than `-2`):

 * "always - city"
 * "sometimes - village"

### References


  * Snedecor, George W. and Cochran, William G. (1989): _Statistical Methods_. Iowa State University Press.
  * Karl Pearson (1900): _Philosophical Magazine_, Series 5 50 (302): 157-175.


## Fisher Exact Test


An other test to check the possible association/independence between two variables, is the [Fisher exact test](http://en.wikipedia.org/wiki/Fisher%27_exact_test). This test is especially useful with small samples, but could be used with bigger datasets as well.

We have the advantage while using the Fisher's over the Chi-square test, that we could get an exact significance value not just a level of it, thus we can have an impression about the power of the test and the association.

The test was invented by, thus named after R.A. Fisher.





The test could not finish within resource limits.






# Charts


If one would like to investigate the relationships rather visually than in a crosstable form, there are several possibilities to do that.


#### Heat map


At first we can have a look at on the so-called [heat map](http://en.wikipedia.org/wiki/Heat_map). This kind of chart uses the same amount of cells and a similar form as the crosstable does, but instead of the numbers there are colours to show which cell contains the most counts (or likewise the highest total percentages).

The darker colour is one cell painted, the most counts/the higher total percentage it has.

[![Heatmap](plots/Crosstable-5.png)](plots/Crosstable-5-hires.png)


There can be also shown the standardized adjusted residual of each cells:

[![Heatmap of residuals](plots/Crosstable-6.png)](plots/Crosstable-6-hires.png)

#### Mosaic chart


In front of the heat map, on the *mosaic charts*, not only the colours are important. The size of the cells shows the amount of the counts one cell has.

The width on the axis of email determinate one side and the height on the axis of the dwell gives the final shape of the box. The box which demonstrates a cell from the hypothetic crosstable. We can see on the top of the chart which category from the dwell draw the boxes what kind of colour.

[![Mosaic chart](plots/Crosstable-7.png)](plots/Crosstable-7-hires.png)

#### Fluctuation diagram


At last but not least have a glance on the *fluctuation diagram*. Unlike the above two charts, here the colours does not have influence on the chart, but the sizes of the boxes, which obviously demonstrates here as well the cells of the crosstable.

The bigger are the boxes the higher are the numbers of the counts/the total percentages, which that boxes denote.


[![Fluctuation diagram](plots/Crosstable-8.png)](plots/Crosstable-8-hires.png)


{% endhighlight %}
</li>
	<li id="export-Crosstable"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport('Crosstable', data=ius2008, row='gender', col='dwell')
rapport('Crosstable', data=ius2008, row='email', col='dwell')

{% endhighlight %}
<h6>Popular formats:</h6>
<ul>
	<li><a href="demo/Crosstable.html" target="_blank">HTML</a></li>
	<li><a href="demo/Crosstable.pdf" target="_blank">pdf</a></li>
	<li><a href="demo/Crosstable.docx">docx (MS Word 2007 format)</a></li>
	<li><a href="demo/Crosstable.odt">odt (MS Word compatible)</a></li>
	<li><a href="demo/Crosstable.rtf">rtf (MS Word compatible)</a></li>
	<li><a href="demo/Crosstable.epub">epub</a></li>
</ul>
<h6>Other morkdown formats</h6>
<ul>
	<li><a href="demo/Crosstable.textile" target="_blank">textile</a></li>
	<li><a href="demo/Crosstable.docbook" target="_blank">docbook</a></li>
	<li><a href="demo/Crosstable.man" target="_blank">man</a></li>
	<li><a href="demo/Crosstable.md" target="_blank">markdown</a></li>
	<li><a href="demo/Crosstable.mediawiki" target="_blank">mediawiki</a></li>
	<li><a href="demo/Crosstable.wiki" target="_blank">wiki</a></li>
	<li><a href="demo/Crosstable.org" target="_blank">org</a></li>
	<li><a href="demo/Crosstable.pandoc" target="_blank">pandoc</a></li>
</ul>
</div></li>
	<li id="source-Crosstable"><div>
<h5>Source of `Crosstable.tpl`</h5>
{% highlight text %}

<!--head
meta:
  title: Crosstable
  author: Gergely Daróczi, Daniel Nagy
  description: Returning the Chi-squared test of two given variables with count, percentages and Pearson's residuals table.
  email: gergely@snowl.net
  packages: 
  - descr
  - ggplot2
  - reshape
  example:
  - rapport('Crosstable', data=ius2008, row='gender', col='dwell')
  - rapport('Crosstable', data=ius2008, row='email', col='dwell')
inputs:
- name: row
  label: Row variable
  description: A categorical variable.
  class: factor
  length:
    min: 1.0
    max: 1.0
  value: ~
  required: yes
  standalone: no
- name: col
  label: Column variable
  description: A categorical variable.
  class: factor
  length:
    min: 1.0
    max: 1.0
  value: ~
  required: yes
  standalone: no
head-->

# Variable description

Two variables specified:

 * "<%=rp.name(row)%>"<%=ifelse(rp.label(row)==rp.name(row), '', sprintf(' ("%s")', rp.label(row)))%> with <%=rp.valid(as.numeric(row))%> valid values and
 * "<%=rp.name(col)%>"<%=ifelse(rp.label(col)==rp.name(col), '', sprintf(' ("%s")', rp.label(col)))%> with <%=rp.valid(as.numeric(col))%> valid values.

## Introduction

[Crosstables](http://en.wikipedia.org/wiki/Cross_tabulation) are applicable to show the frequencies of categorical variables in a matrix form, with a table view.

We will present four types of these crosstables. The first of them shows the *exact numbers of the observations*, ergo the number of the observations each of the variables' categories commonly have.

The second also shows the possessions each of these cells have, but not the exact numbers of the observations, rather the *percentages* of them from the total data.

The last two type of the crosstabs contain the so-called *row and column percentages* which demonstrate us the distribution of the frequencies if we concentrate only on one variable.

After that we present the *tests* with which we can investigate the possible relationships, associations between the variables, like Chi-squared test, Fisher Exact Test, Goodman and Kruskal's lambda.

In the last part there are some *charts* presented, with that one can visually observe the distribution of the frequencies.

# Counts

<%=
table <- table(row, col, deparse.level = 0, useNA = 'ifany')
if (length(which(is.na(rownames(table)))) > 0) {
    rownames(table)[which(is.na(rownames(table)))] <- 'Missing' }
if (length(which(is.na(colnames(table)))) > 0) {
    colnames(table)[which(is.na(colnames(table)))] <- 'Missing' }
fulltable	<- addmargins(table)
set.caption(sprintf('Counted values: "%s" and "%s"', rp.name(row), rp.name(col)))
set.alignment(row.names = "right")
fulltable
%>

<%=
table.max <- which(table == max(table), arr.ind = TRUE)
%>

Most of the cases (<%=table[table.max]%>) can be found in "<%=paste(rownames(table)[table.max[, 1]], colnames(table)[table.max[, 2]], sep = '-')%>" categories. Row-wise "<%=names(which.max(rowSums(table)))%>" holds the highest number of cases (<%=max(rowSums(table))%>) while column-wise "<%=names(which.max(colSums(table)))%>" has the utmost cases (<%=max(colSums(table))%>).

# Percentages

<%=
set.caption(sprintf('Total percentages: "%s" and "%s"', rp.name(row), rp.name(col)))
set.alignment(row.names = "right")
fulltable <- round(addmargins(prop.table(table) * 100), 2)
fulltable
%>

<%=
set.caption(sprintf('Row percentages: "%s" and "%s"', rp.name(row), rp.name(col)))
set.alignment(row.names = "right")
fulltable <- round(prop.table(addmargins(table, 1), 1) * 100, 2)
fulltable
%>

<%=
set.caption(sprintf('Column percentages: "%s" and "%s"', rp.name(row), rp.name(col)))
set.alignment(row.names = "right")
fulltable <- round(prop.table(addmargins(table, 2), 2) * 100, 2)
fulltable
%>

# Tests of Independence

In the below tests for [independece](http://en.wikipedia.org/wiki/Independence_(probability_theory)) we assume that the row and column variables are independent of each other. If this [null hypothesis](http://en.wikipedia.org/wiki/Null_hypothesis) would be rejected by the tests, then we can say that the assumption must have been wrong, so there is a good chance that the variables are associated.

## Chi-squared test

One of the most widespread independence test is the [Chi-squared test](http://en.wikipedia.org/wiki/Pearson%27s_chi-squared_test). While using that we have the alternative hypothesis, that two variables have an association between each other, in opposite of the null hypothesis that the variables are independent.

We use the cell frequencies from the crosstables to calculate the test statistic for that. The test statistic is based on the difference between this distribution  and a theoretical distribution where the variables are independent of each other. The distribution of this test statistic follows a [Chi-square distribution](http://en.wikipedia.org/wiki/Chi-squared_distribution).

The test was invented by Karl Pearson in 1900. It should be noted that the Chi-squared test has the disadvantage that it is sensitive to the sample size.

### Criteria

Before analyzing the result of the Chi-squared test, we have to check if our data meets some requirements. There are two widely used criteria which have to take into consideration, both of them are related to the so-called expected counts. These expected counts are calculated from the marginal distributions and show how the crosstabs would look like if there were complete independency between the variables. The Chi-squared test calculates how different are the observed cells from the expected ones.

The two criteria are:

  - none of the expected cells could be lower than 1
  - 80% of the expected cells have to be at least 5

<%=
table  <- table(row, col, deparse.level = 0) # no need for NAs from here
t      <- suppressWarnings(chisq.test(table))
lambda <- lambda.test(table)
cramer <- sqrt(as.numeric(t$statistic) / (sum(table) * min(dim(table))))
o <- t$expected
num <- nrow(o) * ncol(o)
k <- 0
l <- 0
for (i in 1:nrow(o))
for (j in 1:ncol(o))
{
if (o[i, j] < 5) {k <- k + 1}
if (o[i, j] < 1) {l <- l + 1}
}
%>
Let's look at on expected values then:
<%=
o
crit <- 0
if (l>0) {crit <- crit + 1}
if (k<num/5)  {crit <- crit + 1}
ifelse(crit > 0,"We can see that the Chi-squared test met the requirements.", "We can see that using the Chi-squared test is not advisable in this case, so you should be careful with the interpretation.")
%>

So now check the result of the test:

<%= t %>

To decide if the null or the alternative hypothesis could be accepted we need to calculate the number of degrees of freedom. The degrees of freedom is easy to calculate, we substract one from the number of the categories of both the row and the coloumn variables and multiply them with each other.

To each degrees of freedom there is denoted a [critical value](http://en.wikipedia.org/wiki/Critical_value#Statistics). The result of the Chi-square test have to be lower than that value to be able to accept the nullhypothesis.

<%if (inherits(tryCatch(chisq.test(table), warning = function(w) w), 'warning')) { %>
The requirements of the chi-squared test was not met, so [Yates's correction for continuity](http://en.wikipedia.org/wiki/Yates%27s_correction_for_continuity) applied. The approximation may be incorrect.
<% } %>

<%if (!is.na(cramer)) { %>
<%if (t$p.value < 0.05) { %>

It seems that a real association can be pointed out between *<%=rp.name(row)%>* and *<%=rp.name(col)%>* by the *<%=t$method%>* ($\chi$=<%=as.numeric(t$statistic)%>) at the [degree of freedom](http://en.wikipedia.org/wiki/Degrees_of_freedom_(statistics)) being <%=as.numeric(t$parameter)%> at the [significance level](http://en.wikipedia.org/wiki/Statistical_significance) of <%=add.significance.stars(t$p.value)%>.

The association between the two variables seems to be <%=ifelse(cramer < 0.2, "weak", "strong")%> based on [Cramer's V](http://en.wikipedia.org/wiki/Cram%C3%A9r%27s_V) (<%=cramer%>).

<% } else { %>

It seems that no real association can be pointed out between *<%=rp.name(row)%>* and *<%=rp.name(col)%>* by the *<%=t$method%>* ($\chi$=<%=as.numeric(t$statistic)%> at the degree of freedom being <%=as.numeric(t$parameter)%>) at the significance level of <%=add.significance.stars(t$p.value)%>.

<% } %>

### References

  * Fisher, R. A. (1922): On the interpretation of chi-square from contingency tables, and the calculation of P. _Journal of the Royal Statistical Society_ 85 (1): 87-94.
  * Fisher, R.A. (1954): _Statistical Methods for Research Workers_. Oliver and Boyd.

### Adjusted standardized residuals

The residuals show the contribution to reject the null hypothesis at a cell level. An extremely high or low value indicates that the given cell had a major effect on the resulting chi-square, so thus helps understanding the association in the crosstable.

<%=
set.caption(sprintf('Residuals: "%s" and "%s"', rp.name(row), rp.name(col)))
set.alignment(row.names = "right")
table.res <- suppressWarnings(CrossTable(table, asresid = TRUE))$asr
table.res <- round(table.res, 2)
table.res.highlow  <- which(table.res < -2 | table.res > 2, arr.ind = TRUE)
table.res
%>

<%=
if (nrow(table.res.highlow) > 0) {
    sprintf('Based on Pearson\'s residuals the following cells seems interesting (with values higher than `2` or lower than `-2`):\n%s', paste(sapply(1:nrow(table.res.highlow), function(i) sprintf('\n * "%s - %s"', rownames(table)[table.res.highlow[i, 1]], colnames(table)[table.res.highlow[i, 2]])), collapse = ''))
} else {
    sprintf('No interesting (higher then `2` or lower then `-2`) values found based on Pearson\'s residuals.')
}
%>

### References

  * Snedecor, George W. and Cochran, William G. (1989): _Statistical Methods_. Iowa State University Press.
  * Karl Pearson (1900): _Philosophical Magazine_, Series 5 50 (302): 157-175.

## Fisher Exact Test

An other test to check the possible association/independence between two variables, is the [Fisher exact test](http://en.wikipedia.org/wiki/Fisher%27_exact_test). This test is especially useful with small samples, but could be used with bigger datasets as well.

We have the advantage while using the Fisher's over the Chi-square test, that we could get an exact significance value not just a level of it, thus we can have an impression about the power of the test and the association.

The test was invented by, thus named after R.A. Fisher.

<%=
f <- tryCatch(suppressWarnings(fisher.test(table, hybrid = TRUE, workspace = 1e6)), error = function(e) e)
%>

<% if (inherits(f, 'error')) { %>

The test could not finish within resource limits.

<%
    f <- list(p.value = t$p.value)
} else {
    if (f$p.value < 0.05) {
%>

The variables seems to be dependent based on Fisher's exact test at the [significance level](http://en.wikipedia.org/wiki/P-value) of <%=add.significance.stars(f$p.value)%>.

<% } else { %>

The variables seems to be independent based on Fisher's exact test at the [significance level](http://en.wikipedia.org/wiki/P-value) of <%=add.significance.stars(f$p.value)%>.

<% }} %>

<% if (t$p.value < 0.05 | f$p.value < 0.05) { %>

# Direction of relationship

## Goodman and Kruskal's lambda

With the help of the [Goodman and Kruskal's lambda](http://en.wikipedia.org/wiki/Goodman_and_Kruskal%27s_lambda) we can look for not only relationship on its own, which have directions if we set one variable as a predictor and the other as a criterion variable.

<%if (diff(unlist(lambda, use.names = FALSE)) != 0 & !is.na(cramer)) { %>

Based on Goodman and Kruskal's lambda it seems that *<%=c(rp.name(col),rp.name(row))[which.max(lambda)]%>* ($\lambda$=<%=pander.return(max(as.numeric(lambda)))%>) has an effect on *<%=c(rp.name(col),rp.name(row))[which.min(lambda)]%>* ($\lambda$=<%=min(as.numeric(lambda))%>) if we assume both variables to be nominal.

<% } else { %>

The computed value for [Goodman and Kruskal's lambda](http://en.wikipedia.org/wiki/Goodman_and_Kruskal%27s_lambda) is the same for both directions: <%=lambda$row%>. For this end, we do not know the direction of the relationship.

<% }}} else { %>
Moreover: **it seems that the provided variables do not fit a real crosstable**.
<% } %>

# Charts

If one would like to investigate the relationships rather visually than in a crosstable form, there are several possibilities to do that.

#### Heat map

At first we can have a look at on the so-called [heat map](http://en.wikipedia.org/wiki/Heat_map). This kind of chart uses the same amount of cells and a similar form as the crosstable does, but instead of the numbers there are colours to show which cell contains the most counts (or likewise the highest total percentages).

The darker colour is one cell painted, the most counts/the higher total percentage it has.

<%=
set.caption('Heatmap')
suppressWarnings(suppressMessages(ggfluctuation(table, type = 'colour') + geom_tile() + xlab('') + ylab('') + labs(fill = 'Count'))) # TODO: drop ggfluctuation
%>

There can be also shown the standardized adjusted residual of each cells:

<%=
set.caption('Heatmap of residuals')
table2 <- as.data.frame(t(table))
table2$Freq <- as.data.frame(t(table.res))$Freq
names(table2) <- c("x", "y", "result")
table2 <- transform(table2, x = as.factor(x), y = as.factor(y), freq = result)
ceiling <- max(table2$freq, na.rm = TRUE)
ggplot(table2, aes_string(x = "x", y = "y", fill = "freq")) + geom_tile(colour = "grey50") + scale_fill_gradient2('Std. adj. res.', limits = c(-max(abs(range(table2$freq))), max(abs(range(table2$freq)))), midpoint = 0, low = "red", mid = "white", high = "green")
%>

#### Mosaic chart

In front of the heat map, on the *mosaic charts*, not only the colours are important. The size of the cells shows the amount of the counts one cell has.

The width on the axis of <%=rp.name(row)%> determinate one side and the height on the axis of the <%=rp.name(col)%> gives the final shape of the box. The box which demonstrates a cell from the hypothetic crosstable. We can see on the top of the chart which category from the <%=rp.name(col)%> draw the boxes what kind of colour.

<%=
set.caption('Mosaic chart')
glp      <- panderOptions('graph.legend.position')
panderOptions('graph.legend.position', 'top')
t        <- melt(table)
t$x      <- rowSums(table) / sum(table) * 100
t$xmax   <- cumsum(rowSums(table)) / sum(table) * 100
t$xmin   <- t$xmax - t$x
t$y      <- t$value / rep(rowSums(table), ncol(table)) * 100
t        <- t[with(t, order(Var.1)), ]
t$ymax   <- cumsum(t$y) - as.vector(sapply(1:nrow(table) - 1, rep, ncol(table))) * 100
t$ymin   <- t$ymax - t$y
t$xxtext <- with(t, xmin + (xmax - xmin) / 2)
t$xytext <- as.vector(sapply(rep(c(103, -3), length.out = nrow(table)), rep, ncol(table)))
ggplot(t, aes(ymin = ymin, ymax = ymax, xmin = xmin, xmax = xmax, fill = Var.2)) + geom_rect() + geom_rect(colour = 'white', show_guide = FALSE) + geom_text(aes(x = xxtext, y = xytext, label = Var.1), size = 4) + xlab('') + ylab('') + theme(legend.position = 'top') + labs(fill = '')
panderOptions('graph.legend.position', glp)
%>

#### Fluctuation diagram

At last but not least have a glance on the *fluctuation diagram*. Unlike the above two charts, here the colours does not have influence on the chart, but the sizes of the boxes, which obviously demonstrates here as well the cells of the crosstable.

The bigger are the boxes the higher are the numbers of the counts/the total percentages, which that boxes denote.


<%=
set.caption('Fluctuation diagram')
suppressWarnings(suppressMessages(ggfluctuation(table) + xlab('') + ylab(''))) # TODO: drop ggfluctuation
%>


{% endhighlight %}
</div></li>
</ul>

<a id="Descriptives"> </a>
#### Descriptives.tpl

 <ul class="tabs">
	<li><a class="active" href="#info-Descriptives">Description</a></li>
	<li><a href="#inputs-Descriptives">Inputs</a></li>
	<li><a href="#example-Descriptives">Example</a></li>
	<li><a href="#export-Descriptives">Export</a></li>
	<li><a href="#source-Descriptives">Source</a></li>
</ul>

 <ul class="tabs-content">
	<li class="active" id="info-Descriptives"><div><h5>Descriptive statistics</h5> by <em>Gergely Daróczi, Daniel Nagy</em>
<br><br>
 This template will return descriptive statistics of a numerical or frequency table of a categorical variable.
<br><br>
<em>Required packages:</em> 
<br>
<em>Example:</em> 
{% highlight text %}
rapport('Descriptives', data=ius2008, var='gender')
rapport('Descriptives', data=ius2008, var='age')
rapport('Descriptives', data=mtcars, var='hp')
{% endhighlight %}
</div></li>
	<li id="inputs-Descriptives"><div><h5>Input parameters</h5><em>Descriptives.tpl</em> template has the following options to be (optionally) set while calling <em>rapport</em>:<ul>
	
 Inputs
 
 "var" (Variable)  *required
 Categorical or numerical variable. This template will determine the measurement level of the given variable.
   - standalone:	no
   - length:		exactly 1 vector
 </ul></div></li>
	<li id="example-Descriptives">
{% highlight text %}


#######################################################################
##	 Running: rapport('Descriptives', data=ius2008, var='gender')
#######################################################################

# *gender* ("Gender")


The dataset has _709_ observations with _673_ valid values (missing: _36_).




----------------------------------------
 gender   N    %    Cumul. N   Cumul. % 
-------- --- ----- ---------- ----------
  male   410 60.92    410       60.92   

 female  263 39.08    673        100    

 Total   673  100     673        100    
----------------------------------------

Table: Frequency table: Gender



The most frequent value is *male*.


## Charts

[![Barplot: Gender](plots/Descriptives-1.png)](plots/Descriptives-1-hires.png)


####################################################################
##	 Running: rapport('Descriptives', data=ius2008, var='age')
####################################################################

# *age* ("Age")


The dataset has _709_ observations with _677_ valid values (missing: _32_).



## Base statistics


-----------------------------
 Variable   mean   sd    var 
---------- ------ ----- -----
   Age     24.57  6.849 46.91
-----------------------------

Table: Descriptives: Age



The [standard deviation](http://en.wikipedia.org/wiki/Standard_deviation) equals to  _6.849_ (variance: _46.91_), which shows the unstandardized degree of [homogenity](http://en.wikipedia.org/wiki/Homogeneity_(statistics)): how much variation exists from the average. The [expected value](http://en.wikipedia.org/wiki/Mean) is around _24.57_, somewhere between _24.06_ and _25.09_ with the standard error of _0.2632_.

The highest value found in the dataset is _58_, which is exactly _3.625_ times higher than the minimum (_16_). The difference between the two is described by the [range](http://en.wikipedia.org/wiki/Range_(statistics)): _42_.


## Chart


A [histogram](http://en.wikipedia.org/wiki/Histogram) visually shows the [distribution](http://en.wikipedia.org/wiki/Probability_distribution) of the dataset based on artificially allocated [frequencies](http://en.wikipedia.org/wiki/Statistical_frequency). Each bar represents a theoretical interval of the data, where the height shows the count or density.

[![Histogram: Age](plots/Descriptives-2.png)](plots/Descriptives-2-hires.png)


If we *suppose* that *Age* is not near to the [normal distribution](http://en.wikipedia.org/wiki/Normal_distribution) (see for example [skewness](http://en.wikipedia.org/wiki/Skewness): _1.925_, [kurtosis](http://en.wikipedia.org/wiki/Kurtosis): _4.463_), checking the median (_23_) might be a better option instead of the mean. The [interquartile range](http://en.wikipedia.org/wiki/Interquartile_range) (_6_) measures the statistics dispersion of the variable (similar to standard deviation) based on median.




##################################################################
##	 Running: rapport('Descriptives', data=mtcars, var='hp')
##################################################################

# *hp*


The dataset has _32_ observations with _32_ valid values (missing: _0_).



## Base statistics


-----------------------------
 Variable   mean   sd    var 
---------- ------ ----- -----
    hp     146.7  68.56 4701 
-----------------------------

Table: Descriptives: hp



The [standard deviation](http://en.wikipedia.org/wiki/Standard_deviation) equals to  _68.56_ (variance: _4701_), which shows the unstandardized degree of [homogenity](http://en.wikipedia.org/wiki/Homogeneity_(statistics)): how much variation exists from the average. The [expected value](http://en.wikipedia.org/wiki/Mean) is around _146.7_, somewhere between _122.9_ and _170.4_ with the standard error of _12.12_.

The highest value found in the dataset is _335_, which is exactly _6.442_ times higher than the minimum (_52_). The difference between the two is described by the [range](http://en.wikipedia.org/wiki/Range_(statistics)): _283_.


## Chart


A [histogram](http://en.wikipedia.org/wiki/Histogram) visually shows the [distribution](http://en.wikipedia.org/wiki/Probability_distribution) of the dataset based on artificially allocated [frequencies](http://en.wikipedia.org/wiki/Statistical_frequency). Each bar represents a theoretical interval of the data, where the height shows the count or density.

[![Histogram: hp](plots/Descriptives-3.png)](plots/Descriptives-3-hires.png)


If we *suppose* that *hp* is not near to the [normal distribution](http://en.wikipedia.org/wiki/Normal_distribution) (see for example [skewness](http://en.wikipedia.org/wiki/Skewness): _0.726_, [kurtosis](http://en.wikipedia.org/wiki/Kurtosis): _-0.1356_), checking the median (_123_) might be a better option instead of the mean. The [interquartile range](http://en.wikipedia.org/wiki/Interquartile_range) (_83.5_) measures the statistics dispersion of the variable (similar to standard deviation) based on median.




{% endhighlight %}
</li>
	<li id="export-Descriptives"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport('Descriptives', data=ius2008, var='gender')
rapport('Descriptives', data=ius2008, var='age')
rapport('Descriptives', data=mtcars, var='hp')

{% endhighlight %}
<h6>Popular formats:</h6>
<ul>
	<li><a href="demo/Descriptives.html" target="_blank">HTML</a></li>
	<li><a href="demo/Descriptives.pdf" target="_blank">pdf</a></li>
	<li><a href="demo/Descriptives.docx">docx (MS Word 2007 format)</a></li>
	<li><a href="demo/Descriptives.odt">odt (MS Word compatible)</a></li>
	<li><a href="demo/Descriptives.rtf">rtf (MS Word compatible)</a></li>
	<li><a href="demo/Descriptives.epub">epub</a></li>
</ul>
<h6>Other morkdown formats</h6>
<ul>
	<li><a href="demo/Descriptives.textile" target="_blank">textile</a></li>
	<li><a href="demo/Descriptives.docbook" target="_blank">docbook</a></li>
	<li><a href="demo/Descriptives.man" target="_blank">man</a></li>
	<li><a href="demo/Descriptives.md" target="_blank">markdown</a></li>
	<li><a href="demo/Descriptives.mediawiki" target="_blank">mediawiki</a></li>
	<li><a href="demo/Descriptives.wiki" target="_blank">wiki</a></li>
	<li><a href="demo/Descriptives.org" target="_blank">org</a></li>
	<li><a href="demo/Descriptives.pandoc" target="_blank">pandoc</a></li>
</ul>
</div></li>
	<li id="source-Descriptives"><div>
<h5>Source of `Descriptives.tpl`</h5>
{% highlight text %}

<!--head
meta:
  title: Descriptive statistics
  author: Gergely Daróczi, Daniel Nagy
  description: This template will return descriptive statistics of a numerical or frequency table of a categorical variable.
  email: gergely@snowl.net
  packages: ~
  example:
  - rapport('Descriptives', data=ius2008, var='gender')
  - rapport('Descriptives', data=ius2008, var='age')
  - rapport('Descriptives', data=mtcars, var='hp')
inputs:
- name: var
  label: Variable
  description: Categorical or numerical variable. This template will determine the
    measurement level of the given variable.
  length:
    min: 1.0
    max: 1.0
  value: ~
  required: yes
  standalone: no
head-->

# *<%=rp.name(var)%>*<%=ifelse(rp.label(var) == rp.name(var), '', sprintf(' ("%s")', rp.label(var)))%>

The dataset has <%=nvar<-as.numeric(var); length(nvar)%> observations with <%=rp.valid(nvar)%> valid values (missing: <%=rp.missing(nvar)%>).

<% if (is.numeric(var)) { %>
## Base statistics

<%=
set.caption(sprintf('Descriptives: %s', rp.label(var)))
rp.desc(rp.name(var), NULL, c('mean', 'sd', 'var'), rp.data)
%>

The [standard deviation](http://en.wikipedia.org/wiki/Standard_deviation) equals to  <%=rp.sd(var)%> (variance: <%=rp.var(var)%>), which shows the unstandardized degree of [homogenity](http://en.wikipedia.org/wiki/Homogeneity_(statistics)): how much variation exists from the average. The [expected value](http://en.wikipedia.org/wiki/Mean) is around <%=rp.mean(var)%>, somewhere between <%=rp.mean(var)-1.96*rp.se.mean(var)%> and <%=rp.mean(var) + 1.96 * rp.se.mean(var)%> with the standard error of <%=rp.se.mean(var)%>.

The highest value found in the dataset is <%=rp.max(var)%>, which is exactly <%=rp.max(var) / rp.min(var)%> times higher than the minimum (<%=rp.min(var)%>). The difference between the two is described by the [range](http://en.wikipedia.org/wiki/Range_(statistics)): <%=diff(range(var, na.rm = TRUE))%>.

## Chart

A [histogram](http://en.wikipedia.org/wiki/Histogram) visually shows the [distribution](http://en.wikipedia.org/wiki/Probability_distribution) of the dataset based on artificially allocated [frequencies](http://en.wikipedia.org/wiki/Statistical_frequency). Each bar represents a theoretical interval of the data, where the height shows the count or density.

<%=
set.caption(sprintf('Histogram: %s', rp.label(var)))
hist(var)
%>

If we *suppose* that *<%=rp.label(var)%>* is not near to the [normal distribution](http://en.wikipedia.org/wiki/Normal_distribution) (see for example [skewness](http://en.wikipedia.org/wiki/Skewness): <%=rp.skewness(var)%>, [kurtosis](http://en.wikipedia.org/wiki/Kurtosis): <%=rp.kurtosis(var)%>), checking the median (<%=rp.median(var)%>) might be a better option instead of the mean. The [interquartile range](http://en.wikipedia.org/wiki/Interquartile_range) (<%=rp.iqr(var)%>) measures the statistics dispersion of the variable (similar to standard deviation) based on median.

<%} else {%>

<%=
set.caption(sprintf('Frequency table: %s', rp.label(var)))
rp.freq(rp.name(var), rp.data, na.rm = FALSE, include.na = TRUE)
%>

The most frequent value is *<%=t <- table(var); names(t[t == max(t)])%>*.

## Charts

<%=
set.caption(sprintf('Barplot: %s', rp.label(var)))
rp.barplot(var)
%>

<%}%>

{% endhighlight %}
</div></li>
</ul>

<a id="FactorAnalysis"> </a>
#### FactorAnalysis.tpl

 <ul class="tabs">
	<li><a class="active" href="#info-FactorAnalysis">Description</a></li>
	<li><a href="#inputs-FactorAnalysis">Inputs</a></li>
	<li><a href="#example-FactorAnalysis">Example</a></li>
	<li><a href="#export-FactorAnalysis">Export</a></li>
	<li><a href="#source-FactorAnalysis">Source</a></li>
</ul>

 <ul class="tabs-content">
	<li class="active" id="info-FactorAnalysis"><div><h5>Factor Analysis</h5> by <em>Daniel Nagy</em>
<br><br>
 In this template Rapporter will present you Factor Analysis.
<br><br>
<em>Required packages:</em> psych
<br>
<em>Example:</em> 
{% highlight text %}
rapport('FactorAnalysis.tpl', data=mtcars, vars=c('carb', 'gear', 'mpg', 'cyl'), rot.method="varimax")
rapport('FactorAnalysis.tpl', data=mtcars, vars=c('carb', 'gear', 'mpg', 'cyl'), rot.method="varimax", fact.num = 3)
rapport('FactorAnalysis.tpl', data=mtcars, vars=c('carb', 'gear', 'mpg', 'cyl', 'drat'), rot.method="varimax", fact.num = 5)
{% endhighlight %}
</div></li>
	<li id="inputs-FactorAnalysis"><div><h5>Input parameters</h5><em>FactorAnalysis.tpl</em> template has the following options to be (optionally) set while calling <em>rapport</em>:<ul>
	
 Inputs
 
 "vars" (Used Variables)  *required
 The Variables that will be used in Factor Analysis
   - class:		numeric
   - standalone:	no
   - length:		from 2 to 500 vectors
 
 "fact.num" (Number of Factors)
 How many Factors you want to use?
   - class:		integer
   - standalone:	yes
   - length:		exactly 1 value
   - limits:		1 <= x <= 499
 
 "method" (Method of factoring)
 The used method of the factoring
   - class:		character
   - standalone:	yes
   - length:		exactly 1 value
   - matchable:		TRUE
   - options:		"minimum residual (OLS)", "weighted least squares (WLS)", "generalized weighted least squares (GLS)", "maximum likelihood" and "minimize the sample size weighted chi square"
   - value:		"maximum likelihood"
 
 "rot.method" (Method of Rotation)
 The used method of the rotation
   - class:		character
   - standalone:	yes
   - length:		exactly 1 value
   - matchable:		TRUE
   - options:		"none", "varimax", "promax", "quartimax", "bentlerT", "geominT", "bifactor", "oblimin", "simplimax", "bentlerQ", "geominQ", "biquartimin" and "cluster"
   - value:		"varimax"
 
 "fa.scores" (Type of scores)
 Type of scores to produce
   - class:		character
   - standalone:	yes
   - length:		exactly 1 value
   - matchable:		TRUE
   - options:		"regression" and "Bartlett"
   - value:		"regression"
 
 "max.iter" (Maximum iterations)
 Maximum number of iterations for convergence
   - class:		integer
   - standalone:	yes
   - length:		exactly 1 value
   - limits:		1 <= x <= 10000
 </ul></div></li>
	<li id="example-FactorAnalysis">
{% highlight text %}


##########################################################################################################################
##	 Running: rapport('FactorAnalysis.tpl', data=mtcars, vars=c('carb', 'gear', 'mpg', 'cyl'), rot.method="varimax")
##########################################################################################################################

# Introduction


[Factor Analysis](http://en.wikipedia.org/wiki/Factor_analysis) is applied as a data reduction or structure detection method. There are two main applications of it: reducing the number of variables and detecting structure in the relationships between variables, thus explore latent structure behind the data, classify variables.



#### Determining the number of the factors

[![](plots/FactorAnalysis.tpl-1.png)](plots/FactorAnalysis.tpl-1-hires.png)

#### Eigenvalues



You can find the eigenvalues of the possible factors in the following table (_2_ factors were produced as you set):

-----------------------------
 Factor Number   Eigenvalues 
--------------- -------------
     **1**        **2.461**  

     **2**        **1.273**  

       3           0.1485    

       4           0.1176    
-----------------------------


## Factor loadings


At the next step let's check the factor loadings. They mean that how deep the impact of a factor for the variables. We emphasized the cells when the explained is higher than 30% of the whole variance.

---------------------------------
  &nbsp;       ML1        ML2    
---------- ----------- ----------
 **carb**  **0.8723**  **0.3756**

 **gear**   -0.08811   **0.9343**

 **mpg**   **-0.8197** **0.4368**

 **cyl**   **0.7988**  **-0.452**
---------------------------------




So it can be said that 
* ML1 is a latent factor of carb 
* ML1 is a latent factor of mpg 
* ML1 is a latent factor of cyl 
* ML2 is a latent factor of carb 
* ML2 is a latent factor of gear 
* ML2 is a latent factor of mpg 
* ML2 is a latent factor of cyl 

<!-- end of list -->



From them in the cases of the _ML1's impact on mpg_ and _ML2's impact on cyl_, we can say they are negative effects.
    







## Uniquenesses


At last but not least let us say some words about the not explained part of the variables. There are two statistics which help us quantifying this concept: Communality and Uniqueness. They are in a really strong relationship, because Uniqueness is the variability of a variable minus its Communality. The first table contains the Uniqunesses, the second the Communalities of the variables:

----------------------------------------
  &nbsp;    Uniqunesses   Communalities 
---------- ------------- ---------------
 **carb**     0.09805         0.902     

 **gear**     0.1193         0.8807     

 **mpg**      0.1374         0.8626     

 **cyl**      0.1576         0.8424     
----------------------------------------



We can see from the table that variable cyl has the highest Uniqueness, so could be explained the least by the factors and variable carb variance's was explained the most, because it has the lowest Uniqueness. From the communalities we can draw the same conclusion.




########################################################################################################################################
##	 Running: rapport('FactorAnalysis.tpl', data=mtcars, vars=c('carb', 'gear', 'mpg', 'cyl'), rot.method="varimax", fact.num = 3)
########################################################################################################################################

# Introduction


[Factor Analysis](http://en.wikipedia.org/wiki/Factor_analysis) is applied as a data reduction or structure detection method. There are two main applications of it: reducing the number of variables and detecting structure in the relationships between variables, thus explore latent structure behind the data, classify variables.





#### Eigenvalues



You can find the eigenvalues of the possible factors in the following table (_3_ factors were produced as you set):

-----------------------------
 Factor Number   Eigenvalues 
--------------- -------------
     **1**        **2.461**  

     **2**        **1.273**  

     **3**       **0.1485**  

       4           0.1176    
-----------------------------


## Factor loadings


At the next step let's check the factor loadings. They mean that how deep the impact of a factor for the variables. We emphasized the cells when the explained is higher than 30% of the whole variance.

--------------------------------------------
  &nbsp;       ML1         ML2        ML3   
---------- ----------- ----------- ---------
 **carb**  **0.8771**  **0.3502**  -0.001772

 **gear**    -0.0595   **0.9317**  -0.005685

 **mpg**   **-0.8132** **0.4641**   0.0972  

 **cyl**   **0.7917**  **-0.4774**  0.1361  
--------------------------------------------




So it can be said that 
* ML1 is a latent factor of carb 
* ML1 is a latent factor of mpg 
* ML1 is a latent factor of cyl 
* ML2 is a latent factor of carb 
* ML2 is a latent factor of gear 
* ML2 is a latent factor of mpg 
* ML2 is a latent factor of cyl 

<!-- end of list -->



From them in the cases of the _ML1's impact on mpg_ and _ML2's impact on cyl_, we can say they are negative effects.
    







## Uniquenesses


At last but not least let us say some words about the not explained part of the variables. There are two statistics which help us quantifying this concept: Communality and Uniqueness. They are in a really strong relationship, because Uniqueness is the variability of a variable minus its Communality. The first table contains the Uniqunesses, the second the Communalities of the variables:

----------------------------------------
  &nbsp;    Uniqunesses   Communalities 
---------- ------------- ---------------
 **carb**     0.1081         0.8919     

 **gear**     0.1283         0.8717     

 **mpg**      0.1138         0.8862     

 **cyl**      0.1268         0.8732     
----------------------------------------



We can see from the table that variable gear has the highest Uniqueness, so could be explained the least by the factors and variable carb variance's was explained the most, because it has the lowest Uniqueness. From the communalities we can draw the same conclusion.




################################################################################################################################################
##	 Running: rapport('FactorAnalysis.tpl', data=mtcars, vars=c('carb', 'gear', 'mpg', 'cyl', 'drat'), rot.method="varimax", fact.num = 5)
################################################################################################################################################



Your request cannot be implemented, because there are the same number of variables (_5_) like the number of the requested factors (_5_) . Please set the number of the factors to maximum _4_ with the same number of the variables or extend the number of those variables at least to _6_.




{% endhighlight %}
</li>
	<li id="export-FactorAnalysis"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport('FactorAnalysis.tpl', data=mtcars, vars=c('carb', 'gear', 'mpg', 'cyl'), rot.method="varimax")
rapport('FactorAnalysis.tpl', data=mtcars, vars=c('carb', 'gear', 'mpg', 'cyl'), rot.method="varimax", fact.num = 3)
rapport('FactorAnalysis.tpl', data=mtcars, vars=c('carb', 'gear', 'mpg', 'cyl', 'drat'), rot.method="varimax", fact.num = 5)

{% endhighlight %}
<h6>Popular formats:</h6>
<ul>
	<li><a href="demo/FactorAnalysis.html" target="_blank">HTML</a></li>
	<li><a href="demo/FactorAnalysis.pdf" target="_blank">pdf</a></li>
	<li><a href="demo/FactorAnalysis.docx">docx (MS Word 2007 format)</a></li>
	<li><a href="demo/FactorAnalysis.odt">odt (MS Word compatible)</a></li>
	<li><a href="demo/FactorAnalysis.rtf">rtf (MS Word compatible)</a></li>
	<li><a href="demo/FactorAnalysis.epub">epub</a></li>
</ul>
<h6>Other morkdown formats</h6>
<ul>
	<li><a href="demo/FactorAnalysis.textile" target="_blank">textile</a></li>
	<li><a href="demo/FactorAnalysis.docbook" target="_blank">docbook</a></li>
	<li><a href="demo/FactorAnalysis.man" target="_blank">man</a></li>
	<li><a href="demo/FactorAnalysis.md" target="_blank">markdown</a></li>
	<li><a href="demo/FactorAnalysis.mediawiki" target="_blank">mediawiki</a></li>
	<li><a href="demo/FactorAnalysis.wiki" target="_blank">wiki</a></li>
	<li><a href="demo/FactorAnalysis.org" target="_blank">org</a></li>
	<li><a href="demo/FactorAnalysis.pandoc" target="_blank">pandoc</a></li>
</ul>
</div></li>
	<li id="source-FactorAnalysis"><div>
<h5>Source of `FactorAnalysis.tpl`</h5>
{% highlight text %}

<!--head
meta:
  title: Factor Analysis
  author: Daniel Nagy
  description: In this template Rapporter will present you Factor Analysis.
  email: ~
  packages:
  - psych
  - nFactors
  example:
  - rapport('FactorAnalysis.tpl', data=mtcars, vars=c('carb', 'gear', 'mpg', 'cyl'),
            rot.method="varimax")
  - rapport('FactorAnalysis.tpl', data=mtcars, vars=c('carb', 'gear', 'mpg', 'cyl'),
            rot.method="varimax", fact.num = 3)
  - rapport('FactorAnalysis.tpl', data=mtcars, vars=c('carb', 'gear', 'mpg', 'cyl', 
            'drat'), rot.method="varimax", fact.num = 5)
inputs:
- name: vars
  label: Used Variables
  description: The Variables that will be used in Factor Analysis
  class: numeric
  length:
    min: 2.0
    max: 500.0
  required: yes
  standalone: no
- name: fact.num
  label: Number of Factors
  description: How many Factors you want to use?
  class: integer
  limit:
    min: 1.0
    max: 499.0
  required: no
  standalone: yes
- name: method
  label: Method of factoring
  description: The used method of the factoring
  class: character
  options:
  - minimum residual (OLS)
  - weighted least squares (WLS)
  - generalized weighted least squares (GLS)
  - maximum likelihood
  - minimize the sample size weighted chi square
  value: maximum likelihood
  matchable: yes
  allow_multiple: no
  required: no
  standalone: yes
- name: rot.method
  label: Method of Rotation
  description: The used method of the rotation
  class: character
  options:
  - none
  - varimax
  - promax
  - quartimax
  - bentlerT
  - geominT
  - bifactor
  - oblimin
  - simplimax
  - bentlerQ
  - geominQ
  - biquartimin
  - cluster
  value: varimax
  matchable: yes
  allow_multiple: no
  required: no
  standalone: yes
- name: fa.scores
  label: Type of scores
  description: Type of scores to produce
  class: character
  options:
  - regression
  - Bartlett
  value: regression
  matchable: yes
  allow_multiple: no
  required: no
  standalone: yes
- name: max.iter
  label : Maximum iterations
  description: Maximum number of iterations for convergence
  class: integer
  limit:
    min: 1
    max: 10000 
  required: no
  standalone: yes
head-->

<% if (exists('fact.num') && !is.null(fact.num) && fact.num > 0 && fact.num >= ncol(vars)) { %>

Your request cannot be implemented, because there are <%=ifelse(ncol(vars) == fact.num, "the same number of variables", "less variables")%> (<%= ncol(vars) %>) <%=ifelse(ncol(vars) == fact.num, "like", "than")%> the number of the requested factors (<%= fact.num %>) . Please set the number of the factors to maximum <%= ncol(vars) - 1 %> with the same number of the variables or extend the number of those variables at least to <%= fact.num + 1 %>.

<% } else { %>

<% if (exists('fact.num') && !is.null(fact.num) && fact.num > 0) { %>
<% } else { %>
<% if (ncol(vars) < 3) { %>
Your request to automatically calculate the number of the clusters cannot be implemented, because there are not enough variables. Please set at least 3 variables in order to use that automatic function or set the number of the factors (obviously to less than the number of the used variables). Now we are using a 1 factor case.
<%= 
fact.num <- 1 
%>
<% }} %>

# Introduction

[Factor Analysis](http://en.wikipedia.org/wiki/Factor_analysis) is applied as a data reduction or structure detection method. There are two main applications of it: reducing the number of variables and detecting structure in the relationships between variables, thus explore latent structure behind the data, classify variables.

<% if (exists('fact.num') && !is.null(fact.num) && fact.num > 0) { %>
<% } else { %>
#### Determining the number of the factors
<% } %>

<%= 
if (method=="minimum residual (OLS)") { method <- "minres" }
if (method=="weighted least squares (WLS)") { method <- "wls" }
if (method=="generalized weighted least squares (GLS)") { method <- "gls" }
if (method=="maximum likelihood") { method <- "ml" }
if (method=="minimize the sample size weighted chi square") { method <- "minchi" }

fact.matrix <- na.omit(scale(vars))
ev <- eigen(cor(fact.matrix))

if (exists('fact.num') && !is.null(fact.num) && fact.num > 0) {
suppressMessages(FA <- fa(fact.matrix, nfactors = fact.num, scores = fa.scores, rotate = rot.method, fm = method, max.iter = max.iter, warnings = TRUE))
} else {
ap <- parallel(subject=nrow(fact.matrix), var = ncol(fact.matrix), rep = 100, cent=.05)
nS <- nScree(x = ev$values, aparallel = ap$eigen$qevpea)
plotnScree(nS)
fact.num <- max(which(ev$values >= 1))
suppressMessages(FA <- fa(fact.matrix, nfactors = fact.num, scores = fa.scores, rotate = rot.method, fm = method, max.iter = max.iter, warnings = TRUE))
}
%>

#### Eigenvalues

<% if (exists('fact.num') && !is.null(fact.num) && fact.num > 0) { %>
You can find the eigenvalues of the possible factors in the following table (<%=fact.num%> factors were produced as you set):
<%=
emphasize.strong.rows(1:fact.num)
cbind("Factor Number" = 1:length(ev$values), "Eigenvalues" = ev$values)
%>
<% } else { %>
As you haven't provided value for the number of the factors, we calculated that automatically based on the eigenvalues, thus it is: <%=max(which(ev$values >= 1))%>. The eigenvalues you can find in the following table:
<%=
emphasize.strong.rows(1:max(which(ev$values >= 1)))
cbind("Factor Number" = 1:length(ev$values), "Eigenvalues" = ev$values)
%>
<% } %>


## Factor loadings

At the next step let's check the factor loadings. They mean that how deep the impact of a factor for the variables<%= ifelse(rot.method != "none",""," (Keep in mind that these are the results without rotation, please set the parameter rot.method to see the rotated ones)")%>. We emphasized the cells when the explained is higher than 30% of the whole variance.
<%= 
FA_loadings <- FA$loadings
class(FA_loadings) <- "matrix"
emphasize.strong.cells(which(abs(FA_loadings) > 0.3, arr.ind = TRUE))
FA_loadings
%>


So it can be said that <%=paste(pandoc.list.return(paste(colnames(FA_loadings)[which(abs(FA_loadings) > 0.3, arr.ind = TRUE)[, 2]],rp.name(vars)[which(abs(FA_loadings) > 0.3, arr.ind = TRUE)[, 1]], sep = " is a latent factor of ")), collapse = '\n')%>

<% if (length(which(FA_loadings > 0.3)) != length(which(abs(FA_loadings) > 0.3))) { %>

<%=neg.comp <- colnames(FA_loadings)[which(FA_loadings < -0.3, arr.ind = TRUE)[, 2]]%>

From them in the case<%=ifelse(length(neg.comp) > 1, "s", "")%> of the <%=paste(colnames(FA_loadings)[which(FA_loadings < -0.3, arr.ind = TRUE)[, 2]], rp.name(vars)[which(FA_loadings < -0.3, arr.ind = TRUE)[, 1]], sep = "'s impact on ")%>, we can say <%=ifelse(length(neg.comp) > 1, "they are", "that is")%> negative effects.
    
<% } else { %>
We can say that <%=ifelse(length(which(abs(FA_loadings) > 0.3)), "none of these impacts are negative", "this impact is positive")%>. 

<% }%>


<% if (length(rownames(FA$scores)) > 0 & nrow(vars) < 10) { %>

## Plot about the distribution of the observations

Now let's check how the observations distribute among the <%= ifelse(fact.num < 2, "factor", "first and the second factors")%>.
<%= FA_scores <- FA$scores
plot(FA_scores)
+text(FA_scores, labels = rownames(fact.matrix), cex = 1)
%>
<% } else { %>
<% } %>

## Uniquenesses

At last but not least let us say some words about the not explained part of the variables. There are two statistics which help us quantifying this concept: Communality and Uniqueness. They are in a really strong relationship, because Uniqueness is the variability of a variable minus its Communality. The first table contains the Uniqunesses, the second the Communalities of the variables:
<%= 
uni <- as.matrix(FA$uniquenesses)
comm <- as.matrix(FA$communality)
table <- cbind(uni,comm)
colnames(table) <- c("Uniqunesses", "Communalities")
table
%>

We can see from the table that variable <%=rownames(uni)[which(max(uni) == uni)]%> has the highest Uniqueness, so could be explained the least by the factors and variable <%= rownames(uni)[which(min(uni) == uni)]%> variance's was explained the most, because it has the lowest Uniqueness. From the communalities we can draw the same conclusion.

<% } %>

{% endhighlight %}
</div></li>
</ul>

<a id="FTest"> </a>
#### FTest.tpl

 <ul class="tabs">
	<li><a class="active" href="#info-FTest">Description</a></li>
	<li><a href="#inputs-FTest">Inputs</a></li>
	<li><a href="#example-FTest">Example</a></li>
	<li><a href="#export-FTest">Export</a></li>
	<li><a href="#source-FTest">Source</a></li>
</ul>

 <ul class="tabs-content">
	<li class="active" id="info-FTest"><div><h5>F test</h5> by <em>Gergely Daróczi, Daniel Nagy</em>
<br><br>
 This template will run an F-test to check if two continuous variables have the same means.
<br><br>
<em>Required packages:</em> nortest
<br>
<em>Example:</em> 
{% highlight text %}
rapport('FTest', data=ius2008, xvar='edu', yvar='age')
rapport('FTest', data=ius2008, xvar='edu', yvar='age', norm.check=F)
rapport('FTest', data=mtcars, xvar='cyl', yvar='drat', norm.check=F)
{% endhighlight %}
</div></li>
	<li id="inputs-FTest"><div><h5>Input parameters</h5><em>FTest.tpl</em> template has the following options to be (optionally) set while calling <em>rapport</em>:<ul>
	
 Inputs
 
 "xvar" (X Variable(s))  *required
 This is the X variable which will be used here
   - class:		numeric
   - standalone:	no
   - length:		exactly 1 vector
 
 "yvar" (Y Variable(s))  *required
 This is the Y variable which will be used here.
   - class:		numeric
   - standalone:	no
   - length:		exactly 1 vector
 
 "norm.check" (Normality check)
 You can set to run a normality check before the F test.
   - class:		logical
   - standalone:	yes
   - length:		exactly 1 value
   - value:		TRUE
 </ul></div></li>
	<li id="example-FTest">
{% highlight text %}


##########################################################################
##	 Running: rapport('FTest', data=ius2008, xvar='edu', yvar='age')
##########################################################################

# Introduction


F test compares the means of two continuous variables. In other words it shows if their means were statistically different.
We should be careful, while using the F test, because of the strict normality assumption, where strict means approximately normal ditribution is not enough to satisfy that.




# Normality assumption check (_Internet usage for educational purposes (hours per day)_)


The [_Shapiro-Wilk test_](http://en.wikipedia.org/wiki/Shapiro%E2%80%93Wilk_test), the [_Lilliefors test_](http://en.wikipedia.org/wiki/Lilliefors_test) and the [_Anderson-Darling test_](http://en.wikipedia.org/wiki/Anderson_Darling_test) help us to decide if the above-mentioned assumption can be accepted of the _Internet usage for educational purposes (hours per day)_.




-------------------------------------------------
          Method             Statistic   p-value 
--------------------------- ----------- ---------
        Lilliefors            0.2223    2.243e-92
   (Kolmogorov-Smirnov)                          
      normality test                             

Anderson-Darling normality     42.04    3.31e-90 
           test                                  

Shapiro-Wilk normality test   0.7985    6.366e-28
-------------------------------------------------


So, the conclusions we can draw with the help of test statistics: 
   
 - based on _Lilliefors test_, distribution of _Internet usage for educational purposes (hours per day)_ is not normal
   
 - _Anderson-Darling test_ confirms violation of normality assumption

 - according to _Shapiro-Wilk test_, the distribution of _Internet usage for educational purposes (hours per day)_ is not normal
 


As you can see, the applied tests confirm departures from normality.

# Normality assumption check (_Age_)


The [_Shapiro-Wilk test_](http://en.wikipedia.org/wiki/Shapiro%E2%80%93Wilk_test), the [_Lilliefors test_](http://en.wikipedia.org/wiki/Lilliefors_test) and the [_Anderson-Darling test_](http://en.wikipedia.org/wiki/Anderson_Darling_test) help us to decide if the above-mentioned assumption can be accepted of the _Internet usage for educational purposes (hours per day)_.




-------------------------------------------------
          Method             Statistic   p-value 
--------------------------- ----------- ---------
        Lilliefors             0.17     6.193e-54
   (Kolmogorov-Smirnov)                          
      normality test                             

Anderson-Darling normality     32.16    1.26e-71 
           test                                  

Shapiro-Wilk normality test   0.8216    9.445e-27
-------------------------------------------------


So, the conclusions we can draw with the help of test statistics: 
   
 - based on _Lilliefors test_, distribution of _Age_ is not normal
   
 - _Anderson-Darling test_ confirms violation of normality assumption

 - according to _Shapiro-Wilk test_, the distribution of _Age_ is not normal
 


As you can see, the applied tests confirm departures from normality.



_In this case it is advisable to run a more robust test, then the F-test._





########################################################################################
##	 Running: rapport('FTest', data=ius2008, xvar='edu', yvar='age', norm.check=F)
########################################################################################

# Introduction


F test compares the means of two continuous variables. In other words it shows if their means were statistically different.
We should be careful, while using the F test, because of the strict normality assumption, where strict means approximately normal ditribution is not enough to satisfy that.



# The F-test


Here is the the result of the _F test_ to compare the means of _Internet usage for educational purposes (hours per day)_ and _Age_.


--------------------------------------------
       Method          Statistic   p-value  
--------------------- ----------- ----------
F test to compare two   0.08618   3.772e-180
      variances                             
--------------------------------------------



We can see from the table (in the p-value coloumn) that there is a significant difference between the means of _Internet usage for educational purposes (hours per day)_ and _Age_.



########################################################################################
##	 Running: rapport('FTest', data=mtcars, xvar='cyl', yvar='drat', norm.check=F)
########################################################################################

# Introduction


F test compares the means of two continuous variables. In other words it shows if their means were statistically different.
We should be careful, while using the F test, because of the strict normality assumption, where strict means approximately normal ditribution is not enough to satisfy that.



# The F-test


Here is the the result of the _F test_ to compare the means of _cyl_ and _drat_.


-------------------------------------------
       Method          Statistic   p-value 
--------------------- ----------- ---------
F test to compare two    11.16    1.461e-09
      variances                            
-------------------------------------------



We can see from the table (in the p-value coloumn) that there is a significant difference between the means of _cyl_ and _drat_.



{% endhighlight %}
</li>
	<li id="export-FTest"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport('FTest', data=ius2008, xvar='edu', yvar='age')
rapport('FTest', data=ius2008, xvar='edu', yvar='age', norm.check=F)
rapport('FTest', data=mtcars, xvar='cyl', yvar='drat', norm.check=F)

{% endhighlight %}
<h6>Popular formats:</h6>
<ul>
	<li><a href="demo/FTest.html" target="_blank">HTML</a></li>
	<li><a href="demo/FTest.pdf" target="_blank">pdf</a></li>
	<li><a href="demo/FTest.docx">docx (MS Word 2007 format)</a></li>
	<li><a href="demo/FTest.odt">odt (MS Word compatible)</a></li>
	<li><a href="demo/FTest.rtf">rtf (MS Word compatible)</a></li>
	<li><a href="demo/FTest.epub">epub</a></li>
</ul>
<h6>Other morkdown formats</h6>
<ul>
	<li><a href="demo/FTest.textile" target="_blank">textile</a></li>
	<li><a href="demo/FTest.docbook" target="_blank">docbook</a></li>
	<li><a href="demo/FTest.man" target="_blank">man</a></li>
	<li><a href="demo/FTest.md" target="_blank">markdown</a></li>
	<li><a href="demo/FTest.mediawiki" target="_blank">mediawiki</a></li>
	<li><a href="demo/FTest.wiki" target="_blank">wiki</a></li>
	<li><a href="demo/FTest.org" target="_blank">org</a></li>
	<li><a href="demo/FTest.pandoc" target="_blank">pandoc</a></li>
</ul>
</div></li>
	<li id="source-FTest"><div>
<h5>Source of `FTest.tpl`</h5>
{% highlight text %}

<!--head
meta:
  title: F test
  author: Gergely Daróczi, Daniel Nagy
  description: This template will run an F-test to check if two continuous variables have the same means.
  email: ~
  packages:
  - nortest
  example:
  - rapport('FTest', data=ius2008, xvar='edu', yvar='age')
  - rapport('FTest', data=ius2008, xvar='edu', yvar='age', norm.check=F)
  - rapport('FTest', data=mtcars, xvar='cyl', yvar='drat', norm.check=F)
inputs:
- name: xvar
  label: X Variable(s)
  description: This is the X variable which will be used here
  class: numeric
  length:
    min: 1.0
    max: 1.0
  required: yes
  standalone: no
- name: yvar
  label: Y Variable(s)
  description: This is the Y variable which will be used here.
  class: numeric
  length:
    min: 1.0
    max: 1.0
  required: yes
  standalone: no
- name: norm.check
  label: Normality check
  description: You can set to run a normality check before the F test.
  class: logical
  value: yes
  required: no
  standalone: yes
head-->

# Introduction

F test compares the means of two continuous variables. In other words it shows if their means were statistically different.
We should be careful, while using the F test, because of the strict normality assumption, where strict means approximately normal ditribution is not enough to satisfy that.

<% if (norm.check) { %>

# Normality assumption check (<%=p(xvar.label)%>)

The <%=ifelse(length(xvar) < 5000, "[_Shapiro-Wilk test_](http://en.wikipedia.org/wiki/Shapiro%E2%80%93Wilk_test), the", "")%> [_Lilliefors test_](http://en.wikipedia.org/wiki/Lilliefors_test) and the [_Anderson-Darling test_](http://en.wikipedia.org/wiki/Anderson_Darling_test) help us to decide if the above-mentioned assumption can be accepted of the <%=p(xvar.label)%>.

<% if (length(xvar) < 5000) { %>

<%= ntest <- htest(xvar, lillie.test, ad.test, shapiro.test)
k <- 0
l <- 0
m <- 0
n <- 0
p <- 0.05
if (ntest$p[1] < 0.05) {l <- k + 1}
if (ntest$p[2] < 0.05) {m <- l + 1}
if (ntest$p[3] < 0.05) {n <- m + 1}
ntest
%>
So, the conclusions we can draw with the help of test statistics: 
   
 - based on _Lilliefors test_, distribution of _<%= xvar.label %>_ is <%= ifelse(ntest[1, 3] < p, "not normal", "normal") %>
   
 - _Anderson-Darling test_ confirms<%= ifelse(ntest[2, 3] < p, " violation of", "") %> normality assumption

 - according to _Shapiro-Wilk test_, the distribution of _<%= xvar.label %>_ is<%= ifelse(ntest[3, 3] < p, " not", "") %> normal
 
<% } else { %>
<%= ntest <- htest(xvar, lillie.test, ad.test)
k <- 0
l <- 0
m <- 0
n <- 0
p <- 0.05
if (ntest$p[1] < 0.05) {l <- k + 1}
if (ntest$p[2] < 0.05) {n <- l + 1}
ntest
%>

So, the conclusions we can draw with the help of test statistics: 
   
 - based on _Lilliefors test_, distribution of _<%= xvar.label %>_ is <%= ifelse(ntest[1, 3] < p, "not normal", "normal") %>
   
 - _Anderson-Darling test_ confirms<%= ifelse(ntest[2, 3] < p, " violation of", "") %> normality assumption
<% } %>

<%= if (n > 0) {
sprintf("As you can see, the applied tests %s.", ifelse(n > 1, "confirm departures from normality", "yield different results on hypotheses of normality, so you may want to stick with one you find most appropriate or you trust the most.")) 
} else { 
sprintf("reject departures from normality") 
} 
%>

# Normality assumption check (<%=p(yvar.label)%>)

The <%=ifelse(length(yvar) < 5000, "[_Shapiro-Wilk test_](http://en.wikipedia.org/wiki/Shapiro%E2%80%93Wilk_test), the", "")%> [_Lilliefors test_](http://en.wikipedia.org/wiki/Lilliefors_test) and the [_Anderson-Darling test_](http://en.wikipedia.org/wiki/Anderson_Darling_test) help us to decide if the above-mentioned assumption can be accepted of the <%=p(xvar.label)%>.

<% if (length(yvar) < 5000) { %>

<%= ntest <- htest(yvar, lillie.test, ad.test, shapiro.test)
k2 <- 0
l2 <- 0
m2 <- 0
n2 <- 0
p <- 0.05
if (ntest$p[1] < 0.05) {l2 <- k2 + 1}
if (ntest$p[2] < 0.05) {m2 <- l2 + 1}
if (ntest$p[3] < 0.05) {n2 <- m2 + 1}
ntest
%>
So, the conclusions we can draw with the help of test statistics: 
   
 - based on _Lilliefors test_, distribution of _<%= yvar.label %>_ is <%= ifelse(ntest[1, 3] < p, "not normal", "normal") %>
   
 - _Anderson-Darling test_ confirms<%= ifelse(ntest[2, 3] < p, " violation of", "") %> normality assumption

 - according to _Shapiro-Wilk test_, the distribution of _<%= yvar.label %>_ is<%= ifelse(ntest[3, 3] < p, " not", "") %> normal
 
<% } else { %>
<%= ntest <- htest(yvar, lillie.test, ad.test)
k2 <- 0
l2 <- 0
m2 <- 0
n2 <- 0
p2 <- 0.05
if (ntest$p[1] < 0.05) {l2 <- k2 + 1}
if (ntest$p[2] < 0.05) {n2 <- l2 + 1}
ntest
%>

So, the conclusions we can draw with the help of test statistics: 
   
 - based on _Lilliefors test_, distribution of _<%= yvar.label %>_ is <%= ifelse(ntest[1, 3] < p, "not normal", "normal") %>
   
 - _Anderson-Darling test_ confirms<%= ifelse(ntest[2, 3] < p, " violation of", "") %> normality assumption
<% } %>

<%= if (n2 > 0) {
sprintf("As you can see, the applied tests %s.", ifelse(n2 > 1, "confirm departures from normality", "yield different results on hypotheses of normality, so you may want to stick with one you find most appropriate or you trust the most.")) 
} else { 
sprintf("reject departures from normality") 
} 
%>

<% if(n + n2 < 1) { %>

# The F-test

Whereas we have checked the normality assumptions, let's see the results of the _F test_ to compare the means of <%= p(xvar.label) %> and <%=p(yvar.label)%>.

<%=
ftest <- function(xvar) var.test(xvar, yvar)
Ftest <- htest(xvar, ftest)
f.p <- Ftest$"p.value"
p <- 0.05
Ftest
%>

We can see from the table (in the p-value coloumn) that there is<%=ifelse(f.p < p,""," not")%> a significant difference between the means of _<%=xvar.label%>_ and _<%=yvar.label%>_.

<% } else { %>
_In this case it is advisable to run a more robust test, then the F-test._
<% } %>

<% } else { %>
# The F-test

Here is the the result of the _F test_ to compare the means of <%= p(xvar.label) %> and <%=p(yvar.label)%>.

<%=
ftest <- function(xvar) var.test(xvar, yvar)
Ftest <- htest(xvar, ftest)
f.p <- Ftest$"p.value"
p <- 0.05
Ftest
%>

We can see from the table (in the p-value coloumn) that there is<%=ifelse(f.p < p,""," not")%> a significant difference between the means of _<%=xvar.label%>_ and _<%=yvar.label%>_.
<% } %>

{% endhighlight %}
</div></li>
</ul>

<a id="GenerateBeta"> </a>
#### GenerateBeta.tpl

 <ul class="tabs">
	<li><a class="active" href="#info-GenerateBeta">Description</a></li>
	<li><a href="#inputs-GenerateBeta">Inputs</a></li>
	<li><a href="#example-GenerateBeta">Example</a></li>
	<li><a href="#export-GenerateBeta">Export</a></li>
	<li><a href="#source-GenerateBeta">Source</a></li>
</ul>

 <ul class="tabs-content">
	<li class="active" id="info-GenerateBeta"><div><h5>Generate beta distribution</h5> by <em>Rapporter Team (@rapporter)</em>
<br><br>
 Random generation for the Beta distribution with parameters.
<br><br>
<em>Required packages:</em> nortest
<br>
<em>Example:</em> </div></li>
	<li id="inputs-GenerateBeta"><div><h5>Input parameters</h5><em>GenerateBeta.tpl</em> template has the following options to be (optionally) set while calling <em>rapport</em>:<ul>
	
 Inputs
 
 "n" (Observations)  *required
 Number of observations
   - class:		numeric
   - standalone:	yes
   - length:		exactly 1 value
   - value:		100
   - limits:		1 <= x <= Inf
 
 "shape1" (Alpha)  *required
 First parameter of the Beta distribution
   - class:		numeric
   - standalone:	yes
   - length:		exactly 1 value
   - value:		0.1
   - limits:		0 <= x <= 100
 
 "shape2" (Beta)  *required
 Second parameter of the Beta distribution
   - class:		numeric
   - standalone:	yes
   - length:		exactly 1 value
   - value:		0.1
   - limits:		0 <= x <= 100
 </ul></div></li>
	<li id="example-GenerateBeta">No examples provided with template, sorry.</li>
	<li id="export-GenerateBeta">No examples provided with template, sorry.</li>
	<li id="source-GenerateBeta"><div>
<h5>Source of `GenerateBeta.tpl`</h5>
{% highlight text %}

<!--head
meta:
  title: Generate beta distribution
  author: Rapporter Team (@rapporter)
  description: Random generation for the Beta distribution with parameters.
  email: ~
  packages: nortest
  example: ~
inputs:
- name: 'n'
  label: Observations
  description: Number of observations
  class: numeric
  length:
    min: 1.0
    max: 1.0
  value: 100.0
  limit:
    min: 1.0
    max: .inf
  required: yes
  standalone: yes
- name: shape1
  label: Alpha
  description: First parameter of the Beta distribution
  class: numeric
  length:
    min: 1.0
    max: 1.0
  value: 0.1
  limit:
    min: 0.0
    max: 100.0
  required: yes
  standalone: yes
- name: shape2
  label: Beta
  description: Second parameter of the Beta distribution
  class: numeric
  length:
    min: 1.0
    max: 1.0
  value: 0.1
  limit:
    min: 0.0
    max: 100.0
  required: yes
  standalone: yes
head-->
# Histogram

The below [histogram](http://en.wikipedia.org/wiki/Histogram) shows the graphical representation of the estimated probability distribution (generated by the provided parameters).

<%=
g <- rbeta(n, shape1, shape2)
set.caption(paste0('rbeta(n = ', n, ', shape1 = ', shape1, ', shape2 = ', shape2, ')'))
hist(g, main = '', xlab = '')
%>

The plot was generated with `hist` command, the grid was added automatically.

# Descriptives

The [skewness](http://en.wikipedia.org/wiki/Skewness) is <%=skewness(g)%> and the [kurtosis](http://en.wikipedia.org/wiki/Kurtosis) is <%=kurtosis(g)%> based on the <%=n%> observations, although most [frequentists](http://xkcd.com/1132/) would be rather interested in the [mean](http://xkcd.com/207/) (<%=mean(g)%>) and standard deviation (<%=sd(g)%>).

But did we generated a [normal distribution](http://en.wikipedia.org/wiki/Normal_distribution) after all?

# Normality check

Various hypothesis tests can be applied in order to test if the distribution of given random variable violates normality assumption. These procedures test the H~0~ that provided variable's distribution is _normal_. At this point only few such tests will be covered: the ones that are available in `stats` package (which comes bundled with default R installation) and `nortest` package that is [available](http://cran.r-project.org/web/packages/nortest/index.html) on CRAN.

 - **Shapiro-Wilk test** is a powerful normality test appropriate for small samples. In R, it's implemented in `shapiro.test` function available in `stats` package.
 - **Lilliefors test** is a modification of _Kolmogorov-Smirnov test_ appropriate for testing normality when parameters or normal distribution ($\mu$, $\sigma^2$) are not known. `lillie.test` function is located in `nortest` package.
 - **Anderson-Darling test** is one of the most powerful normality tests as it will detect the most of departures from normality. You can find `ad.test` function in `nortest` package.
 - **Pearson $\chi^2$ test** is another normality test which takes more "traditional" approach in normality testing. `pearson.test` is located in `nortest` package.

## Results

Here you can see the results of applied normality tests (_p-values_ less than 0.05 indicate significant discrepancies):

<%=
if (length(g) > 5000) {
    h <- htest(g, lillie.test, ad.test, pearson.test)
} else {
    h <- htest(g, shapiro.test, lillie.test, ad.test, pearson.test)
}
p <- .05
h
-%>

So, let's draw some conclusions based on applied normality test:

<% if (!is.na(h[1, 3])) { -%>
 - based on _Lilliefors test_, the distribution is <%= ifelse(h[1, 3] < p, "not normal", "normal") %>
<% } %>
<% if (!is.na(h[2, 3])) { -%>
 - _Anderson-Darling test_ confirms <%= ifelse(h[2, 3] < p, "violation of", "") %> normality assumption
<% } %>
<% if (!is.na(h[3, 3])) { -%>
 - _Pearson's $\chi^2$ test_ classifies the underlying distribution as <%= ifelse(h[3, 3] < p, "non-normal", "normal") %>
<% } %>
<% if (length(g) > 5000) { -%>
 - according to _Shapiro-Wilk test_, the distribution is <%= ifelse(h[4, 3] < p, "not", "") %> normal.
<% } %>

## Q-Q Plot

"Q" in _Q-Q plot_ stands for _quantile_, as this plot compares empirical and theoretical distribution (in this case, _normal_ distribution) by plotting their quantiles against each other. For normal distribution, plotted dots should approximate a "straight", `x = y` line.

<%=
set.caption('Q-Q plot')
qqmath(g, panel=function(x){
            panel.qqmath(x)
            panel.qqmathline(x, distribution = qnorm)
}, xlab = "Theoretical Quantiles", ylab = "Empirical Quantiles")
%>

## Kernel Density Plot

_Kernel density plot_ is a plot of smoothed _empirical distribution function_. As such, it provides good insight about the shape of the distribution. For normal distributions, it should resemble the well known "bell shape".

<%=
set.caption('Kernel Density Plot')
rp.densityplot(g)
%>

{% endhighlight %}
</div></li>
</ul>

<a id="GLM"> </a>
#### GLM.tpl

 <ul class="tabs">
	<li><a class="active" href="#info-GLM">Description</a></li>
	<li><a href="#inputs-GLM">Inputs</a></li>
	<li><a href="#example-GLM">Example</a></li>
	<li><a href="#export-GLM">Export</a></li>
	<li><a href="#source-GLM">Source</a></li>
</ul>

 <ul class="tabs-content">
	<li class="active" id="info-GLM"><div><h5>GLM</h5> by <em>Daniel Nagy</em>
<br><br>
 In this template Rapporter will present you GLM.
<br><br>
<em>Required packages:</em> 
<br>
<em>Example:</em> 
{% highlight text %}
rapport('GLM.tpl', data=ius2008, dep='age', indep=c('leisure','edu'), family='poisson')
rapport('GLM.tpl', data=ius2008, dep='age', indep=c('leisure','edu'), indep.inter=FALSE, family='poisson')
rapport('GLM.tpl', data=ius2008, dep='age', indep=c('leisure','edu'), indep.inter=FALSE, family='Gamma')
{% endhighlight %}
</div></li>
	<li id="inputs-GLM"><div><h5>Input parameters</h5><em>GLM.tpl</em> template has the following options to be (optionally) set while calling <em>rapport</em>:<ul>
	
 Inputs
 
 "dep" (Dependent Variable)  *required
 These are the dependent variables which will be used here
   - class:		numeric
   - standalone:	no
   - length:		from 1 to 100 vectors
 
 "indep" (Independent Variable)  *required
 These are the independent variables which will be used here
   - class:		numeric
   - standalone:	no
   - length:		from 1 to 100 vectors
 
 "indep.inter" (Interaction)
 Interaction between the independent variables
   - class:		logical
   - standalone:	yes
   - length:		exactly 1 value
   - value:		TRUE
 
 "family" (Method of GLM)
   - class:		character
   - standalone:	yes
   - length:		exactly 1 value
   - matchable:		TRUE
   - options:		"gaussian", "binomial", "Gamma" and "poisson"
   - value:		"gaussian"
 </ul></div></li>
	<li id="example-GLM">
{% highlight text %}


###########################################################################################################
##	 Running: rapport('GLM.tpl', data=ius2008, dep='age', indep=c('leisure','edu'), family='poisson')
###########################################################################################################

# Introduction


[Generalized Linear Model (GLM)](http://en.wikipedia.org/wiki/Generalized_linear_model) is a generalization of the ordinary [Linear Regression](http://en.wikipedia.org/wiki/Linear_regression). While using GLM we don't need the assumption of normality for response variables. There are two basic ideas of the model: It allows the linear model to be related to the response variable via a link function and the magnitude of the variance of each measurement to be a function of its predicted value. An extinsion to the GLM is the [Hierarchical generalized linear model](https://en.wikipedia.org/wiki/Hierarchical_generalized_linear_model).



#Overview

Multivariate-General Linear Model was carried out, with _Internet usage in leisure time (hours per day)_ and _Internet usage for educational purposes (hours per day)_ as independent variables, and _Age_ as a dependent variable.
The [interaction](http://en.wikipedia.org/wiki/Interaction) between the independent variables was taken into account.




--------------------------------------------------------------
     &nbsp;        Estimate   Std. Error   z value   Pr(>|z|) 
----------------- ---------- ------------ --------- ----------
 **(Intercept)**    3.198      0.02122      150.7       0     

   **leisure**     -0.02021    0.005847    -3.457    0.000547 

     **edu**       0.01474     0.007586     1.944    0.05196  

 **leisure:edu**   0.004439    0.001795     2.472    0.01342  
--------------------------------------------------------------

Table: Fitting General Linear Model: age based on _leisure_ and _edu_



From the table one can see that 
* (Intercept) has significant effect on the dependent variable, the p-value of that is 0 
* leisure has significant effect on the dependent variable, the p-value of that is 0.001 
* leisure:edu has significant effect on the dependent variable, the p-value of that is 0.013 

<!-- end of list -->



##############################################################################################################################
##	 Running: rapport('GLM.tpl', data=ius2008, dep='age', indep=c('leisure','edu'), indep.inter=FALSE, family='poisson')
##############################################################################################################################

# Introduction


[Generalized Linear Model (GLM)](http://en.wikipedia.org/wiki/Generalized_linear_model) is a generalization of the ordinary [Linear Regression](http://en.wikipedia.org/wiki/Linear_regression). While using GLM we don't need the assumption of normality for response variables. There are two basic ideas of the model: It allows the linear model to be related to the response variable via a link function and the magnitude of the variance of each measurement to be a function of its predicted value. An extinsion to the GLM is the [Hierarchical generalized linear model](https://en.wikipedia.org/wiki/Hierarchical_generalized_linear_model).



#Overview

Multivariate-General Linear Model was carried out, with _Internet usage in leisure time (hours per day)_ and _Internet usage for educational purposes (hours per day)_ as independent variables, and _Age_ as a dependent variable.
The [interaction](http://en.wikipedia.org/wiki/Interaction) between the independent variables wasn't taken into account.




--------------------------------------------------------------
     &nbsp;        Estimate   Std. Error   z value   Pr(>|z|) 
----------------- ---------- ------------ --------- ----------
 **(Intercept)**    3.163      0.01605      197.1       0     

   **leisure**     -0.0095     0.003888    -2.443    0.01455  

     **edu**       0.03071     0.003883     7.91    2.581e-15 
--------------------------------------------------------------

Table: Fitting General Linear Model: age based on _leisure_ and _edu_



From the table one can see that 
* (Intercept) has significant effect on the dependent variable, the p-value of that is 0 
* leisure has significant effect on the dependent variable, the p-value of that is 0.015 
* edu has significant effect on the dependent variable, the p-value of that is 0 

<!-- end of list -->



############################################################################################################################
##	 Running: rapport('GLM.tpl', data=ius2008, dep='age', indep=c('leisure','edu'), indep.inter=FALSE, family='Gamma')
############################################################################################################################

# Introduction


[Generalized Linear Model (GLM)](http://en.wikipedia.org/wiki/Generalized_linear_model) is a generalization of the ordinary [Linear Regression](http://en.wikipedia.org/wiki/Linear_regression). While using GLM we don't need the assumption of normality for response variables. There are two basic ideas of the model: It allows the linear model to be related to the response variable via a link function and the magnitude of the variance of each measurement to be a function of its predicted value. An extinsion to the GLM is the [Hierarchical generalized linear model](https://en.wikipedia.org/wiki/Hierarchical_generalized_linear_model).



#Overview

Multivariate-General Linear Model was carried out, with _Internet usage in leisure time (hours per day)_ and _Internet usage for educational purposes (hours per day)_ as independent variables, and _Age_ as a dependent variable.
The [interaction](http://en.wikipedia.org/wiki/Interaction) between the independent variables wasn't taken into account.




--------------------------------------------------------------
     &nbsp;        Estimate   Std. Error   t value   Pr(>|t|) 
----------------- ---------- ------------ --------- ----------
 **(Intercept)**    0.0422    0.0008599     49.08   4.612e-212

   **leisure**    0.0003828   0.0002093     1.829    0.06785  

     **edu**      -0.001182   0.0001948    -6.065   2.332e-09 
--------------------------------------------------------------

Table: Fitting General Linear Model: age based on _leisure_ and _edu_



From the table one can see that 
* (Intercept) has significant effect on the dependent variable, the p-value of that is 0 
* edu has significant effect on the dependent variable, the p-value of that is 0 

<!-- end of list -->



{% endhighlight %}
</li>
	<li id="export-GLM"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport('GLM.tpl', data=ius2008, dep='age', indep=c('leisure','edu'), family='poisson')
rapport('GLM.tpl', data=ius2008, dep='age', indep=c('leisure','edu'), indep.inter=FALSE, family='poisson')
rapport('GLM.tpl', data=ius2008, dep='age', indep=c('leisure','edu'), indep.inter=FALSE, family='Gamma')

{% endhighlight %}
<h6>Popular formats:</h6>
<ul>
	<li><a href="demo/GLM.html" target="_blank">HTML</a></li>
	<li><a href="demo/GLM.pdf" target="_blank">pdf</a></li>
	<li><a href="demo/GLM.docx">docx (MS Word 2007 format)</a></li>
	<li><a href="demo/GLM.odt">odt (MS Word compatible)</a></li>
	<li><a href="demo/GLM.rtf">rtf (MS Word compatible)</a></li>
	<li><a href="demo/GLM.epub">epub</a></li>
</ul>
<h6>Other morkdown formats</h6>
<ul>
	<li><a href="demo/GLM.textile" target="_blank">textile</a></li>
	<li><a href="demo/GLM.docbook" target="_blank">docbook</a></li>
	<li><a href="demo/GLM.man" target="_blank">man</a></li>
	<li><a href="demo/GLM.md" target="_blank">markdown</a></li>
	<li><a href="demo/GLM.mediawiki" target="_blank">mediawiki</a></li>
	<li><a href="demo/GLM.wiki" target="_blank">wiki</a></li>
	<li><a href="demo/GLM.org" target="_blank">org</a></li>
	<li><a href="demo/GLM.pandoc" target="_blank">pandoc</a></li>
</ul>
</div></li>
	<li id="source-GLM"><div>
<h5>Source of `GLM.tpl`</h5>
{% highlight text %}

<!--head
meta:
  title: GLM
  author: Daniel Nagy
  description: In this template Rapporter will present you GLM.
  email: ~
  packages: ~
  example:
  - rapport('GLM.tpl', data=ius2008, dep='age', indep=c('leisure','edu'), family='poisson')
  - rapport('GLM.tpl', data=ius2008, dep='age', indep=c('leisure','edu'), indep.inter=FALSE, family='poisson')
  - rapport('GLM.tpl', data=ius2008, dep='age', indep=c('leisure','edu'), indep.inter=FALSE, family='Gamma')
inputs:
- name: dep
  label: Dependent Variable
  description: These are the dependent variables which will be used here
  class: numeric
  length:
    min: 1.0
    max: 100.0
  required: yes
  standalone: no
- name: indep
  label: Independent Variable
  description: These are the independent variables which will be used here
  class: numeric
  length:
    min: 1.0
    max: 100.0
  required: yes
  standalone: no
- name: indep.inter
  label : Interaction
  description: Interaction between the independent variables
  class: logical
  length:
    min: 1.0
    max: 1.0
  value: yes
  required: no
  standalone: yes
- name: family
  label: Method of GLM
  description: 
  class: character
  length:
    min: 1.0
    max: 1.0
  options:
  - gaussian
  - binomial
  - Gamma
  - poisson
  value: gaussian
  matchable: yes
  allow_multiple: no
  required: no
  standalone: yes
head-->


<% if (isTRUE(any(indep.name == dep.name))) { %>

You provided  the same variable as a dependent and as an independent variable. In this case the model does not make sense, please replace the duplicated variables in order to run the GLM.

<% } else { %>

<% if (indep < 0 | indep > 1 & family == "binomial") { %>
Values of the independent variables must be between 0 and 1 when binomial used as link function. Please change parameter family to one that is usable or switch the independent variable to meet the assumptions.

<% } else { %>


# Introduction

[Generalized Linear Model (GLM)](http://en.wikipedia.org/wiki/Generalized_linear_model) is a generalization of the ordinary [Linear Regression](http://en.wikipedia.org/wiki/Linear_regression). While using GLM we don't need the assumption of normality for response variables. There are two basic ideas of the model: It allows the linear model to be related to the response variable via a link function and the magnitude of the variance of each measurement to be a function of its predicted value. An extinsion to the GLM is the [Hierarchical generalized linear model](https://en.wikipedia.org/wiki/Hierarchical_generalized_linear_model).

<%=
d <- structure(na.omit(data.frame(dep, indep)), .Names = c(dep.name, indep.name))
indep.int <- fml(dep.name, indep.name, join.right = "*")
indep.nonint <- fml(dep.name, indep.name, join.right = "+")
suppressWarnings(fit <- glm(ifelse(indep.inter, indep.int, indep.nonint), data = d, family = family))
indep.plu <- switch(indep.ilen, '', 's')
%>

#Overview

<%= ifelse(indep.ilen == 1, '', 'Multivariate-') %>General Linear Model was carried out, with <%= p(indep.label) %> as independent variable<%= indep.plu %>, and <%= p(dep.label) %> as a dependent variable.
The [interaction](http://en.wikipedia.org/wiki/Interaction) between the independent variables was<%=ifelse(indep.inter, "", "n't")%> taken into account.



<%=
set.caption(sprintf('Fitting General Linear Model: %s based on %s', dep.name, p(indep.name)))
fit
p_val <- summary(fit)$coefficients[, 4]
%>

From the table one can see that <%= paste(pandoc.list.return(paste(rownames(summary(fit)$coefficients)[which(p_val < 0.05)], round(p_val, 3)[which(p_val < 0.05)], sep = " has significant effect on the dependent variable, the p-value of that is ")), collapse = '\n')
%>

<% }} %>


{% endhighlight %}
</div></li>
</ul>

<a id="HierarchicalClusterAnalysis"> </a>
#### HierarchicalClusterAnalysis.tpl

 <ul class="tabs">
	<li><a class="active" href="#info-HierarchicalClusterAnalysis">Description</a></li>
	<li><a href="#inputs-HierarchicalClusterAnalysis">Inputs</a></li>
	<li><a href="#example-HierarchicalClusterAnalysis">Example</a></li>
	<li><a href="#export-HierarchicalClusterAnalysis">Export</a></li>
	<li><a href="#source-HierarchicalClusterAnalysis">Source</a></li>
</ul>

 <ul class="tabs-content">
	<li class="active" id="info-HierarchicalClusterAnalysis"><div><h5>Hierarchical Cluster Analysis</h5> by <em>Daniel Nagy</em>
<br><br>
 In this template Rapporter will present you Hierarchical Cluster Analysis.
<br><br>
<em>Required packages:</em> mclust
<br>
<em>Example:</em> 
{% highlight text %}
rapport('HierarchicalClusterAnalysis.tpl', data = ius2008, vars = c('age', 'edu'))
rapport('HierarchicalClusterAnalysis.tpl', data=ius2008, vars = c('age', 'edu'), clust.num = 30)
rapport('HierarchicalClusterAnalysis.tpl', data = mtcars, vars = c('drat', 'cyl', 'mpg'), clust.num = 30, method = "average")
{% endhighlight %}
</div></li>
	<li id="inputs-HierarchicalClusterAnalysis"><div><h5>Input parameters</h5><em>HierarchicalClusterAnalysis.tpl</em> template has the following options to be (optionally) set while calling <em>rapport</em>:<ul>
	
 Inputs
 
 "vars" (Used Variables)  *required
   - class:		numeric
   - standalone:	no
   - length:		from 2 to 5000 vectors
 
 "dist.mat" (Distance Matrix)
 Is your data a Distance matrix?
   - class:		logical
   - standalone:	yes
   - length:		exactly 1 value
   - value:		FALSE
 
 "method" (Method)
   - class:		character
   - standalone:	yes
   - length:		exactly 1 value
   - matchable:		TRUE
   - options:		"ward", "single", "complete", "average", "mcquitty", "median" and "centroid"
   - value:		"ward"
 
 "clust.num" (Number of Clusters)
 How many clusters you want to check on the Dendogram?
   - class:		integer
   - standalone:	yes
   - length:		exactly 1 value
   - limits:		2 <= x <= 9999
 </ul></div></li>
	<li id="example-HierarchicalClusterAnalysis">
{% highlight text %}


######################################################################################################
##	 Running: rapport('HierarchicalClusterAnalysis.tpl', data = ius2008, vars = c('age', 'edu'))
######################################################################################################

# Introduction


[Hierarchical Cluster Analysis](http://en.wikipedia.org/wiki/Hierarchical_clustering) is a data mining method which seeks to build a hierarchy of clusters. Clusters are calculated based on the distances between the observations. At the beginning each observation is assigned to be a single cluster, later in every round the most similar clusters will be joined until all observations are in one cluster. One should not mix it up with [K-means Cluster Analysis](http://en.wikipedia.org/wiki/K-means_clustering), which calculates the clusters based on the final numbers of them.


# HCA


Below you can see on the plot how the clusters were made, how the observations were paired with each other. The horizontal linkage between the vertical lines indicates the stage where two clusters joined to each other. In the bottom of the plot you can see the clustering process in an other way, for each observations the shorter lines indicate later clustering. 

[![](plots/HierarchicalClusterAnalysis.tpl-6.png)](plots/HierarchicalClusterAnalysis.tpl-6-hires.png)



We can say that _438_ observations have the same values on the used variables, so they were joined in the first _438_ round. After that _40_ times there were only made clusters with 2 observations, the first cluster that contains 3 was made in the round _478_.



### Optimal number of clusters



According to the BIC for EM initialized by hierarchical clustering for parameterized Gaussian mixture models, the optimum numbers of the clusters are _8_.

Let's see how the Dendogram looks like when we the optimal number of the clusters (_8_) plotted in it.
[![](plots/HierarchicalClusterAnalysis.tpl-2.png)](plots/HierarchicalClusterAnalysis.tpl-2-hires.png)


####################################################################################################################
##	 Running: rapport('HierarchicalClusterAnalysis.tpl', data=ius2008, vars = c('age', 'edu'), clust.num = 30)
####################################################################################################################

# Introduction


[Hierarchical Cluster Analysis](http://en.wikipedia.org/wiki/Hierarchical_clustering) is a data mining method which seeks to build a hierarchy of clusters. Clusters are calculated based on the distances between the observations. At the beginning each observation is assigned to be a single cluster, later in every round the most similar clusters will be joined until all observations are in one cluster. One should not mix it up with [K-means Cluster Analysis](http://en.wikipedia.org/wiki/K-means_clustering), which calculates the clusters based on the final numbers of them.


# HCA


Below you can see on the plot how the clusters were made, how the observations were paired with each other. The horizontal linkage between the vertical lines indicates the stage where two clusters joined to each other. In the bottom of the plot you can see the clustering process in an other way, for each observations the shorter lines indicate later clustering. 

The red boxes shows the last 30 clusters.
[![](plots/HierarchicalClusterAnalysis.tpl-3.png)](plots/HierarchicalClusterAnalysis.tpl-3-hires.png)



We can say that _438_ observations have the same values on the used variables, so they were joined in the first _438_ round. After that _40_ times there were only made clusters with 2 observations, the first cluster that contains 3 was made in the round _478_.



### Optimal number of clusters



According to the BIC for EM initialized by hierarchical clustering for parameterized Gaussian mixture models, the optimum numbers of the clusters are _8_.


Let's see how the Dendogram looks like when we the optimal number of the clusters plotted in it.
[![](plots/HierarchicalClusterAnalysis.tpl-2.png)](plots/HierarchicalClusterAnalysis.tpl-2-hires.png)


#################################################################################################################################################
##	 Running: rapport('HierarchicalClusterAnalysis.tpl', data = mtcars, vars = c('drat', 'cyl', 'mpg'), clust.num = 30, method = "average")
#################################################################################################################################################

# Introduction


[Hierarchical Cluster Analysis](http://en.wikipedia.org/wiki/Hierarchical_clustering) is a data mining method which seeks to build a hierarchy of clusters. Clusters are calculated based on the distances between the observations. At the beginning each observation is assigned to be a single cluster, later in every round the most similar clusters will be joined until all observations are in one cluster. One should not mix it up with [K-means Cluster Analysis](http://en.wikipedia.org/wiki/K-means_clustering), which calculates the clusters based on the final numbers of them.


# HCA


Below you can see on the plot how the clusters were made, how the observations were paired with each other. The horizontal linkage between the vertical lines indicates the stage where two clusters joined to each other. In the bottom of the plot you can see the clustering process in an other way, for each observations the shorter lines indicate later clustering. 

The red boxes shows the last 30 clusters.
[![](plots/HierarchicalClusterAnalysis.tpl-4.png)](plots/HierarchicalClusterAnalysis.tpl-4-hires.png)



We can say that _1_ observations have the same values on the used variables, so they were joined in the first _1_ round. After that _8_ times there were only made clusters with 2 observations, the first cluster that contains 3 was made in the round _9_.



### Optimal number of clusters



According to the BIC for EM initialized by hierarchical clustering for parameterized Gaussian mixture models, the optimum numbers of the clusters are _7_.


Let's see how the Dendogram looks like when we the optimal number of the clusters plotted in it.
[![](plots/HierarchicalClusterAnalysis.tpl-7.png)](plots/HierarchicalClusterAnalysis.tpl-7-hires.png)


{% endhighlight %}
</li>
	<li id="export-HierarchicalClusterAnalysis"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport('HierarchicalClusterAnalysis.tpl', data = ius2008, vars = c('age', 'edu'))
rapport('HierarchicalClusterAnalysis.tpl', data=ius2008, vars = c('age', 'edu'), clust.num = 30)
rapport('HierarchicalClusterAnalysis.tpl', data = mtcars, vars = c('drat', 'cyl', 'mpg'), clust.num = 30, method = "average")

{% endhighlight %}
<h6>Popular formats:</h6>
<ul>
	<li><a href="demo/HierarchicalClusterAnalysis.html" target="_blank">HTML</a></li>
	<li><a href="demo/HierarchicalClusterAnalysis.pdf" target="_blank">pdf</a></li>
	<li><a href="demo/HierarchicalClusterAnalysis.docx">docx (MS Word 2007 format)</a></li>
	<li><a href="demo/HierarchicalClusterAnalysis.odt">odt (MS Word compatible)</a></li>
	<li><a href="demo/HierarchicalClusterAnalysis.rtf">rtf (MS Word compatible)</a></li>
	<li><a href="demo/HierarchicalClusterAnalysis.epub">epub</a></li>
</ul>
<h6>Other morkdown formats</h6>
<ul>
	<li><a href="demo/HierarchicalClusterAnalysis.textile" target="_blank">textile</a></li>
	<li><a href="demo/HierarchicalClusterAnalysis.docbook" target="_blank">docbook</a></li>
	<li><a href="demo/HierarchicalClusterAnalysis.man" target="_blank">man</a></li>
	<li><a href="demo/HierarchicalClusterAnalysis.md" target="_blank">markdown</a></li>
	<li><a href="demo/HierarchicalClusterAnalysis.mediawiki" target="_blank">mediawiki</a></li>
	<li><a href="demo/HierarchicalClusterAnalysis.wiki" target="_blank">wiki</a></li>
	<li><a href="demo/HierarchicalClusterAnalysis.org" target="_blank">org</a></li>
	<li><a href="demo/HierarchicalClusterAnalysis.pandoc" target="_blank">pandoc</a></li>
</ul>
</div></li>
	<li id="source-HierarchicalClusterAnalysis"><div>
<h5>Source of `HierarchicalClusterAnalysis.tpl`</h5>
{% highlight text %}

<!--head
meta:
  title: Hierarchical Cluster Analysis
  author: Daniel Nagy
  description: In this template Rapporter will present you Hierarchical Cluster Analysis.
  email: ~
  packages:
  - mclust
  example: ~
inputs:
- name: vars
  label: Used Variables
  description:
  class: numeric
  length:
    min: 2.0
    max: 5000.0
  required: yes
  standalone: no
- name: dist.mat
  label : Distance Matrix
  description: Is your data a Distance matrix?
  class: logical
  value: no
  required: no
  standalone: yes
- name: method
  label: Method
  description: 
  class: character
  length:
    min: 1.0
    max: 1.0
  options:
  - ward
  - single
  - complete
  - average
  - mcquitty
  - median
  - centroid
  value: ward
  matchable: yes
  allow_multiple: no
  required: no
  standalone: yes
- name: clust.num
  label: Number of Clusters
  description: How many clusters you want to check on the Dendogram?
  class: integer
  limit:
    min: 2.0
    max: 9999.0
  required: no
  standalone: yes
head-->


# Introduction

[Hierarchical Cluster Analysis](http://en.wikipedia.org/wiki/Hierarchical_clustering) is a data mining method which seeks to build a hierarchy of clusters. Clusters are calculated based on the distances between the observations. At the beginning each observation is assigned to be a single cluster, later in every round the most similar clusters will be joined until all observations are in one cluster. One should not mix it up with [K-means Cluster Analysis](http://en.wikipedia.org/wiki/K-means_clustering), which calculates the clusters based on the final numbers of them.

# HCA

Below you can see on the plot how the clusters were made, how the observations were paired with each other. The horizontal linkage between the vertical lines indicates the stage where two clusters joined to each other. In the bottom of the plot you can see the clustering process in an other way, for each observations the shorter lines indicate later clustering. 

<%=
variables <- scale(na.omit(vars))
if (!dist.mat) {
d <- dist(variables) 
} else { 
d <- variables
}
try(HCA <- hclust(d,method))
if (exists('HCA') && !is.null(HCA)) { 
} else {
d <- dist(variables)
HCA <- hclust(d,method)
}
%>

<% if (exists('clust.num') && !is.null(clust.num) && clust.num > 0) { %>
<% if (length(HCA$order) <= clust.num) { %>
The number of the clusters cannot be equal or higher than the unique cases (<%=length(HCA$order)%>), which you set (<%=clust.num%>), was <%=ifelse(length(HCA$order) == clust.num, "equal", "higher")%>. In the following, we will use the maximum available number of the clusters (<%=length(HCA$order) -1%>).
<%= clust.num <- length(HCA$order) -1 %>
<% } %>
<%=paste("The red boxes shows the last", clust.num, "clusters.") %>
<%=
plclust(HCA, labels = F, main = "HCA", xlab = "Hierarchical Cluster Analysis", sub = "")
+rect.hclust(HCA, k = clust.num, border = "red")
%>
<% } else { %>
<%= 
plclust(HCA, labels = F, main = "HCA", xlab = "Hierarchical Cluster Analysis", sub = "") 
%>
<% } %>

We can say that <%=length(which(HCA$height == 0))%> observations have the same values on the used variables, so they were joined in the first <%=length(which(HCA$height == 0))%> round. After that <%=which(HCA$merge[, 1] >= 0)[1]-length(which(HCA$height == 0))%> times there were only made clusters with 2 observations, the first cluster that contains 3 was made in the round <%=which(HCA$merge[, 1] >= 0)[1]%>.


### Optimal number of clusters

<%= mod1 <-  suppressWarnings(Mclust(variables))%>

According to the BIC for EM initialized by hierarchical clustering for parameterized Gaussian mixture models, the optimum numbers of the clusters are <%=summary(mod1)$G%>.
<% if (exists('clust.num') && !is.null(clust.num) && clust.num > 0) { %>
<% if (summary(mod1)$G != clust.num) { %>
Let's see how the Dendogram looks like when we the optimal number of the clusters plotted in it.
<%=plclust(HCA, labels = F, main = "HCA", xlab = "Hierarchical Cluster Analysis",sub = "")
+rect.hclust(HCA, k = summary(mod1)$G, border = "red")%>
<% } else { %>
So we can see the optimum number of the clusters on the plot above.
<% } %>
<% } else { %>
Let's see how the Dendogram looks like when we the optimal number of the clusters (<%=summary(mod1)$G%>) plotted in it.
<%=plclust(HCA, labels = F, main = "HCA", xlab = "Hierarchical Cluster Analysis",sub = "")
+rect.hclust(HCA, k = summary(mod1)$G, border = "red")%>
<% } %>


{% endhighlight %}
</div></li>
</ul>

<a id="HomogeneityCrosstable"> </a>
#### HomogeneityCrosstable.tpl

 <ul class="tabs">
	<li><a class="active" href="#info-HomogeneityCrosstable">Description</a></li>
	<li><a href="#inputs-HomogeneityCrosstable">Inputs</a></li>
	<li><a href="#example-HomogeneityCrosstable">Example</a></li>
	<li><a href="#export-HomogeneityCrosstable">Export</a></li>
	<li><a href="#source-HomogeneityCrosstable">Source</a></li>
</ul>

 <ul class="tabs-content">
	<li class="active" id="info-HomogeneityCrosstable"><div><h5>Homogeneity test of factor variables</h5> by <em>Gergely Daróczi, Daniel Nagy</em>
<br><br>
 Test of homogeneity of a given factor variable split by another factor.
<br><br>
<em>Required packages:</em> descr
<br>
<em>Example:</em> 
{% highlight text %}
rapport('HomogeneityCrosstable', data=ius2008, var='gender', split='dwell')
{% endhighlight %}
</div></li>
	<li id="inputs-HomogeneityCrosstable"><div><h5>Input parameters</h5><em>HomogeneityCrosstable.tpl</em> template has the following options to be (optionally) set while calling <em>rapport</em>:<ul>
	
 Inputs
 
 "var" (Variable to analyse)  *required
 Variable to analyse
   - class:		factor
   - standalone:	no
   - length:		exactly 1 vector
 
 "split" (Split variable)  *required
 Split variable
   - class:		factor
   - standalone:	no
   - length:		exactly 1 vector
 </ul></div></li>
	<li id="example-HomogeneityCrosstable">
{% highlight text %}


###############################################################################################
##	 Running: rapport('HomogeneityCrosstable', data=ius2008, var='gender', split='dwell')
###############################################################################################

# Variable description


Analysing "gender" ("Gender") with _673_ valid values whether frequency counts are distributed equally across different categories of "dwell" ("Dwelling").

"dwell" has _3_ categories:


  * city
  * small town
  * village

<!-- end of list -->



# Counts


------------------------------------------------
          &nbsp;  male   female   Missing   Sum 
---------------- ------ -------- --------- -----
        **city**  338     234       27      599 

  **small town**   28      3         2      33  

     **village**   19      9         2      30  

     **Missing**   25      17        5      47  

         **Sum**  410     263       36      709 
------------------------------------------------

Table: Counted values: "dwell" and "gender"


# Chi-squared test


Our [null hypothetis](http://en.wikipedia.org/wiki/Null_hypothesis) says that the proportion of *gender* is indentical in each categories of *dwell*.


---------------------------------
 Test statistic   df    P value  
---------------- ---- -----------
     16.18        6   _0.01282_ *
---------------------------------

Table: Pearson's Chi-squared test: `table`



The chi-squared test returned the value of _16.18_ with a degree of freedom being _6_. Based on the returned [p value](http://en.wikipedia.org/wiki/P-value) (_0.01282_) we could state that the null hypothesis is rejected.




{% endhighlight %}
</li>
	<li id="export-HomogeneityCrosstable"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport('HomogeneityCrosstable', data=ius2008, var='gender', split='dwell')

{% endhighlight %}
<h6>Popular formats:</h6>
<ul>
	<li><a href="demo/HomogeneityCrosstable.html" target="_blank">HTML</a></li>
	<li><a href="demo/HomogeneityCrosstable.pdf" target="_blank">pdf</a></li>
	<li><a href="demo/HomogeneityCrosstable.docx">docx (MS Word 2007 format)</a></li>
	<li><a href="demo/HomogeneityCrosstable.odt">odt (MS Word compatible)</a></li>
	<li><a href="demo/HomogeneityCrosstable.rtf">rtf (MS Word compatible)</a></li>
	<li><a href="demo/HomogeneityCrosstable.epub">epub</a></li>
</ul>
<h6>Other morkdown formats</h6>
<ul>
	<li><a href="demo/HomogeneityCrosstable.textile" target="_blank">textile</a></li>
	<li><a href="demo/HomogeneityCrosstable.docbook" target="_blank">docbook</a></li>
	<li><a href="demo/HomogeneityCrosstable.man" target="_blank">man</a></li>
	<li><a href="demo/HomogeneityCrosstable.md" target="_blank">markdown</a></li>
	<li><a href="demo/HomogeneityCrosstable.mediawiki" target="_blank">mediawiki</a></li>
	<li><a href="demo/HomogeneityCrosstable.wiki" target="_blank">wiki</a></li>
	<li><a href="demo/HomogeneityCrosstable.org" target="_blank">org</a></li>
	<li><a href="demo/HomogeneityCrosstable.pandoc" target="_blank">pandoc</a></li>
</ul>
</div></li>
	<li id="source-HomogeneityCrosstable"><div>
<h5>Source of `HomogeneityCrosstable.tpl`</h5>
{% highlight text %}

<!--head
meta:
  title: Homogeneity test of factor variables
  author: Gergely Daróczi, Daniel Nagy
  description: Test of homogeneity of a given factor variable split by another factor.
  packages: 
  - descr
  example:
  - rapport('HomogeneityCrosstable', data=ius2008, var='gender', split='dwell')
inputs:
- name: var
  label: Variable to analyse
  description: Variable to analyse
  class: factor
  length:
    min: 1.0
    max: 1.0
  value: ~
  required: yes
  standalone: no
- name: split
  label: Split variable
  description: Split variable
  class: factor
  length:
    min: 1.0
    max: 1.0
  value: ~
  required: yes
  standalone: no
head-->

# Variable description

Analysing "<%=rp.name(var)%>"<%=ifelse(rp.label(var) == rp.name(var), '', sprintf(' ("%s")', rp.label(var)))%> with <%=rp.valid(as.numeric(var))%> valid values whether frequency counts are distributed equally across different categories of "<%=rp.name(split)%>"<%=ifelse(rp.label(split) == rp.name(split), '', sprintf(' ("%s")', rp.label(split)))%>.

"<%=rp.name(split)%>" has <%=split.cat <- names(table(split)); length(split.cat)%> categories:
<%=as.list(split.cat)%>

# Counts

<%=
table	<- table(split, var, deparse.level = 0, useNA = 'ifany')
if (length(which(is.na(rownames(table)))) > 0) {
    rownames(table)[which(is.na(rownames(table)))] <- 'Missing' }
if (length(which(is.na(colnames(table)))) > 0) {
    colnames(table)[which(is.na(colnames(table)))] <- 'Missing' }
fulltable	<- addmargins(table)
set.caption(sprintf('Counted values: "%s" and "%s"', rp.name(split), rp.name(var)))
set.alignment(row.names = "right")
fulltable
%>

# Chi-squared test

Our [null hypothetis](http://en.wikipedia.org/wiki/Null_hypothesis) says that the proportion of *<%=rp.name(var)%>* is indentical in each categories of *<%=rp.name(split)%>*.

<%=
t <- suppressWarnings(chisq.test(table))
t
%>

The chi-squared test returned the value of <%=as.numeric(t$statistic)%> with a degree of freedom being <%=as.numeric(t$parameter)%>. Based on the returned [p value](http://en.wikipedia.org/wiki/P-value) (<%=t$p.value%>) we could state that the null hypothesis is <%=ifelse(t$p.value < 0.05, 'rejected', 'accepted')%>.



{% endhighlight %}
</div></li>
</ul>

<a id="KMeansCluster"> </a>
#### KMeansCluster.tpl

 <ul class="tabs">
	<li><a class="active" href="#info-KMeansCluster">Description</a></li>
	<li><a href="#inputs-KMeansCluster">Inputs</a></li>
	<li><a href="#example-KMeansCluster">Example</a></li>
	<li><a href="#export-KMeansCluster">Export</a></li>
	<li><a href="#source-KMeansCluster">Source</a></li>
</ul>

 <ul class="tabs-content">
	<li class="active" id="info-KMeansCluster"><div><h5>K-means cluster</h5> by <em>Gergely Daróczi, Daniel Nagy</em>
<br><br>
 K-means clustering with automatically estimated number of clusters
<br><br>
<em>Required packages:</em> cluster
<br>
<em>Example:</em> 
{% highlight text %}
rapport('KMeansCluster.tpl', data=ius2008, vars=c('age', 'edu', 'leisure'))
rapport('KMeansCluster.tpl', data=mtcars, vars=c('drat', 'cyl', 'wt', 'mpg'))
rapport('KMeansCluster.tpl', data=mtcars, vars=c('drat', 'cyl', 'wt', 'mpg'), clust_num=7)
{% endhighlight %}
</div></li>
	<li id="inputs-KMeansCluster"><div><h5>Input parameters</h5><em>KMeansCluster.tpl</em> template has the following options to be (optionally) set while calling <em>rapport</em>:<ul>
	
 Inputs
 
 "vars" (Input variables)  *required
 These are the input variables which will be used here
   - class:		numeric
   - standalone:	no
   - length:		from 1 to 1000 vectors
 
 "clust_num" (Number of Clusters)
 One can set the Number of the Clusters for the K-Mean Clustering
   - class:		integer
   - standalone:	yes
   - length:		exactly 1 value
   - limits:		2 <= x <= 9999
 </ul></div></li>
	<li id="example-KMeansCluster">
{% highlight text %}


###############################################################################################
##	 Running: rapport('KMeansCluster.tpl', data=ius2008, vars=c('age', 'edu', 'leisure'))
###############################################################################################

## Introduction


[K-means Clustering](http://en.wikipedia.org/wiki/K-means_clustering) is a specific and one of the most widespread method of [clustering](http://en.wikipedia.org/wiki/Cluster_analysis). With clustering we want to divide our data into groups, which in the objects are similar to each other. K-means clustering is specified in the way, here we set the number of groups we want to make. In our case we will take into account the following variables: _Age_, _Internet usage for educational purposes (hours per day)_ and _Internet usage in leisure time (hours per day)_, to find out which observations are the nearest to each other.


## References


J. B. MacQueen (1967). _"Some Methods for classification and Analysis of Multivariate Observations, Proceedings of 5-th Berkeley Symposium on Mathematical Statistics and Probability"_. 1:281-297


## Determining the number of clusters


As it was mentioned above, the speciality of the K-means Cluster method is to set the number of groups we want to produce. 




Let's see how to decide which is the ideal number of them!

[![](plots/KMeansCluster.tpl-6.png)](plots/KMeansCluster.tpl-6-hires.png)


We can figure out that, as we see how much the Within groups sum of squares decreases if we set a higher number of the groups. So the smaller the difference the smaller the gain we can do with increasing the number of the clusters (thus in this case the larger decreasing means the bigger gain).


The ideal number of clusters seems to be _2_.





## Cluster means


The method of the K-means clustering starts with the step to set k number of centorids which could be the center of the groups we want to form. After that there comes several iterations, meanwhile the ideal centers are being calculated.

The centroids are the observations which are the nearest in average to all the other observations of their group. But it could be also interesting which are the typical values of the clusters! One way to figure out these typical values is to see the group means. The _2_ cluster averages are:


----------------------------------------
         &nbsp;  age     edu    leisure 
--------------- ------ ------- ---------
  **1.Cluster** 0.3344  1.182    1.002  

  **2.Cluster** -0.109 -0.3853  -0.3265 
----------------------------------------



The size of the above clusters are: _148_ and _454_.


## Results


On the chart below we can see the produced groups. To distinct which observation is related to which cluster each of the objects from the same groups have the same figure and there is a circle which shows the border of the clusters.

[![](plots/KMeansCluster.tpl-7.png)](plots/KMeansCluster.tpl-7-hires.png)


#################################################################################################
##	 Running: rapport('KMeansCluster.tpl', data=mtcars, vars=c('drat', 'cyl', 'wt', 'mpg'))
#################################################################################################

## Introduction


[K-means Clustering](http://en.wikipedia.org/wiki/K-means_clustering) is a specific and one of the most widespread method of [clustering](http://en.wikipedia.org/wiki/Cluster_analysis). With clustering we want to divide our data into groups, which in the objects are similar to each other. K-means clustering is specified in the way, here we set the number of groups we want to make. In our case we will take into account the following variables: _drat_, _cyl_, _wt_ and _mpg_, to find out which observations are the nearest to each other.


## References


J. B. MacQueen (1967). _"Some Methods for classification and Analysis of Multivariate Observations, Proceedings of 5-th Berkeley Symposium on Mathematical Statistics and Probability"_. 1:281-297


## Determining the number of clusters


As it was mentioned above, the speciality of the K-means Cluster method is to set the number of groups we want to produce. 




Let's see how to decide which is the ideal number of them!

[![](plots/KMeansCluster.tpl-8.png)](plots/KMeansCluster.tpl-8-hires.png)


We can figure out that, as we see how much the Within groups sum of squares decreases if we set a higher number of the groups. So the smaller the difference the smaller the gain we can do with increasing the number of the clusters (thus in this case the larger decreasing means the bigger gain).


The ideal number of clusters seems to be _2_.





## Cluster means


The method of the K-means clustering starts with the step to set k number of centorids which could be the center of the groups we want to form. After that there comes several iterations, meanwhile the ideal centers are being calculated.

The centroids are the observations which are the nearest in average to all the other observations of their group. But it could be also interesting which are the typical values of the clusters! One way to figure out these typical values is to see the group means. The _2_ cluster averages are:


----------------------------------------------
         &nbsp;  drat    cyl     wt      mpg  
--------------- ------ ------- ------- -------
  **1.Cluster** -0.882 0.9349  0.8204  -0.8008

  **2.Cluster** 0.3698 0.05499 -0.1447 -0.1122

  **3.Cluster** 0.8872 -1.225  -0.952   1.091 
----------------------------------------------



The size of the above clusters are: _14_, _7_ and _11_.


## Results


On the chart below we can see the produced groups. To distinct which observation is related to which cluster each of the objects from the same groups have the same figure and there is a circle which shows the border of the clusters.

[![](plots/KMeansCluster.tpl-9.png)](plots/KMeansCluster.tpl-9-hires.png)


##############################################################################################################
##	 Running: rapport('KMeansCluster.tpl', data=mtcars, vars=c('drat', 'cyl', 'wt', 'mpg'), clust_num=7)
##############################################################################################################

## Introduction


[K-means Clustering](http://en.wikipedia.org/wiki/K-means_clustering) is a specific and one of the most widespread method of [clustering](http://en.wikipedia.org/wiki/Cluster_analysis). With clustering we want to divide our data into groups, which in the objects are similar to each other. K-means clustering is specified in the way, here we set the number of groups we want to make. In our case we will take into account the following variables: _drat_, _cyl_, _wt_ and _mpg_, to find out which observations are the nearest to each other.


## References


J. B. MacQueen (1967). _"Some Methods for classification and Analysis of Multivariate Observations, Proceedings of 5-th Berkeley Symposium on Mathematical Statistics and Probability"_. 1:281-297


## Determining the number of clusters


As it was mentioned above, the speciality of the K-means Cluster method is to set the number of groups we want to produce. 



As you set, there will be a _7_-means cluster analysis provided.


## Cluster means


The method of the K-means clustering starts with the step to set k number of centorids which could be the center of the groups we want to form. After that there comes several iterations, meanwhile the ideal centers are being calculated.

The centroids are the observations which are the nearest in average to all the other observations of their group. But it could be also interesting which are the typical values of the clusters! One way to figure out these typical values is to see the group means. The  cluster averages are:


-------------------------------------------------
         &nbsp;  drat     cyl      wt      mpg   
--------------- ------- ------- -------- --------
  **1.Cluster** -1.265  -0.105   0.1229  -0.05652

  **2.Cluster** -0.8294  1.015   0.8644   -0.837 

  **3.Cluster** 0.3898  -1.225  -0.04829  0.5823 

  **4.Cluster** 0.5925  0.08166 -0.1684  -0.1671 

  **5.Cluster** 0.8247  -1.225   -1.376    1.81  

  **6.Cluster**  2.026  -1.225   -1.369   1.346  

  **7.Cluster** 0.5426  -1.225  -0.7109   0.3002 
-------------------------------------------------



The size of the above clusters are: _2_, _13_, _2_, _6_, _4_, _2_ and _3_.


## Results


On the chart below we can see the produced groups. To distinct which observation is related to which cluster each of the objects from the same groups have the same figure and there is a circle which shows the border of the clusters.

[![](plots/KMeansCluster.tpl-10.png)](plots/KMeansCluster.tpl-10-hires.png)


{% endhighlight %}
</li>
	<li id="export-KMeansCluster"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport('KMeansCluster.tpl', data=ius2008, vars=c('age', 'edu', 'leisure'))
rapport('KMeansCluster.tpl', data=mtcars, vars=c('drat', 'cyl', 'wt', 'mpg'))
rapport('KMeansCluster.tpl', data=mtcars, vars=c('drat', 'cyl', 'wt', 'mpg'), clust_num=7)

{% endhighlight %}
<h6>Popular formats:</h6>
<ul>
	<li><a href="demo/KMeansCluster.html" target="_blank">HTML</a></li>
	<li><a href="demo/KMeansCluster.pdf" target="_blank">pdf</a></li>
	<li><a href="demo/KMeansCluster.docx">docx (MS Word 2007 format)</a></li>
	<li><a href="demo/KMeansCluster.odt">odt (MS Word compatible)</a></li>
	<li><a href="demo/KMeansCluster.rtf">rtf (MS Word compatible)</a></li>
	<li><a href="demo/KMeansCluster.epub">epub</a></li>
</ul>
<h6>Other morkdown formats</h6>
<ul>
	<li><a href="demo/KMeansCluster.textile" target="_blank">textile</a></li>
	<li><a href="demo/KMeansCluster.docbook" target="_blank">docbook</a></li>
	<li><a href="demo/KMeansCluster.man" target="_blank">man</a></li>
	<li><a href="demo/KMeansCluster.md" target="_blank">markdown</a></li>
	<li><a href="demo/KMeansCluster.mediawiki" target="_blank">mediawiki</a></li>
	<li><a href="demo/KMeansCluster.wiki" target="_blank">wiki</a></li>
	<li><a href="demo/KMeansCluster.org" target="_blank">org</a></li>
	<li><a href="demo/KMeansCluster.pandoc" target="_blank">pandoc</a></li>
</ul>
</div></li>
	<li id="source-KMeansCluster"><div>
<h5>Source of `KMeansCluster.tpl`</h5>
{% highlight text %}

<!--head
meta:
  title: K-means cluster
  author: Gergely Daróczi, Daniel Nagy
  description: K-means clustering with automatically estimated number of clusters
  email: ~
  packages:
  - cluster
  - fpc
  example:
  - rapport('KMeansCluster.tpl', data=ius2008, vars=c('age', 'edu', 'leisure'))
  - rapport('KMeansCluster.tpl', data=mtcars, vars=c('drat', 'cyl', 'wt', 'mpg'))
  - rapport('KMeansCluster.tpl', data=mtcars, vars=c('drat', 'cyl', 'wt', 'mpg'), clust_num=7)
inputs:
- name: vars
  label: Input variables
  description: These are the input variables which will be used here
  class: numeric
  length:
    min: 1.0
    max: 1000.0
  required: yes
  standalone: no
- name: clust_num
  class: integer
  label: Number of Clusters
  description: One can set the Number of the Clusters for the K-Mean Clustering
  standalone: yes
  value: ~
  length:
    min: 1.0
    max: 1.0
  limit:
    min: 2.0
    max: 9999.0
  required: no
head-->

<%=
evalsOptions('graph.unify', FALSE)
%>

<%=
vars <- na.omit(vars)
varsScaled <- scale(vars)
maxclust <- nrow(varsScaled) - 1
%>

## Introduction

[K-means Clustering](http://en.wikipedia.org/wiki/K-means_clustering) is a specific and one of the most widespread method of [clustering](http://en.wikipedia.org/wiki/Cluster_analysis). With clustering we want to divide our data into groups, which in the objects are similar to each other. K-means clustering is specified in the way, here we set the number of groups we want to make. In our case we will take into account the following variables: <%=vars.label%>, to find out which observations are the nearest to each other.

## References

J. B. MacQueen (1967). _"Some Methods for classification and Analysis of Multivariate Observations, Proceedings of 5-th Berkeley Symposium on Mathematical Statistics and Probability"_. 1:281-297

## Determining the number of clusters

As it was mentioned above, the speciality of the K-means Cluster method is to set the number of groups we want to produce. 

<% if (exists('clust_num') && !is.null(clust_num) && clust_num > 0) { %>
<% if (clust_num >= maxclust) { %>
The number of the clusters cannot be equal or higher than the unique cases (<%=maxclust + 1%>), which you set (<%=clust_num%>), was <%=ifelse(maxclust +1 == clust_num, "equal", "higher")%>. In the following, we will use two clusters.
<%= clust_num <- 2 %>
<% } else { %>
As you set, there will be a <%=clust_num%>-means cluster analysis provided.
<% } %>
<%= 
cn <- tryCatch(pam(vars, clust_num), error = function(e) e)
fit <- kmeans(varsScaled, clust_num)
%>

<% } else { %>
<%=
cn <- tryCatch(pamk(vars), error = function(e) e)
fit <- kmeans(varsScaled, cn$nc)
cn <- cn$pamobject
%>

Let's see how to decide which is the ideal number of them!

<%=
wss <- (nrow(varsScaled) - 1) * sum(apply(varsScaled, 2, var))
for (i in 2:15) {
    wss[i] <- sum(kmeans(varsScaled, centers = i)$withinss)
}
plot(1:15, wss, type = "b", xlab = "Number of Clusters",  ylab = "Within groups sum of squares")
cn <- tryCatch(pamk(varsScaled), error = function(e) e)
%>

We can figure out that, as we see how much the Within groups sum of squares decreases if we set a higher number of the groups. So the smaller the difference the smaller the gain we can do with increasing the number of the clusters (thus in this case the larger decreasing means the bigger gain).

<% if (inherits(cn, 'error')) { %>
<%=
nc <-  sample(2:5, 1)
cn <- list(pamobject = pam(varsScaled, nc), nc = nc)
stop(paste0('Unable to identify the ideal number of clusters, using a random number between 2 and 5: ', cn$nc))
%>
<% } else { %>
The ideal number of clusters seems to be <%=cn$nc%>.
<% } %>

<% } %>

## Cluster means

The method of the K-means clustering starts with the step to set k number of centorids which could be the center of the groups we want to form. After that there comes several iterations, meanwhile the ideal centers are being calculated.

The centroids are the observations which are the nearest in average to all the other observations of their group. But it could be also interesting which are the typical values of the clusters! One way to figure out these typical values is to see the group means. The <%=cn$nc%> cluster averages are:

<%=
res <- fit$centers
row.names(res) <- paste0(1:nrow(res), '.', 'Cluster')
set.alignment(rep('centre', ncol(res)), 'right')
res
%>

The size of the above clusters are: <%=fit$size%>.

## Results

On the chart below we can see the produced groups. To distinct which observation is related to which cluster each of the objects from the same groups have the same figure and there is a circle which shows the border of the clusters.

<%=
if (exists('clust_num') && !is.null(clust_num) && clust_num > 0) {
cn <- tryCatch(pam(vars, clust_num), error = function(e) e)
fit <- kmeans(varsScaled, clust_num)
} else {
cn <- tryCatch(pamk(vars), error = function(e) e)
fit <- kmeans(varsScaled, cn$nc)
cn <- cn$pamobject
}
if (ncol(res) > 1) {
clusplot(cn, fit$cluster, color = TRUE, shade = TRUE, labels = ifelse(nrow(vars) < 100, 2, 4), lines = 1, main = '', col.p = 'black', col.clus = panderOptions('graph.colors'))
} else {
    warning('Only one variable provided, so there is no sense drawing a 2D plot here.')
}
%>

{% endhighlight %}
</div></li>
</ul>

<a id="KolmogorovSmirnovTest"> </a>
#### KolmogorovSmirnovTest.tpl

 <ul class="tabs">
	<li><a class="active" href="#info-KolmogorovSmirnovTest">Description</a></li>
	<li><a href="#inputs-KolmogorovSmirnovTest">Inputs</a></li>
	<li><a href="#example-KolmogorovSmirnovTest">Example</a></li>
	<li><a href="#export-KolmogorovSmirnovTest">Export</a></li>
	<li><a href="#source-KolmogorovSmirnovTest">Source</a></li>
</ul>

 <ul class="tabs-content">
	<li class="active" id="info-KolmogorovSmirnovTest"><div><h5>Kolmogorov-Smirnov-test</h5> by <em>Gergely Daróczi, Daniel Nagy</em>
<br><br>
 This template will run a Kolmogorov-Smirnov-test
<br><br>
<em>Required packages:</em> nortest
<br>
<em>Example:</em> 
{% highlight text %}
rapport('KolmogorovSmirnovTest', data=ius2008, xvar='edu', yvar='age')
rapport('KolmogorovSmirnovTest', data=mtcars, xvar='cyl', yvar='carb')
{% endhighlight %}
</div></li>
	<li id="inputs-KolmogorovSmirnovTest"><div><h5>Input parameters</h5><em>KolmogorovSmirnovTest.tpl</em> template has the following options to be (optionally) set while calling <em>rapport</em>:<ul>
	
 Inputs
 
 "xvar" (X Variable)  *required
 This is the X variable which will be used here
   - class:		numeric
   - standalone:	no
   - length:		exactly 1 vector
 
 "yvar" (Y Variable)  *required
 This is the Y variable which will be used here
   - class:		numeric
   - standalone:	no
   - length:		exactly 1 vector
 </ul></div></li>
	<li id="example-KolmogorovSmirnovTest">
{% highlight text %}


##########################################################################################
##	 Running: rapport('KolmogorovSmirnovTest', data=ius2008, xvar='edu', yvar='age')
##########################################################################################

## Introduction


[Kolmogorov-Smirnov test](http://en.wikipedia.org/wiki/Kolmogorov%E2%80%93Smirnov_test) is one of the most widely used [nonparametric tests](http://en.wikipedia.org/wiki/Non-parametric_statistics). With the help of that in this case we use to check if two continuous variables had the same distribution. We do not test that here, but there is a possibility to use that in the way to check if a sample/variable followed an expected distribution.


## Distributions


Before we use the K-S test to look at the possible statistical differences, it could be useful to see visually the distributions we want to observe. Below lie the [Cumulative Distribution Functions](http://en.wikipedia.org/wiki/Cumulative_distribution_function) of the variables we compared:

[![](plots/KolmogorovSmirnovTest-1.png)](plots/KolmogorovSmirnovTest-1-hires.png)
[![](plots/KolmogorovSmirnovTest-2.png)](plots/KolmogorovSmirnovTest-2-hires.png)

## Test results


Now we will test if the Internet usage for educational purposes (hours per day) and the Age had statistically the same distribution.


---------------------------------------------------
 Test statistic   P value   Alternative hypothesis 
---------------- --------- ------------------------
       1         _0_ * * *        two-sided        
---------------------------------------------------

Table: Two-sample Kolmogorov-Smirnov test on Internet usage for educational purposes (hours per day) and Age




The requirements of the Kolmogorov-Smirnov Test test was not met, the approximation may be incorrect.

So the variables do not follow the same distribution, according to the Kolmogorov-Smirnov test statistic.


##########################################################################################
##	 Running: rapport('KolmogorovSmirnovTest', data=mtcars, xvar='cyl', yvar='carb')
##########################################################################################

## Introduction


[Kolmogorov-Smirnov test](http://en.wikipedia.org/wiki/Kolmogorov%E2%80%93Smirnov_test) is one of the most widely used [nonparametric tests](http://en.wikipedia.org/wiki/Non-parametric_statistics). With the help of that in this case we use to check if two continuous variables had the same distribution. We do not test that here, but there is a possibility to use that in the way to check if a sample/variable followed an expected distribution.


## Distributions


Before we use the K-S test to look at the possible statistical differences, it could be useful to see visually the distributions we want to observe. Below lie the [Cumulative Distribution Functions](http://en.wikipedia.org/wiki/Cumulative_distribution_function) of the variables we compared:

[![](plots/KolmogorovSmirnovTest-3.png)](plots/KolmogorovSmirnovTest-3-hires.png)
[![](plots/KolmogorovSmirnovTest-4.png)](plots/KolmogorovSmirnovTest-4-hires.png)

## Test results


Now we will test if the cyl and the carb had statistically the same distribution.


-----------------------------------------------------------
 Test statistic       P value       Alternative hypothesis 
---------------- ----------------- ------------------------
     0.625       _7.453e-06_ * * *        two-sided        
-----------------------------------------------------------

Table: Two-sample Kolmogorov-Smirnov test on cyl and carb




The requirements of the Kolmogorov-Smirnov Test test was not met, the approximation may be incorrect.

So the variables do not follow the same distribution, according to the Kolmogorov-Smirnov test statistic.


{% endhighlight %}
</li>
	<li id="export-KolmogorovSmirnovTest"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport('KolmogorovSmirnovTest', data=ius2008, xvar='edu', yvar='age')
rapport('KolmogorovSmirnovTest', data=mtcars, xvar='cyl', yvar='carb')

{% endhighlight %}
<h6>Popular formats:</h6>
<ul>
	<li><a href="demo/KolmogorovSmirnovTest.html" target="_blank">HTML</a></li>
	<li><a href="demo/KolmogorovSmirnovTest.pdf" target="_blank">pdf</a></li>
	<li><a href="demo/KolmogorovSmirnovTest.docx">docx (MS Word 2007 format)</a></li>
	<li><a href="demo/KolmogorovSmirnovTest.odt">odt (MS Word compatible)</a></li>
	<li><a href="demo/KolmogorovSmirnovTest.rtf">rtf (MS Word compatible)</a></li>
	<li><a href="demo/KolmogorovSmirnovTest.epub">epub</a></li>
</ul>
<h6>Other morkdown formats</h6>
<ul>
	<li><a href="demo/KolmogorovSmirnovTest.textile" target="_blank">textile</a></li>
	<li><a href="demo/KolmogorovSmirnovTest.docbook" target="_blank">docbook</a></li>
	<li><a href="demo/KolmogorovSmirnovTest.man" target="_blank">man</a></li>
	<li><a href="demo/KolmogorovSmirnovTest.md" target="_blank">markdown</a></li>
	<li><a href="demo/KolmogorovSmirnovTest.mediawiki" target="_blank">mediawiki</a></li>
	<li><a href="demo/KolmogorovSmirnovTest.wiki" target="_blank">wiki</a></li>
	<li><a href="demo/KolmogorovSmirnovTest.org" target="_blank">org</a></li>
	<li><a href="demo/KolmogorovSmirnovTest.pandoc" target="_blank">pandoc</a></li>
</ul>
</div></li>
	<li id="source-KolmogorovSmirnovTest"><div>
<h5>Source of `KolmogorovSmirnovTest.tpl`</h5>
{% highlight text %}

<!--head
meta:
  title: Kolmogorov-Smirnov-test
  author: Gergely Daróczi, Daniel Nagy
  description: This template will run a Kolmogorov-Smirnov-test
  email: ~
  packages:
  - nortest
  example:
  - rapport('KolmogorovSmirnovTest', data=ius2008, xvar='edu', yvar='age')
  - rapport('KolmogorovSmirnovTest', data=mtcars, xvar='cyl', yvar='carb')
inputs:
- name: xvar
  label: X Variable
  description: This is the X variable which will be used here
  class: numeric
  length:
    min: 1.0
    max: 1.0
  required: yes
  standalone: no
- name: yvar
  label: Y Variable
  description: This is the Y variable which will be used here
  class: numeric
  length:
    min: 1.0
    max: 1.0
  required: yes
  standalone: no
head-->


## Introduction

[Kolmogorov-Smirnov test](http://en.wikipedia.org/wiki/Kolmogorov%E2%80%93Smirnov_test) is one of the most widely used [nonparametric tests](http://en.wikipedia.org/wiki/Non-parametric_statistics). With the help of that in this case we use to check if two continuous variables had the same distribution. We do not test that here, but there is a possibility to use that in the way to check if a sample/variable followed an expected distribution.

## Distributions

Before we use the K-S test to look at the possible statistical differences, it could be useful to see visually the distributions we want to observe. Below lie the [Cumulative Distribution Functions](http://en.wikipedia.org/wiki/Cumulative_distribution_function) of the variables we compared:

<%=
plot(ecdf(xvar), main = sprintf('Cumulative Distribution of %s', xvar.label))


plot(ecdf(yvar), main = sprintf('Cumulative Distribution of %s', xvar.label))
%>

## Test results

Now we will test if the <%=xvar.label%> and the <%=yvar.label%> had statistically the same distribution.

<%=
set.caption(sprintf('Two-sample Kolmogorov-Smirnov test on %s and %s', xvar.label, yvar.label))
kstest <- suppressWarnings(ks.test(xvar, yvar))
kstest
ksp <- kstest$'p.value'
p <- 0.05
%>

<%if (inherits(tryCatch(ks.test(xvar, yvar), warning = function(w) w), 'warning')) { %>
The requirements of the Kolmogorov-Smirnov Test test was not met, the approximation may be incorrect.
<% } %>
<%=ifelse(ksp > p,'So the nullhypothesis, that the variables follow the same distribution was not rejected. Here the stars represent the [significance levels](http://en.wikipedia.org/wiki/Statistical_significance) of the Kolmogorov-Smirnov test coefficients: one star for `0.05`, two for `0.01` and three  for `0.001`.','So the variables do not follow the same distribution, according to the Kolmogorov-Smirnov test statistic.')%>



{% endhighlight %}
</div></li>
</ul>

<a id="KruskalWallisTest"> </a>
#### KruskalWallisTest.tpl

 <ul class="tabs">
	<li><a class="active" href="#info-KruskalWallisTest">Description</a></li>
	<li><a href="#inputs-KruskalWallisTest">Inputs</a></li>
	<li><a href="#example-KruskalWallisTest">Example</a></li>
	<li><a href="#export-KruskalWallisTest">Export</a></li>
	<li><a href="#source-KruskalWallisTest">Source</a></li>
</ul>

 <ul class="tabs-content">
	<li class="active" id="info-KruskalWallisTest"><div><h5>Kruskal Wallis test</h5> by <em>Daniel Nagy</em>
<br><br>
 In this template Rapporter will present you Kruskal Wallis test.
<br><br>
<em>Required packages:</em> 
<br>
<em>Example:</em> 
{% highlight text %}
rapport('KruskalWallisTest.tpl', data=ius2008, var1='age', var2='edu')
rapport('KruskalWallisTest.tpl', data=mtcars, var1='mpg', var2='drat')
{% endhighlight %}
</div></li>
	<li id="inputs-KruskalWallisTest"><div><h5>Input parameters</h5><em>KruskalWallisTest.tpl</em> template has the following options to be (optionally) set while calling <em>rapport</em>:<ul>
	
 Inputs
 
 "var1" (First Used Variable)  *required
 This is the first variable which will be used here
   - class:		numeric
   - standalone:	no
   - length:		exactly 1 vector
 
 "var2" (Second Used Variable)  *required
 This is the second variable which will be used here
   - class:		numeric
   - standalone:	no
   - length:		exactly 1 vector
 </ul></div></li>
	<li id="example-KruskalWallisTest">
{% highlight text %}


##########################################################################################
##	 Running: rapport('KruskalWallisTest.tpl', data=ius2008, var1='age', var2='edu')
##########################################################################################

# Introduction


[Kruskal-Wallis test](http://en.wikipedia.org/wiki/Kruskal-Wallis) is a non-parametric statistical test that assesses hypothesis of equality of two independent sample's/variabels' variances. Most of the time it's being used beacuse the normality assumptions didn't meet for the samples/variables, but we need the assumption of the equal variances, so it can be an alternative of the Two-sample t-test.
Significant result means difference between the samples/variables.



----------------------------------------
 Test statistic   df       P value      
---------------- ---- ------------------
      1010        1   _1.056e-221_ * * *
----------------------------------------

Table: Kruskal-Wallis test for _Age_ and _Internet usage for educational purposes (hours per day)_



As you can see in the table the test's degrees of freedom is _1_, the joint test-statistic is _1010_, so the p-value of the Kruskal-Wallis test is _1.056e-221_. Thus we can reject the assumption of the equal variances.









##########################################################################################
##	 Running: rapport('KruskalWallisTest.tpl', data=mtcars, var1='mpg', var2='drat')
##########################################################################################

# Introduction


[Kruskal-Wallis test](http://en.wikipedia.org/wiki/Kruskal-Wallis) is a non-parametric statistical test that assesses hypothesis of equality of two independent sample's/variabels' variances. Most of the time it's being used beacuse the normality assumptions didn't meet for the samples/variables, but we need the assumption of the equal variances, so it can be an alternative of the Two-sample t-test.
Significant result means difference between the samples/variables.



--------------------------------------
 Test statistic   df      P value     
---------------- ---- ----------------
     47.28        1   _6.14e-12_ * * *
--------------------------------------

Table: Kruskal-Wallis test for _mpg_ and _drat_



As you can see in the table the test's degrees of freedom is _1_, the joint test-statistic is _47.28_, so the p-value of the Kruskal-Wallis test is _6.14e-12_. Thus we can reject the assumption of the equal variances.









{% endhighlight %}
</li>
	<li id="export-KruskalWallisTest"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport('KruskalWallisTest.tpl', data=ius2008, var1='age', var2='edu')
rapport('KruskalWallisTest.tpl', data=mtcars, var1='mpg', var2='drat')

{% endhighlight %}
<h6>Popular formats:</h6>
<ul>
	<li><a href="demo/KruskalWallisTest.html" target="_blank">HTML</a></li>
	<li><a href="demo/KruskalWallisTest.pdf" target="_blank">pdf</a></li>
	<li><a href="demo/KruskalWallisTest.docx">docx (MS Word 2007 format)</a></li>
	<li><a href="demo/KruskalWallisTest.odt">odt (MS Word compatible)</a></li>
	<li><a href="demo/KruskalWallisTest.rtf">rtf (MS Word compatible)</a></li>
	<li><a href="demo/KruskalWallisTest.epub">epub</a></li>
</ul>
<h6>Other morkdown formats</h6>
<ul>
	<li><a href="demo/KruskalWallisTest.textile" target="_blank">textile</a></li>
	<li><a href="demo/KruskalWallisTest.docbook" target="_blank">docbook</a></li>
	<li><a href="demo/KruskalWallisTest.man" target="_blank">man</a></li>
	<li><a href="demo/KruskalWallisTest.md" target="_blank">markdown</a></li>
	<li><a href="demo/KruskalWallisTest.mediawiki" target="_blank">mediawiki</a></li>
	<li><a href="demo/KruskalWallisTest.wiki" target="_blank">wiki</a></li>
	<li><a href="demo/KruskalWallisTest.org" target="_blank">org</a></li>
	<li><a href="demo/KruskalWallisTest.pandoc" target="_blank">pandoc</a></li>
</ul>
</div></li>
	<li id="source-KruskalWallisTest"><div>
<h5>Source of `KruskalWallisTest.tpl`</h5>
{% highlight text %}

<!--head
meta:
  title: Kruskal Wallis test
  author: Daniel Nagy
  description: In this template Rapporter will present you Kruskal Wallis test.
  email: ~
  packages: ~
  example:
  - rapport('KruskalWallisTest.tpl', data=ius2008, var1='age', var2='edu')
  - rapport('KruskalWallisTest.tpl', data=mtcars, var1='mpg', var2='drat')
inputs:
- name: var1
  label: First Used Variable
  description: This is the first variable which will be used here
  class: numeric
  length:
    min: 1.0
    max: 1.0
  required: yes
  standalone: no
- name: var2
  label: Second Used Variable
  description: This is the second variable which will be used here
  class: numeric
  length:
    min: 1.0
    max: 1.0
  required: yes
  standalone: no
head-->

# Introduction

[Kruskal-Wallis test](http://en.wikipedia.org/wiki/Kruskal-Wallis) is a non-parametric statistical test that assesses hypothesis of equality of two independent sample's/variabels' variances. Most of the time it's being used beacuse the normality assumptions didn't meet for the samples/variables, but we need the assumption of the equal variances, so it can be an alternative of the Two-sample t-test.
Significant result means difference between the samples/variables.


<%=
set.caption(sprintf('Kruskal-Wallis test for %s and %s', p(var1.label), p(var2.label)))
krusk <- kruskal.test(list(var1, var2))
krusk
p.v <- krusk$p.value
sta <- krusk$statistic
par <- krusk$parameter
%>

As you can see in the table the test's degrees of freedom is <%=par%>, the joint test-statistic is <%=sta%>, so the p-value of the Kruskal-Wallis test is <%=p.v%>. Thus we can <%= ifelse(p.v < 0.05,"reject", "accept")%> the assumption of the equal variances.








{% endhighlight %}
</div></li>
</ul>

<a id="LinearRegression"> </a>
#### LinearRegression.tpl

 <ul class="tabs">
	<li><a class="active" href="#info-LinearRegression">Description</a></li>
	<li><a href="#inputs-LinearRegression">Inputs</a></li>
	<li><a href="#example-LinearRegression">Example</a></li>
	<li><a href="#export-LinearRegression">Export</a></li>
	<li><a href="#source-LinearRegression">Source</a></li>
</ul>

 <ul class="tabs-content">
	<li class="active" id="info-LinearRegression"><div><h5>Linear Regression</h5> by <em>Gergely Daróczi, Daniel Nagy</em>
<br><br>
 This template will run a Linear Regression
<br><br>
<em>Required packages:</em> HH
<br>
<em>Example:</em> 
{% highlight text %}
rapport('LinearRegression.tpl', data=ius2008, dep='age', indep='edu', indep.inter=F)
rapport('LinearRegression.tpl', data=ius2008, dep='age', indep='edu', indep.inter=T)
rapport('LinearRegression.tpl', data=mtcars, dep='carb', indep='cyl', indep.inter=F)
{% endhighlight %}
</div></li>
	<li id="inputs-LinearRegression"><div><h5>Input parameters</h5><em>LinearRegression.tpl</em> template has the following options to be (optionally) set while calling <em>rapport</em>:<ul>
	
 Inputs
 
 "dep" (Dependent Variable)  *required
 This is the dependent variables which will be used here
   - class:		numeric
   - standalone:	no
   - length:		exactly 1 vector
 
 "indep" (Independent Variable(s))  *required
 These are the independent variables which will be used here
   - class:		numeric
   - standalone:	no
   - length:		from 1 to 100 vectors
 
 "indep.inter" (Interaction)  *required
 Should be calculated the interaction between the independent variables
   - class:		logical
   - standalone:	yes
   - length:		exactly 1 value
 
 "crPlots" (crplot)
 Plot checking linearity
   - class:		logical
   - standalone:	yes
   - length:		exactly 1 value
   - value:		TRUE
 </ul></div></li>
	<li id="example-LinearRegression">
{% highlight text %}


########################################################################################################
##	 Running: rapport('LinearRegression.tpl', data=ius2008, dep='age', indep='edu', indep.inter=F)
########################################################################################################

# Introduction


With the help of the [linear regression](http://en.wikipedia.org/wiki/Linear_regression) we can investigate the relationship between two variables. More punctually we can observe if one of the variables, the so-called [dependent](http://en.wikipedia.org/wiki/Dependent_variable) variable, significantly depended on the other variable, if an increase/decrease on the dependent variable's values made an increase/decrease on the independent variable.
In this case we only observe linear relationships. 


# Overview

Linear Regression was carried out, with _Internet usage for educational purposes (hours per day)_ as independent variable, and _Age_ as a dependent variable.





# Assumptions



In order to have reliable results, we have to check if the assumptions of the linear regression met with the data we used.


------------------------------------------
         &nbsp;           Value   p-value 
------------------------ ------- ---------
    **Global Stat**       875.9      0    

      **Skewness**        378.9      0    

      **Kurtosis**        490.7      0    

   **Link Function**     0.9379   0.3328  

 **Heteroscedasticity**   5.404   0.0201  
------------------------------------------

Table: Table continues below

 
---------------------------------------------------
         &nbsp;                   Decision         
------------------------ --------------------------
    **Global Stat**      Assumptions NOT satisfied!

      **Skewness**       Assumptions NOT satisfied!

      **Kurtosis**       Assumptions NOT satisfied!

   **Link Function**      Assumptions acceptable.  

 **Heteroscedasticity**  Assumptions NOT satisfied!
---------------------------------------------------



To check these assumptions the so-called GVLMA, the Global Validation of Linear Model Assumptions will help us. The result of that we can see in the table above.

The GVLMA makes a thorough detection on the linear model, including tests generally about the fit, the shape of the distribution of the residuals ([skewness](http://en.wikipedia.org/wiki/Skewness) and [kurtosis](http://en.wikipedia.org/wiki/Kurtosis)), the linearity and the [homoskedasticity](http://en.wikipedia.org/wiki/Homoscedasticity). On the table we can see if our model met with the assumptions.
As a generally accepted thumb-rule we use the critical [p-value](http://en.wikipedia.org/wiki/P-value)=0.05.

So let's see the results, which the test gave us:

 - The general statistic tells us about the linear model, that it does not fit to our data.

 - According to the GVLMA the residuals of our model's skewness differs significantly from the normal distribution's skewness.

 - The residuals of our model's kurtosis differs significantly from the normal distribution's kurtosis, based on the result of the GVLMA.

 - In the row of the link function we can read that the linearity assumption of our model was accepted.

 - At last but not least GVLMA confirms the violation of homoscedasticity.

In summary: We can 't be sure that the linear model used here fits to the data.

References:

  * Pena, EA and Slate, EH (2006): Global validation of linear model assumptions. _J. Amer. Statist. Assoc._ **101** (473):341-354.




### Nonlinearity


As we want to fit a linear regression model, it is advisable to see if the relationship between the used variables are linear indeed.
Next to the test statistic of the GVLMA it is advisable to use a graphical device as well to check that linearity. Here we will use the so-called crPlots funtion to do that, which is an abbreviation of the Component + Residual Plot.

[![](plots/LinearRegression.tpl-7.png)](plots/LinearRegression.tpl-7-hires.png)


Here comes the question: What do we see on the plot?
First of all we can see two lines and several circles. The red interrupted line is the best fitted linear line, which means that te square of the residuals are the least while fitting that line in the model. The green curved line is the best fitted line, which does not have to be straight, of all. The observations we investigate are the circles.
We can talk about linearity if the green line did not lie too far from the red.


Next to these options there is a possibility to have a glance on the so-called diagnostic plots, which on we can see the residuals in themselves and in standardized forms.
[![](plots/LinearRegression.tpl-8.png)](plots/LinearRegression.tpl-8-hires.png)

# Results


After successfully checked the assumptions we can finally turn to the main part of the interest, the results of the Linear Regression Model.
From the table we can read the variables which have significant effect on the dependent variable.


--------------------------------------------------------------
     &nbsp;        Estimate   Std. Error   t value   Pr(>|t|) 
----------------- ---------- ------------ --------- ----------
     **edu**        0.7373      0.1307      5.643   2.521e-08 

 **(Intercept)**    23.07       0.3771      61.17   2.273e-268
--------------------------------------------------------------

Table: Fitting linear model: age based on _edu_


--------------------------------------------------
 Number of Cases   Adjusted R Squared   AIC   BIC 
----------------- -------------------- ----- -----
       637              0.04625        4231  4244 
--------------------------------------------------



From the table one can see that _(Intercept) has significant effect on the dependent variable, the p-value of that is 0_ and _edu has significant effect on the dependent variable, the p-value of that is 0_

The model does not fit  well, because the Adjusted R Square is _0.04625_.





########################################################################################################
##	 Running: rapport('LinearRegression.tpl', data=ius2008, dep='age', indep='edu', indep.inter=T)
########################################################################################################

# Introduction


With the help of the [linear regression](http://en.wikipedia.org/wiki/Linear_regression) we can investigate the relationship between two variables. More punctually we can observe if one of the variables, the so-called [dependent](http://en.wikipedia.org/wiki/Dependent_variable) variable, significantly depended on the other variable, if an increase/decrease on the dependent variable's values made an increase/decrease on the independent variable.
In this case we only observe linear relationships. 


# Overview

Linear Regression was carried out, with _Internet usage for educational purposes (hours per day)_ as independent variable, and _Age_ as a dependent variable.





# Assumptions



In order to have reliable results, we have to check if the assumptions of the linear regression met with the data we used.


------------------------------------------
         &nbsp;           Value   p-value 
------------------------ ------- ---------
    **Global Stat**       875.9      0    

      **Skewness**        378.9      0    

      **Kurtosis**        490.7      0    

   **Link Function**     0.9379   0.3328  

 **Heteroscedasticity**   5.404   0.0201  
------------------------------------------

Table: Table continues below

 
---------------------------------------------------
         &nbsp;                   Decision         
------------------------ --------------------------
    **Global Stat**      Assumptions NOT satisfied!

      **Skewness**       Assumptions NOT satisfied!

      **Kurtosis**       Assumptions NOT satisfied!

   **Link Function**      Assumptions acceptable.  

 **Heteroscedasticity**  Assumptions NOT satisfied!
---------------------------------------------------



To check these assumptions the so-called GVLMA, the Global Validation of Linear Model Assumptions will help us. The result of that we can see in the table above.

The GVLMA makes a thorough detection on the linear model, including tests generally about the fit, the shape of the distribution of the residuals ([skewness](http://en.wikipedia.org/wiki/Skewness) and [kurtosis](http://en.wikipedia.org/wiki/Kurtosis)), the linearity and the [homoskedasticity](http://en.wikipedia.org/wiki/Homoscedasticity). On the table we can see if our model met with the assumptions.
As a generally accepted thumb-rule we use the critical [p-value](http://en.wikipedia.org/wiki/P-value)=0.05.

So let's see the results, which the test gave us:

 - The general statistic tells us about the linear model, that it does not fit to our data.

 - According to the GVLMA the residuals of our model's skewness differs significantly from the normal distribution's skewness.

 - The residuals of our model's kurtosis differs significantly from the normal distribution's kurtosis, based on the result of the GVLMA.

 - In the row of the link function we can read that the linearity assumption of our model was accepted.

 - At last but not least GVLMA confirms the violation of homoscedasticity.

In summary: We can 't be sure that the linear model used here fits to the data.

References:

  * Pena, EA and Slate, EH (2006): Global validation of linear model assumptions. _J. Amer. Statist. Assoc._ **101** (473):341-354.




### Nonlinearity


As we want to fit a linear regression model, it is advisable to see if the relationship between the used variables are linear indeed.
Next to the test statistic of the GVLMA it is advisable to use a graphical device as well to check that linearity. Here we will use the so-called crPlots funtion to do that, which is an abbreviation of the Component + Residual Plot.

[![](plots/LinearRegression.tpl-9.png)](plots/LinearRegression.tpl-9-hires.png)


Here comes the question: What do we see on the plot?
First of all we can see two lines and several circles. The red interrupted line is the best fitted linear line, which means that te square of the residuals are the least while fitting that line in the model. The green curved line is the best fitted line, which does not have to be straight, of all. The observations we investigate are the circles.
We can talk about linearity if the green line did not lie too far from the red.


Next to these options there is a possibility to have a glance on the so-called diagnostic plots, which on we can see the residuals in themselves and in standardized forms.
[![](plots/LinearRegression.tpl-10.png)](plots/LinearRegression.tpl-10-hires.png)

# Results


After successfully checked the assumptions we can finally turn to the main part of the interest, the results of the Linear Regression Model.
From the table we can read the variables and interactions which have significant effect on the dependent variable.


--------------------------------------------------------------
     &nbsp;        Estimate   Std. Error   t value   Pr(>|t|) 
----------------- ---------- ------------ --------- ----------
     **edu**        0.7373      0.1307      5.643   2.521e-08 

 **(Intercept)**    23.07       0.3771      61.17   2.273e-268
--------------------------------------------------------------

Table: Fitting linear model: age based on _edu_


--------------------------------------------------
 Number of Cases   Adjusted R Squared   AIC   BIC 
----------------- -------------------- ----- -----
       637              0.04625        4231  4244 
--------------------------------------------------



From the table one can see that _(Intercept) has significant effect on the dependent variable, the p-value of that is 0_ and _edu has significant effect on the dependent variable, the p-value of that is 0_

The model does not fit  well, because the Adjusted R Square is _0.04625_.





########################################################################################################
##	 Running: rapport('LinearRegression.tpl', data=mtcars, dep='carb', indep='cyl', indep.inter=F)
########################################################################################################

# Introduction


With the help of the [linear regression](http://en.wikipedia.org/wiki/Linear_regression) we can investigate the relationship between two variables. More punctually we can observe if one of the variables, the so-called [dependent](http://en.wikipedia.org/wiki/Dependent_variable) variable, significantly depended on the other variable, if an increase/decrease on the dependent variable's values made an increase/decrease on the independent variable.
In this case we only observe linear relationships. 


# Overview

Linear Regression was carried out, with _cyl_ as independent variable, and _carb_ as a dependent variable.





# Assumptions



In order to have reliable results, we have to check if the assumptions of the linear regression met with the data we used.


------------------------------------------
         &nbsp;           Value   p-value 
------------------------ ------- ---------
    **Global Stat**       19.91  0.0005211

      **Skewness**        7.299  0.006899 

      **Kurtosis**        5.033   0.02486 

   **Link Function**      2.45    0.1175  

 **Heteroscedasticity**   5.124   0.0236  
------------------------------------------

Table: Table continues below

 
---------------------------------------------------
         &nbsp;                   Decision         
------------------------ --------------------------
    **Global Stat**      Assumptions NOT satisfied!

      **Skewness**       Assumptions NOT satisfied!

      **Kurtosis**       Assumptions NOT satisfied!

   **Link Function**      Assumptions acceptable.  

 **Heteroscedasticity**  Assumptions NOT satisfied!
---------------------------------------------------



To check these assumptions the so-called GVLMA, the Global Validation of Linear Model Assumptions will help us. The result of that we can see in the table above.

The GVLMA makes a thorough detection on the linear model, including tests generally about the fit, the shape of the distribution of the residuals ([skewness](http://en.wikipedia.org/wiki/Skewness) and [kurtosis](http://en.wikipedia.org/wiki/Kurtosis)), the linearity and the [homoskedasticity](http://en.wikipedia.org/wiki/Homoscedasticity). On the table we can see if our model met with the assumptions.
As a generally accepted thumb-rule we use the critical [p-value](http://en.wikipedia.org/wiki/P-value)=0.05.

So let's see the results, which the test gave us:

 - The general statistic tells us about the linear model, that it does not fit to our data.

 - According to the GVLMA the residuals of our model's skewness differs significantly from the normal distribution's skewness.

 - The residuals of our model's kurtosis differs significantly from the normal distribution's kurtosis, based on the result of the GVLMA.

 - In the row of the link function we can read that the linearity assumption of our model was accepted.

 - At last but not least GVLMA confirms the violation of homoscedasticity.

In summary: We can 't be sure that the linear model used here fits to the data.

References:

  * Pena, EA and Slate, EH (2006): Global validation of linear model assumptions. _J. Amer. Statist. Assoc._ **101** (473):341-354.




### Nonlinearity


As we want to fit a linear regression model, it is advisable to see if the relationship between the used variables are linear indeed.
Next to the test statistic of the GVLMA it is advisable to use a graphical device as well to check that linearity. Here we will use the so-called crPlots funtion to do that, which is an abbreviation of the Component + Residual Plot.

[![](plots/LinearRegression.tpl-11.png)](plots/LinearRegression.tpl-11-hires.png)


Here comes the question: What do we see on the plot?
First of all we can see two lines and several circles. The red interrupted line is the best fitted linear line, which means that te square of the residuals are the least while fitting that line in the model. The green curved line is the best fitted line, which does not have to be straight, of all. The observations we investigate are the circles.
We can talk about linearity if the green line did not lie too far from the red.


Next to these options there is a possibility to have a glance on the so-called diagnostic plots, which on we can see the residuals in themselves and in standardized forms.
[![](plots/LinearRegression.tpl-12.png)](plots/LinearRegression.tpl-12-hires.png)

# Results


After successfully checked the assumptions we can finally turn to the main part of the interest, the results of the Linear Regression Model.
From the table we can read the variables which have significant effect on the dependent variable.


--------------------------------------------------------------
     &nbsp;        Estimate   Std. Error   t value   Pr(>|t|) 
----------------- ---------- ------------ --------- ----------
     **cyl**        0.4766      0.1403      3.396    0.001942 

 **(Intercept)**   -0.1365      0.9027     -0.1513    0.8808  
--------------------------------------------------------------

Table: Fitting linear model: carb based on _cyl_


--------------------------------------------------
 Number of Cases   Adjusted R Squared   AIC   BIC 
----------------- -------------------- ----- -----
       32                0.2536        116.1 120.5
--------------------------------------------------



From the table one can see that cyl has significant effect on the dependent variable, the p-value of that is 0.002

The model fits  well, because the Adjusted R Square is _0.2536_.





{% endhighlight %}
</li>
	<li id="export-LinearRegression"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport('LinearRegression.tpl', data=ius2008, dep='age', indep='edu', indep.inter=F)
rapport('LinearRegression.tpl', data=ius2008, dep='age', indep='edu', indep.inter=T)
rapport('LinearRegression.tpl', data=mtcars, dep='carb', indep='cyl', indep.inter=F)

{% endhighlight %}
<h6>Popular formats:</h6>
<ul>
	<li><a href="demo/LinearRegression.html" target="_blank">HTML</a></li>
	<li><a href="demo/LinearRegression.pdf" target="_blank">pdf</a></li>
	<li><a href="demo/LinearRegression.docx">docx (MS Word 2007 format)</a></li>
	<li><a href="demo/LinearRegression.odt">odt (MS Word compatible)</a></li>
	<li><a href="demo/LinearRegression.rtf">rtf (MS Word compatible)</a></li>
	<li><a href="demo/LinearRegression.epub">epub</a></li>
</ul>
<h6>Other morkdown formats</h6>
<ul>
	<li><a href="demo/LinearRegression.textile" target="_blank">textile</a></li>
	<li><a href="demo/LinearRegression.docbook" target="_blank">docbook</a></li>
	<li><a href="demo/LinearRegression.man" target="_blank">man</a></li>
	<li><a href="demo/LinearRegression.md" target="_blank">markdown</a></li>
	<li><a href="demo/LinearRegression.mediawiki" target="_blank">mediawiki</a></li>
	<li><a href="demo/LinearRegression.wiki" target="_blank">wiki</a></li>
	<li><a href="demo/LinearRegression.org" target="_blank">org</a></li>
	<li><a href="demo/LinearRegression.pandoc" target="_blank">pandoc</a></li>
</ul>
</div></li>
	<li id="source-LinearRegression"><div>
<h5>Source of `LinearRegression.tpl`</h5>
{% highlight text %}

<!--head
meta:
  title: Linear Regression
  author: Gergely Daróczi, Daniel Nagy
  description: This template will run a Linear Regression
  email: ~
  packages:
  - HH
  - car
  - nortest
  - gvlma
  example:
  - rapport('LinearRegression.tpl', data=ius2008, dep='age', indep='edu', indep.inter=F)
  - rapport('LinearRegression.tpl', data=ius2008, dep='age', indep='edu', indep.inter=T)
  - rapport('LinearRegression.tpl', data=mtcars, dep='carb', indep='cyl', indep.inter=F)
inputs:
- name: dep
  label: Dependent Variable
  description: This is the dependent variables which will be used here
  class: numeric
  length:
    min: 1.0
    max: 1.0
  required: yes
  standalone: no
- name: indep
  label: Independent Variable(s)
  description: These are the independent variables which will be used here
  class: numeric
  length:
    min: 1.0
    max: 100.0
  required: yes
  standalone: no
- name: indep.inter
  label: Interaction
  description: Should be calculated the interaction between the independent variables
  class: logical
  required: yes
  standalone: yes
- name: crPlots
  label: crplot
  description: Plot checking linearity
  class: logical
  required: no
  value: yes
  standalone: yes
head-->

<%=
d <- structure(na.omit(data.frame(dep, indep)), .Names = c(dep.name, indep.name))
indep.int <- fml(dep.name, indep.name, join.right = "*")
indep.nonint <- fml(dep.name, indep.name, join.right = "+")
fit <- lm(ifelse(indep.inter, indep.int, indep.nonint), data = d)
indep.plu <- switch(indep.ilen, '', 's')
gvmodel <- tryCatch(gvlma(fit), error = function(e) e)
%>

# Introduction

With the help of the [linear regression](http://en.wikipedia.org/wiki/Linear_regression) we can investigate the relationship <%=ifelse(indep.ilen == 1, 'between two variables', 'between the variables')%>. More punctually we can observe if one of the variables, the so-called [dependent](http://en.wikipedia.org/wiki/Dependent_variable) variable, significantly depended on the other variable<%=indep.plu%>, if an increase/decrease on the dependent variable's values made an increase/decrease on the independent variable<%=indep.plu%>.
In this case we only observe linear relationships. <%=ifelse(indep.ilen == 1, '', 'As we use in the model more than 1 independent variables, we call the method [multivariate regression](http://en.wikipedia.org/wiki/Multivariate_regression_model).')%>

# Overview

<%= ifelse(indep.ilen == 1, '', 'Multivariate-') %>Linear Regression was carried out, with <%= p(indep.label) %> as independent variable<%= indep.plu %>, and <%= p(dep.label) %> as a dependent variable.

<% if (ncol(as.matrix(indep)) > 1) { %>
The [interaction](http://en.wikipedia.org/wiki/Interaction) between the independent variables was<%=ifelse(indep.inter, "", "n't")%> taken into account.
<% } %>


# Assumptions

<% if (!inherits(gvmodel, 'error')) { %>
In order to have reliable results, we have to check if the assumptions of the linear regression met with the data we used.

<%=
(summary(gvmodel))
decision <- (gvmodel$Decision)
decision <- summary(gvmodel)[, 3]
decision1 <- (decision[1] == 'Assumptions NOT satisfied!')
decision2 <- (decision[2] == 'Assumptions NOT satisfied!')
decision3 <- (decision[3] == 'Assumptions NOT satisfied!')
decision4 <- (decision[4] == 'Assumptions NOT satisfied!')
decision5 <- (decision[5] == 'Assumptions NOT satisfied!')
decision.any <- (any(decision == 'Assumptions NOT satisfied!'))
%>

To check these assumptions the so-called GVLMA, the Global Validation of Linear Model Assumptions will help us. The result of that we can see in the table above.

The GVLMA makes a thorough detection on the linear model, including tests generally about the fit, the shape of the distribution of the residuals ([skewness](http://en.wikipedia.org/wiki/Skewness) and [kurtosis](http://en.wikipedia.org/wiki/Kurtosis)), the linearity and the [homoskedasticity](http://en.wikipedia.org/wiki/Homoscedasticity). On the table we can see if our model met with the assumptions.
As a generally accepted thumb-rule we use the critical [p-value](http://en.wikipedia.org/wiki/P-value)=0.05.

So let's see the results, which the test gave us:

 - The general statistic tells us about the linear model, that it <%= ifelse(decision1, "does not fit to our data", "can fit to our data")%>.

 - According to the GVLMA the residuals of our model's skewness<%= ifelse(decision2, "", " does not")%> differs significantly from the normal distribution's skewness.

 - The residuals of our model's kurtosis<%= ifelse(decision3, "", " does not")%> differs significantly from the normal distribution's kurtosis, based on the result of the GVLMA.

 - In the row of the link function we can read that the linearity assumption of our model was <%=ifelse(decision4, "rejected", "accepted")%>.

 - At last but not least GVLMA confirms<%= ifelse(decision5, " the violation of", "") %> homoscedasticity.

In summary: We can<%=ifelse(decision.any, " 't", "")%> be sure that the linear model used here fits to the data.

References:

  * Pena, EA and Slate, EH (2006): Global validation of linear model assumptions. _J. Amer. Statist. Assoc._ **101** (473):341-354.

<% } else { %>

We could not test the assumptions as the following R error occured: <%=gvmodel$message%>

<% } %>

### Nonlinearity

As we want to fit a linear regression model, it is advisable to see if the relationship between the used variables are linear indeed.
Next to the test statistic of the GVLMA it is advisable to use a graphical device as well to check that linearity. Here we will use the so-called crPlots funtion to do that, which is an abbreviation of the Component + Residual Plot.

<%=
fit.nonint <- lm(indep.nonint, data = d)
suppressWarnings(crPlots(fit.nonint))
%>

Here comes the question: What do we see on the plot?
First of all we can see two lines and several circles. The red interrupted line is the best fitted linear line, which means that te square of the residuals are the least while fitting that line in the model. The green curved line is the best fitted line, which does not have to be straight, of all. The observations we investigate are the circles.
We can talk about linearity if the green line did not lie too far from the red.
<%=ifelse(indep.ilen==1,'','The other plots we see are simple [boxplots](http://en.wikipedia.org/wiki/Box_plot).')%>

Next to these options there is a possibility to have a glance on the so-called diagnostic plots, which on we can see the residuals in themselves and in standardized forms.
<%=
par(mfrow = c(2, 2))
+plot(fit)
%>

<% if (ncol(d) > 2) { %>

### Multicollinearity

<%=
mcoll <- as.table(matrix(c(vif(fit), 1 / vif(fit)), ncol(d)-1, 2))
colnames(mcoll) <- c("VIF", "Tolerance")
rownames(mcoll) <- c(indep.name)
mcoll 
CNM <- as.table(kappa(fit))
row.names(CNM) <- "The Condition Number of a Matrix"
CNM
%>
<% } else { } %>

# Results

After successfully checked the assumptions we can finally turn to the main part of the interest, the results of the Linear Regression Model.
From the table we can read the variables <%=ifelse(indep.inter,'and interactions ','')%>which have significant effect on the dependent variable.

<%=
set.caption(sprintf('Fitting linear model: %s based on %s', dep.name, p(indep.name)))
fit
gof <- as.table(c(nrow(d), summary(fit)$adj.r.squared, AIC(fit), BIC(fit)),1,4)
rownames(gof) <- c("Number of Cases", "Adjusted R Squared", "AIC", "BIC")
gof
p_val <- summary(fit)$coefficients[, 4]
%>

From the table one can see that <%= paste(rownames(summary(fit)$coefficients)[which(p_val < 0.05)], round(p_val, 3)[which(p_val < 0.05)], sep = " has significant effect on the dependent variable, the p-value of that is ")%>

The model <%= sprintf("%s %s well", ifelse(gof[2] > 0.2, "fits", "does not fit"), ifelse(gof[2] > 0.4, "very", "")) %>, because the Adjusted R Square is <%=gof[2]%>.




{% endhighlight %}
</div></li>
</ul>

<a id="MDS"> </a>
#### MDS.tpl

 <ul class="tabs">
	<li><a class="active" href="#info-MDS">Description</a></li>
	<li><a href="#inputs-MDS">Inputs</a></li>
	<li><a href="#example-MDS">Example</a></li>
	<li><a href="#export-MDS">Export</a></li>
	<li><a href="#source-MDS">Source</a></li>
</ul>

 <ul class="tabs-content">
	<li class="active" id="info-MDS"><div><h5>Multidimensional Scaling</h5> by <em>Daniel Nagy</em>
<br><br>
 In this template Rapporter will present you Multidimensional Scaling.
<br><br>
<em>Required packages:</em> 
<br>
<em>Example:</em> 
{% highlight text %}
rapport('MDS.tpl', data=ius2008, vars=c('age', 'edu', 'leisure'), max.dist.num=16)
rapport('MDS.tpl', data=ius2008, vars=c('age', 'edu', 'leisure'), max.dist.num=17, min.dist.num=30)
rapport('MDS.tpl', data=mtcars, vars=c('drat', 'cyl', 'mpg'), max.dist.num=17, min.dist.num=30)
{% endhighlight %}
</div></li>
	<li id="inputs-MDS"><div><h5>Input parameters</h5><em>MDS.tpl</em> template has the following options to be (optionally) set while calling <em>rapport</em>:<ul>
	
 Inputs
 
 "vars" (Used Variables)  *required
 These are the variables which MDS use to differentiate between values
   - class:		numeric
   - standalone:	no
   - length:		from 2 to 100 vectors
 
 "id" (Labels of the cases)
 On the plot, these names will be shown as the labels of the cases
   - standalone:	no
   - length:		exactly 1 vector
 
 "dist.mat" (Distance Matrix)
 Is your data a Distance matrix?
   - class:		logical
   - standalone:	yes
   - length:		exactly 1 value
   - value:		FALSE
 
 "max.dist.num" (Maximum Distance Number)
 Number of pairs with the biggest differences
   - class:		integer
   - standalone:	yes
   - length:		exactly 1 value
   - value:		10
   - limits:		1 <= x <= 1000
 
 "min.dist.num" (Minimum Distance Number)
 Number of pairs with the smallest distances
   - class:		integer
   - standalone:	yes
   - length:		exactly 1 value
   - value:		10
   - limits:		1 <= x <= 1000
 </ul></div></li>
	<li id="example-MDS">
{% highlight text %}


######################################################################################################
##	 Running: rapport('MDS.tpl', data=ius2008, vars=c('age', 'edu', 'leisure'), max.dist.num=16)
######################################################################################################

# Introduction


[Multidimensional-scaling](http://en.wikipedia.org/wiki/Multidimensional_scaling) is a technique which gives us a visual representation about the distances between the observations. 


# MDS


Below you can see a plot, that presents you the distance between the observations, which was calculated based on _Age_, _Internet usage for educational purposes (hours per day)_ and _Internet usage in leisure time (hours per day)_.

[![](plots/MDS.tpl-1.png)](plots/MDS.tpl-1-hires.png)

### What can be seen here?


#### Outsiders

84 differs the most from the others, and 8 seems to be the most "common" observation, which lie nearest to all other observations.


#### Outsider Pairs

_284_ and _84_ (8.02) are the "furthest", _280_ and _1_ (0) are the "nearest" to each other.


#### In General


Now let's see which observations can be said statistically far/similar to each other in general. The _16_ pairs with the biggest differences and the _10_ pairs with the smallest differences will be presented. In the brackets you can see the amount of the distances between two observations.



There are _17_ observations which are the most similar, and equal in the same time, that is a higher number than the wanted _16_, thus will not be reported one-by-one. Set _17_ as parameter _max.dist.num_ to check the pairs if you are interested.


 


There are _318_ observations which are the most similar and equal in the same time, that is a higher number than the wanted _10_, thus will not be reported one-by-one. Set _318_ as parameter _min.dist.num_ to check the pairs if you are interested.






#######################################################################################################################
##	 Running: rapport('MDS.tpl', data=ius2008, vars=c('age', 'edu', 'leisure'), max.dist.num=17, min.dist.num=30)
#######################################################################################################################

# Introduction


[Multidimensional-scaling](http://en.wikipedia.org/wiki/Multidimensional_scaling) is a technique which gives us a visual representation about the distances between the observations. 


# MDS


Below you can see a plot, that presents you the distance between the observations, which was calculated based on _Age_, _Internet usage for educational purposes (hours per day)_ and _Internet usage in leisure time (hours per day)_.

[![](plots/MDS.tpl-1.png)](plots/MDS.tpl-1-hires.png)

### What can be seen here?


#### Outsiders

84 differs the most from the others, and 8 seems to be the most "common" observation, which lie nearest to all other observations.


#### Outsider Pairs

_284_ and _84_ (8.02) are the "furthest", _280_ and _1_ (0) are the "nearest" to each other.


#### In General


Now let's see which observations can be said statistically far/similar to each other in general. The _17_ pairs with the biggest differences and the _30_ pairs with the smallest differences will be presented. In the brackets you can see the amount of the distances between two observations.



According to the used variables (_Age_, _Internet usage for educational purposes (hours per day)_ and _Internet usage in leisure time (hours per day)_) the _17_ furthest pair of observations are:



  * _284_ and _84_ (8.02)
  * _224_ and _84_ (7.87)
  * _230_ and _84_ (7.84)
  * _84_ and _68_ (7.81)
  * _463_ and _84_ (7.79)
  * _583_ and _84_ (7.79)
  * _582_ and _84_ (7.72)
  * _122_ and _84_ (7.72)
  * _460_ and _84_ (7.72)
  * _606_ and _84_ (7.7)
  * _607_ and _84_ (7.7)
  * _128_ and _84_ (7.69)
  * _253_ and _84_ (7.69)
  * _84_ and _41_ (7.69)
  * _269_ and _84_ (7.65)
  * _376_ and _84_ (7.63)
  * _506_ and _84_ (7.63)

<!-- end of list -->





 


There are _318_ observations which are the most similar and equal in the same time, that is a higher number than the wanted _30_, thus will not be reported one-by-one. Set _318_ as parameter _min.dist.num_ to check the pairs if you are interested.






###################################################################################################################
##	 Running: rapport('MDS.tpl', data=mtcars, vars=c('drat', 'cyl', 'mpg'), max.dist.num=17, min.dist.num=30)
###################################################################################################################

# Introduction


[Multidimensional-scaling](http://en.wikipedia.org/wiki/Multidimensional_scaling) is a technique which gives us a visual representation about the distances between the observations. 


# MDS


Below you can see a plot, that presents you the distance between the observations, which was calculated based on _drat_, _cyl_ and _mpg_.

[![](plots/MDS.tpl-2.png)](plots/MDS.tpl-2-hires.png)

### What can be seen here?


#### Outsiders

Honda Civic differs the most from the others, and Ferrari Dino seems to be the most "common" observation, which lie nearest to all other observations.


#### Outsider Pairs

_Honda Civic_ and _Cadillac Fleetwood_ (5.48) are the "furthest", _Mazda RX4 Wag_ and _Mazda RX4_ (0) are the "nearest" to each other.


#### In General


Now let's see which observations can be said statistically far/similar to each other in general. The _17_ pairs with the biggest differences and the _30_ pairs with the smallest differences will be presented. In the brackets you can see the amount of the distances between two observations.



According to the used variables (_drat_, _cyl_ and _mpg_) the _17_ furthest pair of observations are:



  * _Honda Civic_ and _Cadillac Fleetwood_ (5.48)
  * _Honda Civic_ and _Lincoln Continental_ (5.39)
  * _Dodge Challenger_ and _Honda Civic_ (5.25)
  * _Toyota Corolla_ and _Cadillac Fleetwood_ (5.1)
  * _Toyota Corolla_ and _Lincoln Continental_ (5.04)
  * _Honda Civic_ and _Merc 450SLC_ (4.85)
  * _Fiat 128_ and _Cadillac Fleetwood_ (4.79)
  * _Honda Civic_ and _Merc 450SE_ (4.74)
  * _Honda Civic_ and _Duster 360_ (4.74)
  * _AMC Javelin_ and _Honda Civic_ (4.74)
  * _Fiat 128_ and _Lincoln Continental_ (4.74)
  * _Honda Civic_ and _Chrysler Imperial_ (4.68)
  * _Honda Civic_ and _Valiant_ (4.68)
  * _Honda Civic_ and _Merc 450SL_ (4.67)
  * _Dodge Challenger_ and _Toyota Corolla_ (4.67)
  * _Pontiac Firebird_ and _Honda Civic_ (4.52)
  * _Honda Civic_ and _Hornet Sportabout_ (4.46)

<!-- end of list -->





 


According to the used variables (_drat_, _cyl_ and _mpg_) the _30_ nearest pair of observations are:



  * _Mazda RX4 Wag_ and _Mazda RX4_ (0)
  * _Chrysler Imperial_ and _Duster 360_ (0.08)
  * _Merc 230_ and _Datsun 710_ (0.13)
  * _Lincoln Continental_ and _Cadillac Fleetwood_ (0.13)
  * _Merc 450SL_ and _Merc 450SE_ (0.15)
  * _AMC Javelin_ and _Merc 450SLC_ (0.15)
  * _Pontiac Firebird_ and _Hornet Sportabout_ (0.15)
  * _AMC Javelin_ and _Chrysler Imperial_ (0.17)
  * _AMC Javelin_ and _Duster 360_ (0.19)
  * _Merc 450SLC_ and _Merc 450SE_ (0.2)
  * _Merc 280C_ and _Merc 280_ (0.23)
  * _AMC Javelin_ and _Merc 450SE_ (0.25)
  * _Merc 450SL_ and _Hornet Sportabout_ (0.28)
  * _Merc 280_ and _Mazda RX4_ (0.3)
  * _Merc 280_ and _Mazda RX4 Wag_ (0.3)
  * _Merc 450SLC_ and _Duster 360_ (0.3)
  * _Chrysler Imperial_ and _Merc 450SLC_ (0.31)
  * _Pontiac Firebird_ and _Merc 450SL_ (0.32)
  * _Merc 450SLC_ and _Merc 450SL_ (0.35)
  * _Toyota Corona_ and _Datsun 710_ (0.35)
  * _Toyota Corolla_ and _Fiat 128_ (0.36)
  * _AMC Javelin_ and _Merc 450SL_ (0.38)
  * _Merc 240D_ and _Datsun 710_ (0.4)
  * _Merc 450SE_ and _Hornet Sportabout_ (0.41)
  * _Chrysler Imperial_ and _Merc 450SE_ (0.41)
  * _Volvo 142E_ and _Merc 230_ (0.42)
  * _Merc 450SE_ and _Duster 360_ (0.44)
  * _Maserati Bora_ and _Camaro Z28_ (0.45)
  * _Toyota Corona_ and _Merc 230_ (0.46)
  * _Pontiac Firebird_ and _Merc 450SE_ (0.46)

<!-- end of list -->



{% endhighlight %}
</li>
	<li id="export-MDS"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport('MDS.tpl', data=ius2008, vars=c('age', 'edu', 'leisure'), max.dist.num=16)
rapport('MDS.tpl', data=ius2008, vars=c('age', 'edu', 'leisure'), max.dist.num=17, min.dist.num=30)
rapport('MDS.tpl', data=mtcars, vars=c('drat', 'cyl', 'mpg'), max.dist.num=17, min.dist.num=30)

{% endhighlight %}
<h6>Popular formats:</h6>
<ul>
	<li><a href="demo/MDS.html" target="_blank">HTML</a></li>
	<li><a href="demo/MDS.pdf" target="_blank">pdf</a></li>
	<li><a href="demo/MDS.docx">docx (MS Word 2007 format)</a></li>
	<li><a href="demo/MDS.odt">odt (MS Word compatible)</a></li>
	<li><a href="demo/MDS.rtf">rtf (MS Word compatible)</a></li>
	<li><a href="demo/MDS.epub">epub</a></li>
</ul>
<h6>Other morkdown formats</h6>
<ul>
	<li><a href="demo/MDS.textile" target="_blank">textile</a></li>
	<li><a href="demo/MDS.docbook" target="_blank">docbook</a></li>
	<li><a href="demo/MDS.man" target="_blank">man</a></li>
	<li><a href="demo/MDS.md" target="_blank">markdown</a></li>
	<li><a href="demo/MDS.mediawiki" target="_blank">mediawiki</a></li>
	<li><a href="demo/MDS.wiki" target="_blank">wiki</a></li>
	<li><a href="demo/MDS.org" target="_blank">org</a></li>
	<li><a href="demo/MDS.pandoc" target="_blank">pandoc</a></li>
</ul>
</div></li>
	<li id="source-MDS"><div>
<h5>Source of `MDS.tpl`</h5>
{% highlight text %}

<!--head
meta:
  title: Multidimensional Scaling
  author: Daniel Nagy
  description: In this template Rapporter will present you Multidimensional Scaling.
  email: ~
  packages: ~
  example:
  - rapport('MDS.tpl', data=ius2008, vars=c('age', 'edu', 'leisure'), max.dist.num=16)
  - rapport('MDS.tpl', data=ius2008, vars=c('age', 'edu', 'leisure'), max.dist.num=17, min.dist.num=30)
  - rapport('MDS.tpl', data=mtcars, vars=c('drat', 'cyl', 'mpg'), max.dist.num=17, min.dist.num=30)
inputs:
- name: vars
  label: Used Variables
  description: These are the variables which MDS use to differentiate between values
  class: numeric
  length:
    min: 2.0
    max: 100.0
  required: yes
  standalone: no
- name: id
  label: Labels of the cases
  description: On the plot, these names will be shown as the labels of the cases
  class: ~
  required: no
  standalone: no
- name: dist.mat
  label : Distance Matrix
  description: Is your data a Distance matrix?
  class: logical
  value: no
  required: no
  standalone: yes
- name: max.dist.num
  label: Maximum Distance Number
  description: Number of pairs with the biggest differences
  class: integer
  length:
    min: 1.0
    max: 1.0
  limit:
    min: 1.0
    max: 1000.0
  value: 10
  required: no
  standalone: yes
- name: min.dist.num
  label: Minimum Distance Number
  description: Number of pairs with the smallest distances
  class: integer
  length:
    min: 1.0
    max: 1.0
  limit:
    min: 1.0
    max: 1000.0
  value: 10
  required: no
  standalone: yes
head-->


# Introduction

[Multidimensional-scaling](http://en.wikipedia.org/wiki/Multidimensional_scaling) is a technique which gives us a visual representation about the distances between the observations. 

# MDS

Below you can see a plot, that presents you the distance between the observations, which was calculated based on <%=rp.label(vars)%>.

<%= if (exists('id') && !is.null(id)) {
id <- as.character(id)
id[which(is.na(id))] <- "noname"
dd <- duplicated(id)
if (any(dd)) {
warning("Among labels some of them are duplicated. Possibly there is a better way to label, please consider other options. In this report duplications will be distinguished by following '_' and numbers after them.")
}
whichisduplicated <- apply(data.frame(need = names(table(id[dd]))), 1, function(i) which(id==i))
if (class(whichisduplicated) != "list") {
  whichisduplicated <- list('1' = whichisduplicated) }
lapply(whichisduplicated, function(i) id[i] <<- paste(id[i], 1:length(i), sep = "_") )
rownames(vars) <- id
}
variables <- scale(na.omit(vars))
if (!dist.mat) {
d <- dist(variables) 
} else { 
d <- variables
}
try(fit <- cmdscale(d, eig = TRUE, k = 2))
if (exists('fit') && !is.null(fit)) { 
} else {
d <- dist(variables)
fit <- cmdscale(d, eig = TRUE, k = 2)
}
x <- fit$points[, 1]
y <- fit$points[, 2]
plot(x, y, xlab="Coordinate 1", ylab = "Coordinate 2", main = "Metric  MDS",   type = "n")
+text(x, y, labels = row.names(variables), cex = 0.7, col = panderOptions("graph.colors")[4]) 
distance <- as.matrix(d)
maxind <- which(distance == max(distance), arr.ind = TRUE)
minind <- which(distance == min(distance[distance != min(distance)]), arr.ind = TRUE)
%>

### What can be seen here?

#### Outsiders
<%=
furthest <- colnames(distance)[which(colSums(distance) == max(colSums(distance)))]
nearest <- colnames(distance)[which(colSums(distance) == min(colSums(distance)))]%>

<%=furthest %> differ<%= ifelse(length(furthest) > 1, "", "s")%> the most from the others, and <%=nearest%> seem<%= (ifelse (length(nearest) > 1, "", "s"))%> to be the most "common" observation<%= (ifelse (length(nearest) > 1, "s", ""))%>, which <%=ifelse(length(nearest) > 1, "lies", "lie") %> nearest to all other observations.

<%=
distance[upper.tri(distance, diag = T)] <- NA
h <- NULL
notneeded <- apply(data.frame(unique(as.vector(sort(distance[lower.tri(distance)], decreasing = T))[1:max.dist.num])), 1, function(i) h <<- rbind(h, which(distance == i, arr.ind = T)))
j <- NULL
notneeded <- apply(data.frame(unique(as.vector(sort(distance[lower.tri(distance)], decreasing = F))[1:min.dist.num])), 1, function(i) j <<- rbind(j, which(distance == i, arr.ind = T)))
%>

#### Outsider Pairs

<%=paste0(p(c(rownames(distance)[h[1, 1]], colnames(distance)[h[1, 2]])), ' (', round(distance[h[1, 1], h[1, 2]], 2), ')')%> are the "furthest", <%=paste0(p(c(rownames(distance)[j[1, 1]], colnames(distance)[j[1, 2]])), ' (', round(distance[j[1, 1], j[1, 2]], 2), ')') %> are the "nearest" to each other.

#### In General

Now let's see which observations can be said statistically far/similar to each other in general. The <%=max.dist.num%> pairs with the biggest differences and the <%=min.dist.num%> pairs with the smallest differences will be presented. In the brackets you can see the amount of the distances between two observations.

<%if (nrow(h) <= max.dist.num) { %>

According to the used variables (<%=rp.label(vars)%>) the <%=max.dist.num%> furthest pair of observations are:

<%=
paste(pander.return(lapply(1:nrow(h), function(i) paste0(p(c(rownames(distance)[h[i, 1]], colnames(distance)[h[i, 2]])), ' (', round(distance[h[i, 1], h[i, 2]], 2), ')'))), collapse = '\n')
%>

<% } else { %>

There are <%=nrow(h)%> observations which are the most similar, and equal in the same time, that is a higher number than the wanted <%=max.dist.num%>, thus will not be reported one-by-one. Set <%=nrow(h)%> as parameter _max.dist.num_ to check the pairs if you are interested.
<%}%>

 
<%if (nrow(j) <= min.dist.num) { %>

According to the used variables (<%=rp.label(vars)%>) the <%=min.dist.num%> nearest pair of observations are:

<%=
paste(pander.return(lapply(1:nrow(j), function(i) paste0(p(c(rownames(distance)[j[i, 1]], colnames(distance)[j[i, 2]])), ' (', round(distance[j[i, 1], j[i, 2]], 2), ')'))), collapse = '\n')
%>

<% } else { %>

There are <%=nrow(j)%> observations which are the most similar and equal in the same time, that is a higher number than the wanted <%=min.dist.num%>, thus will not be reported one-by-one. Set <%=nrow(j)%> as parameter _min.dist.num_ to check the pairs if you are interested.
<%}%>




{% endhighlight %}
</div></li>
</ul>

<a id="NormalityTest"> </a>
#### NormalityTest.tpl

 <ul class="tabs">
	<li><a class="active" href="#info-NormalityTest">Description</a></li>
	<li><a href="#inputs-NormalityTest">Inputs</a></li>
	<li><a href="#example-NormalityTest">Example</a></li>
	<li><a href="#export-NormalityTest">Export</a></li>
	<li><a href="#source-NormalityTest">Source</a></li>
</ul>

 <ul class="tabs-content">
	<li class="active" id="info-NormalityTest"><div><h5>Normality Tests</h5> by <em>Aleksandar Blagotić</em>
<br><br>
 Overview of several normality tests and diagnostic plots that can screen departures from normality.
<br><br>
<em>Required packages:</em> nortest
<br>
<em>Example:</em> 
{% highlight text %}
rapport("NormalityTest", ius2008, var = "leisure")
rapport("NormalityTest", ius2008, var = "leisure", nc.plot = FALSE)
rapport("NormalityTest", ius2008, var = "leisure", qq.line = FALSE)
{% endhighlight %}
</div></li>
	<li id="inputs-NormalityTest"><div><h5>Input parameters</h5><em>NormalityTest.tpl</em> template has the following options to be (optionally) set while calling <em>rapport</em>:<ul>
	
 Inputs
 
 "var" (Test variables)  *required
 Variables to test for normality
   - class:		numeric
   - standalone:	no
   - length:		exactly 1 vector
 
 "nc.plot" (Normal curve plot)
 Plot normal curve?
   - class:		logical
   - standalone:	yes
   - length:		exactly 1 value
   - value:		TRUE
 
 "qq.line" (Q-Q plot line)
 Add line to Q-Q plot?
   - class:		logical
   - standalone:	yes
   - length:		exactly 1 value
   - value:		TRUE
 </ul></div></li>
	<li id="example-NormalityTest">
{% highlight text %}


######################################################################
##	 Running: rapport("NormalityTest", ius2008, var = "leisure")
######################################################################

# Introduction


In statistics, _normality_ refers to an assumption that the distribution of a random variable follows _normal_ (_Gaussian_) distribution. Because of its bell-like shape, it's also known as the _"bell curve"_. The formula for _normal distribution_ is:

$$f(x) = \frac{1}{\sqrt{2\pi{}\sigma{}^2}} e^{-\frac{(x-\mu{})^2}{2\sigma{}^2}}$$

_Normal distribution_ belongs to a _location-scale family_ of distributions, as it's defined two parameters:

 - $\mu$ - _mean_ or _expectation_ (location parameter)
 - $\sigma^2$ - _variance_ (scale parameter)

[![](plots/NormalityTest-1.png)](plots/NormalityTest-1-hires.png)

# Normality Tests


## Overview


Various hypothesis tests can be applied in order to test if the distribution of given random variable violates normality assumption. These procedures test the H~0~ that provided variable's distribution is _normal_. At this point only few such tests will be covered: the ones that are available in `stats` package (which comes bundled with default R installation) and `nortest` package that is [available](http://cran.r-project.org/web/packages/nortest/index.html) on CRAN.

 - **Shapiro-Wilk test** is a powerful normality test appropriate for small samples. In R, it's implemented in `shapiro.test` function available in `stats` package.
 - **Lilliefors test** is a modification of _Kolmogorov-Smirnov test_ appropriate for testing normality when parameters or normal distribution ($\mu$, $\sigma^2$) are not known. `lillie.test` function is located in `nortest` package.
 - **Anderson-Darling test** is one of the most powerful normality tests as it will detect the most of departures from normality. You can find `ad.test` function in `nortest` package.


## Results


Here you can see the results of applied normality tests (_p-values_ less than 0.05 indicate significant discrepancies):

We will use _Shapiro-Wilk_, _Lilliefors_ and _Anderson-Darling_ tests to screen departures from normality in the response variable. 




-------------------------------------------------
          Method             Statistic   p-value 
--------------------------- ----------- ---------
        Lilliefors             0.168      3e-52  
   (Kolmogorov-Smirnov)                          
      normality test                             

Anderson-Darling normality     18.75    7.261e-44
           test                                  

Shapiro-Wilk normality test   0.9001    1.618e-20
-------------------------------------------------


So, the conclusions we can draw with the help of test statistics: 
   
 - based on _Lilliefors test_, distribution of _Internet usage in leisure time (hours per day)_ is not normal
   
 - _Anderson-Darling test_ confirms violation of normality assumption

 - according to _Shapiro-Wilk test_, the distribution of _Internet usage in leisure time (hours per day)_ is not normal
 


As you can see, the applied tests confirm departures from normality.

# Diagnostic Plots


There are various plots that can help you decide about the normality of the distribution. Only a few most commonly used plots will be shown: _histogram_, _Q-Q plot_ and _kernel density plot_.


## Histogram


_Histogram_ was first introduced by _Karl Pearson_ and it's probably the most popular plot for depicting the probability distribution of a random variable. However, the decision depends on number of bins, so it can sometimes be misleading. If the variable distribution is normal, bins should resemble the "bell-like" shape.

[![](plots/NormalityTest-2.png)](plots/NormalityTest-2-hires.png)

## Q-Q Plot


"Q" in _Q-Q plot_ stands for _quantile_, as this plot compares empirical and theoretical distribution (in this case, _normal_ distribution) by plotting their quantiles against each other. For normal distribution, plotted dots should approximate a "straight", `x = y` line.

[![](plots/NormalityTest-3.png)](plots/NormalityTest-3-hires.png)

## Kernel Density Plot


_Kernel density plot_ is a plot of smoothed _empirical distribution function_. As such, it provides good insight about the shape of the distribution. For normal distributions, it should resemble the well known "bell shape".

[![](plots/NormalityTest-4.png)](plots/NormalityTest-4-hires.png)


#######################################################################################
##	 Running: rapport("NormalityTest", ius2008, var = "leisure", nc.plot = FALSE)
#######################################################################################

# Introduction


In statistics, _normality_ refers to an assumption that the distribution of a random variable follows _normal_ (_Gaussian_) distribution. Because of its bell-like shape, it's also known as the _"bell curve"_. The formula for _normal distribution_ is:

$$f(x) = \frac{1}{\sqrt{2\pi{}\sigma{}^2}} e^{-\frac{(x-\mu{})^2}{2\sigma{}^2}}$$

_Normal distribution_ belongs to a _location-scale family_ of distributions, as it's defined two parameters:

 - $\mu$ - _mean_ or _expectation_ (location parameter)
 - $\sigma^2$ - _variance_ (scale parameter)


# Normality Tests


## Overview


Various hypothesis tests can be applied in order to test if the distribution of given random variable violates normality assumption. These procedures test the H~0~ that provided variable's distribution is _normal_. At this point only few such tests will be covered: the ones that are available in `stats` package (which comes bundled with default R installation) and `nortest` package that is [available](http://cran.r-project.org/web/packages/nortest/index.html) on CRAN.

 - **Shapiro-Wilk test** is a powerful normality test appropriate for small samples. In R, it's implemented in `shapiro.test` function available in `stats` package.
 - **Lilliefors test** is a modification of _Kolmogorov-Smirnov test_ appropriate for testing normality when parameters or normal distribution ($\mu$, $\sigma^2$) are not known. `lillie.test` function is located in `nortest` package.
 - **Anderson-Darling test** is one of the most powerful normality tests as it will detect the most of departures from normality. You can find `ad.test` function in `nortest` package.


## Results


Here you can see the results of applied normality tests (_p-values_ less than 0.05 indicate significant discrepancies):

We will use _Shapiro-Wilk_, _Lilliefors_ and _Anderson-Darling_ tests to screen departures from normality in the response variable. 




-------------------------------------------------
          Method             Statistic   p-value 
--------------------------- ----------- ---------
        Lilliefors             0.168      3e-52  
   (Kolmogorov-Smirnov)                          
      normality test                             

Anderson-Darling normality     18.75    7.261e-44
           test                                  

Shapiro-Wilk normality test   0.9001    1.618e-20
-------------------------------------------------


So, the conclusions we can draw with the help of test statistics: 
   
 - based on _Lilliefors test_, distribution of _Internet usage in leisure time (hours per day)_ is not normal
   
 - _Anderson-Darling test_ confirms violation of normality assumption

 - according to _Shapiro-Wilk test_, the distribution of _Internet usage in leisure time (hours per day)_ is not normal
 


As you can see, the applied tests confirm departures from normality.

# Diagnostic Plots


There are various plots that can help you decide about the normality of the distribution. Only a few most commonly used plots will be shown: _histogram_, _Q-Q plot_ and _kernel density plot_.


## Histogram


_Histogram_ was first introduced by _Karl Pearson_ and it's probably the most popular plot for depicting the probability distribution of a random variable. However, the decision depends on number of bins, so it can sometimes be misleading. If the variable distribution is normal, bins should resemble the "bell-like" shape.

[![](plots/NormalityTest-2.png)](plots/NormalityTest-2-hires.png)

## Q-Q Plot


"Q" in _Q-Q plot_ stands for _quantile_, as this plot compares empirical and theoretical distribution (in this case, _normal_ distribution) by plotting their quantiles against each other. For normal distribution, plotted dots should approximate a "straight", `x = y` line.

[![](plots/NormalityTest-5.png)](plots/NormalityTest-5-hires.png)

## Kernel Density Plot


_Kernel density plot_ is a plot of smoothed _empirical distribution function_. As such, it provides good insight about the shape of the distribution. For normal distributions, it should resemble the well known "bell shape".

[![](plots/NormalityTest-4.png)](plots/NormalityTest-4-hires.png)


#######################################################################################
##	 Running: rapport("NormalityTest", ius2008, var = "leisure", qq.line = FALSE)
#######################################################################################

# Introduction


In statistics, _normality_ refers to an assumption that the distribution of a random variable follows _normal_ (_Gaussian_) distribution. Because of its bell-like shape, it's also known as the _"bell curve"_. The formula for _normal distribution_ is:

$$f(x) = \frac{1}{\sqrt{2\pi{}\sigma{}^2}} e^{-\frac{(x-\mu{})^2}{2\sigma{}^2}}$$

_Normal distribution_ belongs to a _location-scale family_ of distributions, as it's defined two parameters:

 - $\mu$ - _mean_ or _expectation_ (location parameter)
 - $\sigma^2$ - _variance_ (scale parameter)

[![](plots/NormalityTest-1.png)](plots/NormalityTest-1-hires.png)

# Normality Tests


## Overview


Various hypothesis tests can be applied in order to test if the distribution of given random variable violates normality assumption. These procedures test the H~0~ that provided variable's distribution is _normal_. At this point only few such tests will be covered: the ones that are available in `stats` package (which comes bundled with default R installation) and `nortest` package that is [available](http://cran.r-project.org/web/packages/nortest/index.html) on CRAN.

 - **Shapiro-Wilk test** is a powerful normality test appropriate for small samples. In R, it's implemented in `shapiro.test` function available in `stats` package.
 - **Lilliefors test** is a modification of _Kolmogorov-Smirnov test_ appropriate for testing normality when parameters or normal distribution ($\mu$, $\sigma^2$) are not known. `lillie.test` function is located in `nortest` package.
 - **Anderson-Darling test** is one of the most powerful normality tests as it will detect the most of departures from normality. You can find `ad.test` function in `nortest` package.


## Results


Here you can see the results of applied normality tests (_p-values_ less than 0.05 indicate significant discrepancies):

We will use _Shapiro-Wilk_, _Lilliefors_ and _Anderson-Darling_ tests to screen departures from normality in the response variable. 




-------------------------------------------------
          Method             Statistic   p-value 
--------------------------- ----------- ---------
        Lilliefors             0.168      3e-52  
   (Kolmogorov-Smirnov)                          
      normality test                             

Anderson-Darling normality     18.75    7.261e-44
           test                                  

Shapiro-Wilk normality test   0.9001    1.618e-20
-------------------------------------------------


So, the conclusions we can draw with the help of test statistics: 
   
 - based on _Lilliefors test_, distribution of _Internet usage in leisure time (hours per day)_ is not normal
   
 - _Anderson-Darling test_ confirms violation of normality assumption

 - according to _Shapiro-Wilk test_, the distribution of _Internet usage in leisure time (hours per day)_ is not normal
 


As you can see, the applied tests confirm departures from normality.

# Diagnostic Plots


There are various plots that can help you decide about the normality of the distribution. Only a few most commonly used plots will be shown: _histogram_, _Q-Q plot_ and _kernel density plot_.


## Histogram


_Histogram_ was first introduced by _Karl Pearson_ and it's probably the most popular plot for depicting the probability distribution of a random variable. However, the decision depends on number of bins, so it can sometimes be misleading. If the variable distribution is normal, bins should resemble the "bell-like" shape.

[![](plots/NormalityTest-2.png)](plots/NormalityTest-2-hires.png)

## Q-Q Plot


"Q" in _Q-Q plot_ stands for _quantile_, as this plot compares empirical and theoretical distribution (in this case, _normal_ distribution) by plotting their quantiles against each other. For normal distribution, plotted dots should approximate a "straight", `x = y` line.

[![](plots/NormalityTest-6.png)](plots/NormalityTest-6-hires.png)

## Kernel Density Plot


_Kernel density plot_ is a plot of smoothed _empirical distribution function_. As such, it provides good insight about the shape of the distribution. For normal distributions, it should resemble the well known "bell shape".

[![](plots/NormalityTest-4.png)](plots/NormalityTest-4-hires.png)


{% endhighlight %}
</li>
	<li id="export-NormalityTest"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport("NormalityTest", ius2008, var = "leisure")
rapport("NormalityTest", ius2008, var = "leisure", nc.plot = FALSE)
rapport("NormalityTest", ius2008, var = "leisure", qq.line = FALSE)

{% endhighlight %}
<h6>Popular formats:</h6>
<ul>
	<li><a href="demo/NormalityTest.html" target="_blank">HTML</a></li>
	<li><a href="demo/NormalityTest.pdf" target="_blank">pdf</a></li>
	<li><a href="demo/NormalityTest.docx">docx (MS Word 2007 format)</a></li>
	<li><a href="demo/NormalityTest.odt">odt (MS Word compatible)</a></li>
	<li><a href="demo/NormalityTest.rtf">rtf (MS Word compatible)</a></li>
	<li><a href="demo/NormalityTest.epub">epub</a></li>
</ul>
<h6>Other morkdown formats</h6>
<ul>
	<li><a href="demo/NormalityTest.textile" target="_blank">textile</a></li>
	<li><a href="demo/NormalityTest.docbook" target="_blank">docbook</a></li>
	<li><a href="demo/NormalityTest.man" target="_blank">man</a></li>
	<li><a href="demo/NormalityTest.md" target="_blank">markdown</a></li>
	<li><a href="demo/NormalityTest.mediawiki" target="_blank">mediawiki</a></li>
	<li><a href="demo/NormalityTest.wiki" target="_blank">wiki</a></li>
	<li><a href="demo/NormalityTest.org" target="_blank">org</a></li>
	<li><a href="demo/NormalityTest.pandoc" target="_blank">pandoc</a></li>
</ul>
</div></li>
	<li id="source-NormalityTest"><div>
<h5>Source of `NormalityTest.tpl`</h5>
{% highlight text %}

<!--head
meta:
  title: Normality Tests
  author: Aleksandar Blagotić
  description: Overview of several normality tests and diagnostic plots that can screen
    departures from normality.
  email: ~
  packages: nortest
  example:
  - rapport("NormalityTest", ius2008, var = "leisure")
  - rapport("NormalityTest", ius2008, var = "leisure", nc.plot = FALSE)
  - rapport("NormalityTest", ius2008, var = "leisure", qq.line = FALSE)
inputs:
- name: var
  label: Test variables
  description: Variables to test for normality
  class: numeric
  length:
    min: 1.0
    max: 1.0
  value: ~
  required: yes
  standalone: no
- name: nc.plot
  label: Normal curve plot
  description: Plot normal curve?
  class: logical
  length:
    min: 1.0
    max: 1.0
  value: yes
  required: no
  standalone: yes
- name: qq.line
  label: Q-Q plot line
  description: Add line to Q-Q plot?
  class: logical
  length:
    min: 1.0
    max: 1.0
  value: yes
  required: no
  standalone: yes
head-->

# Introduction

In statistics, _normality_ refers to an assumption that the distribution of a random variable follows _normal_ (_Gaussian_) distribution. Because of its bell-like shape, it's also known as the _"bell curve"_. The formula for _normal distribution_ is:

$$f(x) = \frac{1}{\sqrt{2\pi{}\sigma{}^2}} e^{-\frac{(x-\mu{})^2}{2\sigma{}^2}}$$

_Normal distribution_ belongs to a _location-scale family_ of distributions, as it's defined two parameters:

 - $\mu$ - _mean_ or _expectation_ (location parameter)
 - $\sigma^2$ - _variance_ (scale parameter)

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
 - **Lilliefors test** is a modification of _Kolmogorov-Smirnov test_ appropriate for testing normality when parameters or normal distribution ($\mu$, $\sigma^2$) are not known. `lillie.test` function is located in `nortest` package.
 - **Anderson-Darling test** is one of the most powerful normality tests as it will detect the most of departures from normality. You can find `ad.test` function in `nortest` package.

## Results

Here you can see the results of applied normality tests (_p-values_ less than 0.05 indicate significant discrepancies):

We will use <%=ifelse(length(var) < 5000, "_Shapiro-Wilk_, ", "")%>_Lilliefors_ and _Anderson-Darling_ tests to screen departures from normality in the response variable. <%=ifelse(length(var) > 5000, "_Shapiro-Wilk_ test can only be used with samples below 5000 cases, now we have more.", "")%>

<% if (length(var) < 5000) { %>

<%= ntest <- htest(var, lillie.test, ad.test, shapiro.test)
k <- 0
l <- 0
m <- 0
n <- 0
p <- 0.05
if (ntest$p[1] < 0.05) {l <- k + 1}
if (ntest$p[2] < 0.05) {m <- l + 1}
if (ntest$p[3] < 0.05) {n <- m + 1}
ntest
%>
So, the conclusions we can draw with the help of test statistics: 
   
 - based on _Lilliefors test_, distribution of _<%= var.label %>_ is <%= ifelse(ntest[1, 3] < p, "not normal", "normal") %>
   
 - _Anderson-Darling test_ confirms<%= ifelse(ntest[2, 3] < p, " violation of", "") %> normality assumption

 - according to _Shapiro-Wilk test_, the distribution of _<%= var.label %>_ is<%= ifelse(ntest[3, 3] < p, " not", "") %> normal
 
<% } else { %>
<%= ntest <- htest(var, lillie.test, ad.test)
k <- 0
l <- 0
m <- 0
n <- 0
p <- 0.05
if (ntest$p[1] < 0.05) {l <- k + 1}
if (ntest$p[2] < 0.05) {n <- l + 1}
ntest
%>

So, the conclusions we can draw with the help of test statistics: 
   
 - based on _Lilliefors test_, distribution of _<%= var.label %>_ is <%= ifelse(ntest[1, 3] < p, "not normal", "normal") %>
   
 - _Anderson-Darling test_ confirms<%= ifelse(ntest[2, 3] < p, " violation of", "") %> normality assumption
<% } %>

<%= if (n > 0) {
sprintf("As you can see, the applied tests %s.", ifelse(n > 1, "confirm departures from normality", "yield different results on hypotheses of normality, so you may want to stick with one you find most appropriate or you trust the most.")) 
} else { 
sprintf("reject departures from normality") 
} 
%>


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

<a id="OutlierTest"> </a>
#### OutlierTest.tpl

 <ul class="tabs">
	<li><a class="active" href="#info-OutlierTest">Description</a></li>
	<li><a href="#inputs-OutlierTest">Inputs</a></li>
	<li><a href="#example-OutlierTest">Example</a></li>
	<li><a href="#export-OutlierTest">Export</a></li>
	<li><a href="#source-OutlierTest">Source</a></li>
</ul>

 <ul class="tabs-content">
	<li class="active" id="info-OutlierTest"><div><h5>Outlier tests</h5> by <em>Gergely Daróczi, Dániel Nagy</em>
<br><br>
 This template will check if provided variable has any outliers.
<br><br>
<em>Required packages:</em> outliers
<br>
<em>Example:</em> 
{% highlight text %}
rapport('OutlierTest', data=ius2008, var='edu')
rapport('OutlierTest', data=ius2008, var='edu', lund.res=FALSE)
rapport('OutlierTest', data=ius2008, var='edu', lund.res=FALSE, references=FALSE, grubb=FALSE, dixon=FALSE)
{% endhighlight %}
</div></li>
	<li id="inputs-OutlierTest"><div><h5>Input parameters</h5><em>OutlierTest.tpl</em> template has the following options to be (optionally) set while calling <em>rapport</em>:<ul>
	
 Inputs
 
 "var" (Variable)  *required
 Numerical variable
   - class:		numeric
   - standalone:	no
   - length:		exactly 1 vector
 
 "lund.res" (Residuals)
 Return Lund's residuals?
   - class:		logical
   - standalone:	yes
   - length:		exactly 1 value
   - value:		FALSE
 
 "references" (References)
 Print references?
   - class:		logical
   - standalone:	yes
   - length:		exactly 1 value
   - value:		TRUE
 
 "grubb" (Grubb's test)
 Show Grubb's test?
   - class:		logical
   - standalone:	yes
   - length:		exactly 1 value
   - value:		TRUE
 
 "dixon" (Dixon's test)
 Show Dixon's test?
   - class:		logical
   - standalone:	yes
   - length:		exactly 1 value
   - value:		TRUE
 </ul></div></li>
	<li id="example-OutlierTest">
{% highlight text %}


###################################################################
##	 Running: rapport('OutlierTest', data=ius2008, var='edu')
###################################################################

# Introduction


An outlying observation, or outlier, is one that appears to deviate markedly from other members of the sample in which it occurs.
There are several ways to detect the outliers of our data. However, we cannot say one of them is the perfect method for that, thus it could be useful to take different methods into consideration.
We present here four of them, one by a chart (a Box Plot based on IQR) and three by statistical descriptions (Lund Test, Grubb's test, Dixon's test).


## References


  * Grubbs, F. E.: 1969, Procedures for detecting outlying observations in samples. Technometrics 11, pp. 1-21.


# Charts


Among the graphical displays the Box plots are quite widespread, because of their several advantages. For example, one can easily get approximately punctual first impression from the data and one can visually see the positions of the (possible) outliers, with the help of them.

The Box Plot we used here is based on IQR (Interquartile Range), which is the difference between the higher and the lower quartiles. On the chart the blue box shows the "middle-half" of the data, the so-called whiskers shows the border where from the possible values can be called outliers. The lower whisker is placed 1.5 times below the first quartile, similarly the higher whisker 1.5 times above the third quartile.

[![Boxplot: edu](plots/OutlierTest-1.png)](plots/OutlierTest-1-hires.png)

## References


  * Chambers, John, William Cleveland, Beat Kleiner, and Paul Tukey, (1983), Graphical Methods for Data Analysis, Wadsworth.
  * Upton, Graham; Cook, Ian (1996). Understanding Statistics. Oxford University Press. p. 55.


# Lund test


It seems that _4_ extreme values can be found in "Internet usage for educational purposes (hours per day)". These are: _10_, _0.5_, _1.5_ and _0.5_.


## Explanation


The above test for outliers was based on *lm(edu ~ 1)*:


--------------------------------------------------------------
     &nbsp;        Estimate   Std. Error   t value   Pr(>|t|) 
----------------- ---------- ------------ --------- ----------
 **(Intercept)**    2.048      0.07797      26.27   7.939e-105
--------------------------------------------------------------

Table: Linear model: edu ~ 1


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






###################################################################################
##	 Running: rapport('OutlierTest', data=ius2008, var='edu', lund.res=FALSE)
###################################################################################

# Introduction


An outlying observation, or outlier, is one that appears to deviate markedly from other members of the sample in which it occurs.
There are several ways to detect the outliers of our data. However, we cannot say one of them is the perfect method for that, thus it could be useful to take different methods into consideration.
We present here four of them, one by a chart (a Box Plot based on IQR) and three by statistical descriptions (Lund Test, Grubb's test, Dixon's test).


## References


  * Grubbs, F. E.: 1969, Procedures for detecting outlying observations in samples. Technometrics 11, pp. 1-21.


# Charts


Among the graphical displays the Box plots are quite widespread, because of their several advantages. For example, one can easily get approximately punctual first impression from the data and one can visually see the positions of the (possible) outliers, with the help of them.

The Box Plot we used here is based on IQR (Interquartile Range), which is the difference between the higher and the lower quartiles. On the chart the blue box shows the "middle-half" of the data, the so-called whiskers shows the border where from the possible values can be called outliers. The lower whisker is placed 1.5 times below the first quartile, similarly the higher whisker 1.5 times above the third quartile.

[![Boxplot: edu](plots/OutlierTest-1.png)](plots/OutlierTest-1-hires.png)

## References


  * Chambers, John, William Cleveland, Beat Kleiner, and Paul Tukey, (1983), Graphical Methods for Data Analysis, Wadsworth.
  * Upton, Graham; Cook, Ian (1996). Understanding Statistics. Oxford University Press. p. 55.


# Lund test


It seems that _4_ extreme values can be found in "Internet usage for educational purposes (hours per day)". These are: _10_, _0.5_, _1.5_ and _0.5_.


## Explanation


The above test for outliers was based on *lm(edu ~ 1)*:


--------------------------------------------------------------
     &nbsp;        Estimate   Std. Error   t value   Pr(>|t|) 
----------------- ---------- ------------ --------- ----------
 **(Intercept)**    2.048      0.07797      26.27   7.939e-105
--------------------------------------------------------------

Table: Linear model: edu ~ 1


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






###############################################################################################################################
##	 Running: rapport('OutlierTest', data=ius2008, var='edu', lund.res=FALSE, references=FALSE, grubb=FALSE, dixon=FALSE)
###############################################################################################################################

# Introduction


An outlying observation, or outlier, is one that appears to deviate markedly from other members of the sample in which it occurs.
There are several ways to detect the outliers of our data. However, we cannot say one of them is the perfect method for that, thus it could be useful to take different methods into consideration.
We present here four of them, one by a chart (a Box Plot based on IQR) and three by statistical descriptions (Lund Test, Grubb's test, Dixon's test).


## References


  * Grubbs, F. E.: 1969, Procedures for detecting outlying observations in samples. Technometrics 11, pp. 1-21.


# Charts


Among the graphical displays the Box plots are quite widespread, because of their several advantages. For example, one can easily get approximately punctual first impression from the data and one can visually see the positions of the (possible) outliers, with the help of them.

The Box Plot we used here is based on IQR (Interquartile Range), which is the difference between the higher and the lower quartiles. On the chart the blue box shows the "middle-half" of the data, the so-called whiskers shows the border where from the possible values can be called outliers. The lower whisker is placed 1.5 times below the first quartile, similarly the higher whisker 1.5 times above the third quartile.

[![Boxplot: edu](plots/OutlierTest-1.png)](plots/OutlierTest-1-hires.png)

## References


  * Chambers, John, William Cleveland, Beat Kleiner, and Paul Tukey, (1983), Graphical Methods for Data Analysis, Wadsworth.
  * Upton, Graham; Cook, Ian (1996). Understanding Statistics. Oxford University Press. p. 55.


# Lund test


It seems that _4_ extreme values can be found in "Internet usage for educational purposes (hours per day)". These are: _10_, _0.5_, _1.5_ and _0.5_.


## Explanation


The above test for outliers was based on *lm(edu ~ 1)*:


--------------------------------------------------------------
     &nbsp;        Estimate   Std. Error   t value   Pr(>|t|) 
----------------- ---------- ------------ --------- ----------
 **(Intercept)**    2.048      0.07797      26.27   7.939e-105
--------------------------------------------------------------

Table: Linear model: edu ~ 1



{% endhighlight %}
</li>
	<li id="export-OutlierTest"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport('OutlierTest', data=ius2008, var='edu')
rapport('OutlierTest', data=ius2008, var='edu', lund.res=FALSE)
rapport('OutlierTest', data=ius2008, var='edu', lund.res=FALSE, references=FALSE, grubb=FALSE, dixon=FALSE)

{% endhighlight %}
<h6>Popular formats:</h6>
<ul>
	<li><a href="demo/OutlierTest.html" target="_blank">HTML</a></li>
	<li><a href="demo/OutlierTest.pdf" target="_blank">pdf</a></li>
	<li><a href="demo/OutlierTest.docx">docx (MS Word 2007 format)</a></li>
	<li><a href="demo/OutlierTest.odt">odt (MS Word compatible)</a></li>
	<li><a href="demo/OutlierTest.rtf">rtf (MS Word compatible)</a></li>
	<li><a href="demo/OutlierTest.epub">epub</a></li>
</ul>
<h6>Other morkdown formats</h6>
<ul>
	<li><a href="demo/OutlierTest.textile" target="_blank">textile</a></li>
	<li><a href="demo/OutlierTest.docbook" target="_blank">docbook</a></li>
	<li><a href="demo/OutlierTest.man" target="_blank">man</a></li>
	<li><a href="demo/OutlierTest.md" target="_blank">markdown</a></li>
	<li><a href="demo/OutlierTest.mediawiki" target="_blank">mediawiki</a></li>
	<li><a href="demo/OutlierTest.wiki" target="_blank">wiki</a></li>
	<li><a href="demo/OutlierTest.org" target="_blank">org</a></li>
	<li><a href="demo/OutlierTest.pandoc" target="_blank">pandoc</a></li>
</ul>
</div></li>
	<li id="source-OutlierTest"><div>
<h5>Source of `OutlierTest.tpl`</h5>
{% highlight text %}

<!--head
meta:
  title: Outlier tests
  author: Gergely Daróczi, Dániel Nagy
  description: This template will check if provided variable has any outliers.
  email: gergely@snowl.net
  packages: outliers
  example:
  - rapport('OutlierTest', data=ius2008, var='edu')
  - rapport('OutlierTest', data=ius2008, var='edu', lund.res=FALSE)
  - rapport('OutlierTest', data=ius2008, var='edu', lund.res=FALSE, references=FALSE,
    grubb=FALSE, dixon=FALSE)
inputs:
- name: var
  label: Variable
  description: Numerical variable
  class: numeric
  length:
    min: 1.0
    max: 1.0
  value: ~
  required: yes
  standalone: no
- name: lund.res
  label: Residuals
  description: Return Lund's residuals?
  class: logical
  length:
    min: 1.0
    max: 1.0
  value: no
  required: no
  standalone: yes
- name: references
  label: References
  description: Print references?
  class: logical
  length:
    min: 1.0
    max: 1.0
  value: yes
  required: no
  standalone: yes
- name: grubb
  label: Grubb's test
  description: Show Grubb's test?
  class: logical
  length:
    min: 1.0
    max: 1.0
  value: yes
  required: no
  standalone: yes
- name: dixon
  label: Dixon's test
  description: Show Dixon's test?
  class: logical
  length:
    min: 1.0
    max: 1.0
  value: yes
  required: no
  standalone: yes
head-->

# Introduction

An outlying observation, or outlier, is one that appears to deviate markedly from other members of the sample in which it occurs.
There are several ways to detect the outliers of our data. However, we cannot say one of them is the perfect method for that, thus it could be useful to take different methods into consideration.
We present here four of them, one by a chart (a Box Plot based on IQR) and three by statistical descriptions (Lund Test, Grubb's test, Dixon's test).

## References

  * Grubbs, F. E.: 1969, Procedures for detecting outlying observations in samples. Technometrics 11, pp. 1-21.

# Charts

Among the graphical displays the Box plots are quite widespread, because of their several advantages. For example, one can easily get approximately punctual first impression from the data and one can visually see the positions of the (possible) outliers, with the help of them.

The Box Plot we used here is based on IQR (Interquartile Range), which is the difference between the higher and the lower quartiles. On the chart the blue box shows the "middle-half" of the data, the so-called whiskers shows the border where from the possible values can be called outliers. The lower whisker is placed 1.5 times below the first quartile, similarly the higher whisker 1.5 times above the third quartile.

<%=
set.caption(sprintf('Boxplot: %s', rp.name(var)))
rp.boxplot(var)
%>

## References

  * Chambers, John, William Cleveland, Beat Kleiner, and Paul Tukey, (1983), Graphical Methods for Data Analysis, Wadsworth.
  * Upton, Graham; Cook, Ian (1996). Understanding Statistics. Oxford University Press. p. 55.

# Lund test

It seems that <%=out <- rp.outlier(var); length(out)%> extreme values can be found in "<%=rp.label(var)%>". <%=ifelse(length(out) > 0, sprintf('These are: %s.', p(out)), '')%>

## Explanation

The above test for outliers was based on *lm(<%=rp.name(var)%> ~ 1)*:

<%=
set.caption(sprintf('Linear model: %s ~ 1', rp.name(var)))
lm(var ~ 1)
%>

<% if (lund.res) { %>

## The residuals returned:

<%=rstandard(lm(var ~ 1))%>

<% } %>

<%if (references) { %>

## References

  * Lund, R. E. 1975, "Tables for An Approximate Test for Outliers in Linear Models", Technometrics, vol. 17, no. 4, pp. 473-476.
  * Prescott, P. 1975, "An Approximate Test for Outliers in Linear Models", Technometrics, vol. 17, no. 1, pp. 129-132.

<% } %>

<%if (grubb & suppressMessages(suppressWarnings(require(outliers)))) { %>

# Grubb's test

<%=test <- grubbs.test(var); test$method%> shows that <%=ifelse(test$p.value>0.05, 'there are no outliers', test$alternative)%> (p=<%=test$p.value%>).

<%if (references) {%>

## References

  * Grubbs, F.E. (1950). Sample Criteria for testing outlying observations. Ann. Math. Stat. 21, 1, 27-58.

<% } %>

<% } %>



<% if (dixon & suppressMessages(suppressWarnings(require(outliers)))) { %>

# Dixon's test

<%=test <- chisq.out.test(var); test$method%> shows that <%=ifelse(test$p.value > 0.05, 'there are no outliers', test$alternative)%> (p=<%=test$p.value%>).

<% if (references) { %>

## References

  * Dixon, W.J. (1950). Analysis of extreme values. Ann. Math. Stat. 21, 4, 488-506.

<% } %>

<% } %>

{% endhighlight %}
</div></li>
</ul>

<a id="PCA"> </a>
#### PCA.tpl

 <ul class="tabs">
	<li><a class="active" href="#info-PCA">Description</a></li>
	<li><a href="#inputs-PCA">Inputs</a></li>
	<li><a href="#example-PCA">Example</a></li>
	<li><a href="#export-PCA">Export</a></li>
	<li><a href="#source-PCA">Source</a></li>
</ul>

 <ul class="tabs-content">
	<li class="active" id="info-PCA"><div><h5>Principal Component Analysis</h5> by <em>Daniel Nagy</em>
<br><br>
 In this template Rapporter will present you Principal Component Analysis.
<br><br>
<em>Required packages:</em> psych
<br>
<em>Example:</em> 
{% highlight text %}
rapport('PCA.tpl', data=mtcars, vars=c('carb', 'mpg', 'cyl', 'drat'), components=3)
rapport('PCA.tpl', data=mtcars, vars=c('carb', 'mpg', 'cyl', 'drat'), components=3, rot.method="oblimin")
{% endhighlight %}
</div></li>
	<li id="inputs-PCA"><div><h5>Input parameters</h5><em>PCA.tpl</em> template has the following options to be (optionally) set while calling <em>rapport</em>:<ul>
	
 Inputs
 
 "vars" (Used Variables)  *required
 Which variables would you use?
   - class:		numeric
   - standalone:	no
   - length:		from 2 to 1000 vectors
 
 "components" (Number of Components)  *required
 How many Principal Components you want to use?
   - class:		integer
   - standalone:	yes
   - length:		exactly 1 value
   - value:		2
   - limits:		1 <= x <= 999
 
 "rot.matrix" (Rotation Matrix)
 Would you check the Rotation Matrix?
   - class:		logical
   - standalone:	yes
   - length:		exactly 1 value
   - value:		TRUE
 
 "rot.method" (Method of Rotation)
 Which rotation method would you use?
   - class:		character
   - standalone:	yes
   - length:		exactly 1 value
   - matchable:		TRUE
   - options:		"none", "varimax", "quartimax", "promax", "oblimin", "simplimax" and "cluster"
   - value:		"varimax"
 </ul></div></li>
	<li id="example-PCA">
{% highlight text %}


#######################################################################################################
##	 Running: rapport('PCA.tpl', data=mtcars, vars=c('carb', 'mpg', 'cyl', 'drat'), components=3)
#######################################################################################################

# Introduction

 
[Principal Component Analysis](https://en.wikipedia.org/wiki/Principal_component_analysis) is a dimension reduction method. It produces linearly independent principal components using the variances of the observations in a set of variables.
 
 

# Results

 

---------------------------------------------------
           &nbsp;             PC1     PC2     PC3  
---------------------------- ------ ------- -------
   **Standard deviation**    6.298   1.35   0.9088 

 **Proportion of Variance**  0.9354 0.04298 0.01947

 **Cumulative Proportion**   0.9354 0.9783  0.9978 
---------------------------------------------------


From the table above one can see that the first _3_ Principal Components contains the _93.535 %_, _4.298 %_ and _1.947 %_ of the variances, so together the 99.78 % of that.


### Visual representation


It could be informative to see visually how the observations lies on these components. On that two dimensional plot below, where the axes are the components which contains the two most variances, you can see (the red vectors) the effect of the variables as well. 

[![](plots/PCA.tpl-1.png)](plots/PCA.tpl-1-hires.png)

## Rotation

As you wanted to check the Rotation matrix let us present that for you:

-------------------------------------------
  &nbsp;      PC1        PC2        PC3    
---------- ---------- ---------- ----------
 **carb**   -0.1486   **0.9728**  -0.08587 

 **mpg**   **0.9557**   0.1614     0.2433  

 **cyl**    -0.2476    0.07389   **0.9502**

 **drat**   0.05777     0.1488    -0.1745  
-------------------------------------------



The cells written in bold shows which components explain the most variances of the variables, with the help of them we can draw the following conclusion:

* PC1 is a principal component of mpg 
* PC2 is a principal component of carb 
* PC3 is a principal component of cyl 

<!-- end of list -->




We can say that none of these impacts are negative. 




#############################################################################################################################
##	 Running: rapport('PCA.tpl', data=mtcars, vars=c('carb', 'mpg', 'cyl', 'drat'), components=3, rot.method="oblimin")
#############################################################################################################################

# Introduction

 
[Principal Component Analysis](https://en.wikipedia.org/wiki/Principal_component_analysis) is a dimension reduction method. It produces linearly independent principal components using the variances of the observations in a set of variables.
 
 

# Results

 

---------------------------------------------------
           &nbsp;             PC1     PC2     PC3  
---------------------------- ------ ------- -------
   **Standard deviation**    6.298   1.35   0.9088 

 **Proportion of Variance**  0.9354 0.04298 0.01947

 **Cumulative Proportion**   0.9354 0.9783  0.9978 
---------------------------------------------------


From the table above one can see that the first _3_ Principal Components contains the _93.535 %_, _4.298 %_ and _1.947 %_ of the variances, so together the 99.78 % of that.


### Visual representation


It could be informative to see visually how the observations lies on these components. On that two dimensional plot below, where the axes are the components which contains the two most variances, you can see (the red vectors) the effect of the variables as well. 

[![](plots/PCA.tpl-1.png)](plots/PCA.tpl-1-hires.png)

## Rotation

As you wanted to check the Rotation matrix let us present that for you:

-------------------------------------------
  &nbsp;      PC1        PC2        PC3    
---------- ---------- ---------- ----------
 **carb**   -0.1486   **0.9728**  -0.08587 

 **mpg**   **0.9557**   0.1614     0.2433  

 **cyl**    -0.2476    0.07389   **0.9502**

 **drat**   0.05777     0.1488    -0.1745  
-------------------------------------------



The cells written in bold shows which components explain the most variances of the variables, with the help of them we can draw the following conclusion:

* PC1 is a principal component of mpg 
* PC2 is a principal component of carb 
* PC3 is a principal component of cyl 

<!-- end of list -->




We can say that none of these impacts are negative. 




{% endhighlight %}
</li>
	<li id="export-PCA"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport('PCA.tpl', data=mtcars, vars=c('carb', 'mpg', 'cyl', 'drat'), components=3)
rapport('PCA.tpl', data=mtcars, vars=c('carb', 'mpg', 'cyl', 'drat'), components=3, rot.method="oblimin")

{% endhighlight %}
<h6>Popular formats:</h6>
<ul>
	<li><a href="demo/PCA.html" target="_blank">HTML</a></li>
	<li><a href="demo/PCA.pdf" target="_blank">pdf</a></li>
	<li><a href="demo/PCA.docx">docx (MS Word 2007 format)</a></li>
	<li><a href="demo/PCA.odt">odt (MS Word compatible)</a></li>
	<li><a href="demo/PCA.rtf">rtf (MS Word compatible)</a></li>
	<li><a href="demo/PCA.epub">epub</a></li>
</ul>
<h6>Other morkdown formats</h6>
<ul>
	<li><a href="demo/PCA.textile" target="_blank">textile</a></li>
	<li><a href="demo/PCA.docbook" target="_blank">docbook</a></li>
	<li><a href="demo/PCA.man" target="_blank">man</a></li>
	<li><a href="demo/PCA.md" target="_blank">markdown</a></li>
	<li><a href="demo/PCA.mediawiki" target="_blank">mediawiki</a></li>
	<li><a href="demo/PCA.wiki" target="_blank">wiki</a></li>
	<li><a href="demo/PCA.org" target="_blank">org</a></li>
	<li><a href="demo/PCA.pandoc" target="_blank">pandoc</a></li>
</ul>
</div></li>
	<li id="source-PCA"><div>
<h5>Source of `PCA.tpl`</h5>
{% highlight text %}

<!--head
meta:
  title: Principal Component Analysis
  author: Daniel Nagy
  description: In this template Rapporter will present you Principal Component Analysis.
  email: ~
  packages: 
  - psych
  - GPArotation
  example:
  - rapport('PCA.tpl', data=mtcars, vars=c('carb', 'mpg', 'cyl', 'drat'), components=3)
  - rapport('PCA.tpl', data=mtcars, vars=c('carb', 'mpg', 'cyl', 'drat'), components=3, rot.method="oblimin")
inputs:
- name: vars
  label: Used Variables
  description: Which variables would you use?
  class: numeric
  length:
    min: 2.0
    max: 1000.0
  required: yes
  standalone: no
- name: components
  label: Number of Components
  description: How many Principal Components you want to use?
  class: integer
  limit:
    min: 1.0
    max: 999.0
  value: 2.0
  required: yes
  standalone: yes
- name: rot.matrix
  label : Rotation Matrix
  description: Would you check the Rotation Matrix?
  class: logical
  length:
    min: 1.0
    max: 1.0
  value: yes
  required: no
  standalone: yes
- name: rot.method
  label: Method of Rotation
  description: Which rotation method would you use?
  class: character
  length:
    min: 1.0
    max: 1.0
  options:
  - none
  - varimax
  - quartimax
  - promax
  - oblimin
  - simplimax
  - cluster
  value: varimax
  matchable: yes
  allow_multiple: no
  required: no
  standalone: yes
head-->


<% if (components > ncol(vars)) { %>

Your request cannot be implemented, because there are more components (<%= components %>) than the number of the used variables (<%= ncol(vars) %>). Please set the number of the components to maximum <%= ncol(vars) - 1 %> with the same number of the variables or extend the number of those variables to <%= components + 1 %>

<% } else { %>


# Introduction
 
[Principal Component Analysis](https://en.wikipedia.org/wiki/Principal_component_analysis) is a dimension reduction method. It produces linearly independent principal components using the variances of the observations in a set of variables.
 
 
# Results
 
<%=
vars <- na.omit(vars)
summ <- as.matrix(summary(prcomp(vars))$importance[, 1:components])
if (components == 1) colnames(summ)[1] <- "PC1"
summ
%>
From the table above one can see that the <%=ifelse(components == 1, "", "first")%> <%=components%> Principal Component<%=ifelse(components == 1, '', 's')%> contains the <%=paste(summary(prcomp(vars))$importance[2, 1:components] * 100, "%")%> of the variance<%=ifelse(components == 1, '', 's')%><% if (components != 1) {%>, so together the <%=paste(sum(summary(prcomp(vars))$importance[2, 1:components] * 100), "%")%> of that.<%} else{%>.<%}%>

### Visual representation

It could be informative to see visually how the observations lies on these components. On that two dimensional plot below, where the axes are the components which contains the two most variances, you can see (the red vectors) the effect of the variables as well. <% if(ncol(vars) > 5) { %> In the case we have several variables, the plot could be a little bit confusing but it still helps us to explore the number of the Principal Components. <% } %>

<%= 
biplot(prcomp(vars)) 
%>

<% if (rot.matrix) { %>

## Rotation


<%= 
ifelse(rot.matrix,"As you wanted to check the Rotation matrix let us present that for you:","")
if (rot.matrix) {
rot <- as.matrix(prcomp(vars)$rotation[,1:components])
if (components == 1) colnames(rot)[1] <- "PC1"
emphasize.strong.cells(which(abs(rot) > 0.3, arr.ind = TRUE))
rot
} else { }
%>

The cells written in bold shows which components explain the most variances of the variables, with the help of them we can draw the following conclusion:
<%=paste(pandoc.list.return(paste(colnames(rot)[which(abs(rot) > 0.3, arr.ind = TRUE)[, 2]],rp.name(vars)[which(abs(rot) > 0.3, arr.ind = TRUE)[, 1]], sep = " is a principal component of ")), collapse = '\n')%>

<% if (length(which(rot > 0.3)) != length(which(abs(rot) > 0.3))) { %>

<%=neg.comp <- colnames(rot)[which(rot < -0.3, arr.ind = TRUE)[, 2]]%>

From them in the case<%=ifelse(neg.comp < 1, "s", "")%> of the <%=paste(colnames(rot)[which(rot < -0.3, arr.ind = TRUE)[, 2]],rp.name(vars)[which(rot < -0.3, arr.ind = TRUE)[, 1]], sep = "'s impact on ")%>, we can say <%=ifelse(neg.comp < 1, "they are", "that is")%> negative.
  	
<% } else { %>
We can say that <%=ifelse(length(which(abs(rot) > 0.3)), "none of these impacts are negative", "this impact is positive")%>. 

<% }}} %>

{% endhighlight %}
</div></li>
</ul>

<a id="TTest"> </a>
#### TTest.tpl

 <ul class="tabs">
	<li><a class="active" href="#info-TTest">Description</a></li>
	<li><a href="#inputs-TTest">Inputs</a></li>
	<li><a href="#example-TTest">Example</a></li>
	<li><a href="#export-TTest">Export</a></li>
	<li><a href="#source-TTest">Source</a></li>
</ul>

 <ul class="tabs-content">
	<li class="active" id="info-TTest"><div><h5>t-test Template</h5> by <em>Aleksandar Blagotić</em>
<br><br>
 A t-test report with table of descriptives, diagnostic tests and t-test specific statistics.
<br><br>
<em>Required packages:</em> nortest
<br>
<em>Example:</em> 
{% highlight text %}
rapport("TTest", ius2008, x = "leisure", y = "gender")
rapport("TTest", ius2008, x = "leisure", mu = 3.2)
{% endhighlight %}
</div></li>
	<li id="inputs-TTest"><div><h5>Input parameters</h5><em>TTest.tpl</em> template has the following options to be (optionally) set while calling <em>rapport</em>:<ul>
	
 Inputs
 
 "x" (X variable)  *required
 Dependent (response) variable
   - class:		numeric
   - standalone:	no
   - length:		exactly 1 vector
 
 "y" (Y variable)
 Independent variable (factor, or another numeric)
   - standalone:	no
   - length:		exactly 1 vector
 
 "alter" (Alternative hypothesis)
 Whether two-sided, greater or less variant will be applied
   - class:		character
   - standalone:	yes
   - length:		exactly 1 value
   - matchable:		TRUE
   - options:		"two.sided", "less" and "greater"
   - value:		"two.sided"
 
 "mu" (Mean value)
 Mean value for one-sample t-test
   - class:		numeric
   - standalone:	yes
   - length:		exactly 1 value
   - limits:		-Inf <= x <= Inf
 
 "paired" (Paired t-test)
 Carry out paired t-test or not
   - class:		logical
   - standalone:	yes
   - length:		exactly 1 value
   - value:		FALSE
 
 "var.equal" (Variance equality)
 Equal variances assumed: choose automatically or not
   - class:		logical
   - standalone:	yes
   - length:		exactly 1 value
   - value:		FALSE
 
 "ci.level" (Confidence interval)
 Confidence interval level
   - class:		numeric
   - standalone:	yes
   - length:		exactly 1 value
   - value:		0.95
   - limits:		0 <= x <= 1
 </ul></div></li>
	<li id="example-TTest">
{% highlight text %}


##########################################################################
##	 Running: rapport("TTest", ius2008, x = "leisure", y = "gender")
##########################################################################

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
  male     0    12    3.27  1.953 3.816    3       3  

 female    0    12   3.064  2.355 5.544    2       3  
------------------------------------------------------

Table: Table continues below

 
---------------------
 skewness   kurtosis 
---------- ----------
  0.9443     0.9858  

  1.398       1.87   
---------------------


# Diagnostics


Since _t-test_ is a parametric technique, it sets some basic assumptions on distribution shape: it has to be _normal_ (or approximately normal). A few normality test are to be applied, in order to screen possible departures from normality.


## Normality Tests


We will use _Shapiro-Wilk_, _Lilliefors_ and _Anderson-Darling_ tests to screen departures from normality in the response variable (_Internet usage in leisure time (hours per day)_).


--------------------------------------------
             N                p             
--------------------------- ------ ---------
Shapiro-Wilk normality test 0.9001 1.618e-20

        Lilliefors          0.168    3e-52  
   (Kolmogorov-Smirnov)                     
      normality test                        

Anderson-Darling normality  18.75  7.261e-44
           test                             
--------------------------------------------



As you can see, applied tests yield different results on hypotheses of normality, so you may want to stick with one you find most appropriate or you trust the most..



# Results

Welch Two Sample t-test was applied, and significant differences were found.


--------------------------------------------------------
&nbsp;   statistic   df     p     CI(lower)   CI(upper) 
------- ----------- ----- ------ ----------- -----------
 **t**     1.148    457.9 0.2514   -0.1463     0.5576   
--------------------------------------------------------



######################################################################
##	 Running: rapport("TTest", ius2008, x = "leisure", mu = 3.2)
######################################################################

# Introduction


In a nutshell, _t-test_ is a statistical test that assesses hypothesis of equality of two means. But in theory, any hypothesis test that yields statistic which follows [_t-distribution_](https://en.wikipedia.org/wiki/Student%27s_t-distribution) can be considered a _t-test_. The most common usage of _t-test_ is to:

 - compare the mean of a variable with given test mean value - **one-sample _t-test_**
 - compare means of two variables from independent samples - **independent samples _t-test_**
 - compare means of two variables from dependent samples - **paired-samples _t-test_**


# Overview

One-sample _t-test_ is carried out with _Internet usage in leisure time (hours per day)_ as dependent variable. Confidence interval is set to 95%. Equality of variances wasn't assumed.


# Descriptives


In order to get more insight on the underlying data, a table of basic descriptive statistics is displayed below.


-------------------------------------------------------------
           Variable             min   max   mean   sd    var 
------------------------------ ----- ----- ------ ----- -----
Internet usage in leisure time   0    12   3.199  2.144 4.595
       (hours per day)                                       
-------------------------------------------------------------

Table: Table continues below

 
------------------------------------
 median   IQR   skewness   kurtosis 
-------- ----- ---------- ----------
   3       2     1.185      1.533   
------------------------------------


# Diagnostics


Since _t-test_ is a parametric technique, it sets some basic assumptions on distribution shape: it has to be _normal_ (or approximately normal). A few normality test are to be applied, in order to screen possible departures from normality.


## Normality Tests


We will use _Shapiro-Wilk_, _Lilliefors_ and _Anderson-Darling_ tests to screen departures from normality in the response variable (_Internet usage in leisure time (hours per day)_).


--------------------------------------------
             N                p             
--------------------------- ------ ---------
Shapiro-Wilk normality test 0.9001 1.618e-20

        Lilliefors          0.168    3e-52  
   (Kolmogorov-Smirnov)                     
      normality test                        

Anderson-Darling normality  18.75  7.261e-44
           test                             
--------------------------------------------



As you can see, applied tests yield different results on hypotheses of normality, so you may want to stick with one you find most appropriate or you trust the most..



# Results

One Sample t-test was applied, and significant differences were found.


-------------------------------------------------------
&nbsp;   statistic   df    p     CI(lower)   CI(upper) 
------- ----------- ---- ------ ----------- -----------
 **t**   -0.007198  671  0.9943    3.037       3.362   
-------------------------------------------------------



{% endhighlight %}
</li>
	<li id="export-TTest"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport("TTest", ius2008, x = "leisure", y = "gender")
rapport("TTest", ius2008, x = "leisure", mu = 3.2)

{% endhighlight %}
<h6>Popular formats:</h6>
<ul>
	<li><a href="demo/TTest.html" target="_blank">HTML</a></li>
	<li><a href="demo/TTest.pdf" target="_blank">pdf</a></li>
	<li><a href="demo/TTest.docx">docx (MS Word 2007 format)</a></li>
	<li><a href="demo/TTest.odt">odt (MS Word compatible)</a></li>
	<li><a href="demo/TTest.rtf">rtf (MS Word compatible)</a></li>
	<li><a href="demo/TTest.epub">epub</a></li>
</ul>
<h6>Other morkdown formats</h6>
<ul>
	<li><a href="demo/TTest.textile" target="_blank">textile</a></li>
	<li><a href="demo/TTest.docbook" target="_blank">docbook</a></li>
	<li><a href="demo/TTest.man" target="_blank">man</a></li>
	<li><a href="demo/TTest.md" target="_blank">markdown</a></li>
	<li><a href="demo/TTest.mediawiki" target="_blank">mediawiki</a></li>
	<li><a href="demo/TTest.wiki" target="_blank">wiki</a></li>
	<li><a href="demo/TTest.org" target="_blank">org</a></li>
	<li><a href="demo/TTest.pandoc" target="_blank">pandoc</a></li>
</ul>
</div></li>
	<li id="source-TTest"><div>
<h5>Source of `TTest.tpl`</h5>
{% highlight text %}

<!--head
meta:
  title: t-test Template
  author: Aleksandar Blagotić
  description: A t-test report with table of descriptives, diagnostic tests and t-test
    specific statistics.
  email: ~
  packages: nortest
  example:
  - rapport("TTest", ius2008, x = "leisure", y = "gender")
  - rapport("TTest", ius2008, x = "leisure", mu = 3.2)
inputs:
- name: x
  label: X variable
  description: Dependent (response) variable
  class: numeric
  length:
    min: 1.0
    max: 1.0
  value: ~
  required: yes
  standalone: no
- name: 'y'
  label: Y variable
  description: Independent variable (factor, or another numeric)
  length:
    min: 1.0
    max: 1.0
  value: ~
  required: no
  standalone: no
- name: alter
  label: Alternative hypothesis
  description: Whether two-sided, greater or less variant will be applied
  class: character
  length:
    min: 1.0
    max: 1.0
  options:
  - two.sided
  - less
  - greater
  value: two.sided
  matchable: yes
  allow_multiple: no
  required: no
  standalone: yes
- name: mu
  label: Mean value
  description: Mean value for one-sample t-test
  class: numeric
  length:
    min: 1.0
    max: 1.0
  value: ~
  limit:
    min: -.inf
    max: .inf
  required: no
  standalone: yes
- name: paired
  label: Paired t-test
  description: Carry out paired t-test or not
  class: logical
  length:
    min: 1.0
    max: 1.0
  value: no
  required: no
  standalone: yes
- name: var.equal
  label: Variance equality
  description: 'Equal variances assumed: choose automatically or not'
  class: logical
  length:
    min: 1.0
    max: 1.0
  value: no
  required: no
  standalone: yes
- name: ci.level
  label: Confidence interval
  description: Confidence interval level
  class: numeric
  length:
    min: 1.0
    max: 1.0
  value: 0.95
  limit:
    min: 0.0
    max: 1.0
  required: no
  standalone: yes
head-->
<%=

if (!exists('y') || is.null(y)) {

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
if (is.null(y)) {
    rp.desc(x, NULL, c('min', 'max', 'mean', 'sd', 'var', 'median', 'IQR', 'skewness', 'kurtosis'), rp.data)
} else {
    rp.desc(x, y, c('min', 'max', 'mean', 'sd', 'var', 'median', 'IQR', 'skewness', 'kurtosis'), rp.data)
}
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

<a id="WilcoxonTest"> </a>
#### WilcoxonTest.tpl

 <ul class="tabs">
	<li><a class="active" href="#info-WilcoxonTest">Description</a></li>
	<li><a href="#inputs-WilcoxonTest">Inputs</a></li>
	<li><a href="#example-WilcoxonTest">Example</a></li>
	<li><a href="#export-WilcoxonTest">Export</a></li>
	<li><a href="#source-WilcoxonTest">Source</a></li>
</ul>

 <ul class="tabs-content">
	<li class="active" id="info-WilcoxonTest"><div><h5>Wilcoxon test</h5> by <em>Daniel Nagy</em>
<br><br>
 In this template Rapporter will present you Wilcoxon test.
<br><br>
<em>Required packages:</em> 
<br>
<em>Example:</em> 
{% highlight text %}
rapport('WilcoxonTest.tpl', data=mtcars, var1='mpg', var2='cyl')
{% endhighlight %}
</div></li>
	<li id="inputs-WilcoxonTest"><div><h5>Input parameters</h5><em>WilcoxonTest.tpl</em> template has the following options to be (optionally) set while calling <em>rapport</em>:<ul>
	
 Inputs
 
 "var1" (Variable1)  *required
 This is the first variable which will be used here
   - class:		numeric
   - standalone:	no
   - length:		exactly 1 vector
 
 "var2" (Variable2)  *required
 This is the second variable which will be used here
   - class:		numeric
   - standalone:	no
   - length:		exactly 1 vector
 
 "alter" (Alternative hypothesis)
   - class:		character
   - standalone:	yes
   - length:		exactly 1 value
   - matchable:		TRUE
   - options:		"two.sided", "less" and "greater"
   - value:		"two.sided"
 </ul></div></li>
	<li id="example-WilcoxonTest">
{% highlight text %}


####################################################################################
##	 Running: rapport('WilcoxonTest.tpl', data=mtcars, var1='mpg', var2='cyl')
####################################################################################

# Introduction


[Wilcoxon test](http://en.wikipedia.org/wiki/Wilcoxon_test) (or its equivalent 
the Mann-Whitney U test)  is a non-parametric statistical test which can be an alternative of the  paired Student's t-test, t-test for matched pairs, or the t-test for dependent samples. When the Wilcoxon test is used to compare two samples of values which are not paired, it makes no assumption about the shape of the distribution, only that (as null hypothesis) the distribution from which mpg was sampled is the same as the distribution from which cyl was sampled. The null hypothesis states that the variances of the variables are equal.


-----------------------------------------------------------
 Test statistic       P value       Alternative hypothesis 
---------------- ----------------- ------------------------
      1024       _4.306e-12_ * * *        two.sided        
-----------------------------------------------------------

Table: Wilcoxon rank sum test with continuity correction mpg and cyl



As you can see in the table the the p-value of the Wilcoxon test is _4.306e-12_, thus we can accept the assumption of the null hypothesis, so we can say that statistically the variances are equal.




{% endhighlight %}
</li>
	<li id="export-WilcoxonTest"><div>
<h5>Exports of example</h5><em>pandoc</em> and the other backends provide a great number of formats to export your templates.<br>We have generated the following types for demonstartion purposes based on the example command(s):
{% highlight text %}

rapport('WilcoxonTest.tpl', data=mtcars, var1='mpg', var2='cyl')

{% endhighlight %}
<h6>Popular formats:</h6>
<ul>
	<li><a href="demo/WilcoxonTest.html" target="_blank">HTML</a></li>
	<li><a href="demo/WilcoxonTest.pdf" target="_blank">pdf</a></li>
	<li><a href="demo/WilcoxonTest.docx">docx (MS Word 2007 format)</a></li>
	<li><a href="demo/WilcoxonTest.odt">odt (MS Word compatible)</a></li>
	<li><a href="demo/WilcoxonTest.rtf">rtf (MS Word compatible)</a></li>
	<li><a href="demo/WilcoxonTest.epub">epub</a></li>
</ul>
<h6>Other morkdown formats</h6>
<ul>
	<li><a href="demo/WilcoxonTest.textile" target="_blank">textile</a></li>
	<li><a href="demo/WilcoxonTest.docbook" target="_blank">docbook</a></li>
	<li><a href="demo/WilcoxonTest.man" target="_blank">man</a></li>
	<li><a href="demo/WilcoxonTest.md" target="_blank">markdown</a></li>
	<li><a href="demo/WilcoxonTest.mediawiki" target="_blank">mediawiki</a></li>
	<li><a href="demo/WilcoxonTest.wiki" target="_blank">wiki</a></li>
	<li><a href="demo/WilcoxonTest.org" target="_blank">org</a></li>
	<li><a href="demo/WilcoxonTest.pandoc" target="_blank">pandoc</a></li>
</ul>
</div></li>
	<li id="source-WilcoxonTest"><div>
<h5>Source of `WilcoxonTest.tpl`</h5>
{% highlight text %}

<!--head
meta:
  title: Wilcoxon test
  author: Daniel Nagy
  description: In this template Rapporter will present you Wilcoxon test.
  email: ~
  packages: ~
  example:
  - rapport('WilcoxonTest.tpl', data=mtcars, var1='mpg', var2='cyl')
inputs:
- name: var1
  label: Variable1
  description: This is the first variable which will be used here
  class: numeric
  length:
    min: 1.0
    max: 1.0
  required: yes
  standalone: no
- name: var2
  label: Variable2
  description: This is the second variable which will be used here
  class: numeric
  length:
    min: 1.0
    max: 1.0
  required: yes
  standalone: no
- name: alter
  label: Alternative hypothesis
  description: 
  class: character
  options:
  - two.sided
  - less
  - greater
  value: two.sided
  matchable: yes
  allow.multiple: no
  required: no
  standalone: yes
head-->

# Introduction

[Wilcoxon test](http://en.wikipedia.org/wiki/Wilcoxon_test) (or its equivalent 
the Mann-Whitney U test)  is a non-parametric statistical test which can be an alternative of the  paired Student's t-test, t-test for matched pairs, or the t-test for dependent samples. When the Wilcoxon test is used to compare two samples of values which are not paired, it makes no assumption about the shape of the distribution, only that (as null hypothesis) the distribution from which <%=var1.label%> was sampled is the same as the distribution from which <%=var2.label%> was sampled. The null hypothesis states that the variances of the variables are equal.

<%=
set.caption(sprintf('Wilcoxon rank sum test with continuity correction %s and %s', var1.label, var2.label))
suppressWarnings(wilc <- wilcox.test(var1, var2, alter))
wilc
p.v <- wilc$p.value
%>

As you can see in the table the the p-value of the Wilcoxon test is <%=p.v%>, thus we can <%= ifelse(p.v > 0.05, "reject", "accept")%> the assumption of the null hypothesis, so we can say that statistically the variances are<%= ifelse(p.v > 0.05, " not", "")%> equal.



{% endhighlight %}
</div></li>
</ul>

