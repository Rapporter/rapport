<!--head
meta:
  title: Native inputs
  description: Example template that illustrates implementation of new "native" inputs
  author: Aleksandar Blagotić
inputs:
- name: c
  class: character
  label: Character input
  description: Just a character input
  required: TRUE
- name: n
  class: numeric
  label: Numeric input
  description: Just a numeric input
  required: TRUE
  length:
    min: 1
    max: 10
  standalone: TRUE
  limit:
    min: 1
head-->
# Hello _native inputs_!!!

Native inputs:
 - **character**: length of character is <%= length(c) %>
 - **numeric**: mean of numeric is <%= mean(n) %>
