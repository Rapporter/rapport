<!--head
meta:
  title: Confidence Interval
  author: Rapporter team
  description: In this template Rapporter will present you Confidence Interval.
  email: ~
  packages: ~
  example:
  - rapport
inputs:
- name: vars
  label: Used Variables
  description: These are the variables which will be used here
  class: numeric
  length:
    min: 1.0
    max: 50.0
  limit:
    min: 1.0
    max: 50.0
  required: yes
  standalone: no
- name: ci.level
  label: Confidence interval
  description: Confidence interval level
  class: numeric
  length:
    min: 1.0
    max: 1.0
  value: 0.95
  limit:
    min: 0.0
    max: 1.0
  required: no
  standalone: yes
- name: res.plot
  label: Plot of the result
  description: rapport csomagon belül rp.hist,rp.density...
  class: logical
  length:
    min: 1.0
    max: 1.0
  value: yes
  required: no
  standalone: yes
head-->



function: confint
<%=
confidence <- confint(vars,level=ci.level)
if (res.plot) {
rp.hist(confidence)
rp.density(confidence)
}
%>

