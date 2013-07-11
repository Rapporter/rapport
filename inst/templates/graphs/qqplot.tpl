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
- name: main.lab
  label: Main name of the plot
  description: This is good to set the main name of the plot.
  class: character
  value: default
  matchable: no
  allow_multiple: no
  required: no
  standalone: yes
- name: x.lab
  label: X label
  description: This is the name of the X label on the plot.
  class: character
  value: default
  matchable: no
  allow_multiple: no
  required: no
  standalone: yes
- name: y.lab
  label: Y label
  description: This is the name of the Y label on the plot.
  class: character
  value: default
  matchable: no
  allow_multiple: no
  required: no
  standalone: yes
head-->


<%=
if (main.lab == "default")  main_lab <- sprintf('Densityplot of %s and %s',x.name, y.name)
if (x.lab == "default")  x_lab <- sprintf(x.label)
if (y.lab == "default")  y_lab <- sprintf(y.label)

x <- na.omit(x)
y <- na.omit(y)
qqplot(x,y, main = ifelse(main.lab == "default", main_lab, main.lab), xlab = ifelse(x.lab == "default", x_lab, x.lab), ylab = ifelse(y.lab == "default", y_lab, y.lab)) 
%>
