<!--head
meta:
  title: Correlations
  author: Daróczi Gergely, Nagy Dániel
  email: gergely@snowl.net
  example:
  - rapport('correlations', data=ius2008, vars=c('age', 'edu'))
  - rapport('correlations', data=ius2008, vars=c('age', 'edu', 'leisure'))
  - rapport('correlations', data=mtcars, vars=c('mpg', 'cyl', 'disp', 'hp', 'drat',
    'wt', 'qsec', 'vs', 'am', 'gear', 'carb'))
  description: This template will return the correlation matrix of supplied numerical
    variables.
inputs:
- name: vars
  label: Variable
  description: Numerical variables
  class: numeric
  length:
    min: 2
    max: 50
  value: ~
  required: TRUE
  standalone: FALSE
- name: cor.matrix
  label: Correlation matrix
  description: Show correlation matrix (numbers)?
  class: logical
  length: 1
  value: TRUE
  required: FALSE
  standalone: TRUE
- name: cor.plot
  label: Scatterplot matrix
  description: Show scatterplot matrix (image)?
  class: logical
  length: 1
  value: TRUE
  required: FALSE
  standalone: TRUE
- name: quick.plot
  label: Using a sample for plotting
  description: If set to TRUE, the scatterplot matrix will be drawn on a sample size
    of max. 1000 cases not to render millions of points.
  class: logical
  length: 1
  value: TRUE
  required: FALSE
  standalone: TRUE
head-->

# Introduction

Correlation is one of the most commonly used statistical tool. With the help of that we can get information about a possible linear relation between two variables. According to the definition of the correlation, one can call it also as the standardized covariance.
The maximum possible value of the correlation (the so-called correlation coefficient) could be 1, the minimum could be -1. In the first case there is a perfect positive (thus in the second case there is a perfect negative) linear relationship between the two variables, though perfect relationships, especially in the social sciences, are quite rare. If two variables are independent from each other, the correlation between them is 0, but 0 correlation coefficient only means certainly a linear independency.
Because extreme values occur seldom we have rule of thumbs for the coefficients, like other fields of statistics:
We call two variables highly correlated if the absolute value of the correlation coefficient between them is higher than 0.7 and we call them uncorrelated if that is smaller than 0.2.

# Variable description

<%=length(vars)%> variables provided.

<%=
cm <- cor(vars, use = 'complete.obs')
diag(cm) <- NA
%>

<%if (length(vars) > 2) { %>
The highest correlation coefficient (<%=max(cm, na.rm=T)%>) is between <%=row.names(which(cm == max(cm, na.rm=T), arr.ind=T))[1:2]%> and the lowest (<%=min(cm, na.rm=T)%>) is between <%=row.names(which(cm == min(cm, na.rm=T), arr.ind=T))[1:2]%>. It seems that the strongest association (r=<%=cm[which(abs(cm) == max(abs(cm), na.rm=T), arr.ind=T)][1]%>) is between <%=row.names(which(abs(cm) == max(abs(cm), na.rm=T), arr.ind=T))[1:2]%>.
<%}%>

<%=
cm[upper.tri(cm)] <- NA
h <- which((cm > 0.7) | (cm < -0.7), arr.ind = T)
%>

<%if (nrow(h) > 0) { %>

Highly correlated (r < -0.7 or r > 0.7) variables:

<%=paste(pander.return(lapply(1:nrow(h), function(i) paste0(p(c(rownames(cm)[h[i,1]], colnames(cm)[h[i,2]])), ' (', round(cm[h[i, 1], h[i, 2]], 2), ')'))), collapse = '\n')%>

<%} else {%>

There are no highly correlated (r < -0.7 or r > 0.7) variables.
<%}%>

<%=
h <- which((cm < 0.2)&(cm > -0.2), arr.ind=T)
%>

<%if (nrow(h) > 0) { %>

Uncorrelated (-0.2 < r < 0.2) variables:

<%=
if (nrow(h) > 0)
    paste(pander.return(lapply(1:nrow(h), function(i) paste0(p(c(rownames(cm)[h[i,1]], colnames(cm)[h[i,2]])), ' (', round(cm[h[i, 1], h[i, 2]], 2), ')'))), collapse = '\n')
%>

<%} else {%>

There are no uncorrelated correlated (r < -0.2 or r > 0.2) variables.
<%}%>

## <%=if (cor.matrix) 'Correlation matrix'%>

<%=
if (cor.matrix) {
    set.caption('Correlation matrix')
    cm <- format(round(cor(vars, use = 'complete.obs'), 4), decimal.mark = panderOptions('decimal.mark'))
    d <- attributes(cm)
    for (row in attr(cm, 'dimnames')[[1]])
	for (col in attr(cm, 'dimnames')[[2]]) {
	    test.p <- cor.test(vars[, row], vars[, col])$p.value
	    cm[row, col] <- paste(cm[row, col], ' ', ifelse(test.p > 0.05, '', ifelse(test.p > 0.01, ' *', ifelse(test.p > 0.001, ' * *', ' * * *'))), sep='')
	}
    diag(cm) <- ''
    set.alignment('centre', 'right')
    as.data.frame(cm)
}
%>

Where the stars represent the [significance levels](http://en.wikipedia.org/wiki/Statistical_significance) of the bivariate correlation coefficients: one star for `0.05`, two for `0.01` and three  for `0.001`.

On the plot one can see the correlation in two forms: below the diagonal visually, above that one can find the coefficient(s).

<%=
if (cor.plot) {

    labels <- lapply(vars, rp.name)

    if (quick.plot)
        if (nrow(vars) > 1000)
            vars <- vars[sample(1:nrow(vars), size = 1000), ]

    ## custom panels
    panel.cor <- function(x, y, digits = 2, prefix = "", cex.cor, ...) {

        ## forked from ?pairs
        par(usr = c(0, 1, 0, 1))
        r   <- cor(x, y, use = 'complete.obs')
        txt <- format(c(r, 0.123456789), digits = digits, decimal.mark = panderOptions('decimal.mark'))[1]
        txt <- paste(prefix, txt, sep = "")
        if(missing(cex.cor))
            cex <- 0.8/strwidth(txt)
        test <- cor.test(x,y)
        Signif <- symnum(test$p.value, corr = FALSE, na = FALSE,
                         cutpoints = c(0, 0.001, 0.01, 0.05, 0.1, 1),
                         symbols = c("***", "**", "*", ".", " "))
        text(0.5, 0.5, txt, cex = cex * abs(r) * 1.5)
        text(.8, .8, Signif, cex = cex, col = 2)
    }

    ## plot
    set.caption(sprintf('Scatterplot matrix%s', ifelse(quick.plot, ' (based on a sample size of 1000)', '')))
    pairs(vars, lower.panel = 'panel.smooth', upper.panel = 'panel.cor', labels = labels)

}
%>
