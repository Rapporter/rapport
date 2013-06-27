<!--head
meta:
  title: Hierarchical Cluster Analysis
  author: Rapporter team
  description: In this template Rapporter will present you Hierarchical Cluster Analysis.
  email: ~
  packages: ~
  dataRequired:  TRUE
  example:
  - rapport
inputs:
- name: vars
  label: Used Variables
  description:
  class: numeric
  length:
    min: 1.0
    max: 50.0
  limit:
    min: 1.0
    max: 50.0
  required: yes
  standalone: no
- name: dist
  label : Distance matrix
  description: Is the data a distance matrix?
  class: logical
  length:
    min: 1.0
    max: 1.0
  value: no
  required: no
  standalone: yes
- name: method
  label: Method
  description: 
  class: character
  length:
    min: 1.0
    max: 1.0
  options:
  - ward
  - single
  - complete
  - average
  - mcquitty
  - median
  - centroid
  value: two.sided
  matchable: yes
  allow.multiple: no
  required: no
  standalone: yes
head-->

function: hclust