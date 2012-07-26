<!--head
Title:          Correlations
Author:         Daróczi Gergely
Email:          gergely@snowl.net
Description:    This template will return the correlation matrix of supplied numerical variables.
Data required:  TRUE
Example:        rapport('correlations', data=ius2008, vars=c('age', 'edu'))
		rapport('correlations', data=ius2008, vars=c('age', 'edu', 'leisure'))
		rapport('correlations', data=mtcars, vars=c('mpg', 'cyl', 'disp', 'hp', 'drat', 'wt', 'qsec', 'vs', 'am', 'gear', 'carb'))

vars            | *numeric[2,50]| Variable              | Numerical variables
cor.matrix      | TRUE          | Correlation matrix    | Show correlation matrix (numbers)?
cor.plot        | TRUE          | Scatterplot matrix    | Show scatterplot matrix (image)?
head-->

# Variable description

<%=length(vars)%> variables provided.

<%=cm <- cor(vars, use = 'complete.obs');diag(cm) <- NA
%>

<%if (length(vars) >2 ) {%>
The highest correlation coefficient (<%pander.return(max(cm, na.rm=T))%>) is between <%=p(row.names(which(cm == max(cm, na.rm=T), arr.ind=T))[1:2])%> and the lowest (<%=pander.return(min(cm, na.rm=T))%>) is between <%=p(row.names(which(cm == min(cm, na.rm=T), arr.ind=T))[1:2])%>. It seems that the strongest association (r=<%=pander.return(cm[which(abs(cm) == max(abs(cm), na.rm=T), arr.ind=T)][1])%>) is between <%=p(row.names(which(abs(cm) == max(abs(cm), na.rm=T), arr.ind=T))[1:2])%>.
<%}%>

Highly correlated (r < -0.7 or r > 0.7) variables: <%=cm[lower.tri(cm)] <- NA; l <- row.names(cm)[which((cm > 0.7) | (cm < -0.7), arr.ind=T)]; ifelse(length(l) == 0, '-', '')%>
<%=ifelse(length(l) > 0, paste('\n *', lapply(split(l, 1:(length(l)/2)), p), collapse=''), '')%>

Uncorrelated (-0.2 < r < 0.2) variables: <%=l <- row.names(cm)[which((cm < 0.2)&(cm > -0.2), arr.ind=T)]; ifelse(length(l) == 0, '-', '')%>
<%=ifelse(length(l) > 0, paste('\n *', lapply(split(l, 1:(length(l)/2)), p), collapse=''), '')%>

## <%=if (cor.matrix) 'Correlation matrix'%>

<%=
if (cor.matrix) {
    set.caption('Correlation matrix')
    cm <- round(cor(vars, use = 'complete.obs'), 4)
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

<%=
if (cor.plot) {

    ## custom panels
    panel.cor <- function(x, y, digits = 2, prefix = "", cex.cor, ...) {
        ## forked from ?pairs
        usr <- par("usr"); on.exit(par(usr))
        par(usr = c(0, 1, 0, 1))
        r <- cor(x, y, use = 'complete.obs')
        txt <- format(c(r, 0.123456789), digits = digits)[1]
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
    panel.hist <- function(x, ...) {
        ## forked from ?pairs
        usr <- par("usr"); on.exit(par(usr))
        par(usr = c(usr[1:2], 0, 1.5) )
        h <- hist(x, plot = FALSE)
        breaks <- h$breaks; nB <- length(breaks)
        y <- h$counts; y <- y/max(y)
        rect(breaks[-nB], 0, breaks[-1], y, col="cyan", ...)
    }

    ## plot
    set.caption('Scatterplot matrix')
    pairs(vars, lower.panel = 'panel.smooth', upper.panel = 'panel.cor', labels = lapply(vars, rp.name))

}
%>
