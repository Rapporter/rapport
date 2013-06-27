<!--head
meta:
  title: Three-way crosstable
  author: Rapporter team
  description: In this template Rapporter will present you Three-way crosstable.
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
- name: chi.sq
  label : Chi-Squared test
  description:
  class:logical
  length:
    min: 1.0
    max: 1.0
  value: yes
  required: no
  standalone: yes
- name: rot.method
  label: Method of Rotation
  description: 
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
  required: yes
  standalone: yes
head-->


- Three-way crosstables (ftable a designos de sima table is jó)
  
	variables*
		type: numeric
	chi.sq
		type: boolean
	percentages
		type: option (row,column,total,N) ??? itt lehet egyszerre ntöbbet is kiválasztani?
	


