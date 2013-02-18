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
