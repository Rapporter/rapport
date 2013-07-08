<!--head
meta:
  title: Kruskal Wallis test
  author: Rapporter team
  description: In this template Rapporter will present you Kruskal Wallis test.
  email: ~
  packages: ~
  example:
  - rapport
inputs:
- name: vars
  label: Used Variables
  description: These are the variables which will be used here
  class: numeric
  length:
    min: 1.0
    max: 50.0
  limit:
    min: 1.0
    max: 50.0
  required: yes
  standalone: no
head-->

# Introduction

[Kruskal-Wallis test](http://en.wikipedia.org/wiki/Kruskal-Wallis) is a non-parametric statistical test that assesses hypothesis of equality of two independent sample's/variabels' variances. Most of the time it's being used beacuse the normality assumptions didn't meet for the samples/variables, but we need the assumption of the equal variances, so it can be an alternative of the Two-sample t-test.
Significant result means difference between the samples/variables.


<%=
set.caption(sprintf('Kruskal-Wallis test for %s', p(vars.name)))
krusk <- kruskal.test(vars)
krusk
p.v <- krusk$p.value
sta <- krusk$statistic
par <- krusk$parameter
%>

As you can see in the table the test's degrees of freedom is <%=par%>, the joint test-statistic is <%=sta%>, so the p-value of the Kruskal-Wallis test is <%=p.v%>. Thus we can <%= ifelse(p.v < 0.05,"reject", "accept")%> the assumption of the equal variances.







