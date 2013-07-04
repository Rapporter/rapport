<!--head
meta:
  title: Factor Analysis
  author: Rapporter team
  description: In this template Rapporter will present you Factor Analysis.
  email: ~
  packages: ~
  example:
  - rapport
inputs:
- name: vars
  label: Used Variables
  description: The Variables that will be used in Factor Analysis
  class: numeric
  length:
    min: 1.0
    max: 50.0
  required: yes
  standalone: no
- name: fact.num
  label: Number of Factors
  description: How many Factors you want to use?
  class: integer
  length:
    min: 1.0
    max: 10.0
  required: yes
  standalone: yes
- name: rot.method
  label: Method of Rotation
  description: The used method of the rotation
  class: character
  options:
  - none
  - varimax
  - promax
  value: varimax
  matchable: yes
  allow_multiple: no
  required: no
  standalone: yes
- name: fa.scores
  label: Type of scores
  description: Type of scores to produce
  class: character
  options:
  - regression
  - Bartlett
  value: regression
  matchable: yes
  allow_multiple: no
  required: no
  standalone: yes
head-->


# Introduction

[Factor Analysis](http://en.wikipedia.org/wiki/Factor_analysis) is applied as a data reduction or structure detection method. There are two main applications of it: reducing the number of variables and detecting structure in the relationships between variables, thus explore latent structure behind the data, classify variables.


function: factanal (http://www.statmethods.net/advstats/factor.html)


<%= 
fact.matrix <- na.omit(scale(vars))
FA <- factanal(fact.matrix,fact.num,rot.method,scores=fa.scores)
print(FA, digits=2, cutoff=.3, sort=TRUE)
load <- FA$loadings
plot(load,type="n")
+text(load,labels=rp.name(vars),cex=.7)
%>
scores
<%= FA$scores%>
loadings
<%= FA.loadings <- FA$loadings
class(FA.loadings) <- "matrix"
FA.loadings
%>
uniquenesses
<%= FA$uniquenesses%>
rotmax
<%= FA$rotmat
%>

later:
the following values ... has higher score on the first factor than 0.3 + communalities




