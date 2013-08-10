<!--head
meta:
  title: Homogeneity test of factor variables
  author: Gergely Daróczi, Daniel Nagy
  description: Test of homogeneity of a given factor variable split by another factor.
  packages: 
  - descr
  example:
  - rapport('crosstable', data=ius2008, row='gender', col='dwell')
  - rapport('crosstable', data=ius2008, row='email', col='dwell')
inputs:
- name: var
  label: Variable to analyse
  description: Variable to analyse
  class: factor
  length:
    min: 1.0
    max: 1.0
  value: ~
  required: yes
  standalone: no
- name: split
  label: Split variable
  description: Split variable
  class: factor
  length:
    min: 1.0
    max: 1.0
  value: ~
  required: yes
  standalone: no
head-->

# Variable description

Analysing "<%=rp.name(var)%>"<%=ifelse(rp.label(var) == rp.name(var), '', sprintf(' ("%s")', rp.label(var)))%> with <%=rp.valid(as.numeric(var))%> valid values whether frequency counts are distributed equally across different categories of "<%=rp.name(split)%>"<%=ifelse(rp.label(split) == rp.name(split), '', sprintf(' ("%s")', rp.label(split)))%>.

"<%=rp.name(split)%>" has <%=split.cat <- names(table(split)); length(split.cat)%> categories:
<%=as.list(split.cat)%>

# Counts

<%=
table	<- table(split, var, deparse.level = 0, useNA = 'ifany')
if (length(which(is.na(rownames(table)))) > 0) {
    rownames(table)[which(is.na(rownames(table)))] <- 'Missing' }
if (length(which(is.na(colnames(table)))) > 0) {
    colnames(table)[which(is.na(colnames(table)))] <- 'Missing' }
fulltable	<- addmargins(table)
set.caption(sprintf('Counted values: "%s" and "%s"', rp.name(split), rp.name(var)))
set.alignment(row.names = "right")
fulltable
%>

# Chi-squared test

Our [null hypothetis](http://en.wikipedia.org/wiki/Null_hypothesis) says that the proportion of *<%=rp.name(var)%>* is indentical in each categories of *<%=rp.name(split)%>*.

<%=
t <- suppressWarnings(chisq.test(table))
t
%>

The chi-squared test returned the value of <%=as.numeric(t$statistic)%> with a degree of freedom being <%=as.numeric(t$parameter)%>. Based on the returned [p value](http://en.wikipedia.org/wiki/P-value) (<%=t$p.value%>) we could state that the null hypothesis is <%=ifelse(t$p.value < 0.05, 'rejected', 'accepted')%>.


