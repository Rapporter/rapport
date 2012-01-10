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
	<li><a href="#source-anova">Source</a></li>
</ul>

 <ul class="tabs-content">
	<li class="active" id="info-anova"><div><h5>ANOVA Template</h5> by <em>Aleksandar Blagotić</em>
<br><br>
 An ANOVA report with table of descriptives, diagnostic tests and ANOVA-specific statistics.
<br><br>
<em>Required packages:</em> nortest
<br>
<em>Example:</em> </div></li>
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
	<li id="example-anova">No examples provided with template, sorry.</li>
	<li id="export-anova">No examples provided with template, sorry.</li>
	<li id="source-anova"><div>
<h5>Source of `anova.tpl`</h5>
{% highlight text %}

<!--head
Title:        ANOVA Template
Author:       Aleksandar Blagotić
Description:  An ANOVA report with table of descriptives, diagnostic tests and ANOVA-specific statistics.
Packages:     nortest
resp     | numeric     | Response variable | Dependent (response) variable
fac      | factor[1,2] | Factor variables  | Independent variables (factors)
head-->
<%
d <- data.frame(resp, fac)
f <- as.formula(d)
fit <- lm(f, data = d)
fac.len <- length(fac)
fac.plu <- switch(fac.len, '', 's')
%>

# Brief info

<% switch(fac.len, 'One', 'Two') %>-Way ANOVA was carried out, with <% p(fac.label) %> as independent variable<% fac.plu %>, and <% p(resp.label) %> as a response variable.

# Descriptives

The following table displays the descriptive statistics of ANOVA model. You can see the factors on the left-hand side of the table, and summary statistics on the right hand side.

<%
rp.desc(fac, resp, c(min, max, mean, SD = sd, median, `M.A.D.` = mad, skewness, kurtosis), margins = TRUE)
%>

# Diagnostics

Before we carry out ANOVA, we'd like to check some basic assumptions. For those purposes, normality and homoscedascity tests are carried out alongside several graphs that may help you with your decision on model's goodness-of-fit.

## Diagnostic tests

### Normality tests

We will use _Shapiro-Wilk_, _Lilliefors_ and _Anderson-Darling_ tests to screen departures from normalitty.

<%
htest(split(resp, fac), shapiro.test, lillie.test, ad.test)
%>

### Homoscedascity tests

In order to test homoscedascity, _Bartlett_ and _Fligner-Kileen_ are applied.

<%
# we need to take different approach here until I come up with nifty helper
data.frame(
        B = e(bartlett.test(split(resp, fac))),
        F = e(fligner.test(split(resp, fac))),
        row.names = c('D', 'p')
)
%>

## Diagnostic plots

Here you can see several diagnostic plots for ANOVA model.

<%
par(mfrow = c(2, 2))
plot(fit)
%>

# ANOVA table

<%
data.frame(anova(fit))
%>

# Off-topic stuff

This should show: WORKS

<%
if (TRUE)
   "WORKS"
%>

This should show: SHOULD WORK TOO

<%
if (TRUE){
   "SHOULD WORK TOO"
}
%>

This should show nothing

<%
if (TRUE)
   x <- "WORKS"
%>

This should show nothing

<%
if (TRUE){
   x <- "WORKS"
}
%>

input name: <% resp.iname %>
variable name: <% p(resp.name) %>
variable label: <% p(resp.label) %>
input label: <% p(resp.ilabel) %>
input description: <% p(resp.idesc) %>
input length: <% resp.len %>

input name: <% fac.iname %>
variable name: <% p(fac.name) %>
variable label: <% p(fac.label) %>
input label: <% p(fac.ilabel) %>
input description: <% p(fac.idesc) %>
input length: <% fac.len %>

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

The highest correlation coefficient (0.2273) is between _edu_ and _age_ and the lowest (-0.0338) is between _leisure_ and _age_. It seems that the strongest association (r=0.2273) is between _edu_ and _age_.

Higly correlated (r < 0.7 or r > 0.7) variables: -


Uncorrelated (-0.2 < r < 0.2) variables: 

 * _age_ and _leisure_
 * _edu_ and _leisure_

 === Correlation matrix  


          **age**          **edu**          **leisure**     
