<!--head
meta:
  title: GLM
  author: Daniel Nagy
  description: In this template Rapporter will present you GLM.
  email: ~
  packages: ~
  example:
  - rapport('GLM.tpl', data=ius2008, dep='age', indep=c('leisure','edu'), family='poisson')
  - rapport('GLM.tpl', data=ius2008, dep='age', indep=c('leisure','edu'), indep.inter=F, family='poisson')
  - rapport('GLM.tpl', data=ius2008, dep='age', indep=c('leisure','edu'), indep.inter=F, family='binomial')
inputs:
- name: dep
  label: Dependent Variable
  description: These are the dependent variables which will be used here
  class: numeric
  length:
    min: 1.0
    max: 100.0
  required: yes
  standalone: no
- name: indep
  label: Independent Variable
  description: These are the independent variables which will be used here
  class: numeric
  length:
    min: 1.0
    max: 100.0
  required: yes
  standalone: no
- name: indep.inter
  label : Interaction
  description: Interaction between the independent variables
  class: logical
  length:
    min: 1.0
    max: 1.0
  value: yes
  required: no
  standalone: yes
- name: family
  label: Method of GLM
  description: 
  class: character
  length:
    min: 1.0
    max: 1.0
  options:
  - gaussian
  - binomial
  - Gamma
  - poisson
  value: binomial
  matchable: yes
  allow_multiple: no
  required: no
  standalone: yes
head-->

<% if (indep < 0 | indep > 1 & family == "binomial") { %>
Values of the independent variables must be between 0 and 1 when binomial used as link function. Please change parameter family to one that is usable or switch the independent variable to meet the assumptions.

<% } else { %>


# Introduction

[Generalized Linear Model (GLM)](http://en.wikipedia.org/wiki/Generalized_linear_model) is a generalization of the ordinary [Linear Regression](http://en.wikipedia.org/wiki/Linear_regression). While using GLM we don't need the assumption of normality for response variables. There are two basic idea of the model: It allows the linear model to be related to the response variable via a link function and the magnitude of the variance of each measurement to be a function of its predicted value. An extinsion to the GLM is the [Hierarchical generalized linear model](https://en.wikipedia.org/wiki/Hierarchical_generalized_linear_model).

<%=
d <- structure(na.omit(data.frame(dep, indep)), .Names = c(dep.name, indep.name))
indep.int <- fml(dep.name, indep.name, join.right = "*")
indep.nonint <- fml(dep.name, indep.name, join.right = "+")
fit <- glm(ifelse(indep.inter, indep.int, indep.nonint), data = d, family = family)
indep.plu <- switch(indep.ilen, '', 's')
%>

#Overview

<%= ifelse(indep.ilen == 1, '', 'Multivariate-') %>General Linear Model was carried out, with <%= p(indep.label) %> as independent variable<%= indep.plu %>, and <%= p(dep.label) %> as a dependent variable.
The [interaction](http://en.wikipedia.org/wiki/Interaction) between the independent variables was<%=ifelse(indep.inter, "", "n't")%> taken into account.



<%=
set.caption(sprintf('Fitting General Linear Model: %s based on %s', dep.name, p(indep.name)))
fit
p_val <- summary(fit)$coefficients[, 4]
%>

From the table one can see that <%= paste(rownames(summary(fit)$coefficients)[which(p_val < 0.05)], round(p_val, 3)[which(p_val < 0.05)], sep = " has significant effect on the dependent variable, the p-value of that is ")%>


<% } %>

