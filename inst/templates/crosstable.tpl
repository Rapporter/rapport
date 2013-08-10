<!--head
meta:
  title: Crosstable
  author: Gergely Daróczi, Daniel Nagy
  description: Returning the Chi-squared test of two given variables with count, percentages and Pearson's residuals table.
  email: gergely@snowl.net
  packages: 
  - descr
  - ggplot2
  - reshape
  example:
  - rapport('crosstable', data=ius2008, row='gender', col='dwell')
  - rapport('crosstable', data=ius2008, row='email', col='dwell')
inputs:
- name: row
  label: Row variable
  description: A categorical variable.
  class: factor
  length:
    min: 1.0
    max: 1.0
  value: ~
  required: yes
  standalone: no
- name: col
  label: Column variable
  description: A categorical variable.
  class: factor
  length:
    min: 1.0
    max: 1.0
  value: ~
  required: yes
  standalone: no
head-->

# Variable description

Two variables specified:

 * "<%=rp.name(row)%>"<%=ifelse(rp.label(row)==rp.name(row), '', sprintf(' ("%s")', rp.label(row)))%> with <%=rp.valid(as.numeric(row))%> valid values and
 * "<%=rp.name(col)%>"<%=ifelse(rp.label(col)==rp.name(col), '', sprintf(' ("%s")', rp.label(col)))%> with <%=rp.valid(as.numeric(col))%> valid values.

## Introduction

