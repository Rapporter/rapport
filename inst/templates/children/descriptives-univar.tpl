<!--head
Title:          Descriptive statistics
Author:         Gergely Daróczi 
Email:          gergely@snowl.net
Description:    This template will return descriptive statistics of a numerical, or a frequency table of a categorical variable.
Data required:  TRUE
Strict:         TRUE
Example:        rapport('children/descriptives-univar', data=ius2008, var='gender')
                rapport('children/descriptives-univar', data=ius2008, var='age')

var             | *variable  | Variable          | A categorical or numerical variable. The template will determine the measurement level of the given variable and will return a detailed frequency table or appropriate descriptive statistics for numerics.
nortest         | TRUE       | Normality test    | If normality tests should be performed for numerical variable
head-->

<%=
if (is.numeric(var)) {
        rapport('children/descriptives-univar-numeric', data=rp.data, var=rp.name(var))
    } else {
        rapport('children/descriptives-univar-factor', data=rp.data, var=rp.name(var))
    }
%>
