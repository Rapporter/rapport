<!--head
meta:
  title: F test
  author: Gergely Daróczi, Daniel Nagy
  description: This template will run an F-test to check if two continuous variables have the same variances.
  email: ~
  packages:
  - nortest
inputs:
- name: xvar
  label: X Variable(s)
  description: This is the X variable which will be used here
  class: numeric
  length:
    min: 1.0
    max: 100.0
  required: yes
  standalone: no
- name: yvar
  label: Y Variable(s)
  description: This is the Y variable which will be used here.
  class: numeric
  length:
    min: 1.0
    max: 100.0
  required: yes
  standalone: no
head-->

# Introduction

F test compares the variances of two continuous variables. In other words it shows if their variances were statistically different.
We should be careful, while using the F test, because of the strict normality assumption, where strict means approximately normal ditribution is not enough to satisfy that.

# Normality assumption

The [_Shapiro-Wilk test_](http://en.wikipedia.org/wiki/Shapiro%E2%80%93Wilk_test) (only below 5000 cases), the [_Lilliefors test_](http://en.wikipedia.org/wiki/Lilliefors_test), the [_Anderson-Darling test_](http://en.wikipedia.org/wiki/Anderson_Darling_test) and the [_Pearson's Chi-square test_](http://en.wikipedia.org/wiki/Pearson%27s_chi-square_test) help us to decide if the above-mentioned assumption existed.

<%=
if (length(xvar) > 5000) {
    h <- htest(xvar, lillie.test, ad.test, pearson.test)
} else {
    h <- htest(xvar, lillie.test, ad.test, pearson.test, shapiro.test)
}
p <- .05
%>
##Normality test results of the variable: _<%=xvar.label%>_
<%=
h
%>

So, let's draw some conclusions based on applied normality tests:

<% if (length(xvar) <= 5000 & !is.na(h[4, 3])) { %>
- According to _Shapiro-Wilk test_, the distribution of _<%= xvar.label %>_ is<%= ifelse(h[4, 3] < p, " not", "") %> normal.
<% }
if (!is.na(h[1, 3])) { %>
- As the test statistic of the _Lilliefors test_ shows us, we <%= ifelse(h[1, 3] < p, "have to reject", "can accept")%> the normality assumption of _<%= xvar.label %>_.
<% }
if (!is.na(h[2, 3])) { %>
- _Anderson-Darling test_ confirms<%= ifelse(h[2, 3] < p, " violation of", "") %> normality assumption.
<% }
if (!is.na(h[3, 3])) { %>
- _Pearson's Chi-square test_ classifies the underlying distribution as <%= ifelse(h[3, 3] < p, "non-normal", "normal") %>.

<% }

o <- sum((h[1, 3] < p), (h[2, 3] < p), (h[3, 3] < p), na.rm = TRUE)
if (length(xvar) > 5000)
    o <- sum(o, (h[4, 3] < p), na.rm = TRUE)
%>

In summary we can<%= ifelse(o < 1, "", " not") %> assume, that the distribution of _<%= xvar.label %>_ is statistically normal.

<%=
if (length(yvar) > 5000) {
    j <- htest(yvar, lillie.test, ad.test, pearson.test)
} else {
    j <- htest(yvar, lillie.test, ad.test, pearson.test, shapiro.test)
}
%>

##Normality test results of the variable: _<%=yvar.label%>_
<%=
j
%>
<% if (length(yvar) <= 5000 & !is.na(j[4, 3])) { %>
- According to _Shapiro-Wilk test_, the distribution of _<%= yvar.label %>_ is<%= ifelse(j[4, 3] < p, " not", "") %> normal.
<% }
if (!is.na(j[1, 3])) { %>
- As the test statistic of the _Lilliefors test_ shows us, we <%= ifelse(j[1, 3] < p, "have to reject", "can accept")%> the normality assumption of _<%= yvar.label %>_.
<% }
if (!is.na(j[2, 3])) { %>
- _Anderson-Darling test_ confirms<%= ifelse(j[3, 3] < p, " violation of", "") %> normality assumption.
<% }
if (!is.na(j[3, 3])) { %>
- _Pearson's Chi-square test_ classifies the underlying distribution as <%= ifelse(j[3, 3] < p, "non-normal", "normal") %>.

<% }

u <- sum((j[1, 3] < p), (j[2, 3] < p), (j[3, 3] < p), na.rm = TRUE)
if (length(yvar) > 5000)
u <- sum(u, (j[4, 3] < p), na.rm = TRUE)
%>

In summary we can<%= ifelse(u < 1, "", " not") %> assume, that the distribution of _<%= yvar.label %>_ is statistically normal.

## Summary of the assumption testing

We<%= ifelse(o+u < 1, " are able to", " should not") %> use the F test<%= ifelse(o + u < 1, ", because all the used variables seem to be normally distributed.", ", because we cannot be sure all the variables are normally distributed.") %>

<% if(o + u < 1) { %>

# The F-test

Whereas we have checked the normality assumptions, let's see the results of the _F test_ to compare the variances of <%= p(xvar.label) %> and <%=p(yvar.label)%>.

<%=
ftest <- function(xvar) var.test(xvar, yvar)
Ftest <- htest(xvar, ftest)
f.p <- Ftest$"p.value"
p <- 0.05
Ftest
%>

We can see from the table (in the p-value coloumn) that there is<%=ifelse(f.p < p,""," not")%> a significant difference between the variance of _<%=xvar.label%>_ and _<%=yvar.label%>_.

<% } else { %>
_In this case it is advisable to run a more robust test, then the F-test._
<% } %>

