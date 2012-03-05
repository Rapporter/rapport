<!--head
Title:          Descriptive statistics
Author:         Gergely Daróczi 
Email:          gergely@snowl.net
Description:    This template will return descriptive statistics of numerical or frequency tables of categorical variables. 
Data required:  TRUE
Strict:         TRUE
Example:        rapport('descriptives', data=ius2008, vars=c('gender'))
                rapport('descriptives', data=ius2008, vars=c('gender', 'age'))
                rapport('descriptives', data=ius2008, vars=c('chatim', 'game', 'surf', 'email', 'download', 'forum', 'socnet', 'xxx'))
                rapport('descriptives', data=mtcars, vars=c('hp','wt'))

vars            | *variable[1,50]| Variables         | Categorical or numerical variables. The template will determine the measurement level of the given variable and will return detailed frequency tables or appropriate descriptive statistics for numeric variables.
nortest         | TRUE          | Normality tests   | Should normality tests be performed on numerical variables?  
head-->

<%
if (vars.ilen == 1) {
    rapport('children/descriptives-univar', data=rp.data, var=rp.name(vars), nortest=nortest)
} else {
    lapply(lapply(vars, rp.name), function(x){
        rapport('children/descriptives-univar', data=rp.data, var=x, nortest=nortest)
    })
}
%>
