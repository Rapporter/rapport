<!--head
Title:          Korrelációs együtthatók
Author:         Daróczi Gergely 
Email:          gergely@snowl.net
Description:    Folytonos változók közötti lineáris összefüggések vizsgálata.
Data required:  TRUE
Strict:         TRUE
Example:        rapport('hu/correlations', data=ius2008, vars=c('age', 'edu', 'leisure'))
                rapport('hu/correlations', data=mtcars, vars=c('mpg', 'cyl', 'disp', 'hp', 'drat', 'wt', 'qsec', 'vs', 'am', 'gear', 'carb'))

vars        | *numeric[1,50] | Változók              | Folytonos változók
cor.matrix  | TRUE          | Korrelációs mátrix    | Korrelációs mátrix hozzáadása
cor.plot    | TRUE          | Pontdiagram           | Pontdiagram hozzáadása
head-->

<%
## setting Hungarian locale and returning NULL not be exported to report
options('p.copula' = 'és'); NULL
%>

# Változó-információk

<%length(vars)%> változó vizsgálata:

A legmagasabb korrelációs együtthatót (<%cm <- cor(vars, use = 'complete.obs');diag(cm) <- NA; rp.round(max(cm, na.rm=T))%>) a(z) <%p(row.names(which(cm == max(cm, na.rm=T), arr.ind=T))[1:2])%>, és a legalacsonyabb értéket (<%rp.round(min(cm, na.rm=T))%>) a(z) <%p(row.names(which(cm == min(cm, na.rm=T), arr.ind=T))[1:2])%> változók között találjuk. Úgy tűnik, hogy a legerősebb kapcsolat (r=<%rp.round(cm[which(abs(cm) == max(abs(cm), na.rm=T), arr.ind=T)][1])%>) a(z) <%
p(row.names(which(abs(cm) == max(abs(cm), na.rm=T), arr.ind=T))[1:2])%> változók között található.

Erős összefüggést mutató (r < 0.7 or r > 0.7) változók: <%cm[lower.tri(cm)] <- NA; l <- row.names(cm)[which((cm > 0.7) | (cm < -0.7), arr.ind=T)]; ifelse(length(l) == 0, '-', '')%>
<%ifelse(length(l) > 0, paste('\n *', lapply(split(l, 1:(length(l)/2)), p), collapse=''), '')%>

Korrelálatlan (-0.2 < r < 0.2) változók: <%l <- row.names(cm)[which((cm < 0.2)&(cm > -0.2), arr.ind=T)]; ifelse(length(l) == 0, '-', '')%>
<%ifelse(length(l) > 0, paste('\n *', lapply(split(l, 1:(length(l)/2)), p), collapse=''), '')%>

## <%if (cor.matrix) 'Korrelációs mátrix'%>

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
