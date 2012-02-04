<!--head
Title:          Correlations
Author:         Daróczi Gergely 
Email:          gergely@snowl.net
Description:    This template will return the correlation matrix of supplied numerical variables. 
Data required:  TRUE
Strict:         TRUE
Example:        rapport('correlations', data=ius2008, vars=c('age', 'edu', 'leisure'))
                rapport('correlations', data=mtcars, vars=c('mpg', 'cyl', 'disp', 'hp', 'drat', 'wt', 'qsec', 'vs', 'am', 'gear', 'carb'))

vars            | *numeric[1,50]| Variable              | Numerical variables
info            | TRUE          | Stat. theory          | Show information about background theory?
cor.matrix      | TRUE          | Correlation matrix    | Show correlation matrix (numbers)?
cor.plot        | TRUE          | Scatterplot matrix    | Show scatterplot matrix (image)?
head-->

# Variable description

<%length(vars)%> variables provided.

The highest correlation coefficient (<%cm <- cor(vars, use = 'complete.obs');diag(cm) <- NA; rp.round(max(cm, na.rm=T))%>) is between <%p(row.names(which(cm == max(cm, na.rm=T), arr.ind=T))[1:2])%> and the lowest (<%rp.round(min(cm, na.rm=T))%>) is between <%p(row.names(which(cm == min(cm, na.rm=T), arr.ind=T))[1:2])%>. It seems that the strongest association (r=<%rp.round(cm[which(abs(cm) == max(abs(cm), na.rm=T), arr.ind=T)][1])%>) is between <%p(row.names(which(abs(cm) == max(abs(cm), na.rm=T), arr.ind=T))[1:2])%>.

Highly correlated (r < 0.7 or r > 0.7) variables: <%cm[lower.tri(cm)] <- NA; l <- row.names(cm)[which((cm > 0.7) | (cm < -0.7), arr.ind=T)]; ifelse(length(l) == 0, '-', '')%>
<%ifelse(length(l) > 0, paste('\n *', lapply(split(l, 1:(length(l)/2)), p), collapse=''), '')%>

Uncorrelated (-0.2 < r < 0.2) variables: <%l <- row.names(cm)[which((cm < 0.2)&(cm > -0.2), arr.ind=T)]; ifelse(length(l) == 0, '-', '')%>
<%ifelse(length(l) > 0, paste('\n *', lapply(split(l, 1:(length(l)/2)), p), collapse=''), '')%>

## <%if (cor.matrix) 'Correlation matrix'%>

<%
if (cor.matrix) {
    cm <- rp.round(cor(vars, use = 'complete.obs'))
    d <- attributes(cm)
    for (row in attr(cm, 'dimnames')[[1]])
        for (col in attr(cm, 'dimnames')[[2]]) {
            test.p <- cor.test(vars[, row], vars[, col])$p.value 
            cm[row, col] <- paste(cm[row, col], ' ', ifelse(test.p > 0.05, '', ifelse(test.p > 0.01, ' *', ifelse(test.p > 0.001, ' * *', ' * * *'))), sep='')
        }
    diag(cm) <- ''
    as.data.frame(cm)
}
%>

<%
if (cor.plot) rp.cor.plot(vars)
%>
