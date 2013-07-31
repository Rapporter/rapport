<!--head
meta:
  title: Input value test
  author: Rapporter team
  description: In this template there will be a test for not required standalone input's value.
  email: ~
  packages: ~
inputs:
- name: vars
  label: Used Variables
  description:
  class: numeric
  length:
    min: 1.0
    max: 500.0
  required: no
  standalone: yes
head-->


<%=is.null(vars)%>


