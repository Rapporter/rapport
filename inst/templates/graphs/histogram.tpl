<!--head
meta:
  title: Graphing
  author: Rapporter team
  description: In this template Rapporter will present you a histogram.
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
head-->

<%=
if (main.lab == "default")  main_lab <- sprintf('Histogram of %s',var.name)
if (x.lab == "default")  x_lab <- sprintf(var.label)

vars <- na.omit(var)
hist(var, main = ifelse(main.lab == "default", main_lab, main.lab), xlab = ifelse(x.lab == "default", x_lab, x.lab)) 
%>
