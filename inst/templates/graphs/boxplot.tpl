<!--head
meta:
  title: Graphing
  author: Rapporter team
  description: In this template Rapporter will present you boxplot.
  email: ~
  packages: ~
  example:
  - rapport
inputs:
- name: var
  label: Used Variables
  description: This is the variable that you will use here
  class: numeric
  length:
    min: 1.0
    max: 1.0
  required: yes
  standalone: no
head-->


<%=
vars <- na.omit(var)
boxplot(var, main = sprintf('Boxplot of %s',var.name), ylab=sprintf(var.label)) 
%>


