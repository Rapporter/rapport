<!--head
Title:          Matrix
Author:         Gergely Daróczi
Description:    Method based reporting of a matrix
Strict:         TRUE
x           | *whatever     | Numeric       | A matrix
Example:        rapport('classes/matrix.tpl', x=pi, digits=3)
head-->
<%
apply(x, c(1,2), function(x) x)
%>
