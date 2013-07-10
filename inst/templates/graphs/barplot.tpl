<!--head
meta:
  title: Graphing
  author: Rapporter team
  description: In this template Rapporter will present you a barplot.
  email: ~
  packages: ~
  example:
  - rapport
inputs:
- name: var
  label: Used Variable
  description: This is the variable that you will use here
  class: numeric
  length:
    min: 1.0
    max: 1.0
  required: yes
  standalone: no
head-->


<%=
var <- as.vector(na.omit(var))
barplot(var)%>



