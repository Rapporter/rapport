<!--head
Title:          Outlier tests
Author:         Gergely Daróczi, Dániel Nagy
Email:          gergely@snowl.net
Description:    This template will check if provided variable has any outliers.
Packages:       outliers
Data required:  TRUE
Example:        rapport('outlier-test', data=ius2008, var='edu')
                rapport('outlier-test', data=ius2008, var='edu', lund.res=FALSE)
                rapport('outlier-test', data=ius2008, var='edu', lund.res=FALSE, references=FALSE, grubb=FALSE, dixon=FALSE)

var             | *numeric | Variable        | Numerical variable
lund.res        | FALSE    | Residuals       | Return Lund's residuals?
references      | TRUE     | References      | Print references?
grubb           | TRUE     | Grubb's test    | Show Grubb's test?
dixon           | TRUE     | Dixon's test    | Show Dixon's test?
head-->

# Introduction

An outlying observation, or outlier, is one that appears to deviate markedly from other members of the sample in which it occurs.
There are several ways to detect the outliers of our data. However, we cannot say one of them is the perfect method for that, thus it could be useful to take different methods into consideration.
We present here four of them, one by a chart (a Box Plot based on IQR) and three by statistical descriptions (Lund Test, Grubb's test, Dixon's test).

## References

  * Grubbs, F. E.: 1969, Procedures for detecting outlying observations in samples. Technometrics 11, pp. 1-21.

# Charts

Among the graphical displays the Box plots are quite widespread, because of their several advantages. For example, one can easily get approximately punctual first impression from the data and one can visually see the positions of the (possible) outliers, with the help of them.

The Box Plot we used here is based on IQR (Inner-quartile Range), which is the difference between the higher and the lower quartiles. On the chart the blue box shows the "middle-half" of the data, the so-called whiskers shows the border where from the possible values can be called outliers. The lower whisker is placed 1.5 times below the first quartile, similarly the higher whisker 1.5 times above the third quartile.

<%=
set.caption(sprintf('Boxplot: %s', rp.name(var)))
rp.boxplot(var)
%>

## References

  * Chambers, John, William Cleveland, Beat Kleiner, and Paul Tukey, (1983), Graphical Methods for Data Analysis, Wadsworth.
  * Upton, Graham; Cook, Ian (1996). Understanding Statistics. Oxford University Press. p. 55.

# Lund test

It seems that <%=length(rp.outlier(var))%> extreme values can be found in "<%=rp.label(var)%>". <%=ifelse(length(rp.outlier(var)) > 0, sprintf('These are: %s.', paste(rp.outlier(var), collapse=', ')), '')%>

## Explanation

The above test for outliers was based on *lm(1 ~ <%=rp.name(var)%>)*:

<%=
set.caption(sprintf('Linear model: 1 ~ %s', rp.name(var)))
lm(var ~ 1)
%>

<% if (lund.res) {%>

## The residuals returned:

<%=pander.return(rstandard(lm(var ~ 1)))%>

<%}%>

<%if (references) {%>

## References

  * Lund, R. E. 1975, "Tables for An Approximate Test for Outliers in Linear Models", Technometrics, vol. 17, no. 4, pp. 473-476.
  * Prescott, P. 1975, "An Approximate Test for Outliers in Linear Models", Technometrics, vol. 17, no. 1, pp. 129-132.

<%}%>

<%if (grubb & suppressMessages(suppressWarnings(require(outliers)))) {%>

# Grubb's test

<%=
if (grubb) if (suppressMessages(suppressWarnings(require(outliers)))) {
test <- grubbs.test(var)
sprintf('%s shows that %s (p=%s).', test$method, ifelse(test$p.value>0.05, 'there are no outliers', test$alternative), pander.return(test$p.value))
} else 'Cannot run test, please install "outliers" package!'
%>

<%if (references) {%>

## References

  * Grubbs, F.E. (1950). Sample Criteria for testing outlying observations. Ann. Math. Stat. 21, 1, 27-58.

<%}%>

<%}%>


<% if (dixon & suppressMessages(suppressWarnings(require(outliers)))) {%>

# Dixon's test

<%=
if (dixon) if (suppressMessages(suppressWarnings(require(outliers)))) {
test <- chisq.out.test(var)
sprintf('%s shows that %s (p=%s).', test$method, ifelse(test$p.value>0.05, 'there are no outliers', test$alternative), pander.return(test$p.value))
} else 'Cannot run test, please install "outliers" package!'
%>

<%if (references) {%>

## References

  * Dixon, W.J. (1950). Analysis of extreme values. Ann. Math. Stat. 21, 4, 488-506.

<%}%>

<%}%>
