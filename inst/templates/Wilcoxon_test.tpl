<!--head
meta:
  title: Wilcoxon test
  author: Rapporter team
  description: In this template Rapporter will present you Wilcoxon test.
  email: ~
  packages: ~
inputs:
- name: X
  label: X Variable
  description: This is the first variable which will be used here
  class: numeric
  length:
    min: 1.0
    max: 1.0
  required: yes
  standalone: no
- name: Y
  label: Independent Variable
  description: This is the second variable which will be used here
  class: numeric
  length:
    min: 1.0
    max: 1.0
  required: yes
  standalone: no
- name: alter
  label: Alternative hypothesis
  description: 
  class: character
  options:
  - two.sided
  - less
  - greater
  value: two.sided
  matchable: yes
  allow.multiple: no
  required: no
  standalone: yes
head-->

# Introduction

[Wilcoxon test](http://en.wikipedia.org/wiki/Wilcoxon_test) (or its equivalent 
the Mann-Whitney U test)  is a non-parametric statistical test which can be an alternative of the  paired Student's t-test, t-test for matched pairs, or the t-test for dependent samples. When the Wilcoxon test is used to compare two samples of values which are not paired, it makes no assumption about the shape of the distribution, only that (as null hypothesis) the distribution from which X is sampled is the same as the distribution from which Y is sampled. The null hypothesis states that the variances of the variables are equal.

<%=
set.caption(sprintf('Wilcoxon rank sum test with continuity correction %s and %s', X.label, Y.label))
suppressWarnings(wilc <- wilcox.test(X,Y,alter))
wilc
p.v <- wilc$p.value
%>

As you can see in the table the the p-value of the Wilcoxon test is <%=p.v%>, thus we can <%= ifelse(p.v > 0.05,"reject", "accept")%> the assumption of the null hypothesis, so we can say that statistically the variances are<%= ifelse(p.v > 0.05," not", "")%> equal.


