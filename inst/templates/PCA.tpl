<!--head
meta:
  title: Principal Component Analysis
  author: Rapporter team
  description: In this template Rapporter will present you Principal Component Analysis.
  email: ~
  packages: 
  - psych
  - GPArotation
  example:
  - rapport
inputs:
- name: vars
  label: Used Variables
  description: Which variables would you use?
  class: numeric
  length:
    min: 1.0
    max: 50.0
  required: yes
  standalone: no
- name: components
  label: Number of Components
  description: How many Principal Components you want to use?
  class: integer
  length:
    min: 1.0
    max: 10.0
  required: yes
  standalone: yes
- name: rot.matrix
  label : Rotation Matrix
  description: Would you check the Rotation Matrix?
  class: logical
  length:
    min: 1.0
    max: 1.0
  value: yes
  required: no
  standalone: yes
- name: rot.method
  label: Method of Rotation
  description: Which rotation method would you use?
  class: character
  length:
    min: 1.0
    max: 1.0
  options:
  - none
  - varimax
  - quartimax
  - promax
  - oblimin
  - simplimax
  - cluster
  value: varimax
  matchable: yes
  allow_multiple: no
  required: no
  standalone: yes
head-->

# Introduction
 
[Principal Component Analysis](https://en.wikipedia.org/wiki/Principal_component_analysis) is a dimension reduction method. It produces linearly independent principal components using the variances of the observations in a set of variables.
 
 
# Results
 
<%=
vars <- na.omit(vars)
summary(prcomp(vars))$importance[,1:components]%>
From the table one can see that the first <%=components%> Principal Component<%=ifelse(components==1,'','s')%> contains the <%=paste(summary(prcomp(vars))$importance[2,1:components]*100,"%")%> of the variance<%=ifelse(components==1,'','s')%>.
 
<%= 
ifelse(rot.matrix,"As you wanted to check the Rotation matrix let us present that for you:","")
if (rot.matrix) {
cor.matrix <- cor(vars)
pca <- principal(cor.matrix,2,rotate="rot.method")$loadings
pca.matrix <- round(matrix(pca,ncol(vars),components),2)
cbind(rp.label(vars),pca.matrix)[,-1] 
} else {}
%>
		