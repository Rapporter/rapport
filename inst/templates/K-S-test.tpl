<!--head
meta:
  title: Kolmogorov-Smirnov-test
  author: Gergely Daróczi, Daniel Nagy
  description: This template will run a Kolmogorov-Smirnov-test
  email: ~
  packages:
  - nortest
  example:
  - rapport('K-S-test', data=ius2008, xvar='edu', yvar='age')
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
set.caption(sprintf('Histogram of %s', xvar.label))
plot(ecdf(xvar))
set.caption(sprintf('Histogram of %s', yvar.label))
plot(ecdf(yvar))
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


