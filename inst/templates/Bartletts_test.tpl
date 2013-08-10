<!--head
meta:
  title: Bartlett's test
  author: Gergely Daróczi, Daniel Nagy
  description: This template will run the Bartlett's test to check the equality of variances between groups.
  email: ~
  packages:
  - nortest
  example:
  - rapport('Bartletts_test.tpl', data=ius2008, resp='age', group='gender')
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

