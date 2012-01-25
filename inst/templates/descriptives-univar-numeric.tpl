<!--head
Title:          Descriptive statistics
Author:         Gergely Daróczi 
Email:          gergely@snowl.net
Description:    This template will return descriptive statistics of a numerical variable.
Data required:  TRUE
Strict:         TRUE
Example:        rapport('descriptives-univar-numeric', data=ius2008, var='age')

var             | numeric   | Variable          | A numerical variable
nortest         | TRUE      | Normality test    | If normality tests should be performed 
head-->

# *<%=rp.name(var)%>*<%ifelse(rp.label(var)==rp.name(var), '', sprintf(' ("%s")', rp.label(var)))%>

The dataset has <%length(var)%> observations with <%=rp.valid(var)%> valid values (missing: <%=rp.missing(var)%>) in *<%=rp.name(var)%>*<%ifelse(rp.label(var)==rp.name(var), '', sprintf(' ("%s")', rp.label(var)))%>, which seems to be a quantitative variable.

## Base statistics

<%
rp.desc(rp.name(var), NULL, c('mean', 'sd', 'var'), rp.data)
%>

## Histogram

<%
print(rp.hist(var))
%>

It seems that the highest value is <%=rp.max(var)%> which is exactly <%=rp.round(rp.max(var)/rp.min(var))%> times higher than the smallest value (<%rp.min(var)%>).

The standard deviation is <%rp.sd(var)%> (variance: <%rp.var(var)%>). The expected value is around <%rp.mean(var)%>, somewhere between <%rp.mean(var)-1.96*rp.se.mean(var)%> and <%rp.mean(var)+1.96*rp.se.mean(var)%> with the standard error of <%rp.se.mean(var)%>.

If we suppose that *<%rp.label(var)%>* is not near to a normal distribution (test: <%ifelse(nortest & is.numeric(var), 'see below', 'not run')%>, skewness: <%rp.skewness(var)%>, kurtosis: <%rp.kurtosis(var)%>), checking the median (<%rp.median(var)%>) might be a better option instead of the mean. The interquartile range (<%rp.iqr(var)%>) measures the statistics dispersion of the variable (similar to standard deviation) based on median.

## <%if (nortest) 'Normality tests'%>

<%
if (nortest) rapport('nortest', data=rp.data, var=rp.name(var), header.levels.offset = 2)
%>