--------- ---------------  ---------------  --------------- 
age                        0.2273 \*\*\* -0.0338         
edu       0.2273 \*\*\*                  0.1732 \*\*\*
leisure   -0.0338          0.1732 \*\*\*                 
--------- ---------------  ---------------  --------------- 


/tmp/RtmpJa8zT2/fileee79a87.png


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


/tmp/RtmpJa8zT2/filee3e7394.png


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
vars        | numeric[1,10] | Variable              | Numerical variables
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
            cm[row, col] <- paste(cm[row, col], ' ', ifelse(test.p > 0.05, '', ifelse(test.p > 0.01, '\\*', ifelse(test.p > 0.001, '\\*\\*', '\\*\\*\\*'))), sep='')
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

 * "gender" ("Gender") with 673 and
 * "dwell" ("Dwelling") with 662 valid values.

 == Counts  


         **city**   **small town**   **village**  
-------- ---------- ---------------- -------------
male     338        28               19           
female   234        3                9            
-------- ---------- ---------------- -------------


 == Percentages  


         **city**   **small town**   **village**  
-------- ---------- ---------------- -------------
male     0.5357     0.0444           0.0301       
female   0.3708     0.0048           0.0143       
-------- ---------- ---------------- -------------


 === Row percentages  


         **city**   **small town**   **village**  
-------- ---------- ---------------- -------------
male     0.8779     0.0727           0.0494       
female   0.9512     0.0122           0.0366       
-------- ---------- ---------------- -------------


 === Column percentages  


         **city**   **small town**   **village**  
-------- ---------- ---------------- -------------
male     0.5909     0.9032           0.6786       
female   0.4091     0.0968           0.3214       
-------- ---------- ---------------- -------------


 == Chi-squared test  


            **X-squared**   **df**   **p-value**  
----------- --------------- -------- -------------
X-squared   12.64           2.00     0.00         
----------- --------------- -------- -------------


It seems that a real association can be pointed out between *gender* and *dwell* by the *Pearson's Chi-squared test* (χ=12.635 at the degree of freedom being 2) at the significance level of 0.0018.
Based on Goodman and Kruskal's lambda it seems that *dwell* (λ=0.7602) has an effect on *gender* (λ=0) if we assume both variables to be nominal.
The association between the two variables seems to be weak based on Cramer's V (0.1001).

 === Pearson's residuals  


         **city**   **small town**   **village**  
-------- ---------- ---------------- -------------
male     -3.0844    3.4312           0.7595       
female   3.0844     -3.4312          -0.7595      
-------- ---------- ---------------- -------------


 === Mosaic chart  

/tmp/RtmpJa8zT2/file76a649ca.png


#################################################################################
##	 Running: rapport('crosstable', data=ius2008, row='email', col='dwell')
#################################################################################

 == Variable description  

Two variables specified:

 * "email" ("Email usage") with 672 and
 * "dwell" ("Dwelling") with 662 valid values.

 == Counts  


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
X-squared   14.86           12.00    0.25         
----------- --------------- -------- -------------


It seems that no real association can be pointed out between *email* and *dwell* by the *Pearson's Chi-squared test* (χ=14.864 at the degree of freedom being 12) at the significance level of 0.249.
For this end no other statistical tests were performed.

 === Pearson's residuals  


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

/tmp/RtmpJa8zT2/file732cdff0.png


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
row           | factor | Row variable        | A categorical variable.
col           | factor | Column variable     | A categorical variable. 
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

And wow, the mean of *leisure* is 3.1994!

 === Descriptive statistics  


    **Min.**   **1st Qu.**   **Median**   **Mean**   **3rd Qu.**   **Max.**   **NA's**  
--- ---------- ------------- ------------ ---------- ------------- ---------- ----------
1   0.0        2.0           3.0          3.2        4.0           12.0       37.0      
--- ---------- ------------- ------------ ---------- ------------- ---------- ----------


The 5 highest values are: _12_, _12_, _10_, _10_ and _10_.


##########################################################################
##	 Running: rapport("example", ius2008, var='leisure', desc=FALSE)
##########################################################################

 == Début  

Hello, world!

