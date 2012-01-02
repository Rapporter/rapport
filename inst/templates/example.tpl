<!--head
Title:        example script
Author:       Aleksandar Blagotić
Description:  A simple report.
Example:      rapport("example", mtcars, x = "mpg", y = "hp")
x      | numeric   | Var X   | One or two factors for one/two-way ANOVA
y      | numeric   | Var Y   | A dependent (response) variable
bool   | TRUE      | Boolean | some boolean values
csv    | foo, bar  | CSV     | comma separated values
head-->
# Descriptive <% "statistics" %>

The average fuel consumption is <% rp.mean(x) %> with SD of <% rp.sd(x) %>.
Let's add one more line to this paragraph.
And another one.
Now, you've probably heard of _pi_? Right? Its value is <%pi%>.

# Graphs

And some graphs:

<%

## write a wrapper for this? in stats.R?

plot(x, pch = 19)
text(x, label = row.names(rp.data), pos = 4)
%>

So far we've been dealing with data.frames and plots, now let's deal with variables

<%
x <- rnorm(100)
%>

Now we'll see if the Z var is working properly. If I omit it, it should perserve the default value (TRUE)... aaaand.... <%bool%>.

OK, so far, so good, but let's see what's going on with code chunks...
<%
if (bool) matrix(rnorm(100), 10)
%>

When it comes to CSV values, let us see how do they work. You have chosen the "<% csv %>".