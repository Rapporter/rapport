<!--head
meta:
  title: Multidimensional Scaling
  author: Rapporter team
  description: In this template Rapporter will present you Multidimensional Scaling.
  email: ~
  packages: ~
  dataRequired:  TRUE
  example:
  - rapport
inputs:
- name: vars
  label: Used Variables
  description: These are the variables which MDS use to differentiate between values
  class: numeric
  length:
    min: 1.0
    max: 10.0
  limit:
    min: 1.0
    max: 50.0
  required: yes
  standalone: no
- name: dist.mat
  label : Distance Matrix
  description: Is your data a Distance matrix?
  class: logical
  length:
    min: 1.0
    max: 1.0
  value: yes
  required: no
  standalone: yes
- name: max.dist.num
  label: Maximum Distance Number
  description: Number of pairs with the biggest differences
  class: integer
  length:
    min: 1.0
    max: 1.0
  limit:
    min: 1.0
    max: 1000.0
  value: 10
  required: no
  standalone: yes
- name: min.dist.num
  label: Minimum Distance Number
  description: Number of pairs with the smallest distances
  class: integer
  length:
    min: 1.0
    max: 1.0
  limit:
    min: 1.0
    max: 1000.0
  value: 10
  required: no
  standalone: yes
head-->


# Introduction

[Multidimensional-scaling](http://en.wikipedia.org/wiki/Multidimensional_scaling) is a technique which gives us a visual representation about the distances between the observations. Below you can see the plot, that presents you the distance between the observations, which was calculated based on <%=rp.label(vars)%>.

<%=
variables <- scale(na.omit(vars))
if (dist.mat) {
d <- dist(variables) 
} else { 
d <- variables
}
fit <- cmdscale(d, eig=TRUE, k = 2)
x <- fit$points[, 1]
y <- fit$points[, 2]
plot(x, y, xlab="Coordinate 1", ylab="Coordinate 2", main="Metric  MDS",   type="n")
+text(x, y, labels = row.names(variables), cex=0.7, col=panderOptions("graph.colors")[4]) 
distance <- as.matrix(d)
maxind <- which(distance == max(distance), arr.ind = TRUE)
minind <- which(distance == min(distance[distance!=min(distance)]), arr.ind = TRUE)
%>

<%=colnames(distance)[which(colSums(distance) == max(colSums(distance)))] %> differs the most from the others, and <%=colnames(distance)[which(colSums(distance) == min(colSums(distance)))]%> seems to be the most "common" observation.


<%=rownames(distance)[c(maxind[1],maxind[2])]%> are the "furthest", <%=rownames(distance)[c(minind[1],minind[2])]%> are the "nearest" to each other.

They are the extreme outsiders, now let's see which observations can be said statistically far/similar to each other in general. In the brackets you can see the amount of the standard deviations of the distance between two observations. The <%=max.dist.num%> pairs with the biggest difference and the <%=min.dist.num%> pairs with the smallest difference will be presented.

<%=
distance[upper.tri(distance, diag = T)] <- NA
h <- which(distance >= sort(distance,decreasing=T)[max.dist.num],arr.ind=T)
%>

<%if (nrow(h) <= max.dist.num) { %>

According to the used variables (<%=rp.name(vars)%>) the <%=max.dist.num%> furthest pair of observations are:

<%=
paste(pander.return(lapply(1:nrow(h), function(i) paste0(p(c(rownames(distance)[h[i,1]], colnames(distance)[h[i,2]])), ' (', round(distance[h[i, 1], h[i, 2]], 2), ')'))), collapse = '\n')%>

<%} else {%>

There are <%=nrow(h)%> observations which are the most similar, that is a higher number than the wanted <%=max.dist.num%>, thus will not be reported one-by-one. Set <%=nrow(h)%> as parameter <%=rp.name(max.dist.num)%> to check the pairs if you are interested.
<%}%>

<%=
h <- which(distance <= sort(distance,decreasing=F)[min.dist.num], arr.ind=T)
%>
 
<%if (nrow(h) <= min.dist.num) { %>

According to the used variables (<%=rp.name(vars)%>) the <%=min.dist.num%> nearest pair of observations are:

<%=
paste(pander.return(lapply(1:nrow(h), function(i) paste0(p(c(rownames(distance)[h[i,1]], colnames(distance)[h[i,2]])), ' (', round(distance[h[i, 1], h[i, 2]], 2), ')'))), collapse = '\n')
%>

<%} else {%>

There are <%=nrow(h)%> observations which are the most similar and equal in the same time, that is a higher number than the wanted <%=min.dist.num%>, thus will not be reported one-by-one. Set <%=nrow(h)%> as parameter (<%=rp.name(min.dist.num)%>) to check the pairs if you are interested.
<%}%>



