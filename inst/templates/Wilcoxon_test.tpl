<!--head
meta:
  title: Wilcoxon test
  author: Daniel Nagy
  description: In this template Rapporter will present you Wilcoxon test.
  email: ~
  packages: ~
  example:
  - rapport('Wilcoxon_test.tpl', data=mtcars, var1='mpg', var2='cyl')
inputs:
- name: var1
  label: Variable1
  description: This is the first variable which will be used here
  class: numeric
  length:
    min: 1.0
    max: 1.0
  required: yes
  standalone: no
- name: var2
  label: Variable2
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
the Mann-Whitney U test)  is a non-parametric statistical test which can be an alternative of the  paired Student's t-test, t-test for matched pairs, or the t-test for dependent samples. When the Wilcoxon test is used to compare two samples of values which are not paired, it makes no assumption about the shape of the distribution, only that (as null hypothesis) the distribution from which <%=var1.label%> is sampled is the same as the distribution from which <%=var2.label%> is sampled. The null hypothesis states that the variances of the variables are equal.

<%=
set.caption(sprintf('Wilcoxon rank sum test with continuity correction %s and %s', var1.label, var2.label))
suppressWarnings(wilc <- wilcox.test(var1, var2, alter))
wilc
p.v <- wilc$p.value
%>

As you can see in the table the the p-value of the Wilcoxon test is <%=p.v%>, thus we can <%= ifelse(p.v > 0.05, "reject", "accept")%> the assumption of the null hypothesis, so we can say that statistically the variances are<%= ifelse(p.v > 0.05, " not", "")%> equal.