I have just specified a *Variable* in this template named to **leisure**. The label of this variable is "Internet usage in leisure time (hours per day)".

And wow, the mean of *leisure* is 3.1994!

**For more detailed statistics, you should have set `desc=TRUE`!**


##################################################################################
##	 Running: rapport("example", ius2008, var='leisure', desc=FALSE, hist=T)
##################################################################################

 == Début  

Hello, world!

I have just specified a *Variable* in this template named to **leisure**. The label of this variable is "Internet usage in leisure time (hours per day)".

And wow, the mean of *leisure* is 3.1994!

**For more detailed statistics, you should have set `desc=TRUE`!**

 === Histogram  

/tmp/RtmpJa8zT2/file651865c7.png


################################################################################################
##	 Running: rapport("example", ius2008, var='leisure', desc=FALSE, hist=T, theme='Set2')
################################################################################################

 == Début  

Hello, world!

I have just specified a *Variable* in this template named to **leisure**. The label of this variable is "Internet usage in leisure time (hours per day)".

And wow, the mean of *leisure* is 3.1994!

**For more detailed statistics, you should have set `desc=TRUE`!**

 === Histogram  

/tmp/RtmpJa8zT2/file20879a3a.png


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
var    | numeric   | Variable| A numeric variable.
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

The dataset has 709 observations with 673 valid values (missing: 36) in *gender* ("Gender").
This variable seems to be a factor.

 === Base statistics  


        **gender**   **N**    **pct**   **cumul.count**   **cumul.pct**  
------- ------------ -------- --------- ----------------- ---------------
1       male         410.00   60.92     410.00            60.92          
2       female       263.00   39.08     673.00            100.00         
Total                673.00   100.00    673.00            100.00         
------- ------------ -------- --------- ----------------- ---------------


 === Barplot  

/tmp/RtmpJa8zT2/file5d5d433b.png

It seems that the highest value is 2 which is exactly 2 times higher than the smallest value (1).

 == *age* ("Age")  

The dataset has 709 observations with 677 valid values (missing: 32) in *age* ("Age").
This variable seems to be numeric.

 === Base statistics  


**value**   **mean(age)**   **sd(age)**   **var(age)**  
----------- --------------- ------------- --------------
(all)       24.57           6.85          46.91         
----------- --------------- ------------- --------------


 === Histogram  

/tmp/RtmpJa8zT2/file4b9b7dcb.png

It seems that the highest value is 58 which is exactly 3.625 times higher than the smallest value (16).

The standard deviation is 6.8491 (variance: 46.911). The expected value is around 24.573, somewhere between 24.057 and 25.089 (SE: 0.2632).

If we suppose that *Age* is not near to a normal distribution (test: , skewness: 1.9296, kurtosis: 7.4851), checking the median (23) might be a better option instead of the mean. The interquartile range (6) measures the statistics dispersion of the variable (similar to standard deviation) based on median.




##################################################################################################################################################
##	 Running: rapport('multivar-descriptive', data=ius2008, vars=c("chatim", "game", "surf", "email", "download", "forum", "socnet", "xxx"))
##################################################################################################################################################

 == *chatim* ("Chat & IM usage")  

The dataset has 709 observations with 669 valid values (missing: 40) in *chatim* ("Chat & IM usage").
This variable seems to be a factor.

 === Base statistics  


        **chatim**    **N**    **pct**   **cumul.count**   **cumul.pct**  
------- ------------- -------- --------- ----------------- ---------------
1       never         60.00    8.97      60.00             8.97           
2       very rarely   73.00    10.91     133.00            19.88          
3       rarely        58.00    8.67      191.00            28.55          
4       sometimes     113.00   16.89     304.00            45.44          
5       often         136.00   20.33     440.00            65.77          
6       very often    88.00    13.15     528.00            78.92          
7       always        141.00   21.08     669.00            100.00         
Total                 669.00   100.00    669.00            100.00         
------- ------------- -------- --------- ----------------- ---------------


 === Barplot  

/tmp/RtmpJa8zT2/file55ef5737.png

It seems that the highest value is 7 which is exactly 7 times higher than the smallest value (1).

 == *game* ("On-line games usage")  

