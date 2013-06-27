<!--head
meta:
  title: Factor Analysis
  author: Rapporter team
  description: In this template Rapporter will present you Factor Analysis.
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
- name: fact.num
  label: Number of Factors
  description: How many Factors you want to use? (itt lehet matchable-t kéne használni, ha akarom a factor.pa függvényt használni az automatikus faktorszám kitalálásához)
  class: integer
  length:
    min: 1.0
    max: 10.0
  limit:
    min: 1.0
    max: 50.0
  required: yes
  standalone: no
- name: rot.method
  label: Method of Rotation
  description: 
  class: character
  length:
    min: 1.0
    max: 1.0
  options:
  - none
  - varimax
  - promax
  value: varimax
  matchable: yes
  allow.multiple: no
  required: no
  standalone: yes
head-->


function: factanal (http://www.statmethods.net/advstats/factor.html)
