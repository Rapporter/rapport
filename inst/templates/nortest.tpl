<!--head
meta:
  title: Normality Tests
  author: Aleksandar Blagotić
  description: Overview of several normality tests and diagnostic plots that can screen
    departures from normality.
  email: ~
  packages: nortest
  example:
  - rapport("nortest", ius2008, var = "leisure")
  - rapport("nortest", ius2008, var = "leisure", nc.plot = FALSE)
  - rapport("nortest", ius2008, var = "leisure", qq.line = FALSE)
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