The dataset has 709 observations with 677 valid values (missing: 32) in *game* ("On-line games usage").
This variable seems to be a factor.

 === Base statistics  


        **game**      **N**    **pct**   **cumul.count**   **cumul.pct**  
------- ------------- -------- --------- ----------------- ---------------
1       never         352.00   51.99     352.00            51.99          
2       very rarely   128.00   18.91     480.00            70.90          
3       rarely        32.00    4.73      512.00            75.63          
4       sometimes     60.00    8.86      572.00            84.49          
5       often         37.00    5.47      609.00            89.96          
6       very often    35.00    5.17      644.00            95.13          
7       always        33.00    4.87      677.00            100.00         
Total                 677.00   100.00    677.00            100.00         
------- ------------- -------- --------- ----------------- ---------------


 === Barplot  

/tmp/RtmpJa8zT2/file7a0dfda2.png

It seems that the highest value is 7 which is exactly 7 times higher than the smallest value (1).

 == *surf* ("Web surfing usage")  

The dataset has 709 observations with 678 valid values (missing: 31) in *surf* ("Web surfing usage").
This variable seems to be a factor.

 === Base statistics  


        **surf**      **N**    **pct**   **cumul.count**   **cumul.pct**  
------- ------------- -------- --------- ----------------- ---------------
1       never         17.00    2.51      17.00             2.51           
2       very rarely   26.00    3.83      43.00             6.34           
3       rarely        33.00    4.87      76.00             11.21          
4       sometimes     107.00   15.78     183.00            26.99          
5       often         158.00   23.30     341.00            50.29          
6       very often    142.00   20.94     483.00            71.24          
7       always        195.00   28.76     678.00            100.00         
Total                 678.00   100.00    678.00            100.00         
------- ------------- -------- --------- ----------------- ---------------


 === Barplot  

/tmp/RtmpJa8zT2/file32c8e7ab.png

It seems that the highest value is 7 which is exactly 7 times higher than the smallest value (1).

 == *email* ("Email usage")  

The dataset has 709 observations with 672 valid values (missing: 37) in *email* ("Email usage").
This variable seems to be a factor.

 === Base statistics  


        **email**     **N**    **pct**   **cumul.count**   **cumul.pct**  
------- ------------- -------- --------- ----------------- ---------------
1       never         13.00    1.93      13.00             1.93           
2       very rarely   36.00    5.36      49.00             7.29           
3       rarely        46.00    6.85      95.00             14.14          
4       sometimes     87.00    12.95     182.00            27.08          
5       often         123.00   18.30     305.00            45.39          
6       very often    108.00   16.07     413.00            61.46          
7       always        259.00   38.54     672.00            100.00         
Total                 672.00   100.00    672.00            100.00         
------- ------------- -------- --------- ----------------- ---------------


 === Barplot  

/tmp/RtmpJa8zT2/file5197d24d.png

It seems that the highest value is 7 which is exactly 7 times higher than the smallest value (1).

 == *download* ("Download usage")  

The dataset has 709 observations with 677 valid values (missing: 32) in *download* ("Download usage").
This variable seems to be a factor.

 === Base statistics  


        **download**   **N**    **pct**   **cumul.count**   **cumul.pct**  
------- -------------- -------- --------- ----------------- ---------------
1       never          11.00    1.62      11.00             1.62           
2       very rarely    28.00    4.14      39.00             5.76           
3       rarely         29.00    4.28      68.00             10.04          
4       sometimes      80.00    11.82     148.00            21.86          
5       often          124.00   18.32     272.00            40.18          
6       very often     160.00   23.63     432.00            63.81          
7       always         245.00   36.19     677.00            100.00         
Total                  677.00   100.00    677.00            100.00         
------- -------------- -------- --------- ----------------- ---------------


 === Barplot  

/tmp/RtmpJa8zT2/file70953941.png

It seems that the highest value is 7 which is exactly 7 times higher than the smallest value (1).

 == *forum* ("Web forums usage")  

The dataset has 709 observations with 673 valid values (missing: 36) in *forum* ("Web forums usage").
This variable seems to be a factor.

 === Base statistics  


        **forum**     **N**    **pct**   **cumul.count**   **cumul.pct**  
