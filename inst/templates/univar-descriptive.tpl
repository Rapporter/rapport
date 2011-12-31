<!--head
Title: Descriptives
Author: Gergely Daróczi 
Email: gergely@snowl.net
Description: This template will return descriptive statistics of a numerical, or a frequency table of a categorical variable. 
Packages: 
Example: rapport('univar-descriptive', data=ius2009, var='it.edu')
var          | variable | Variable        | A categorical or numerical variable. The template will determine the measurement level of the given variable and will return a detailed frequency table or appropriate descriptive statistics for numerics. 
head-->

# Variable description

The dataset has <%=rp.n(var)%> observations with <%=rp.valid(var)%> valid values (missing: <%=rp.missing(var)%>) in "<%=rp.name(var)%>"<%ifelse(rp.label(var)==rp.name(var), '', sprintf(' ("%s")', rp.label(var)))%>.
This variable seems to be <%=ifelse(is.numeric(var), 'numeric', 'a factor')%>.

# Base statistics

<%
if (is.numeric(var)) {
        table(var) #rp.desc(var)
    } else {
        table(var)
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

It seems that the highest value is <%=rp.max(var)%> which is exactly <%=rp.round(rp.max(var)/rp.min(var))%> times higher than the smalles values (<%rp.min(var)%>).

<%
#The standard deviation is <%=rp.sd(var)%> (variance: <%=rp.var(var)%>). The expected value is around <%=rp.mean(var)%>, somewhere between <%rp.mean(var)-1.96*rp.se.mean(var)%> and <%=rp.mean(var)+1.96*rp.se.mean(var)%> (SE: <%=rp.se.mean(var)%>).
%>

If we suppose that "<%=rp.label(var)%> is not near to a normal distribution (test: , skewness: <%=rp.skewness(var)%>, kurtosis: <%=rp.kurtosis(var)%>), checking the median (<%=rp.median(var)%>) might be a better option instead of the mean. The interquartile range (<%=rp.iqr(var)%>) measures the statistics dispersion of the variable (similar to standard deviation) based on median. 
