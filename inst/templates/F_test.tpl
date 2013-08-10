<!--head
meta:
  title: F test
  author: Gergely Daróczi, Daniel Nagy
  description: This template will run an F-test to check if two continuous variables have the same means.
  email: ~
  packages:
  - nortest
  example:
  - rapport('F_test', data=ius2008, xvar='edu', yvar='age')
  - rapport('F_test', data=ius2008, xvar='edu', yvar='age', norm.check=F)
  - rapport('F_test', data=mtcars, xvar='cyl', yvar='drat', norm.check=F)
inputs:
- name: xvar
  label: X Variable(s)
  description: This is the X variable which will be used here
  class: numeric
  length:
    min: 1.0
    max: 1.0
  required: yes
  standalone: no
- name: yvar
  label: Y Variable(s)
  description: This is the Y variable which will be used here.
  class: numeric
  length:
    min: 1.0
    max: 1.0
  required: yes
  standalone: no
- name: norm.check
  label: Normality check
  description: You can set to run a normality check before the F test.
  class: logical
  value: yes
  required: no
  standalone: yes
head-->

# Introduction

F test compares the means of two continuous variables. In other words it shows if their means were statistically different.
We should be careful, while using the F test, because of the strict normality assumption, where strict means approximately normal ditribution is not enough to satisfy that.

<% if (norm.check) { %>

# Normality assumption check (<%=p(xvar.label)%>)

The <%=ifelse(length(xvar) < 5000, "[_Shapiro-Wilk test_](http://en.wikipedia.org/wiki/Shapiro%E2%80%93Wilk_test), the", "")%> [_Lilliefors test_](http://en.wikipedia.org/wiki/Lilliefors_test) and the [_Anderson-Darling test_](http://en.wikipedia.org/wiki/Anderson_Darling_test) help us to decide if the above-mentioned assumption can be accepted of the <%=p(xvar.label)%>.

<% if (length(xvar) < 5000) { %>

<%= ntest <- htest(xvar, lillie.test, ad.test, shapiro.test)
k <- 0
l <- 0
m <- 0
n <- 0
p <- 0.05
if (ntest$p[1] < 0.05) {l <- k + 1}
if (ntest$p[2] < 0.05) {m <- l + 1}
if (ntest$p[3] < 0.05) {n <- m + 1}
ntest
%>
So, the conclusions we can draw with the help of test statistics: 
   
 - based on _Lilliefors test_, distribution of _<%= xvar.label %>_ is <%= ifelse(ntest[1, 3] < p, "not normal", "normal") %>
   
 - _Anderson-Darling test_ confirms<%= ifelse(ntest[2, 3] < p, " violation of", "") %> normality assumption

 - according to _Shapiro-Wilk test_, the distribution of _<%= xvar.label %>_ is<%= ifelse(ntest[3, 3] < p, " not", "") %> normal
 
<% } else { %>
<%= ntest <- htest(xvar, lillie.test, ad.test)
k <- 0
l <- 0
m <- 0
n <- 0
p <- 0.05
if (ntest$p[1] < 0.05) {l <- k + 1}
if (ntest$p[2] < 0.05) {n <- l + 1}
ntest
%>

So, the conclusions we can draw with the help of test statistics: 
   
 - based on _Lilliefors test_, distribution of _<%= xvar.label %>_ is <%= ifelse(ntest[1, 3] < p, "not normal", "normal") %>
   
 - _Anderson-Darling test_ confirms<%= ifelse(ntest[2, 3] < p, " violation of", "") %> normality assumption
<% } %>

<%= if (n > 0) {
sprintf("As you can see, the applied tests %s.", ifelse(n > 1, "confirm departures from normality", "yield different results on hypotheses of normality, so you may want to stick with one you find most appropriate or you trust the most.")) 
} else { 
sprintf("reject departures from normality") 
} 
%>

# Normality assumption check (<%=p(yvar.label)%>)

The <%=ifelse(length(yvar) < 5000, "[_Shapiro-Wilk test_](http://en.wikipedia.org/wiki/Shapiro%E2%80%93Wilk_test), the", "")%> [_Lilliefors test_](http://en.wikipedia.org/wiki/Lilliefors_test) and the [_Anderson-Darling test_](http://en.wikipedia.org/wiki/Anderson_Darling_test) help us to decide if the above-mentioned assumption can be accepted of the <%=p(xvar.label)%>.

<% if (length(yvar) < 5000) { %>

<%= ntest <- htest(yvar, lillie.test, ad.test, shapiro.test)
k2 <- 0
l2 <- 0
m2 <- 0
n2 <- 0
p <- 0.05
if (ntest$p[1] < 0.05) {l2 <- k2 + 1}
if (ntest$p[2] < 0.05) {m2 <- l2 + 1}
if (ntest$p[3] < 0.05) {n2 <- m2 + 1}
ntest
%>
So, the conclusions we can draw with the help of test statistics: 
   
 - based on _Lilliefors test_, distribution of _<%= yvar.label %>_ is <%= ifelse(ntest[1, 3] < p, "not normal", "normal") %>
   
 - _Anderson-Darling test_ confirms<%= ifelse(ntest[2, 3] < p, " violation of", "") %> normality assumption

 - according to _Shapiro-Wilk test_, the distribution of _<%= yvar.label %>_ is<%= ifelse(ntest[3, 3] < p, " not", "") %> normal
 
<% } else { %>
<%= ntest <- htest(yvar, lillie.test, ad.test)
k2 <- 0
l2 <- 0
m2 <- 0
n2 <- 0
p2 <- 0.05
if (ntest$p[1] < 0.05) {l2 <- k2 + 1}
if (ntest$p[2] < 0.05) {n2 <- l2 + 1}
ntest
%>

So, the conclusions we can draw with the help of test statistics: 
   
 - based on _Lilliefors test_, distribution of _<%= yvar.label %>_ is <%= ifelse(ntest[1, 3] < p, "not normal", "normal") %>
   
 - _Anderson-Darling test_ confirms<%= ifelse(ntest[2, 3] < p, " violation of", "") %> normality assumption
<% } %>

<%= if (n2 > 0) {
sprintf("As you can see, the applied tests %s.", ifelse(n2 > 1, "confirm departures from normality", "yield different results on hypotheses of normality, so you may want to stick with one you find most appropriate or you trust the most.")) 
} else { 
sprintf("reject departures from normality") 
} 
%>

<% if(n + n2 < 1) { %>

# The F-test

Whereas we have checked the normality assumptions, let's see the results of the _F test_ to compare the means of <%= p(xvar.label) %> and <%=p(yvar.label)%>.

<%=
ftest <- function(xvar) var.test(xvar, yvar)
Ftest <- htest(xvar, ftest)
f.p <- Ftest$"p.value"
p <- 0.05
Ftest
%>

We can see from the table (in the p-value coloumn) that there is<%=ifelse(f.p < p,""," not")%> a significant difference between the means of _<%=xvar.label%>_ and _<%=yvar.label%>_.

<% } else { %>
_In this case it is advisable to run a more robust test, then the F-test._
<% } %>

<% } else { %>
# The F-test

Here is the the result of the _F test_ to compare the means of <%= p(xvar.label) %> and <%=p(yvar.label)%>.

<%=
ftest <- function(xvar) var.test(xvar, yvar)
Ftest <- htest(xvar, ftest)
f.p <- Ftest$"p.value"
p <- 0.05
Ftest
%>

We can see from the table (in the p-value coloumn) that there is<%=ifelse(f.p < p,""," not")%> a significant difference between the means of _<%=xvar.label%>_ and _<%=yvar.label%>_.
<% } %>
