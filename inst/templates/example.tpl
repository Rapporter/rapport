<!--head
Title:          Example template
Author:         Gergely Daróczi
Description:    This template demonstrates the basic features of rapport. We all hope you will like it!
Packages:       lattice
Data required:  TRUE
Example:        rapport("example", ius2008, var='leisure')
                rapport("example", ius2008, var='leisure', desc=FALSE)
                rapport("example", ius2008, var='leisure', desc=FALSE, histogram=T)

var         | *numeric           | Variable    | A numeric variable.
desc        | TRUE               | Descriptive | Show descriptive statistics of specified variable?
histogram   | FALSE              | Histogram   | Show histogram of specified variable?
head-->

# Début

Hello, world!

I have just specified a *Variable* in this template named to **<%=rp.name(var)%>**. The label of this variable is "<%=rp.label(var)%>".

And wow, the mean of *<%=rp.name(var)%>* is <%=rp.mean(var)%>!

<%=
if (!desc) '**For more detailed statistics, you should have set `desc=TRUE`!**'
%>

By checking out the [sources of this template](https://github.com/rapporter/rapport/blob/master/inst/templates/example.tpl), you could see that we used all `BRCATCODE`s above from `brew` syntax. `BRCODE` tags are useful when you want to loop through something or optionally add or remove a part of the template. A really easy example of this: if `desc` input equals to `TRUE`, then the resulting report would have that chunk, if set to `FALSE`, it would be left our.

<%if (desc) {%>

## Descriptive statistics

<%=summary(var)%>

<%=
sprintf('The 5 highest values are: %s.', p(sort(var, decreasing = TRUE)[1:5]))
%>

<%}%>

<%if (histogram) {%>

## Histogram

For demonstartion purposes you can find a histogram below:

<%=
set.caption('A nice histogram')
rp.hist(var)
%>

<%}%>
