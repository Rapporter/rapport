<!--head
meta:
  title: Brown–Forsyth test
  author: Gergely Daróczi, Daniel Nagy
  description: This template will run a Brown–Forsyth test to check the equality of variances among groups.
  email: ~
  packages:
  - HH
  example:
  - rapport('Brown_Forsyth_test.tpl', data=ius2008, resp='age', group='gender')
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

The Brown–Forsyth test is used for checking the equality of the variances among the groups of one variable, in other words it tests the homogeneity of the variances. Equality of group variances is an assumption of the one-way ANOVA test.

The base of the test is really similar to the Levene's test, but the Brown-Forsyth test uses the deviations from the group medians instead of the mean (what the Levene's does), thus the Brown-Forsyth test is called more robust.

This test has the advantage over the other tests, which are also being used to check the homogeneity (F-test and Bartlett's test), that it does not have a normality assumption, so the variable we investigate do not have to follow a normal distribution.

## References

  * Brown, M.~B. and Forsyth, A.~B. (1974). Robust tests for equality of variances. _Journal of the American Statistical Association_, 69:364–367.

# Result

<%=
df     <- na.omit(data.frame(resp = as.numeric(resp), group = as.factor(group)))
BFtest <- function(x) hov(resp ~ group, data = df)
h      <- htest(resp, BFtest)
h
p <- .05
%>

According to the _Brown–Forsyth test_, the variances of the _<%= resp.label %>_ across the groups of _<%= group.label %>_ <%= ifelse(h[1, 3] < p, "significantly differs", "does not differs significantly") %>.

We can conclude that, because <%= ifelse(h[1, 3] < p,"the p-value is smaller than 0.05","the p-value is higher than 0.05")%>

## References

  * Heiberger, Richard M. and Holland, Burt (2004b). _Statistical Analysis and Data Display: An Intermediate Course with Examples in S-Plus, R, and SAS_.


