<!--head
Title: Correlations
Author: Daróczi Gergely 
Email: gergely@snowl.net
Description: This template will return the correlation matrix of supplied numerical variables. 
Packages: ascii
Example: rapport('correlations', data=ius2009, vars=c('age', 'it.edu', 'it.leisure'))
vars        | numeric[1,10] | Variable              | Numerical variables
cor.matrix  | TRUE          | Correlation matrix    | Show correlation matrix (numbers)?
cor.plot    | TRUE          | Scatterplot matrix    | Show scatterplot matrix (image)?
head-->

# Variable description

<%length(vars)%> variables provided.

The highest correlation coefficient (<%cm <- cor(vars);diag(cm) <- NA; rp.round(max(cm, na.rm=T))%>) is between <%paste('"', row.names(which(cm == max(cm, na.rm=T), arr.ind=T))[1:2], '"', sep='', collapse=' and ')%> and the lowest (<%rp.round(min(cm, na.rm=T))%>) is between <%paste('"', row.names(which(cm == min(cm, na.rm=T), arr.ind=T))[1:2], '"', sep='', collapse=' and ')%>. It seems that the strongest association (r=<%rp.round(cm[which(abs(cm) == max(abs(cm), na.rm=T), arr.ind=T)][1])%>) is between <%paste('"', row.names(which(abs(cm) == max(abs(cm), na.rm=T), arr.ind=T))[1:2], '"', sep='', collapse=' and ')%>.

Higly correlated (r < 0.7 or r > 0.7) variables: <%cm[lower.tri(cm)] <- NA; l <- row.names(cm)[which((cm > 0.7) | (cm < -0.7), arr.ind=T)]; ifelse(length(l) == 0, '-', '')%>
<%ifelse(length(l) > 0, paste(' *', lapply(split(l, 1:(length(l)/2)), function(x) paste('"', x, '"', sep='', collapse=' - ')), collapse='\n'), '')%>

Uncorrelated (-0.2 < r < 0.2) variables: <%l <- row.names(cm)[which((cm < 0.2)&(cm > -0.2), arr.ind=T)]; ifelse(length(l) == 0, '-', '')%>
<%ifelse(length(l) > 0, paste(' *', lapply(split(l, 1:(length(l)/2)), function(x) paste('"', x, '"', sep='', collapse=' - ')), collapse='\n'), '')%>

## <%if (cor.matrix) 'Correlation matrix'%>

<%
if (cor.matrix) as.data.frame(cm)
%>

<%
if (cor.plot) pairs(vars)
%>