------- ------------- -------- --------- ----------------- ---------------
1       never         76.00    11.29     76.00             11.29          
2       very rarely   80.00    11.89     156.00            23.18          
3       rarely        72.00    10.70     228.00            33.88          
4       sometimes     111.00   16.49     339.00            50.37          
5       often         109.00   16.20     448.00            66.57          
6       very often    119.00   17.68     567.00            84.25          
7       always        106.00   15.75     673.00            100.00         
Total                 673.00   100.00    673.00            100.00         
------- ------------- -------- --------- ----------------- ---------------


 === Barplot  

/tmp/RtmpJa8zT2/file5d459b20.png

It seems that the highest value is 7 which is exactly 7 times higher than the smallest value (1).

 == *socnet* ("Social networks usage")  

The dataset has 709 observations with 678 valid values (missing: 31) in *socnet* ("Social networks usage").
This variable seems to be a factor.

 === Base statistics  


        **socnet**    **N**    **pct**   **cumul.count**   **cumul.pct**  
------- ------------- -------- --------- ----------------- ---------------
1       never         208.00   30.68     208.00            30.68          
2       very rarely   102.00   15.04     310.00            45.72          
3       rarely        57.00    8.41      367.00            54.13          
4       sometimes     87.00    12.83     454.00            66.96          
5       often         79.00    11.65     533.00            78.61          
6       very often    80.00    11.80     613.00            90.41          
7       always        65.00    9.59      678.00            100.00         
Total                 678.00   100.00    678.00            100.00         
------- ------------- -------- --------- ----------------- ---------------


 === Barplot  

/tmp/RtmpJa8zT2/file60b2fadd.png

It seems that the highest value is 7 which is exactly 7 times higher than the smallest value (1).

 == *xxx* ("Adult sites usage")  

The dataset has 709 observations with 674 valid values (missing: 35) in *xxx* ("Adult sites usage").
This variable seems to be a factor.

 === Base statistics  


        **xxx**       **N**    **pct**   **cumul.count**   **cumul.pct**  
------- ------------- -------- --------- ----------------- ---------------
1       never         274.00   40.65     274.00            40.65          
2       very rarely   124.00   18.40     398.00            59.05          
3       rarely        52.00    7.72      450.00            66.77          
4       sometimes     131.00   19.44     581.00            86.20          
5       often         46.00    6.82      627.00            93.03          
6       very often    28.00    4.15      655.00            97.18          
7       always        19.00    2.82      674.00            100.00         
Total                 674.00   100.00    674.00            100.00         
------- ------------- -------- --------- ----------------- ---------------


 === Barplot  

/tmp/RtmpJa8zT2/file4fe5e705.png

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
	<li id="source-multivar-descriptive"><div>
<h5>Source of `multivar-descriptive.tpl`</h5>
{% highlight text %}

<!--head
Title: Descriptives
Author: Gergely Daróczi 
Email: gergely@snowl.net
Description: This template will return descriptive statistics of numerical, or frequency tables of categorical variables. 
Packages: 
Example:    rapport('multivar-descriptive', data=ius2008, vars=c("gender", 'age'))
            rapport('multivar-descriptive', data=ius2008, vars=c("chatim", "game", "surf", "email", "download", "forum", "socnet", "xxx"))
vars          | variable[1,10] | Variables        | Categorical or numerical variables. The template will determine the measurement level of the given variable and will return detailed frequency tables or appropriate descriptive statistics for numerics. 
head-->

<%
lapply(lapply(vars, rp.name), function(x) rapport('univar-descriptive', data=rp.data, var=x))
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

/tmp/RtmpJa8zT2/file4d71a586.png

 == Lund test  

It seems that 4 extreme values can be found in "Internet usage for educational purposes (hours per day)". These are: 10, 0.5, 1.5, 0.5.

 === Explanation  

The above test for outliers was based on *lm(1 ~ edu)*:


              **Estimate**   **Std. Error**   **t value**   **Pr(>|t|)**  
------------- -------------- ---------------- ------------- --------------
(Intercept)   2.05           0.08             26.27         0.00          
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

/tmp/RtmpJa8zT2/fileaa0273b.png

 == Lund test  

