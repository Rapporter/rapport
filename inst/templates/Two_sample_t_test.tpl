<!--head
meta:
  title: Two sample t-test
  author: Daniel Nagy
  description: In this template Rapporter will present you Two sample t-test.
  email: ~
  packages:
  - nortest
inputs:
- name: x
  label: X Variable
  description: 
  class: numeric
  length:
    min: 1.0
    max: 50.0
  required: yes
  standalone: no
- name: y
  label: Y Variable
  description: 
  class: numeric
  length:
    min: 1.0
    max: 50.0
  required: yes
  standalone: no
- name: var.equal
  label : Equal Variances
  description:
  class: logical
  length:
    min: 1.0
    max: 1.0
  value: yes
  required: no
  standalone: yes
- name: normality.check
  label : Normality Check
  description:
  class: logical
  length:
    min: 1.0
    max: 1.0
  value: yes
  required: no
  standalone: yes
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
  allow_multiple: no
  required: no
  standalone: yes
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
head-->

# Diagnostics

Since _t-test_ is a parametric technique, it sets some basic assumptions on distribution shape: it has to be _normal_ (or approximately normal). A few normality test are to be applied, in order to screen possible departures from normality.

## Normality Tests

We will use _Shapiro-Wilk_, _Lilliefors_ and _Anderson-Darling_ tests to screen departures from normality in the response variable (<%= p(x.label) %>).




