<!--head
Title:          Descriptive statistics
Author:         Gergely Daróczi 
Email:          gergely@snowl.net
Description:    This template will return descriptive statistics and frequency table of a categorical variable.
Data required:  TRUE
Strict:         TRUE
Example:        rapport('descriptives-univar-factor', data=ius2008, var='gender')
                rapport('descriptives-univar-factor', data=ius2008, var='dwell')

var             | factor    | Variable          | A categorical variable
nortest         | TRUE      | Normality test    | If normality tests should be performed 
head-->

# *<%=rp.name(var)%>*<%ifelse(rp.label(var)==rp.name(var), '', sprintf(' ("%s")', rp.label(var)))%>

The dataset has <%nvar<-as.numeric(var); length(nvar)%> observations with <%=rp.valid(nvar)%> valid values (missing: <%=rp.missing(nvar)%>) in *<%=rp.name(var)%>*<%ifelse(rp.label(var)==rp.name(var), '', sprintf(' ("%s")', rp.label(var)))%>, which seems to be a qualitative variable.

## Base statistics

<%
rp.freq(rp.name(var), rp.data)
%>

## Barplot

<%
print(rp.barplot(var))
%>

It seems that the highest value is <%=rp.max(nvar)%> which is exactly <%=rp.round(rp.max(nvar)/rp.min(nvar))%> times higher than the smallest value (<%rp.min(nvar)%>).

The most frequent value is *<%t <- table(var); names(t[t==max(t)])%>*.
