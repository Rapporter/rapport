<!--head
Title:          Outlier tests
Author:         Gergely Daróczi 
Email:          gergely@snowl.net
Description:    This template will check if provided variable has any outliers. 
Packages:       outliers
Data required:  TRUE
Strict:         TRUE
Example:        rapport('outlier-test', data=ius2008, var='edu')
                rapport('outlier-test', data=ius2008, var='edu', lund.res=FALSE)
                rapport('outlier-test', data=ius2008, var='edu', lund.res=FALSE, references=FALSE, grubb=FALSE, dixon=FALSE)

var             | *numeric | Variable        | Numerical variable
lund.res        | FALSE    | Residuals       | Return Lund's residuals?
references      | TRUE     | References      | Print references?
grubb           | TRUE     | Grubb's test    | Show Grubb's test?
dixon           | TRUE     | Dixon's test    | Show Dixon's test?
head-->

# Boxplot

<%
print(rp.boxplot(var))
%>

# Lund test

It seems that <%length(rp.outlier(var))%> extreme values can be found in "<%rp.label(var)%>". <%ifelse(length(rp.outlier(var)) > 0, sprintf('These are: %s.', paste(rp.outlier(var), collapse=', ')), '')%>

## Explanation

The above test for outliers was based on *lm(1 ~ <%rp.name(var)%>)*:

<%
lm(var ~ 1)
%>

## <% if (lund.res) 'The residuals returned:'%>

<%
if (lund.res) p(rp.round(rstandard(lm(var ~ 1))), limit=Inf)
%>

## <%if (references) 'References'%>

<%
if (references) ' * Lund, R. E. 1975, "Tables for An Approximate Test for Outliers in Linear Models", Technometrics, vol. 17, no. 4, pp. 473-476.
 * Prescott, P. 1975, "An Approximate Test for Outliers in Linear Models", Technometrics, vol. 17, no. 1, pp. 129-132.'
%>

# <% if (grubb & suppressMessages(suppressWarnings(require(outliers)))) 'Grubb\'s test'%>

<%
if (grubb) if (suppressMessages(suppressWarnings(require(outliers)))) {
test <- grubbs.test(var)
sprintf('%s shows that %s (p=%s).', test$method, ifelse(test$p.value>0.05, 'there are no outliers', test$alternative), rp.round(test$p.value))   
} else 'Cannot run test, please install "outliers" package!'
%>

## <%if (grubb & references) 'References'%>

<%
if (references) ' * Grubbs, F.E. (1950). Sample Criteria for testing outlying observations. Ann. Math. Stat. 21, 1, 27-58.'
%>

# <% if (dixon & suppressMessages(suppressWarnings(require(outliers)))) 'Dixon\'s test'%>

<%
if (dixon) if (suppressMessages(suppressWarnings(require(outliers)))) {
test <- chisq.out.test(var)
sprintf('%s shows that %s (p=%s).', test$method, ifelse(test$p.value>0.05, 'there are no outliers', test$alternative), rp.round(test$p.value))   
} else 'Cannot run test, please install "outliers" package!'
%>

## <%if (dixon & references) 'References'%>

<%
if (references) ' * Dixon, W.J. (1950). Analysis of extreme values. Ann. Math. Stat. 21, 4, 488-506.'
%>
