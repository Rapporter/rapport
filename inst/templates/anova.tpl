<!--head
meta:
  title: ANOVA Template
  author: Aleksandar Blagotić, Dániel Nagy
  description: An ANOVA report with table of descriptives, diagnostic tests and ANOVA-specific
    statistics.
  email: ~
  packages: nortest
  example:
  - 'rapport("anova", ius2008, resp = "leisure", fac = "gender")  # one-way'
  - 'rapport("anova", ius2008, resp = "leisure", fac = c("gender", "partner")) # two-way'
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



