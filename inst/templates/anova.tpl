<!--head
Title:        ANOVA Template
Author:       Aleksandar Blagotić
Description:  An ANOVA report with table of descriptives, diagnostic tests and ANOVA-specific statistics.
Packages:     nortest
Example:      rapport("anova", ius2008, resp = "it.leisure", fac = c("gender", "student"))
resp     | numeric     | Response variable | Dependent (response) variable
fac      | factor[1,2] | Factor variables  | Independent variables (factors)
head-->
<%
f <- as.formula(data.frame(resp, fac))
fit <- lm(f, data = rp.data)
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

input name: <% resp.iname %>
variable name: <% p(resp.name) %>
variable label: <% p(resp.label) %>

input name: <% fac.iname %>
variable name: <% p(fac.name) %>
variable label: <% p(fac.label) %>