[Crosstables](http://en.wikipedia.org/wiki/Cross_tabulation) are applicable to show the frequencies of categorical variables in a matrix form, with a table view.

We will present four types of these crosstables. The first of them shows the *exact numbers of the observations*, ergo the number of the observations each of the variables' categories commonly have.

The second also shows the possessions each of these cells have, but not the exact numbers of the observations, rather the *percentages* of them from the total data.

The last two type of the crosstabs contain the so-called *row and column percentages* which demonstrate us the distribution of the frequencies if we concentrate only on one variable.

After that we present the *tests* with which we can investigate the possible relationships, associations between the variables, like Chi-squared test, Fisher Exact Test, Goodman and Kruskal's lambda.

In the last part there are some *charts* presented, with that one can visually observe the distribution of the frequencies.

# Counts

<%=
table <- table(row, col, deparse.level = 0, useNA = 'ifany')
if (length(which(is.na(rownames(table)))) > 0) {
    rownames(table)[which(is.na(rownames(table)))] <- 'Missing' }
if (length(which(is.na(colnames(table)))) > 0) {
    colnames(table)[which(is.na(colnames(table)))] <- 'Missing' }
fulltable	<- addmargins(table)
set.caption(sprintf('Counted values: "%s" and "%s"', rp.name(row), rp.name(col)))
set.alignment(row.names = "right")
fulltable
%>

<%=
table.max <- which(table == max(table), arr.ind = TRUE)
%>

Most of the cases (<%=table[table.max]%>) can be found in "<%=paste(rownames(table)[table.max[, 1]], colnames(table)[table.max[, 2]], sep = '-')%>" categories. Row-wise "<%=names(which.max(rowSums(table)))%>" holds the highest number of cases (<%=max(rowSums(table))%>) while column-wise "<%=names(which.max(colSums(table)))%>" has the utmost cases (<%=max(colSums(table))%>).

# Percentages

<%=
set.caption(sprintf('Total percentages: "%s" and "%s"', rp.name(row), rp.name(col)))
set.alignment(row.names = "right")
fulltable <- round(addmargins(prop.table(table) * 100), 2)
fulltable
%>

<%=
set.caption(sprintf('Row percentages: "%s" and "%s"', rp.name(row), rp.name(col)))
set.alignment(row.names = "right")
fulltable <- round(prop.table(addmargins(table, 1), 1) * 100, 2)
fulltable
%>

<%=
set.caption(sprintf('Column percentages: "%s" and "%s"', rp.name(row), rp.name(col)))
set.alignment(row.names = "right")
fulltable <- round(prop.table(addmargins(table, 2), 2) * 100, 2)
fulltable
%>

# Tests of Independence

In the below tests for [independece](http://en.wikipedia.org/wiki/Independence_(probability_theory)) we assume that the row and column variables are independent of each other. If this [null hypothesis](http://en.wikipedia.org/wiki/Null_hypothesis) would be rejected by the tests, then we can say that the assumption must have been wrong, so there is a good chance that the variables are associated.

## Chi-squared test

One of the most widespread independence test is the [Chi-squared test](http://en.wikipedia.org/wiki/Pearson%27s_chi-squared_test). While using that we have the alternative hypothesis, that two variables have an association between each other, in opposite of the null hypothesis that the variables are independent.

We use the cell frequencies from the crosstables to calculate the test statistic for that. The test statistic is based on the difference between this distribution  and a theoretical distribution where the variables are independent of each other. The distribution of this test statistic follows a [Chi-square distribution](http://en.wikipedia.org/wiki/Chi-squared_distribution).

The test was invented by Karl Pearson in 1900. It should be noted that the Chi-squared test has the disadvantage that it is sensitive to the sample size.

### Criteria

Before analyzing the result of the Chi-squared test, we have to check if our data meets some requirements. There are two widely used criteria which have to take into consideration, both of them are related to the so-called expected counts. These expected counts are calculated from the marginal distributions and show how the crosstabs would look like if there were complete independency between the variables. The Chi-squared test calculates how different are the observed cells from the expected ones.

The two criteria are:

  - none of the expected cells could be lower than 1
  - 80% of the expected cells have to be at least 5

<%=
table  <- table(row, col, deparse.level = 0) # no need for NAs from here
t      <- suppressWarnings(chisq.test(table))
lambda <- lambda.test(table)
cramer <- sqrt(as.numeric(t$statistic) / (sum(table) * min(dim(table))))
o <- t$expected
num <- nrow(o) * ncol(o)
k <- 0
l <- 0
for (i in 1:nrow(o))
for (j in 1:ncol(o))
{
if (o[i, j] < 5) {k <- k + 1}
if (o[i, j] < 1) {l <- l + 1}
}
%>
Let's look at on expected values then:
<%=
o
crit <- 0
if (l>0) {crit <- crit + 1}
if (k<num/5)  {crit <- crit + 1}
ifelse(crit > 0,"We can see that the Chi-squared test met the requirements.", "We can see that using the Chi-squared test is not advisable in this case, so you should be careful with the interpretation.")
%>

So now check the result of the test:

<%= t %>

To decide if the null or the alternative hypothesis could be accepted we need to calculate the number of degrees of freedom. The degrees of freedom is easy to calculate, we substract one from the number of the categories of both the row and the coloumn variables and multiply them with each other.

To each degrees of freedom there is denoted a [critical value](http://en.wikipedia.org/wiki/Critical_value#Statistics). The result of the Chi-square test have to be lower than that value to be able to accept the nullhypothesis.

<%if (inherits(tryCatch(chisq.test(table), warning = function(w) w), 'warning')) { %>
The requirements of the chi-squared test was not met, so [Yates's correction for continuity](http://en.wikipedia.org/wiki/Yates%27s_correction_for_continuity) applied. The approximation may be incorrect.
<% } %>

<%if (!is.na(cramer)) { %>
<%if (t$p.value < 0.05) { %>

It seems that a real association can be pointed out between *<%=rp.name(row)%>* and *<%=rp.name(col)%>* by the *<%=t$method%>* ($\chi$=<%=as.numeric(t$statistic)%>) at the [degree of freedom](http://en.wikipedia.org/wiki/Degrees_of_freedom_(statistics)) being <%=as.numeric(t$parameter)%> at the [significance level](http://en.wikipedia.org/wiki/Statistical_significance) of <%=add.significance.stars(t$p.value)%>.

The association between the two variables seems to be <%=ifelse(cramer < 0.2, "weak", "strong")%> based on [Cramer's V](http://en.wikipedia.org/wiki/Cram%C3%A9r%27s_V) (<%=cramer%>).

<% } else { %>

It seems that no real association can be pointed out between *<%=rp.name(row)%>* and *<%=rp.name(col)%>* by the *<%=t$method%>* ($\chi$=<%=as.numeric(t$statistic)%> at the degree of freedom being <%=as.numeric(t$parameter)%>) at the significance level of <%=add.significance.stars(t$p.value)%>.

<% } %>

### References

  * Fisher, R. A. (1922): On the interpretation of chi-square from contingency tables, and the calculation of P. _Journal of the Royal Statistical Society_ 85 (1): 87-94.
  * Fisher, R.A. (1954): _Statistical Methods for Research Workers_. Oliver and Boyd.

### Adjusted standardized residuals

The residuals show the contribution to reject the null hypothesis at a cell level. An extremely high or low value indicates that the given cell had a major effect on the resulting chi-square, so thus helps understanding the association in the crosstable.

<%=
set.caption(sprintf('Residuals: "%s" and "%s"', rp.name(row), rp.name(col)))
set.alignment(row.names = "right")
table.res <- suppressWarnings(CrossTable(table, asresid = TRUE))$asr
table.res <- round(table.res, 2)
table.res.highlow  <- which(table.res < -2 | table.res > 2, arr.ind = TRUE)
table.res
%>

<%=
if (nrow(table.res.highlow) > 0) {
    sprintf('Based on Pearson\'s residuals the following cells seems interesting (with values higher than `2` or lower than `-2`):\n%s', paste(sapply(1:nrow(table.res.highlow), function(i) sprintf('\n * "%s - %s"', rownames(table)[table.res.highlow[i, 1]], colnames(table)[table.res.highlow[i, 2]])), collapse = ''))
} else {
    sprintf('No interesting (higher then `2` or lower then `-2`) values found based on Pearson\'s residuals.')
}
%>

### References

  * Snedecor, George W. and Cochran, William G. (1989): _Statistical Methods_. Iowa State University Press.
  * Karl Pearson (1900): _Philosophical Magazine_, Series 5 50 (302): 157-175.

## Fisher Exact Test

An other test to check the possible association/independence between two variables, is the [Fisher exact test](http://en.wikipedia.org/wiki/Fisher%27_exact_test). This test is especially useful with small samples, but could be used with bigger datasets as well.

We have the advantage while using the Fisher's over the Chi-square test, that we could get an exact significance value not just a level of it, thus we can have an impression about the power of the test and the association.

The test was invented by, thus named after R.A. Fisher.

<%=
f <- tryCatch(suppressWarnings(fisher.test(table, hybrid = TRUE, workspace = 1e6)), error = function(e) e)
%>

<% if (inherits(f, 'error')) { %>

The test could not finish within resource limits.

<%
    f <- list(p.value = t$p.value)
} else {
    if (f$p.value < 0.05) {
%>

The variables seems to be dependent based on Fisher's exact test at the [significance level](http://en.wikipedia.org/wiki/P-value) of <%=add.significance.stars(f$p.value)%>.

<% } else { %>

The variables seems to be independent based on Fisher's exact test at the [significance level](http://en.wikipedia.org/wiki/P-value) of <%=add.significance.stars(f$p.value)%>.

<% }} %>

<% if (t$p.value < 0.05 | f$p.value < 0.05) { %>

# Direction of relationship

## Goodman and Kruskal's lambda

With the help of the [Goodman and Kruskal's lambda](http://en.wikipedia.org/wiki/Goodman_and_Kruskal%27s_lambda) we can look for not only relationship on its own, which have directions if we set one variable as a predictor and the other as a criterion variable.

<%if (diff(unlist(lambda, use.names = FALSE)) != 0 & !is.na(cramer)) { %>

Based on Goodman and Kruskal's lambda it seems that *<%=c(rp.name(col),rp.name(row))[which.max(lambda)]%>* ($\lambda$=<%=pander.return(max(as.numeric(lambda)))%>) has an effect on *<%=c(rp.name(col),rp.name(row))[which.min(lambda)]%>* ($\lambda$=<%=min(as.numeric(lambda))%>) if we assume both variables to be nominal.

<% } else { %>

The computed value for [Goodman and Kruskal's lambda](http://en.wikipedia.org/wiki/Goodman_and_Kruskal%27s_lambda) is the same for both directions: <%=lambda$row%>. For this end, we do not know the direction of the relationship.

<% }}} else { %>
Moreover: **it seems that the provided variables do not fit a real crosstable**.
<% } %>

# Charts

If one would like to investigate the relationships rather visually than in a crosstable form, there are several possibilities to do that.

#### Heat map

At first we can have a look at on the so-called [heat map](http://en.wikipedia.org/wiki/Heat_map). This kind of chart uses the same amount of cells and a similar form as the crosstable does, but instead of the numbers there are colours to show which cell contains the most counts (or likewise the highest total percentages).

The darker colour is one cell painted, the most counts/the higher total percentage it has.

<%=
set.caption('Heatmap')
suppressWarnings(suppressMessages(ggfluctuation(table, type = 'colour') + geom_tile() + xlab('') + ylab('') + labs(fill = 'Count'))) # TODO: drop ggfluctuation
%>

There can be also shown the standardized adjusted residual of each cells:

<%=
set.caption('Heatmap of residuals')
table2 <- as.data.frame(t(table))
table2$Freq <- as.data.frame(t(table.res))$Freq
names(table2) <- c("x", "y", "result")
table2 <- transform(table2, x = as.factor(x), y = as.factor(y), freq = result)
ceiling <- max(table2$freq, na.rm = TRUE)
ggplot(table2, aes_string(x = "x", y = "y", fill = "freq")) + geom_tile(colour = "grey50") + scale_fill_gradient2('Std. adj. res.', limits = c(-max(abs(range(table2$freq))), max(abs(range(table2$freq)))), midpoint = 0, low = "red", mid = "white", high = "green")
%>

#### Mosaic chart

In front of the heat map, on the *mosaic charts*, not only the colours are important. The size of the cells shows the amount of the counts one cell has.

The width on the axis of <%=rp.name(row)%> determinate one side and the height on the axis of the <%=rp.name(col)%> gives the final shape of the box. The box which demonstrates a cell from the hypothetic crosstable. We can see on the top of the chart which category from the <%=rp.name(col)%> draw the boxes what kind of colour.

<%=
set.caption('Mosaic chart')
glp      <- panderOptions('graph.legend.position')
panderOptions('graph.legend.position', 'top')
t        <- melt(table)
t$x      <- rowSums(table) / sum(table) * 100
t$xmax   <- cumsum(rowSums(table)) / sum(table) * 100
t$xmin   <- t$xmax - t$x
t$y      <- t$value / rep(rowSums(table), ncol(table)) * 100
t        <- t[with(t, order(Var.1)), ]
t$ymax   <- cumsum(t$y) - as.vector(sapply(1:nrow(table) - 1, rep, ncol(table))) * 100
t$ymin   <- t$ymax - t$y
t$xxtext <- with(t, xmin + (xmax - xmin) / 2)
t$xytext <- as.vector(sapply(rep(c(103, -3), length.out = nrow(table)), rep, ncol(table)))
ggplot(t, aes(ymin = ymin, ymax = ymax, xmin = xmin, xmax = xmax, fill = Var.2)) + geom_rect() + geom_rect(colour = 'white', show_guide = FALSE) + geom_text(aes(x = xxtext, y = xytext, label = Var.1), size = 4) + xlab('') + ylab('') + theme(legend.position = 'top') + labs(fill = '')
panderOptions('graph.legend.position', glp)
%>

#### Fluctuation diagram

At last but not least have a glance on the *fluctuation diagram*. Unlike the above two charts, here the colours does not have influence on the chart, but the sizes of the boxes, which obviously demonstrates here as well the cells of the crosstable.

The bigger are the boxes the higher are the numbers of the counts/the total percentages, which that boxes denote.


<%=
set.caption('Fluctuation diagram')
suppressWarnings(suppressMessages(ggfluctuation(table) + xlab('') + ylab(''))) # TODO: drop ggfluctuation
%>

