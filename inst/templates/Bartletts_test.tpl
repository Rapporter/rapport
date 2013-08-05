<!--head
meta:
  title: Bartlett's test
  author: Daniel Nagy
  description: This template will run the Bartlett's test to check the equality of variances between groups.
  email: ~
  packages:
  - nortest
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

The Shapiro-Wilk, the Lilliefors, the Anderson-Darling and the Pearson's Chi-square tests help us to do that.

<%=
if (length(resp) > 5000) {
    h <- htest(resp, lillie.test, ad.test, pearson.test)
} else {
    h <- htest(resp, lillie.test, ad.test, pearson.test, shapiro.test)
}
p <- .05
h
%>

So, the conclusions we can draw with the help of test statistics:

<% if (length(resp) <= 5000 & !is.na(h[4, 3])) { %>
 - according to _Shapiro-Wilk test_, the distribution of _<%= resp.label %>_ is<%= ifelse(h[4, 3] < p, " not", "") %> normal
<% }
if (!is.na(h[1, 3])) { %>
 - based on _Lilliefors test_, distribution of _<%= resp.label %>_ is <%= ifelse(h[1, 3]<p, "not normal", "normal") %>
<% }
if (!is.na(h[2, 3])) { %>
 - _Anderson-Darling test_ confirms<%= ifelse(h[2, 3] < p, " violation of", "") %> normality assumption
<% }
if (!is.na(h[3, 3])) { %>
 - _Pearson's Chi-square test_ classifies the underlying distribution as <%= ifelse(h[3, 3]<p, "non-normal", "normal") %>
<% } %>

<%=
o <- sum((h[1,3]<p), (h[2,3]<p), (h[3,3]<p), na.rm = TRUE)
if (length(resp) > 5000)
    o <- sum(o, (h[4,3]<p), na.rm = TRUE)
%>

As a result we can<%= ifelse(o < 1, "", " not") %> assume, that the distribution of _<%= resp.label %>_ is statistically normal.

In this case the <%= ifelse(o < 1, " Bartlett's test is advisable to use", "Brown-Forsyth test is more advisable to use.") %>

# Test results

After checking the assumptions let's see what the test shows us!

<%=
bartlett <- function(resp) bartlett.test(resp, group)
h <- htest(resp, bartlett)
h
p <- .05
%>

According to the _Bartlett's test_, the variance of the _<%= resp.label %>_ across the groups of _<%= group.label %>_ <%= ifelse(h[1, 3] < p, "significantly differs", "does not differs significantly") %>.

We can conclude that, because <%= ifelse(h[1,3]<p,"the p-value is smaller than 0.05.","the p-value is higher than 0.05.")%>

