<!--head
meta:
  title: Graphing
  author: Rapporter team
  description: In this template Rapporter will present you several graphing options.
  email: ~
  packages: ~
  dataRequired:  TRUE
  example:
  - rapport
inputs:
- name: vars
  label: Used Variables
  description: These are the variables that you will use here
  class: numeric
  length:
    min: 1.0
    max: 50.0
  limit:
    min: 1.0
    max: 50.0
  required: yes
  standalone: no
- name: lattice
  label : Lattice (de ez nem tudom mi még)
  description: rapport csomagon belül rp.hist,rp.density...
  class:logical
  length:
    min: 1.0
    max: 1.0
  value: yes
  required: no
  standalone: yes
head-->


