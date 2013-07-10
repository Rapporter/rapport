<!--head
meta:
  title: Graphing
  author: Rapporter team
  description: In this template Rapporter will present you a qqplot.
  email: ~
  packages: ~
  example:
  - rapport
inputs:
- name: x
  label: Used Variable
  description: This is the x variable that you will use here
  class: numeric
  length:
    min: 1.0
    max: 1.0
  required: yes
  standalone: no
- name: y
  label: Used Variable
  description: This is the y variable that you will use here
  class: numeric
  length:
    min: 1.0
    max: 1.0
  required: yes
  standalone: no
head-->


<%=
x <- na.omit(x)
y <- na.omit(y)
qqplot(x,y, main = "Normal Q-Q Plot", xlab=x.label, ylab=y.label) 
%>
