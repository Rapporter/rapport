<!--head
meta:
  title: Wilcoxon test
  author: Rapporter team
  description: In this template Rapporter will present you Wilcoxon test.
  email: ~
  packages: ~
  example:
  - rapport
inputs:
- name: dep
  label: Dependent Variable
  description: This is the dependent variable which will be used here
  class: numeric
  length:
    min: 1.0
    max: 50.0
  limit:
    min: 1.0
    max: 50.0
  required: yes
  standalone: no
- name: indep
  label: Independent Variable
  description: This is the independent variable which will be used here
  class: numeric
  length:
    min: 1.0
    max: 50.0
  limit:
    min: 1.0
    max: 50.0
  required: yes
  standalone: no
- name: alter
  label: Alternative hypothesis
  description: 
  class: character
  length:
    min: 1.0
    max: 1.0
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

[Wilcoxon test](http://en.wikipedia.org/wiki/Wilcoxon_test) is a non-parametric statistical test which can be an alternative of the  paired Student's t-test, t-test for matched pairs, or the t-test for dependent samples when the population cannot be assumed to be normally distributed.

<%=
set.caption(sprintf('Wilcoxon rank sum test with continuity correction %s and %s', dep.name, indep.name))
wilc <- wilcox.test(dep,indep,alter)
wilc
p.v <- wilc$p.value
%>

As you can see in the table the the p-value of the Wilcoxon test is <%=p.v%>, thus we can <%= ifelse(p.v < 0.05,"reject", "accept")%> the assumption of the null hypothesis.


