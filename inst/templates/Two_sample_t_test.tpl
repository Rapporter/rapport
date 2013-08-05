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


<%=
if (length(x) > 5000) {
    h <- htest(x, lillie.test, ad.test, pearson.test)
} else {
    h <- htest(x, shapiro.test, lillie.test, ad.test, pearson.test)
}
p <- .05
h
%>

So, let's draw some conclusions based on applied normality test:

<% # if (!is.na(h[1, 3])) { %>
 - based on _Lilliefors test_, distribution of _<%= var.label %>_ is <%= ifelse(h[1, 3] < p, "not normal", "normal") %>
#<% #} %>
#<% # if (!is.na(h[2, 3])) { %>
# - _Anderson-Darling test_ confirms <%= ifelse(h[2, 3] < p, "violation of", "") %> normality assumption
#<% #} %>
#<% #if (!is.na(h[3, 3])) { %>
# - _Pearson's $\chi^2$ test_ classifies the underlying distribution as <%= ifelse(h[3, 3] < p, "non-normal", "normal") %>
#<% #} %>
#<% #if (!is.na(h[4, 3])) { %>
# - according to _Shapiro-Wilk test_, the distribution of _<%= var.label %>_ is <%= ifelse(h[4, 3] < p, "not", "") %> normal.
#<% #} %>


<%=
(ntest <- htest(x, shapiro.test, lillie.test, ad.test, colnames = c("N", "p")))
%>

As you can see, applied tests <%= ifelse(all(ntest$p < .05), "confirm departures from normality", "yield different results on hypotheses of normality, so you may want to stick with one you find most appropriate or you trust the most.") %>.




