<!--head
meta:
  title: Three-way crosstable
  author: Daniel Nagy
  description: In this template Rapporter will present you Three-way crosstable.
  email: ~
  packages: ~
  dataRequired:  TRUE
  example:
  - rapport('Three-way_Crosstable.tpl', data=ius2008, var1='game',var2='surf',var3='email')
inputs:
- name: var1
  label: First used Variable
  description: First used Variable
  class: factor
  length:
    min: 1.0
    max: 50.0
  required: yes
  standalone: no
- name: var2
  label: Second used Variable
  description: Second used Variable
  class: factor
  length:
    min: 1.0
    max: 50.0
  required: yes
  standalone: no
- name: var3
  label: Third used Variable
  description: Third used Variable
  class: factor
  length:
    min: 1.0
    max: 50.0
  required: yes
  standalone: no
- name: chi.sq
  label : Chi-Squared test
  description: Chi-Squared test
  class: logical
  length:
    min: 1.0
    max: 1.0
  value: yes
  required: no
  standalone: yes
- name: cells
  label: inside the cells
  description: With this function you can set what to show in the cells
  class: character
  length:
    min: 1.0
    max: 1.0
  options:
  - row
  - column
  - total
  - N
  value: total
  matchable: yes
  allow.multiple: yes
  required: no
  standalone: yes
head-->


Three-way crosstables
  

<%=
naomitmatrix <- na.omit(cbind(var1,var2,var3))
var1 <- naomitmatrix[,1]
var2 <- naomitmatrix[,2]
var3 <- naomitmatrix[,3]

ftable(c(var1,var2,var3))
%>


