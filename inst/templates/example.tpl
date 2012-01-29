<!--head
Title:          Example template
Author:         Gergely Daróczi 
Description:    This template demonstrates the basic features of rapport. We all hope you will like it!
Packages:       lattice
Data required:  TRUE
Strict:         TRUE
Example:        rapport("example", ius2008, var='leisure')
                rapport("example", ius2008, var='leisure', desc=FALSE)
                rapport("example", ius2008, var='leisure', desc=FALSE, hist=T)
                rapport("example", ius2008, var='leisure', desc=FALSE, hist=T, theme='Set2')

var    | *numeric   | Variable| A numeric variable.
desc   | TRUE      | Boolean | Show descriptive statistics of specified variable?
hist   | FALSE     | Boolean | Show histogram of specified variable?
theme  | Set1, Set2, Set3   | Color theme  | Color theme of the diagram
head-->

# Début

Hello, world!

I have just specified a *Variable* in this template named to **<%rp.name(var)%>**. The label of this variable is "<%rp.label(var)%>".

And wow, the mean of *<%rp.name(var)%>* is <%rp.mean(var)%>!

<%
if (!desc) '**For more detailed statistics, you should have set `desc=TRUE`!**'
%>


## <%if (desc) 'Descriptive statistics'%>

<%
if (desc) summary(var)
%>

<%
if (desc) sprintf('The 5 highest values are: %s.', p(sort(var, decreasing = TRUE)[1:5]))
%>

## <%if (hist) 'Histogram'%>

<%
if (hist) {
    options('style.color.palette' = theme) 
    print(rp.hist(var))
}
%>