It seems that 4 extreme values can be found in "Internet usage for educational purposes (hours per day)". These are: 10, 0.5, 1.5, 0.5.

 === Explanation  

The above test for outliers was based on *lm(1 ~ edu)*:


              **Estimate**   **Std. Error**   **t value**   **Pr(>|t|)**  
------------- -------------- ---------------- ------------- --------------
(Intercept)   2.05           0.08             26.27         0.00          
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

/tmp/RtmpJa8zT2/file4452c650.png

 == Lund test  

It seems that 4 extreme values can be found in "Internet usage for educational purposes (hours per day)". These are: 10, 0.5, 1.5, 0.5.

 === Explanation  

The above test for outliers was based on *lm(1 ~ edu)*:


              **Estimate**   **Std. Error**   **t value**   **Pr(>|t|)**  
------------- -------------- ---------------- ------------- --------------
(Intercept)   2.05           0.08             26.27         0.00          
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
Title:          Outlier test
Author:         Gergely Daróczi 
Email:          gergely@snowl.net
Description:    This template will check if provided variable has any outliers. 
Packages:       outliers
Example:        rapport('outlier-test', data=ius2008, var='edu')
                rapport('outlier-test', data=ius2008, var='edu', lund.res=FALSE)
                rapport('outlier-test', data=ius2008, var='edu', lund.res=FALSE, references=FALSE, grubb=FALSE, dixon=FALSE)
var             | numeric | Variable        | Numerical variable
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

The dataset has 709 observations with 673 valid values (missing: 36) in *gender* ("Gender").
This variable seems to be a factor.

 === Base statistics  


        **gender**   **N**    **pct**   **cumul.count**   **cumul.pct**  
------- ------------ -------- --------- ----------------- ---------------
1       male         410.00   60.92     410.00            60.92          
2       female       263.00   39.08     673.00            100.00         
Total                673.00   100.00    673.00            100.00         
------- ------------ -------- --------- ----------------- ---------------


 === Barplot  

/tmp/RtmpJa8zT2/file7de86a72.png

It seems that the highest value is 2 which is exactly 2 times higher than the smallest value (1).


##########################################################################
##	 Running: rapport('univar-descriptive', data=ius2008, var='age')
##########################################################################

 == *age* ("Age")  

The dataset has 709 observations with 677 valid values (missing: 32) in *age* ("Age").
This variable seems to be numeric.

 === Base statistics  


**value**   **mean(age)**   **sd(age)**   **var(age)**  
----------- --------------- ------------- --------------
(all)       24.57           6.85          46.91         
----------- --------------- ------------- --------------


 === Histogram  

/tmp/RtmpJa8zT2/file702afa8c.png

It seems that the highest value is 58 which is exactly 3.625 times higher than the smallest value (16).

The standard deviation is 6.8491 (variance: 46.911). The expected value is around 24.573, somewhere between 24.057 and 25.089 (SE: 0.2632).

If we suppose that *Age* is not near to a normal distribution (test: , skewness: 1.9296, kurtosis: 7.4851), checking the median (23) might be a better option instead of the mean. The interquartile range (6) measures the statistics dispersion of the variable (similar to standard deviation) based on median.


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
Title: Descriptives
Author: Gergely Daróczi 
Email: gergely@snowl.net
Description: This template will return descriptive statistics of a numerical, or a frequency table of a categorical variable. 
Packages: 
Example:    rapport('univar-descriptive', data=ius2008, var='gender')
            rapport('univar-descriptive', data=ius2008, var='age')
var          | variable | Variable        | A categorical or numerical variable. The template will determine the measurement level of the given variable and will return a detailed frequency table or appropriate descriptive statistics for numerics. 
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
    sprintf('If we suppose that *%s* is not near to a normal distribution (test: , skewness: %s, kurtosis: %s), checking the median (%s) might be a better option instead of the mean. The interquartile range (%s) measures the statistics dispersion of the variable (similar to standard deviation) based on median.', rp.label(var), rp.round(rp.skewness(var)), rp.round(rp.kurtosis(var)), rp.round(rp.median(var)), rp.round(rp.iqr(var)))
%>

{% endhighlight %}
</div></li>
</ul>

