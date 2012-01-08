<!--head
Title:        Normality tests
Author:       Aleksandar Blagotić
Description:  Facilitates ANOVA reporting 
resp     | numeric     | Response variable | Dependent (response) variable
fac      | factor[1,2] | Factor variables  | Independent variables (factors)
d.plots  | TRUE        | Diagnostic plots  | Draw diagnostic plots
head-->
<%
# data preparation
fml <- sprintf('%s ~ %s', resp.iname, paste(names(fac), collapse = " + "))
fit <- anova(lm(fml, data = rp.data))
%>
