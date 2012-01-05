<!--head
Title: Descriptives
Author: Gergely Daróczi 
Email: gergely@snowl.net
Description: This template will return descriptive statistics of a numerical, or a frequency table of a categorical variable. 
Packages: 
Example:    rapport('univar-descriptive', data=ius2009, var='gender')
            rapport('univar-descriptive', data=ius2009, var='age')
var          | variable | Variable        | A categorical or numerical variable. The template will determine the measurement level of the given variable and will return a detailed frequency table or appropriate descriptive statistics for numerics. 
head-->

# Variable description

The dataset has <%nvar<-as.numeric(var);rp.n(nvar)%> observations with <%=rp.valid(nvar)%> valid values (missing: <%=rp.missing(nvar)%>) in *<%=rp.name(var)%>*<%ifelse(rp.label(var)==rp.name(var), '', sprintf(' ("%s")', rp.label(var)))%>.
This variable seems to be <%=ifelse(is.numeric(var), 'numeric', 'a factor')%>.

# Base statistics

<%
if (is.numeric(var)) {
        rp.desc(NULL, rp.name(var), c('mean', 'sd', 'var'), rp.data)
    } else {
        rp.freq(rp.name(var), rp.data)
    }
%>

# <%ifelse(is.numeric(var), 'Histogram', 'Barplot')%>

<%
if (is.numeric(var)) {
        rp.hist(var)
    } else {
        rp.barplot(var)
    }
%>

It seems that the highest value is <%=rp.max(nvar)%> which is exactly <%=rp.round(rp.max(nvar)/rp.min(nvar))%> times higher than the smallest value (<%rp.min(nvar)%>).

<%
if (is.numeric(var))
    sprintf('The standard deviation is %s (variance: %s). The expected value is around %s, somewhere between %s and %s (SE: %s).', rp.round(rp.sd(var)), rp.round(rp.var(var)), rp.round(rp.mean(var)), rp.round(rp.mean(var)-1.96*rp.se.mean(var)), rp.round(rp.mean(var)+1.96*rp.se.mean(var)), rp.round(rp.se.mean(var)))
%>

<%
if (is.numeric(var))
    sprintf('If we suppose that *%s* is not near to a normal distribution (test: , skewness: %s, kurtosis: %s), checking the median (%s) might be a better option instead of the mean. The interquartile range (%s) measures the statistics dispersion of the variable (similar to standard deviation) based on median.', rp.label(var), rp.round(rp.skewness(var)), rp.round(rp.kurtosis(var)), rp.round(rp.median(var)), rp.round(rp.iqr(var)))
%>