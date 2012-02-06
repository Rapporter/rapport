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
h <- htest(var, shapiro.test, lillie.test, ad.test, pearson.test)
p <- .05
h
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
