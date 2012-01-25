<!--head
Title:          Crosstable
Author:         Gergely Daróczi 
Email:          gergely@snowl.net
Description:    Returning the Chi-squared test of two given variables with count, percentages and Pearson's residuals table. 
Packages:       descr
Data required:  TRUE
Strict:         TRUE
Example:        rapport('crosstable', data=ius2008, row='gender', col='dwell')
                rapport('crosstable', data=ius2008, row='email', col='dwell')

row             | *factor | Row variable        | A categorical variable.
col             | *factor | Column variable     | A categorical variable. 
head-->

# Variable description

Two variables specified:

 * "<%=rp.name(row)%>"<%ifelse(rp.label(row)==rp.name(row), '', sprintf(' ("%s")', rp.label(row)))%> with <%rp.valid(as.numeric(row))%> and
 * "<%=rp.name(col)%>"<%ifelse(rp.label(col)==rp.name(col), '', sprintf(' ("%s")', rp.label(col)))%> with <%rp.valid(as.numeric(col))%> valid values.

# Counts

<%
table <- table(row, col, deparse.level = 0)
table
%>

# Percentages

<%
prop.table(table)
%>

## Row percentages

<%
prop.table(table, 1)
%>

## Column percentages

<%
prop.table(table, 2)
%>

# Chi-squared test

<%
t <- suppressWarnings(chisq.test(table))
lambda <- lambda.test(table)
cramer <- sqrt(as.numeric(t$statistic)/(sum(table)*min(dim(table))))
t
%>

<%
ifelse(t$p.value < 0.05, sprintf('It seems that a real association can be pointed out between *%s* and *%s* by the *%s* (χ=%s at the degree of freedom being %s) at the significance level of %s.\nBased on Goodman and Kruskal\'s lambda it seems that *%s* (λ=%s) has an effect on *%s* (λ=%s) if we assume both variables to be nominal.\nThe association between the two variables seems to be %s based on Cramer\'s V (%s).', rp.name(row), rp.name(col), t$method, rp.round(as.numeric(t$statistic)), rp.round(as.numeric(t$parameter)), rp.round(t$p.value), c(rp.name(col),rp.name(row))[which.max(lambda)], rp.round(max(as.numeric(lambda))), c(rp.name(col),rp.name(row))[which.min(lambda)], rp.round(min(as.numeric(lambda))), ifelse(cramer < 0.5, "weak", "strong"), rp.round(cramer)), sprintf('It seems that no real association can be pointed out between *%s* and *%s* by the *%s* (χ=%s at the degree of freedom being %s) at the significance level of %s.\nFor this end no other statistical tests were performed.', rp.name(row), rp.name(col), t$method, rp.round(as.numeric(t$statistic)), rp.round(as.numeric(t$parameter)), rp.round(t$p.value)))
%>

## Pearson's residuals

<%
suppressWarnings(CrossTable(table))$chisq$stdres
%>

## Mosaic chart

<%
mosaicplot(table, shade=T, main=NULL)
%>
