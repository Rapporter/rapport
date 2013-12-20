<!--head
meta:
  title: Descriptive statistics
  author: Gergely Daróczi, Daniel Nagy
  description: This template will return descriptive statistics of a numerical or frequency table of a categorical variable.
  email: gergely@snowl.net
  packages: ~
  example:
  - rapport('Descriptives', data=ius2008, var='gender')
  - rapport('Descriptives', data=ius2008, var='age')
  - rapport('Descriptives', data=mtcars, var='hp')
inputs:
- name: var
  label: Variable
  description: Categorical or numerical variable. This template will determine the
    measurement level of the given variable.
  length:
    min: 1.0
    max: 1.0
  value: ~
  required: yes
  standalone: no
head-->
  
# *<%=rp.name(var)%>*<%=ifelse(rp.label(var) == rp.name(var), '', sprintf(' ("%s")', rp.label(var)))%>
  
The dataset has <%=nvar<-as.numeric(var); length(nvar)%> observations with <%=rp.valid(nvar)%> valid values (missing: <%=rp.missing(nvar)%>).

<% if (is.numeric(var)) { %>
## Base statistics
  
<%=
set.caption(sprintf('Descriptives: %s', rp.label(var)))
rp.desc(rp.name(var), NULL, c('mean', 'sd', 'var'), rp.data)
%>
  
The [standard deviation](http://en.wikipedia.org/wiki/Standard_deviation) equals to  <%=rp.sd(var)%> (variance: <%=rp.var(var)%>), which shows the unstandardized degree of [homogenity](http://en.wikipedia.org/wiki/Homogeneity_(statistics)): how much variation exists from the average. The [expected value](http://en.wikipedia.org/wiki/Mean) is around <%=rp.mean(var)%>, somewhere between <%=rp.mean(var)-1.96*rp.se.mean(var)%> and <%=rp.mean(var) + 1.96 * rp.se.mean(var)%> with the standard error of <%=rp.se.mean(var)%>.

<% if (rp.min(var)<=0) { %>
The highest value found in the dataset is <%=rp.max(var)%>, while the minimum is <%=rp.min(var)%>. The difference between the two is described by the [range](http://en.wikipedia.org/wiki/Range_(statistics)): <%=diff(range(var, na.rm = TRUE))%>.

<% } else { %>
The highest value found in the dataset is <%=rp.max(var)%>, which is exactly <%=rp.max(var) / rp.min(var)%> times higher than the minimum (<%=rp.min(var)%>). The difference between the two is described by the [range](http://en.wikipedia.org/wiki/Range_(statistics)): <%=diff(range(var, na.rm = TRUE))%>.

<% } %>
  
## Chart
  
A [histogram](http://en.wikipedia.org/wiki/Histogram) visually shows the [distribution](http://en.wikipedia.org/wiki/Probability_distribution) of the dataset based on artificially allocated [frequencies](http://en.wikipedia.org/wiki/Statistical_frequency). Each bar represents a theoretical interval of the data, where the height shows the count or density.

<%=
set.caption(sprintf('Histogram: %s', rp.label(var)))
hist(var, main=NULL, xlab=rp.label(var))
%>
  
  
If we *suppose* that *<%=rp.label(var)%>* is not near to the [normal distribution](http://en.wikipedia.org/wiki/Normal_distribution) (see for example [skewness](http://en.wikipedia.org/wiki/Skewness): <%=rp.skewness(var)%>, [kurtosis](http://en.wikipedia.org/wiki/Kurtosis): <%=rp.kurtosis(var)%>), checking the median (<%=rp.median(var)%>) might be a better option instead of the mean. The [interquartile range](http://en.wikipedia.org/wiki/Interquartile_range) (<%=rp.iqr(var)%>) measures the statistics dispersion of the variable (similar to standard deviation) based on median.

<%} else { %>
## Base statistics
  
<%=
set.caption(sprintf('Frequency table: %s', rp.label(var)))
rp.freq(rp.name(var), rp.data, na.rm = FALSE, include.na = TRUE)
%>
  
The most frequent value is *<%=t <- table(var); names(t[t == max(t)])%>*.

## Charts

<%=
set.caption(sprintf('Barplot: %s', rp.label(var)))
rp.barplot(var)
%>
  
  <% } %>