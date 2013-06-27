<!--head
meta:
  title: Wilcoxon test
  author: Rapporter team
  description: In this template Rapporter will present you Wilcoxon test.
  email: ~
  packages: ~
  dataRequired:  TRUE
  example:
  - rapport
inputs:
- name: dep
  label: Dependent Variable
  description: This is the dependent variable which will be used here
  class: numeric
  length:
    min: 1.0
    max: 50.0
  limit:
    min: 1.0
    max: 50.0
  required: yes
  standalone: no
- name: indep
  label: Independent Variable
  description: This is the independent variable which will be used here
  class: numeric
  length:
    min: 1.0
    max: 50.0
  limit:
    min: 1.0
    max: 50.0
  required: yes
  standalone: no
- name: alter
  label: Alternative hypothesis
  description: 
  class: character
  length:
    min: 1.0
    max: 1.0
  options:
  - two.sided
  - less
  - greater
  value: two.sided
  matchable: yes
  allow.multiple: no
  required: no
  standalone: yes
head-->    

Wilcoxon test (wilcox.test) t-test-ből átcsatornázni,ha nem teljesül a normalitás

	

